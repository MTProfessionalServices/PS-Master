/*
Run this script on:

        (local).NetMeter    -  This database will be modified

to synchronize it with:

        10.200.86.158.NetMeter

You are recommended to back up your database before running this script

Script created by SQL Compare version 10.7.0 from Red Gate Software Ltd at 7/31/2014 8:44:51 AM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Insert begin upgrade info into t_sys_upgrade'
GO
INSERT INTO t_sys_upgrade
  (target_db_version, dt_start_db_upgrade, db_upgrade_status)
  VALUES	('8.0.0', getdate(), 'R')
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping [dbo].[agg_charge_definition]'
GO
DROP TABLE [dbo].[agg_charge_definition]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[t_po]'
GO
ALTER TABLE [dbo].[t_po] ADD [c_POPartitionId] [int] NOT NULL DEFAULT ((1))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[apply_subscriptions]'
GO
ALTER PROCEDURE apply_subscriptions (
   @template_id                int,
   @sub_start                  datetime,
   @sub_end                    datetime,
   @next_cycle_after_startdate char, /* Y or N */
   @next_cycle_after_enddate   char, /* Y or N */
   @user_id                    int,
   @id_audit                   int,
   @id_event_success           int,
   @id_event_failure           int,
   @systemdate                 datetime,
   @id_template_session        int,
   @retrycount                 int,
   @doCommit				   char = 'Y' /* Y or N */
)
AS
	SET NOCOUNT ON
	DECLARE @my_id_audit         int
	DECLARE @my_error            nvarchar(1024)
	DECLARE @detailtypesubs      int
	DECLARE @detailresultfailure int
	
	SELECT @my_id_audit = @id_audit
	IF @my_id_audit IS NULL
	BEGIN
		DECLARE @audit_msg       nvarchar(256)
		DECLARE @dt_timestamp    datetime
		SET @audit_msg = N'Apply subscriptions from template ' + CAST(@template_id AS nvarchar)
		SET @dt_timestamp = GETDATE()
		EXEC GetCurrentID 'id_audit', @my_id_audit OUT
		EXEC insertauditevent
			@id_userid           = NULL,
			@id_event            = 1451,
			@id_entity_type      = 2,
			@id_entity           = @template_id,
			@dt_timestamp        = @dt_timestamp,
			@id_audit            = @my_id_audit,
			@tx_details          = @audit_msg,
			@tx_logged_in_as     = NULL,
			@tx_application_name = NULL
	END

	SELECT @detailtypesubs = id_enum_data
	FROM   t_enum_data
	WHERE  nm_enum_data = 'metratech.com/accounttemplate/DetailType/Subscription'
		 
	SELECT @detailresultfailure = id_enum_data
	FROM  t_enum_data
	WHERE  nm_enum_data = 'metratech.com/accounttemplate/DetailResult/Failure'
  
	IF object_id('tempdb..#t_acc_template_valid_subs') IS NOT NULL
		DROP TABLE #t_acc_template_valid_subs
	
	CREATE TABLE #t_acc_template_valid_subs
	(
		id_po     int,
		id_group  int,
		sub_start datetime,
		sub_end   datetime,
		po_start  datetime,
		po_end    datetime
	)

	CREATE TABLE #tmp_gsubmember
	(
		id_group int,
		id_acc int,
		vt_start datetime,
		vt_end datetime
	)

	CREATE TABLE #tmp_sub
	(
		id_sub	int,
		id_sub_ext	varbinary(16),
		id_acc	int,
		id_po	int,
		dt_crt	datetime,
		vt_start	datetime,
		vt_end	datetime,
		id_group	int
	)

	create index #t_acc_template_valid_subs_ix1 on #t_acc_template_valid_subs(id_po)
	create index #t_acc_template_valid_subs_ix2 on #t_acc_template_valid_subs(id_group)
  
	/* Detect conflicting subscriptions in the template and choice first available of them and without conflicts */
	INSERT INTO #t_acc_template_valid_subs (id_po, id_group, sub_start, sub_end, po_start, po_end)
	SELECT DISTINCT
	       subs.id_po,
		   subs.id_group,
		   subs.sub_start,
		   subs.sub_end,
		   subs.sub_start,
		   subs.sub_end
	FROM
	(
		SELECT t1.id_po
				, MAX(t1.id_group) AS id_group
				, dbo.GreatestDate(t1.vt_start, MAX(ed.dt_start)) AS sub_start
				, dbo.LeastDate(t1.vt_end,ISNULL(MAX(ed.dt_end), dbo.MTMaxDate())) AS sub_end
			FROM (
				SELECT ISNULL(ts.id_po,s.id_po) AS id_po, ts.vt_start, ts.vt_end, s.id_group
					FROM t_acc_template_subs ts
					LEFT JOIN t_sub s ON s.id_group = ts.id_group
					WHERE ts.id_acc_template = @template_id
			) t1
			JOIN t_po po ON po.id_po = t1.id_po
			JOIN t_effectivedate ed ON po.id_eff_date = ed.id_eff_date
			GROUP BY t1.id_po,t1.vt_start,t1.vt_end

/*
		SELECT MAX(ts.id_po) AS id_po, NULL AS id_group, ISNULL(MAX(ed.dt_start), @systemdate) AS sub_start, ISNULL(MAX(ed.dt_end), dbo.MTMaxDate()) AS sub_end
		FROM   t_acc_template_subs ts
			   JOIN t_pl_map pm ON pm.id_po = ts.id_po
			   JOIN t_po po ON ts.id_po = po.id_po
			   JOIN t_effectivedate ed ON po.id_eff_date = ed.id_eff_date
		WHERE  ts.id_acc_template = @template_id
		GROUP BY pm.id_pi_template
		UNION ALL
		SELECT NULL AS id_po, MAX(ts.id_group) AS id_group, ISNULL(MAX(ed.dt_start), @systemdate) AS sub_start, ISNULL(MAX(ed.dt_end), dbo.MTMaxDate()) AS sub_end
		FROM   t_acc_template_subs ts
			   JOIN t_sub s ON s.id_group = ts.id_group
			   JOIN t_pl_map pm ON pm.id_po = s.id_po
			   JOIN t_po po ON po.id_po = s.id_po
			   JOIN t_effectivedate ed ON po.id_eff_date = ed.id_eff_date
		WHERE  ts.id_acc_template = @template_id
		GROUP BY pm.id_pi_template
*/
	) subs

	DECLARE @id_acc  int
	DECLARE accounts CURSOR LOCAL FOR
		SELECT id_descendent AS id_acc
		FROM   t_vw_get_accounts_by_tmpl_id v
		WHERE  v.id_template = @template_id

	OPEN accounts
	FETCH NEXT FROM accounts INTO @id_acc

	/* Applying subscriptions to accounts */
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC apply_subscriptions_to_acc
			@id_acc                     = @id_acc,
			@id_acc_template            = @template_id,
			@next_cycle_after_startdate = @next_cycle_after_startdate,
			@next_cycle_after_enddate   = @next_cycle_after_enddate,
			@user_id                    = @user_id,
			@id_audit                   = @my_id_audit,
			@id_event_success           = @id_event_success,
			@systemdate                 = @systemdate,
			@id_template_session        = @id_template_session,
			@retrycount                 = @retrycount,
			@detailtypesubs             = @detailtypesubs,
			@detailresultfailure        = @detailresultfailure
		
		FETCH NEXT FROM accounts INTO @id_acc
	END
	
	CLOSE accounts
	DEALLOCATE accounts

	DECLARE @maxdate datetime
	SELECT @maxdate = dbo.MTMaxDate()

	IF @doCommit = 'Y' BEGIN
		BEGIN TRAN t2
	END

	BEGIN TRY
		/* Persist the data in transaction */

		INSERT INTO t_gsubmember_historical (id_group, id_acc, vt_start, vt_end, tt_start, tt_end)
		SELECT id_group, id_acc, vt_start, vt_end, @systemdate, @maxdate
		FROM   #tmp_gsubmember

		INSERT INTO t_gsubmember(id_group, id_acc, vt_start, vt_end)
		SELECT id_group, id_acc, vt_start, vt_end
		FROM   #tmp_gsubmember

		INSERT INTO t_sub_history
			  (id_sub, id_sub_ext, id_acc, id_group, id_po, dt_crt, vt_start, vt_end, tt_start, tt_end)
		SELECT id_sub, id_sub_ext, id_acc, id_group, id_po, dt_crt, vt_start, vt_end, @systemdate, @maxdate
		FROM   #tmp_sub

		INSERT INTO t_sub (id_sub, id_sub_ext, id_acc, id_group, id_po, dt_crt, vt_start, vt_end)
		SELECT id_sub, id_sub_ext, id_acc, id_group, id_po, dt_crt, vt_start, vt_end
		FROM   #tmp_sub

		INSERT INTO t_audit_details (id_audit, tx_details)
		SELECT @my_id_audit,
			   N'Added subscription to id_groupsub ' + CAST(id_group AS nvarchar(10)) +
			   N' for account ' + CAST(id_acc AS nvarchar(10)) +
			   N' from ' + CAST(vt_start AS nvarchar(20)) +
			   N' to ' + CAST(vt_end AS nvarchar(20)) +
			   N' on ' + CAST(@systemdate AS nvarchar(20))
		FROM   #tmp_gsubmember
		UNION ALL
		SELECT @my_id_audit,
			   N'Added subscription to product offering ' + CAST(id_po AS nvarchar(10)) +
			   N' for account ' + CAST(id_acc AS nvarchar) +
			   N' from ' + CAST(vt_start AS nvarchar(20)) +
			   N' to ' + CAST(vt_end AS nvarchar(20)) +
			   N' on ' + CAST(@systemdate AS nvarchar(20))
		FROM   #tmp_sub

		IF @doCommit = 'Y' BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- we should log this.
		IF @doCommit = 'Y' BEGIN
			ROLLBACK
		END
		 
		SELECT @my_error = substring(error_message(), 1, 1024)

		IF @my_id_audit IS NULL
		BEGIN
			IF @id_audit IS NOT NULL
			BEGIN
				SELECT @my_id_audit = @id_audit
			END
			ELSE
			BEGIN
				EXEC getcurrentid 'id_audit', @my_id_audit OUT

				INSERT INTO t_audit (
					id_audit,
					id_event,
					id_userid,
					id_entitytype,
					id_entity,
					dt_crt
					)
				VALUES (
					@my_id_audit,
					@id_event_failure,
					@user_id,
					1,
					@id_acc,
					getutcdate ()
					)
			END
		END

		INSERT INTO t_audit_details (
			id_audit,
			tx_details
			)
		VALUES (
			@my_id_audit,
			'Error applying template to id_acc: ' + CAST(@id_acc AS nvarchar(10)) + ': ' + @my_error
			)
	END CATCH

	DROP TABLE #t_acc_template_valid_subs
	DROP TABLE #tmp_gsubmember
	DROP TABLE #tmp_sub
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[t_pricelist]'
GO
ALTER TABLE [dbo].[t_pricelist] ADD [c_PLPartitionId] [int] NOT NULL DEFAULT ((1))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[agg_charge_definition]'
GO
create view agg_charge_definition
       
as
        
select
 
a.c_Name as charge_type_id,
        
a.c_AmountChain as charge_qualification_group,
        
a.c_ProductViewName as productview_name,
        
b.c_row_num as row_num,
        
b.c_include_table_name as include_table_name,
        
b.c_source_value as source_value,
        
b.c_target_field as target_field,
        
b.c_include_predicate as include_predicate,
        
b.c_included_field_prefix as included_field_prefix,
        
b.c_field_name as field_name,
        
b.c_population_string as population_string,
        
b.c_mvm_procedure as mvm_procedure,
        
b.c_child_charge_name as child_charge_id,
        
b.c_filter as filter,
        
b.c_default_value as default_value
          
from t_amp_generatedcharge a
          
inner join t_amp_genchargedirective b on a.c_GenCharge_Id = b.c_GenCharge_Id;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[VW_ADJUSTMENT_SUMMARY]'
GO
EXEC sp_refreshview N'[dbo].[VW_ADJUSTMENT_SUMMARY]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[AddICBMapping]'
GO
ALTER proc AddICBMapping(
					@id_paramtable as int,
					@id_pi_instance as int,
					@id_sub as int,
					@id_acc as int,
					@id_po as int,
					@p_systemdate as datetime)
				as
					declare @id_pi_type as int
					declare @id_pricelist as int
					declare @id_pi_template as int
					declare @id_pi_instance_parent as int
					declare @currency as nvarchar(10)
					declare @partitionId as int
					
					select 	@id_pi_type = id_pi_type,
							@id_pi_template = id_pi_template,
							@id_pi_instance_parent = id_pi_instance_parent
					from t_pl_map
					where id_pi_instance = @id_pi_instance AND id_paramtable is NULL

					--CR 10884 fix: get the price list currency from product catalog, not
					--corporation. This will take care of the case when gsubs are generated "globally".
					--Also, this seems to be correct for all other cases as well
					
					set @currency = (select pl.nm_currency_code
									from t_po po
									inner join t_pricelist pl on po.id_nonshared_pl = pl.id_pricelist
									where po.id_po = @id_po)
					
					set @partitionId = (select po.c_POPartitionId
										from t_po po
										where po.id_po = @id_po)

					insert into t_base_props (n_kind,n_name,n_display_name,n_desc) values (150,0,0,0)
					
					set @id_pricelist = @@identity
					
					insert into t_pricelist
						(id_pricelist, n_type, nm_currency_code, c_PLPartitionId)
						values (@id_pricelist, 0, @currency, @partitionId)
					
					insert into t_pl_map(
					  id_paramtable,
					  id_pi_type,
					  id_pi_instance,
					  id_pi_template,
					  id_pi_instance_parent,
					  id_sub,
					  id_po,
					  id_pricelist,
					  b_canICB,
					  dt_modified
					  )
					values(
					  @id_paramtable,
					  @id_pi_type,
					  @id_pi_instance,
					  @id_pi_template,
					  @id_pi_instance_parent,
					  @id_sub,
					  @id_po,
					  @id_pricelist,
					  'N',
					  @p_systemdate
					  )
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[T_VW_EFFECTIVE_SUBS]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_EFFECTIVE_SUBS]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[SequencedDeleteAccOwnership]'
GO
ALTER  procedure SequencedDeleteAccOwnership
			@p_id_owner int,
			@p_id_owned int,
			@p_vt_start datetime,
			@p_vt_end datetime,
			@p_tt_current datetime,
			@p_tt_max datetime,
			@p_status int OUTPUT
		as
		begin
    SET @p_status = 0
      INSERT INTO t_acc_ownership(id_owner, id_owned, id_relation_type, n_percent,  vt_start, vt_end, tt_start, tt_end)
        SELECT id_owner, id_owned, id_relation_type, n_percent, dateadd(s,1,@p_vt_end) AS vt_start, vt_end, @p_tt_current as tt_start, @p_tt_max as tt_end
        FROM t_acc_ownership
        WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
	  AND vt_start < @p_vt_start AND vt_end > @p_vt_end and tt_end = @p_tt_max;
      IF @@error <> 0
      BEGIN
        SET @p_status = @@error
        return
      END
	    -- Valid time update becomes bi-temporal insert and update
      INSERT INTO t_acc_ownership(id_owner, id_owned, id_relation_type, n_percent,  vt_start, vt_end, tt_start, tt_end)
      SELECT id_owner, id_owned, id_relation_type, n_percent, vt_start, dateadd(s,-1,@p_vt_start) AS vt_end, @p_tt_current AS tt_start, @p_tt_max AS tt_end
      FROM t_acc_ownership
	    WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
	    AND vt_start < @p_vt_start AND vt_end >= @p_vt_start AND tt_end = @p_tt_max;
      
      UPDATE t_acc_ownership SET tt_end = @p_tt_current
	    WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
	    AND vt_start < @p_vt_start AND vt_end >= @p_vt_start AND tt_end = @p_tt_max;
      IF @@error <> 0
      BEGIN
        SET @p_status = @@error
        return
      END
	    -- Valid time update becomes bi-temporal insert (of the modified existing history into the past history) and update (of the modified existing history)
      INSERT INTO t_acc_ownership(id_owner, id_owned, id_relation_type, n_percent,  vt_start, vt_end, tt_start, tt_end)
      SELECT  id_owner, id_owned, id_relation_type, n_percent, dateadd(s,1,@p_vt_end) AS vt_start, vt_end, @p_tt_current AS tt_start, @p_tt_max AS tt_end
      FROM t_acc_ownership
	    WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
	    AND vt_start <= @p_vt_end AND vt_end > @p_vt_end AND tt_end = @p_tt_max;

      UPDATE t_acc_ownership SET tt_end = @p_tt_current
      WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
      AND vt_start <= @p_vt_end AND vt_end > @p_vt_end AND tt_end = @p_tt_max;
      IF @@error <> 0
      BEGIN
        SET @p_status = @@error
        return
      END
      -- Now we delete any interval contained entirely in the interval we are deleting.
      -- Transaction table delete is really an update of the tt_end
      --   [----------------]                 (interval that is being modified)
      -- [------------------------]           (interval we are deleting)
      UPDATE t_acc_ownership SET tt_end = @p_tt_current
      WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned
	    AND vt_start >= @p_vt_start AND vt_end <= @p_vt_end AND tt_end = @p_tt_max;
      IF @@error <> 0
      BEGIN
        SET @p_status = @@error
        return
      END
      end
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[t_char_values]'
GO
ALTER TABLE [dbo].[t_char_values] ALTER COLUMN [nm_value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[t_char_values_history]'
GO
ALTER TABLE [dbo].[t_char_values_history] ALTER COLUMN [nm_value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[T_VW_ACCTRES]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_ACCTRES]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[DeriveEBCRCycle]'
GO
ALTER FUNCTION DeriveEBCRCycle
(
  @usageCycle INT,     -- billing cycle of the account (context-sensitive)
  @subStart DATETIME,  -- start date of the subscription/membership (context-sensitive)
  @ebcrCycleType INT   -- cycle type of the EBCR PI 
)
RETURNS INT
AS
BEGIN
  DECLARE @usageCycleType INT
  DECLARE @derivedEBCRCycle INT

  DECLARE @startDay INT
  DECLARE @startMonth INT
  DECLARE @endDay INT

  DECLARE @tempDate DATETIME
  DECLARE @endOfMonth INT

	  -- looks up the usage cycle's cycle type
  SELECT @usageCycleType = id_cycle_type
  FROM t_usage_cycle
  WHERE id_usage_cycle = @usageCycle

  IF (@@ROWCOUNT != 1)
    RETURN -1 -- ERROR: Exactly one usage cycle type was not found for given usage cycle ID
   
  -- if  cycle types are identical then EBCR reduces to a trivial BCR case
  IF (@ebcrCycleType = @usageCycleType)
    RETURN @usageCycle

  -- Case map:
  --   -Weekly EBCR
  --      -Bi-weekly BC
  --   - Bi-weekly EBCR
  --      -Weekly BC
  --   -Monthly EBCR
  --      -Quarterly BC
  --      -Annual BC
  --   -Quarterly EBCR
  --      -Monthly BC
  --      -Annual BC
  --   -Annual EBCR
  --      -Monthly BC
  --      -Quarterly BC

  -- Weekly EBCR
  IF (@ebcrCycleType = 4)
  BEGIN
    -- only Bi-weekly cycle type is permitted
    IF (@usageCycleType != 5)
      RETURN -3 -- ERROR: unsupported EBCR cycle combination

    -- retrieves the Bi-weekly start day
    SELECT @startDay = start_day
    FROM t_usage_cycle uc
    WHERE uc.id_usage_cycle = @usageCycle

    -- reduces the start day [1,14] to a start day between [1,7]
    SET @startDay = @startDay % 7
    IF (@startDay = 0)
      SET @startDay = 7

    --   January 2000    
    -- Su Mo Tu We Th Fr Sa
    --                    1
    --  2  3  4  5  6  7  8
    --  9 10 11 12 13 14 15
    -- 16 17 18 19 20 21 22
    -- 23 24 25 26 27 28 29
    -- 30 31 
  
    -- Bi-weekly      Weekly
    -- start day  --> end day of week
    -- 1, 8              6
    -- 2, 9              7
    -- 3, 10             1
    -- 4, 11             2
    -- 5, 12             3
    -- 6, 13             4
    -- 7, 14             5
 
    -- translates the start day to an end day of week for use with Weekly 
    SET @endDay = @startDay - 2
    IF (@endDay < 1)  -- handles wrap around
      SET @endDay = @endDay + 7
      
    SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
    FROM t_usage_cycle ebcr
    WHERE
      ebcr.id_cycle_type = @ebcrCycleType AND
      ebcr.day_of_week = @endDay
  END
   -- Bi-weekly EBCR
   ELSE IF (@ebcrCycleType = 5)
   BEGIN
      -- only a Weekly cycle type is permitted
      IF (@usageCycleType != 4)
         RETURN -3 -- ERROR: unsupported EBCR cycle combination

      -- retrieves the Weekly end day
      SELECT @endDay = day_of_week
      FROM t_usage_cycle uc
      WHERE uc.id_usage_cycle = @usageCycle

      -- performs the reverse translation described in the Weekly EBCR case
      -- NOTE: subscription information is ignored
      SET @startDay = @endDay + 2
      IF (@startDay > 7)  -- handles wrap around
        SET @startDay = @startDay - 7
         
      SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
      FROM t_usage_cycle ebcr
      WHERE
         ebcr.id_cycle_type = @ebcrCycleType AND
         ebcr.start_day = @startDay AND
         ebcr.start_month = 1 AND
         ebcr.start_year = 2000
   END

   -- Monthly EBCR
   ELSE IF (@ebcrCycleType = 1)
   BEGIN
      -- only Quarterly, Semi-annual, and Annual billing cycle types are legal for this case
      IF (@usageCycleType NOT IN (7, 8, 9))
         RETURN -3 -- ERROR: unsupported EBCR cycle combination

      -- the usage cycle type is Quarterly, semi-annual, or Annual
      -- which use the same start_day property
      SELECT @startDay = start_day
      FROM t_usage_cycle uc
      WHERE uc.id_usage_cycle = @usageCycle

      -- translates the start day to an end day since Monthly cycle types
      -- use end days and Quarterly and Annual cycle types use start days
      BEGIN
        SET @endDay = @startDay - 1
        IF (@endDay < 1) -- wraps around to EOM
           SET @endDay = 31
      END

      
      SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
      FROM t_usage_cycle ebcr
      WHERE
         ebcr.id_cycle_type = @ebcrCycleType AND
         ebcr.day_of_month = @endDay
   END

   -- Quarterly EBCR
   ELSE IF (@ebcrCycleType = 7)
   BEGIN
      -- Monthly billing cycle type
      IF (@usageCycleType = 1)
      BEGIN
         -- infers the start month from the subscription start date   
         /* CORE-8006 */
        SELECT
			@startDay = DATEPART(day, tui.dt_start),
			@startMonth = DATEPART(month, tui.dt_start)
		 FROM t_usage_interval tui
         JOIN t_usage_cycle tuc on tuc.id_usage_cycle = tui.id_usage_cycle
         WHERE tui.id_usage_cycle = @usageCycle
              AND tui.dt_start <= @subStart
              AND tui.dt_end > @subStart

		 --Leap years are a problem.  If the last day of the month is the 29th, it's really the 28th for this purpose
		 if (@startMonth = 2 AND @startDay = 29)
			SET @startDay = 28
  
         -- reduces start month to a value between 1 and 3 since there are
         -- really only 3 months of quarterly cycles:
         -- Original Month: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
         --                   1   2   3   4   5   6   7   8   9  10  11  12
         -- Reduced Month:    1   2   3   1   2   3   1   2   3   1   2   3
         SET @startMonth = @startMonth % 3
         IF (@startMonth = 0)
            SET @startMonth = 3
      END
      -- Annual or semiannual billing cycle type
      ELSE IF (@usageCycleType IN (8, 9))
      BEGIN
         SELECT
            @startDay = start_day,
            @startMonth = start_month
         FROM t_usage_cycle uc
         WHERE uc.id_usage_cycle = @usageCycle
      END
      ELSE
         RETURN -3 -- ERROR: unsupported EBCR cycle combination

      -- translates the Annual start month [1 - 12] to a Quarterly start month [1 - 3]
      SET @startMonth = @startMonth % 3
      IF (@startMonth = 0)
        SET @startMonth = 3
 
      SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
      FROM t_usage_cycle ebcr
      WHERE
         ebcr.id_cycle_type = @ebcrCycleType AND
         ebcr.start_day = @startDay AND
         ebcr.start_month = @startMonth
   END
   
   -- Annual EBCR
   ELSE IF (@ebcrCycleType = 8)
   BEGIN
      -- Monthly billing cycle type
      IF (@usageCycleType = 1)
      BEGIN
        -- infers the start month from the subscription start date   
         /* CORE-8006 */
         SELECT
			@startDay = DATEPART(day, tui.dt_start),
			@startMonth = DATEPART(month, tui.dt_start)
		 FROM t_usage_interval tui
         JOIN t_usage_cycle tuc on tuc.id_usage_cycle = tui.id_usage_cycle
         WHERE tui.id_usage_cycle = @usageCycle
              AND tui.dt_start <= @subStart
              AND tui.dt_end > @subStart

		 --Leap years are a problem.  If the last day of the month is the 29th, it's really the 28th for this purpose
		 if (@startMonth = 2 AND @startDay = 29)
			SET @startDay = 28

      END
      -- Quarterly billing cycle type (treat semiannual the same)
      ELSE IF (@usageCycleType IN (7, 9))
      BEGIN
         SELECT
            @startDay = start_day,
            @startMonth = start_month
         FROM t_usage_cycle uc
         WHERE uc.id_usage_cycle = @usageCycle

		 --Fix for cases where quarterly billing would map to 2/29-31
         SET @tempDate = dateadd(mm, 101 * 12 + @startMonth - 1 , @startDay - 1)
	     SET @endOfMonth = DATEPART(day, DATEADD(dd, -DAY(DATEADD(m,1,@tempDate)), DATEADD(m,1,@tempDate)))
	     
		 IF @startDay > @endOfMonth
	        SET @startDay = @endOfMonth
      END
      
      SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
      FROM t_usage_cycle ebcr
      WHERE
         ebcr.id_cycle_type = @ebcrCycleType AND
         ebcr.start_day = @startDay AND
         ebcr.start_month = @startMonth
    END
    -- SemiAnnual EBCR
   ELSE IF (@ebcrCycleType = 9)
   BEGIN
      -- Monthly billing cycle type
      IF (@usageCycleType = 1)
      BEGIN
        -- infers the start month from the subscription start date   
          /* CORE-8006 */
         SELECT
			@startDay = DATEPART(day, tui.dt_start),
			@startMonth = DATEPART(month, tui.dt_start)
		 FROM t_usage_interval tui
         JOIN t_usage_cycle tuc on tuc.id_usage_cycle = tui.id_usage_cycle
         WHERE tui.id_usage_cycle = @usageCycle
              AND tui.dt_start <= @subStart
              AND tui.dt_end > @subStart
		
		 --Leap years are a problem.  If the last day of the month is the 29th, it's really the 28th for this purpose
		 if (@startMonth = 2 AND @startDay = 29)
			SET @startDay = 28
        
      END
      -- Quarterly or annual billing cycle type 
      ELSE IF (@usageCycleType in (7,8))
      BEGIN
         SELECT
            @startDay = start_day,
            @startMonth = start_month
         FROM t_usage_cycle uc
         WHERE uc.id_usage_cycle = @usageCycle

		 --Fix for cases where quarterly billing would map to 2/29-31
         SET @tempDate = dateadd(mm, 101 * 12 + @startMonth - 1 , @startDay - 1)
	     SET @endOfMonth = DATEPART(day, DATEADD(dd, -DAY(DATEADD(m,1,@tempDate)), DATEADD(m,1,@tempDate)))
	     if @startDay > @endOfMonth
	        SET @startDay = @endOfMonth
      END
      ELSE
         RETURN -3 -- ERROR: unsupported usage cycle combination
      
      SELECT @derivedEBCRCycle = ebcr.id_usage_cycle
      FROM t_usage_cycle ebcr
      WHERE
         ebcr.id_cycle_type = @ebcrCycleType AND
         ebcr.start_day = @startDay AND
         ebcr.start_month = @startMonth
  END
  ELSE
    RETURN -4 -- unsupported EBCR cycle type

  IF (@derivedEBCRCycle IS NULL)
    RETURN -5   -- derivation failed

  RETURN @derivedEBCRCycle
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MeterInitialFromRecurWindow]'
GO
ALTER PROCEDURE [dbo].[MeterInitialFromRecurWindow]
	@currentDate DATETIME
AS
BEGIN
  /* SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements. */
  SET NOCOUNT ON;
  IF (( SELECT VALUE FROM t_db_values WHERE parameter = N'InstantRc' ) = 'false' ) RETURN;

  SELECT 'Initial'                                                                                  AS c_RCActionType,
         pci.dt_start                                                                               AS c_RCIntervalStart,
         pci.dt_end                                                                                 AS c_RCIntervalEnd,
         ui.dt_start                                                                                AS c_BillingIntervalStart,
         ui.dt_end                                                                                  AS c_BillingIntervalEnd,
         dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart)                                  AS c_RCIntervalSubscriptionStart,
         dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)                                      AS c_RCIntervalSubscriptionEnd,
         rw.c_SubscriptionStart                                                                     AS c_SubscriptionStart,
         rw.c_SubscriptionEnd                                                                       AS c_SubscriptionEnd,
         dbo.MTMinOfTwoDates(pci.dt_end, rw.c_SubscriptionEnd)                                      AS c_BilledRateDate,
         rcr.n_rating_type                                                                          AS c_RatingType,
         CASE WHEN rw.c_advance = 'Y' THEN '1' ELSE '0' END                                         AS c_Advance,
         CASE WHEN rcr.b_prorate_on_activate = 'Y' THEN '1' ELSE '0' END                            AS c_ProrateOnSubscription,
         CASE WHEN rcr.b_prorate_instantly = 'Y' THEN '1' ELSE '0' END                              AS c_ProrateInstantly, /* NOTE: c_ProrateInstantly - No longer used */
         CASE WHEN rcr.b_prorate_on_deactivate = 'Y' THEN '1' ELSE '0' END                          AS c_ProrateOnUnsubscription,
         CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END        AS c_ProrationCycleLength,
         rw.c__accountid                                                                            AS c__AccountID,
         rw.c__payingaccount                                                                        AS c__PayingAccount,
         rw.c__priceableiteminstanceid                                                              AS c__PriceableItemInstanceID,
         rw.c__priceableitemtemplateid                                                              AS c__PriceableItemTemplateID,
         rw.c__productofferingid                                                                    AS c__ProductOfferingID,
         rw.c_UnitValueStart                                                                        AS c_UnitValueStart,
         rw.c_UnitValueEnd                                                                          AS c_UnitValueEnd,
         rw.c_UnitValue                                                                             AS c_UnitValue,
         currentui.id_interval                                                                      AS c__IntervalID,
         rw.c__subscriptionid                                                                       AS c__SubscriptionID,
         NEWID()                                                                                    AS idSourceSess
         INTO #tmp_rc
  FROM   t_usage_interval ui
         INNER JOIN #recur_window_holder rw
              ON  rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* next interval overlaps with payer */
              AND rw.c_cycleeffectivestart < ui.dt_end AND rw.c_cycleeffectiveend > ui.dt_start /* next interval overlaps with cycle */
              AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* next interval overlaps with membership */
              AND rw.c_SubscriptionStart   < ui.dt_end AND rw.c_SubscriptionEnd   > ui.dt_start
              AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* next interval overlaps with UDRC */
         INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
         INNER LOOP JOIN t_acc_usage_cycle auc ON auc.id_acc = rw.c__payingaccount AND auc.id_usage_cycle = ui.id_usage_cycle
         INNER LOOP JOIN t_usage_cycle ccl
              ON  ccl.id_usage_cycle = CASE
                                            WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
                                            ELSE NULL
                                       END
         INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
         /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
         INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
              AND (
                      (rcr.b_advance = 'Y' AND pci.dt_start BETWEEN ui.dt_start AND ui.dt_end) /* If this is in advance, check if rc start falls in this interval */
                      OR pci.dt_end BETWEEN ui.dt_start AND ui.dt_end                          /* or check if the cycle end falls into this interval */
                      OR (pci.dt_start < ui.dt_start AND pci.dt_end > ui.dt_end)               /* or this interval could be in the middle of the cycle */
                  )
              AND pci.dt_end BETWEEN    rw.c_payerstart AND rw.c_payerend                         /* rc start goes to this payer */
              AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
              AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
              AND rw.c_cycleeffectivestart < pci.dt_end AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
              AND rw.c_SubscriptionStart   < pci.dt_end AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
         INNER JOIN t_usage_interval currentui ON @currentDate BETWEEN currentui.dt_start AND currentui.dt_end
              AND currentui.id_usage_cycle = ui.id_usage_cycle
  WHERE
		 /* Only meter new subscriptions as initial -- so select only items that have at most one entry in t_sub_history */
         NOT EXISTS (SELECT 1 FROM t_sub_history tsh WHERE tsh.id_sub = rw.C__SubscriptionID AND tsh.id_acc = rw.c__AccountID AND tsh.tt_end < dbo.MTMaxDate())
         /* Also no old unit values */
         AND NOT EXISTS (SELECT 1 FROM t_recur_value trv WHERE trv.id_sub = rw.c__SubscriptionID AND trv.tt_end < dbo.MTMaxDate())
             /* Don't meter in the current interval for initial */
         AND ui.dt_start < @currentDate
         AND rw.c__IsAllowGenChargeByTrigger = 1;

  /* If no charges to meter, return immediately */
  IF (NOT EXISTS (SELECT 1 FROM #tmp_rc)) RETURN;

  EXEC InsertChargesIntoSvcTables;

  UPDATE rw
  SET    c_BilledThroughDate = @currentDate
  FROM   #recur_window_holder rw
  WHERE  rw.c__IsAllowGenChargeByTrigger = 1;
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MeterCreditFromRecurWindow]'
GO
ALTER PROCEDURE [dbo].[MeterCreditFromRecurWindow]
  @currentDate DATETIME
AS
BEGIN
  /* SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements. */
  SET NOCOUNT ON;
  IF (( SELECT VALUE FROM t_db_values WHERE parameter = N'InstantRc' ) = 'false' ) RETURN;

  DECLARE @newSubStart DATETIME,
          @newSubEnd   DATETIME,
          @curSubStart DATETIME,
          @curSubEnd   DATETIME,
          @rcActionForEndDateUpdate nvarchar(20),
          /* Borders of updated Sub.End range will stand for internal @subscriptionStart and @subscriptionEnd to charge this range. */
          @subscriptionStart        DATETIME,
          @subscriptionEnd          DATETIME,
          @isEndDateUpdated         BIT = 0,
  /* TODO: Remove duplicated values once 1-st and 2-nd query is executed conditionally */
          @rcActionForEndDateUpdate2 nvarchar(20),
          /* Borders of updated Sub.Start range will stand for internal @subscriptionStart2 and @subscriptionEnd2 to charge this range. */
          @subscriptionStart2        DATETIME,
          @subscriptionEnd2          DATETIME,
          @isStartDateUpdated        BIT = 0

  /* Assuming only 1 subscription can be changed at a time */
  SELECT TOP 1 /* Using only 1-st PI of RC */
         @newSubStart = new_sub.vt_start, @newSubEnd = new_sub.vt_end,
         @curSubStart = current_sub.vt_start, @curSubEnd = current_sub.vt_end
  FROM #recur_window_holder rw
      INNER LOOP JOIN t_sub_history new_sub ON new_sub.id_acc = rw.c__AccountID
          AND new_sub.id_sub = rw.c__SubscriptionID
          AND new_sub.tt_end = dbo.MTMaxDate()
      INNER LOOP JOIN t_sub_history current_sub ON current_sub.id_acc = rw.c__AccountID
          AND current_sub.id_sub = rw.c__SubscriptionID
          AND current_sub.tt_end = dbo.SubtractSecond(new_sub.tt_start)
  /* Work with RC only. Exclude UDRC. */
  WHERE rw.c_UnitValue IS NULL

  /* It is a new subscription - nothing to recharge */
  IF @curSubStart IS NULL RETURN;
          
  IF (@newSubEnd <> @curSubEnd)
  BEGIN
      /* TODO: Run only 1-st query if condition is true */
      SET @isEndDateUpdated = 1

      SELECT @subscriptionStart = dbo.MTMinOfTwoDates(@newSubEnd, @curSubEnd),
             @subscriptionEnd = dbo.MTMaxOfTwoDates(@newSubEnd, @curSubEnd),
             @rcActionForEndDateUpdate = CASE
                                              WHEN @newSubEnd > @curSubEnd THEN
                                                   'Debit'
                                              ELSE 'Credit'
                                         END;
      /* Sub. start date has 23:59:59 time. We need next day and 00:00:00 time for the start date */
      SET @subscriptionStart = dbo.AddSecond(@subscriptionStart);
  END;

  IF (@newSubStart <> @curSubStart)
  BEGIN
      /* TODO: Run only 2-nd query if condition is true */
      SET @isStartDateUpdated = 1

      SELECT @subscriptionStart2 = dbo.MTMinOfTwoDates(@newSubStart, @curSubStart),
             @subscriptionEnd2 = dbo.MTMaxOfTwoDates(@newSubStart, @curSubStart),
             @rcActionForEndDateUpdate2 = CASE
                                              WHEN @newSubStart < @curSubStart THEN
                                                   'InitialDebit'
                                              ELSE 'InitialCredit'
                                         END;
      /* Sub. end date has 00:00:00 time. We need previous day and 23:59:59 time for the end date */
      SELECT @subscriptionEnd2 = dbo.SubtractSecond(@subscriptionEnd2);
  END;


  SELECT
         /* First, credit or debit the difference in the ending of the subscription.  If the new one is later, this will be a debit, otherwise a credit.
         * TODO: Remove this comment:"There's a weird exception when this is (a) an arrears charge, (b) the old subscription end was after the pci end date, and (c) the new sub end is inside the pci end date." */
         @rcActionForEndDateUpdate                                                                  AS c_RCActionType,
         pci.dt_start                                                                               AS c_RCIntervalStart,
         pci.dt_end                                                                                 AS c_RCIntervalEnd,
         ui.dt_start                                                                                AS c_BillingIntervalStart,
         ui.dt_end                                                                                  AS c_BillingIntervalEnd,
         dbo.mtmaxoftwodates(pci.dt_start, @subscriptionStart)                                      AS c_RCIntervalSubscriptionStart,
         dbo.mtminoftwodates(pci.dt_end, @subscriptionEnd)                                          AS c_RCIntervalSubscriptionEnd,
         @subscriptionStart                                                                         AS c_SubscriptionStart,
         @subscriptionEnd                                                                           AS c_SubscriptionEnd,
         dbo.MTMinOfTwoDates(pci.dt_end, @subscriptionStart)                                        AS c_BilledRateDate,
         rcr.n_rating_type                                                                          AS c_RatingType,
         CASE WHEN rw.c_advance = 'Y' THEN '1' ELSE '0' END                                         AS c_Advance,
         CASE WHEN rcr.b_prorate_on_activate = 'Y' THEN '1' ELSE '0' END                            AS c_ProrateOnSubscription,
         CASE WHEN rcr.b_prorate_instantly = 'Y' THEN '1' ELSE '0' END                              AS c_ProrateInstantly, /* NOTE: c_ProrateInstantly - No longer used */
         CASE WHEN rcr.b_prorate_on_deactivate = 'Y' THEN '1' ELSE '0' END                          AS c_ProrateOnUnsubscription,
         CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END        AS c_ProrationCycleLength,
         rw.c__accountid                                                                            AS c__AccountID,
         rw.c__payingaccount                                                                        AS c__PayingAccount,
         rw.c__priceableiteminstanceid                                                              AS c__PriceableItemInstanceID,
         rw.c__priceableitemtemplateid                                                              AS c__PriceableItemTemplateID,
         rw.c__productofferingid                                                                    AS c__ProductOfferingID,
         rw.c_UnitValueStart                                                                        AS c_UnitValueStart,
         rw.c_UnitValueEnd                                                                          AS c_UnitValueEnd,
         rw.c_UnitValue                                                                             AS c_UnitValue,
         currentui.id_interval                                                                      AS c__IntervalID,
         rw.c__subscriptionid                                                                       AS c__SubscriptionID
         INTO #tmp_rc_1
  FROM   t_usage_interval ui
         INNER JOIN #recur_window_holder rw
              ON  rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* next interval overlaps with payer */
              /* rw.c_cycleeffectivestart EQUAL TO @subscriptionStart , rw.c_cycleeffectiveend EQUAL TO @subscriptionEnd */
              AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* next interval overlaps with membership */
              AND @subscriptionStart       < ui.dt_end AND @subscriptionEnd       > ui.dt_start
              AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* next interval overlaps with UDRC */
         INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
         INNER LOOP JOIN t_acc_usage_cycle auc ON auc.id_acc = rw.c__payingaccount AND auc.id_usage_cycle = ui.id_usage_cycle
         INNER LOOP JOIN t_usage_cycle ccl
              ON  ccl.id_usage_cycle = CASE
                                            WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, @subscriptionStart, rcr.id_cycle_type)
                                            ELSE NULL
                                       END
         INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
         INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
              AND (
                      (rcr.b_advance = 'Y' AND pci.dt_start BETWEEN ui.dt_start AND ui.dt_end) /* If this is in advance, check if rc start falls in this interval */
                      OR pci.dt_end BETWEEN ui.dt_start AND ui.dt_end                          /* or check if the cycle end falls into this interval */
                      OR (pci.dt_start < ui.dt_start AND pci.dt_end > ui.dt_end)               /* or this interval could be in the middle of the cycle */
                  )
              AND pci.dt_end BETWEEN    rw.c_payerstart AND rw.c_payerend                         /* rc start goes to this payer */
              AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
              AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
              /* rw.c_cycleeffectivestart EQUAL TO @subscriptionStart , rw.c_cycleeffectiveend EQUAL TO @subscriptionEnd */
              AND @subscriptionStart       < pci.dt_end AND @subscriptionEnd       > pci.dt_start /* rc overlaps with this subscription */
         INNER JOIN t_usage_interval currentui ON @currentDate BETWEEN currentui.dt_start AND currentui.dt_end
              AND currentui.id_usage_cycle = ui.id_usage_cycle
  WHERE
         ui.dt_start < @currentDate
         AND rw.c__IsAllowGenChargeByTrigger = 1
         AND @isEndDateUpdated = 1

  UNION ALL

  SELECT
         /* Now, credit or debit the difference in the start of the subscription.  If the new one is earlier, this will be a debit, otherwise a credit*/
         @rcActionForEndDateUpdate2                                                                 AS c_RCActionType,
         pci.dt_start                                                                               AS c_RCIntervalStart,
         pci.dt_end                                                                                 AS c_RCIntervalEnd,
         ui.dt_start                                                                                AS c_BillingIntervalStart,
         ui.dt_end                                                                                  AS c_BillingIntervalEnd,
         dbo.mtmaxoftwodates(pci.dt_start, @subscriptionStart2)                                     AS c_RCIntervalSubscriptionStart,
         /* If new Subscription Start somewhere in future, after EOP - always use End of RC cycle */
         CASE
              WHEN ui.dt_end <= @subscriptionEnd2 THEN pci.dt_end
              ELSE dbo.mtminoftwodates(pci.dt_end, @subscriptionEnd2)
         END                                                                                        AS c_RCIntervalSubscriptionEnd,
         @subscriptionStart2                                                                        AS c_SubscriptionStart,
         @subscriptionEnd2                                                                          AS c_SubscriptionEnd,
         dbo.MTMinOfTwoDates(pci.dt_end, @subscriptionStart2)                                       AS c_BilledRateDate,
         rcr.n_rating_type                                                                          AS c_RatingType,
         CASE WHEN rw.c_advance = 'Y' THEN '1' ELSE '0' END                                         AS c_Advance,
         CASE WHEN rcr.b_prorate_on_activate = 'Y' THEN '1' ELSE '0' END                            AS c_ProrateOnSubscription,
         CASE WHEN rcr.b_prorate_instantly = 'Y' THEN '1' ELSE '0' END                              AS c_ProrateInstantly, /* NOTE: c_ProrateInstantly - No longer used */
         CASE WHEN rcr.b_prorate_on_deactivate = 'Y' THEN '1' ELSE '0' END                          AS c_ProrateOnUnsubscription,
         CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END        AS c_ProrationCycleLength,
         rw.c__accountid                                                                            AS c__AccountID,
         rw.c__payingaccount                                                                        AS c__PayingAccount,
         rw.c__priceableiteminstanceid                                                              AS c__PriceableItemInstanceID,
         rw.c__priceableitemtemplateid                                                              AS c__PriceableItemTemplateID,
         rw.c__productofferingid                                                                    AS c__ProductOfferingID,
         rw.c_UnitValueStart                                                                        AS c_UnitValueStart,
         rw.c_UnitValueEnd                                                                          AS c_UnitValueEnd,
         rw.c_UnitValue                                                                             AS c_UnitValue,
         currentui.id_interval                                                                      AS c__IntervalID,
         rw.c__subscriptionid                                                                       AS c__SubscriptionID
  FROM   t_usage_interval ui
         INNER JOIN #recur_window_holder rw
              ON  rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* next interval overlaps with payer */
              /* rw.c_cycleeffectivestart EQUAL TO @subscriptionStart , rw.c_cycleeffectiveend EQUAL TO @subscriptionEnd */
              AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* next interval overlaps with membership */
              AND @subscriptionStart2      < ui.dt_end AND @subscriptionEnd2      > ui.dt_start
              AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* next interval overlaps with UDRC */
         INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
         INNER LOOP JOIN t_acc_usage_cycle auc ON auc.id_acc = rw.c__payingaccount AND auc.id_usage_cycle = ui.id_usage_cycle
         INNER LOOP JOIN t_usage_cycle ccl
              ON  ccl.id_usage_cycle = CASE
                                            WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, @subscriptionStart2, rcr.id_cycle_type)
                                            ELSE NULL
                                       END
         INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
         INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
              AND (
                      (rcr.b_advance = 'Y' AND pci.dt_start BETWEEN ui.dt_start AND ui.dt_end) /* If this is in advance, check if rc start falls in this interval */
                      OR pci.dt_end BETWEEN ui.dt_start AND ui.dt_end                          /* or check if the cycle end falls into this interval */
                      OR (pci.dt_start < ui.dt_start AND pci.dt_end > ui.dt_end)               /* or this interval could be in the middle of the cycle */
                  )
              AND pci.dt_end BETWEEN    rw.c_payerstart AND rw.c_payerend                         /* rc start goes to this payer */
              AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
              AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
              /* rw.c_cycleeffectivestart EQUAL TO @subscriptionStart , rw.c_cycleeffectiveend EQUAL TO @subscriptionEnd */
              AND @subscriptionStart2      < pci.dt_end AND @subscriptionEnd2      > pci.dt_start /* rc overlaps with this subscription */
         INNER JOIN t_usage_interval currentui ON @currentDate BETWEEN currentui.dt_start AND currentui.dt_end
              AND currentui.id_usage_cycle = ui.id_usage_cycle
  WHERE
         ui.dt_start < @currentDate
         AND rw.c__IsAllowGenChargeByTrigger = 1
         AND @isStartDateUpdated = 1


  /* Remove extra charges for RCs with No Proration (CORE-6789) */
  IF (@isEndDateUpdated = 1)
  BEGIN
    /* PIs, that starts outside of End Date Update range, should not be handled here */
    DELETE FROM #tmp_rc_1 WHERE c_ProrateOnUnsubscription = '0' AND c_RCIntervalStart < @subscriptionStart

    /* Turn On "Prorate On Subscription" if this is the 1-st RC Cycle of PI with "Prorate on Unsubscription" */
    UPDATE #tmp_rc_1
    SET c_ProrateOnSubscription = '1'
    WHERE c_ProrateOnUnsubscription = '1' AND @newSubStart BETWEEN c_RCIntervalStart AND c_RCIntervalEnd
  END
  IF (@isStartDateUpdated = 1)
    /* PIs, that ends outside of Start Date Update range, should not be handled here */
    DELETE FROM #tmp_rc_1 WHERE c_ProrateOnSubscription = '0' AND c_RCIntervalEnd > @subscriptionEnd2
      AND @subscriptionEnd2 < c_BillingIntervalEnd /* If start date was updated To or From "after EOP date" all PIs should be charged. Don't delete anything. */


  /* Changes related to ESR-6709:"Subscription refunded many times" */
  /* Now determine if the interval and if the RC adapter has run, if no remove those advanced charge credits */
  DECLARE @prev_interval INT, @cur_interval INT, @do_credit INT

  SELECT @prev_interval = pui.id_interval, @cur_interval = cui.id_interval
  FROM   t_usage_interval cui WITH(NOLOCK)
         INNER JOIN #tmp_rc_1 ON #tmp_rc_1.c__IntervalID = cui.id_interval
         INNER JOIN t_usage_cycle uc WITH(NOLOCK) ON cui.id_usage_cycle = uc.id_usage_cycle
         INNER JOIN t_usage_interval pui WITH(NOLOCK) ON pui.dt_end = dbo.SubtractSecond(cui.dt_start)
              AND pui.id_usage_cycle = cui.id_usage_cycle

  SELECT @do_credit = (
             CASE
                  WHEN ISNULL(rei.id_arg_interval, 0) = 0 THEN 0
                  ELSE CASE
                            WHEN (rr.tx_type = 'Execute' AND rei.tx_status = 'Succeeded') THEN
                                 1
                            ELSE 0
                       END
             END
         )
  FROM   t_recevent re
         LEFT OUTER JOIN t_recevent_inst rei
              ON  re.id_event = rei.id_event
              AND rei.id_arg_interval = @prev_interval
         LEFT OUTER JOIN t_recevent_run rr
              ON  rr.id_instance = rei.id_instance
  WHERE  re.dt_deactivated IS NULL
         AND re.tx_name = 'RecurringCharges'
         AND rr.id_run = (
                 SELECT MAX(rr.id_run)
                 FROM   t_recevent re
                        LEFT OUTER JOIN t_recevent_inst rei
                             ON  re.id_event = rei.id_event
                             AND rei.id_arg_interval = @prev_interval
                        LEFT OUTER JOIN t_recevent_run rr
                             ON  rr.id_instance = rei.id_instance
                 WHERE  re.dt_deactivated IS NULL
                        AND re.tx_name = 'RecurringCharges'
             )

  IF @do_credit = 0
  BEGIN
      DELETE rcred
      FROM   #tmp_rc_1 rcred
             INNER JOIN t_usage_interval ui
                  ON  ui.id_interval = @cur_interval
                  AND rcred.c_BillingIntervalStart = ui.dt_start
  END;
  /* End of ESR-6709 */

  SELECT *, NEWID() AS idSourceSess INTO #tmp_rc FROM #tmp_rc_1;

  /* If no charges to meter, return immediately */
  IF (NOT EXISTS (SELECT 1 FROM #tmp_rc)) RETURN;
 
  EXEC InsertChargesIntoSvcTables;

  UPDATE rw
  SET c_BilledThroughDate = @currentDate
  FROM #recur_window_holder rw
  WHERE rw.c__IsAllowGenChargeByTrigger = 1;

 END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[vw_audit_log]'
GO
EXEC sp_refreshview N'[dbo].[vw_audit_log]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MeterUdrcFromRecurWindow]'
GO
ALTER PROCEDURE [dbo].[MeterUdrcFromRecurWindow]
  @currentDate DATETIME,
  @actionType NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @id_run INT
	declare @idMessage BIGINT
	DECLARE @idService INT
	DECLARE @numBlocks INT

  IF ((SELECT value FROM t_db_values WHERE parameter = N'InstantRc') = 'false') return;

  SELECT
         pci.dt_start                                                                               AS c_RCIntervalStart,
         pci.dt_end                                                                                 AS c_RCIntervalEnd,
         ui.dt_start                                                                                AS c_BillingIntervalStart,
         ui.dt_end                                                                                  AS c_BillingIntervalEnd,
         dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart)                                  AS c_RCIntervalSubscriptionStart,
         dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)                                      AS c_RCIntervalSubscriptionEnd,
         rw.c_SubscriptionStart                                                                     AS c_SubscriptionStart,
         rw.c_SubscriptionEnd                                                                       AS c_SubscriptionEnd,
         dbo.MTMinOfTwoDates(pci.dt_end, rw.c_SubscriptionEnd)                                      AS c_BilledRateDate,
         rcr.n_rating_type                                                                          AS c_RatingType,
         CASE WHEN rw.c_advance = 'Y' THEN '1' ELSE '0' END                                         AS c_Advance,
         CASE WHEN rcr.b_prorate_on_activate = 'Y' THEN '1' ELSE '0' END                            AS c_ProrateOnSubscription,
         CASE WHEN rcr.b_prorate_instantly = 'Y' THEN '1' ELSE '0' END                              AS c_ProrateInstantly, /* NOTE: c_ProrateInstantly - No longer used */
         CASE WHEN rcr.b_prorate_on_deactivate = 'Y' THEN '1' ELSE '0' END                          AS c_ProrateOnUnsubscription,
         CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END        AS c_ProrationCycleLength,
         rw.c__accountid                                                                            AS c__AccountID,
         rw.c__payingaccount                                                                        AS c__PayingAccount,
         rw.c__priceableiteminstanceid                                                              AS c__PriceableItemInstanceID,
         rw.c__priceableitemtemplateid                                                              AS c__PriceableItemTemplateID,
         rw.c__productofferingid                                                                    AS c__ProductOfferingID,
         trv.vt_start                                                                               AS c_UnitValueStart,
         trv.vt_end                                                                                 AS c_UnitValueEnd,
         trv.n_value                                                                                AS c_UnitValue,
         currentui.id_interval                                                                      AS c__IntervalID,
         rw.c__subscriptionid                                                                       AS c__SubscriptionID
        INTO #tmp_udrc_1
  FROM   t_usage_interval ui
         INNER JOIN #recur_window_holder rw
              ON  rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* next interval overlaps with payer */
              AND rw.c_cycleeffectivestart < ui.dt_end AND rw.c_cycleeffectiveend > ui.dt_start /* next interval overlaps with cycle */
              AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* next interval overlaps with membership */
              AND rw.c_SubscriptionStart   < ui.dt_end AND rw.c_SubscriptionEnd   > ui.dt_start
              AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* next interval overlaps with UDRC */
         INNER JOIN #tmp_changed_units trv ON trv.id_sub = rw.C__SubscriptionID AND trv.id_prop = rw.c__PriceableItemInstanceID
              AND trv.vt_start < rw.c_UnitValueEnd AND trv.vt_end > rw.c_UnitValueStart
         INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
         INNER LOOP JOIN t_acc_usage_cycle auc ON auc.id_acc = rw.c__payingaccount AND auc.id_usage_cycle = ui.id_usage_cycle
         INNER LOOP JOIN t_usage_cycle ccl
              ON  ccl.id_usage_cycle = CASE
                                            WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                            WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
                                            ELSE NULL
                                       END
         INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
         /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
         INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
              AND (
                      (rcr.b_advance = 'Y' AND pci.dt_start BETWEEN ui.dt_start AND ui.dt_end) /* If this is in advance, check if rc start falls in this interval */
                      OR pci.dt_end BETWEEN ui.dt_start AND ui.dt_end                          /* or check if the cycle end falls into this interval */
                      OR (pci.dt_start < ui.dt_start AND pci.dt_end > ui.dt_end)               /* or this interval could be in the middle of the cycle */
                  )
              AND pci.dt_end BETWEEN    rw.c_payerstart AND rw.c_payerend                         /* rc start goes to this payer */
              AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
              AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
              AND rw.c_cycleeffectivestart < pci.dt_end AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
              AND rw.c_SubscriptionStart   < pci.dt_end AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
         INNER JOIN t_usage_interval currentui ON @currentDate BETWEEN currentui.dt_start AND currentui.dt_end
              AND currentui.id_usage_cycle = ui.id_usage_cycle
  WHERE
        /* Only issue corrections if there's a previous iteration. */
        EXISTS (SELECT 1 FROM t_recur_value rv WHERE rv.id_sub = rw.c__SubscriptionID AND rv.tt_end < dbo.MTMaxDate())
        /* Don't meter in the current interval for initial */
        AND ui.dt_start < @currentDate
        AND rw.c__IsAllowGenChargeByTrigger = 1;

  SELECT @actionType AS c_RCActionType,
         c_RCIntervalStart,
         c_RCIntervalEnd,
         c_BillingIntervalStart,
         c_BillingIntervalEnd,
         c_RCIntervalSubscriptionStart,
         c_RCIntervalSubscriptionEnd,
         c_SubscriptionStart,
         c_SubscriptionEnd,
         c_Advance,
         c_ProrateOnSubscription,
         'N' AS c_ProrateInstantly,
         c_UnitValueStart,
         c_UnitValueEnd,
         c_UnitValue,
         c_RatingType,
         c_ProrateOnUnsubscription,
         c_ProrationCycleLength,
         c_BilledRateDate,
         c__SubscriptionID,
         c__AccountID,
         c__PayingAccount,
         c__PriceableItemInstanceID,
         c__PriceableItemTemplateID,
         c__ProductOfferingID,
         c__IntervalID,
         NEWID() AS idSourceSess INTO #tmp_rc
  FROM   #tmp_udrc_1;

  /* If no charges to meter, return immediately */
  IF (NOT EXISTS (SELECT 1 FROM #tmp_rc)) RETURN;

  EXEC InsertChargesIntoSvcTables;

  UPDATE rw
  SET    c_BilledThroughDate = @currentDate
  FROM   #recur_window_holder rw
  WHERE  rw.c__IsAllowGenChargeByTrigger = 1;
 END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MeterPayerChangesFromRecurWindow]'
GO
ALTER  PROCEDURE [dbo].[MeterPayerChangesFromRecurWindow]
@currentDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF ((SELECT value FROM t_db_values WHERE parameter = N'InstantRc') = 'false') return;
	SELECT DISTINCT
       pci.dt_start      AS c_RCIntervalStart
      ,pci.dt_end      AS c_RCIntervalEnd
      ,ui.dt_start      AS c_BillingIntervalStart
      ,ui.dt_end          AS c_BillingIntervalEnd
      ,CASE WHEN rcr.tx_cycle_mode <> 'Fixed' AND ui.dt_start <> rw.c_cycleEffectiveDate
        THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(rw.c_cycleEffectiveDate), pci.dt_start)
        ELSE pci.dt_start END as c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)          AS c_RCIntervalSubscriptionEnd
      ,rw.c_SubscriptionStart          AS c_SubscriptionStart
      ,rw.c_SubscriptionEnd          AS c_SubscriptionEnd
      --Booleans are, stupidly enough, stored as Y/N in one table, but 0/1 in another table.  Convert them.
      ,case when rw.c_advance  ='Y' then '1' else '0' end          AS c_Advance
      ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end         AS c_ProrateOnSubscription
      ,case when rcr.b_prorate_instantly  ='Y' then '1' else '0' end          AS c_ProrateInstantly -- NOTE: No longer used
      ,case when rcr.b_prorate_on_deactivate  ='Y' then '1' else '0' end          AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END          AS c_ProrationCycleLength
      ,rw.c_UnitValueStart AS c_UnitValueStart
      ,rw.c_UnitValueEnd AS c_UnitValueEnd
      ,rw.c_UnitValue AS c_UnitValue
      ,rcr.n_rating_type AS c_RatingType
      ,rw.c__accountid AS c__AccountID
      ,rw.c__payingaccount      AS c__PayingAccountCredit
      ,rwnew.c__payingaccount AS c__PayingAccountDebit
      ,rw.c__priceableiteminstanceid      AS c__PriceableItemInstanceID
      ,rw.c__priceableitemtemplateid      AS c__PriceableItemTemplateID
      ,rw.c__productofferingid      AS c__ProductOfferingID
      ,dbo.MTMinOfTwoDates(pci.dt_end,rw.c_SubscriptionEnd)  AS c_BilledRateDate
      ,rw.c__subscriptionid      AS c__SubscriptionID
      ,currentui.id_interval AS c__IntervalID
    INTO #tmp_rc_1
	FROM #tmp_oldrw rw INNER JOIN t_usage_interval ui
         on rw.c_cycleeffectivestart < ui.dt_end AND rw.c_cycleeffectiveend > ui.dt_start /* next interval overlaps with cycle */
           AND rw.c_subscriptionstart   < ui.dt_end AND rw.c_subscriptionend   > ui.dt_start /* next interval overlaps with subscription */
           AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend > ui.dt_start /* next interval overlaps with membership */
    /*Between the new and old values, one contains the other, depending on if we've added a payer in the middle or taken one out.
    * Whichever is smaller is the one we actually have to debit/credit, because it's the part that has changed.
    */
    INNER JOIN #tmp_newrw rwnew ON rwnew.c__AccountID = rw.c__AccountID AND rwnew.c__PayingAccount != rw.c__PayingAccount
        and dbo.MTMaxOfTwoDates(rwnew.c_payerstart, rw.c_PayerStart) < ui.dt_end AND dbo.MTMinOfTwoDates(rw.c_PayerEnd,rwnew.c_payerend) > ui.dt_start
          --we only want the cases where the new payer contains the old payer or vice versa.
        AND ((rw.c_PayerStart >= rwnew.c_PayerStart AND rw.c_PayerEnd <= rwnew.c_PayerEnd)
            OR (rw.c_PayerStart <= rwnew.c_PayerStart AND rw.c_PayerEnd >= rwnew.c_PayerEnd))
      INNER JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
      INNER JOIN t_usage_cycle ccl ON ccl.id_usage_cycle = CASE WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle
	    WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
	    WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
	    ELSE NULL END
      JOIN t_acc_usage_cycle auc on auc.id_acc = rw.c__payingaccount and auc.id_usage_cycle = ccl.id_usage_cycle
      /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
      INNER JOIN t_pc_interval pci ON pci.id_cycle = ccl.id_usage_cycle
                                   AND pci.dt_start BETWEEN ui.dt_start     AND ui.dt_end                            /* rc start falls in this interval */
                                   AND pci.dt_start < dbo.MTMinOfTwoDates(rw.c_PayerEnd, rwnew.c_payerend)
                                   AND pci.dt_end > dbo.MTMaxOfTwoDates(rwnew.c_payerstart, rw.c_PayerStart)             /* rc start goes to this payer */
                                   /*Also, RC end needs to be for this payer -- otherwise the other payer gets it.*/
                                   AND pci.dt_end <= dbo.MTMinOfTwoDates(rw.c_PayerEnd, rwnew.c_payerend)
                                   AND rwnew.c_membershipstart     < pci.dt_end AND rwnew.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw.c_cycleeffectivestart < pci.dt_end AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
                                   AND rw.c_SubscriptionStart   < pci.dt_end AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
								   and pci.dt_start < @currentDate /* Don't go into the future*/
      INNER JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
      inner join t_usage_interval currentui on @currentDate between currentui.dt_start and currentui.dt_end and currentui.id_usage_cycle = ui.id_usage_cycle
	  where rwnew.c__IsAllowGenChargeByTrigger = 1;

		SELECT 'InitialDebit' AS c_RCActionType
           ,c_RCIntervalStart
           ,c_RCIntervalEnd
           ,c_BillingIntervalStart
           ,c_BillingIntervalEnd
           ,c_RCIntervalSubscriptionStart
           ,c_RCIntervalSubscriptionEnd
           ,c_SubscriptionStart
           ,c_SubscriptionEnd
           ,c_Advance
           ,c_ProrateOnSubscription
           ,c_ProrateInstantly
           ,c_UnitValueStart
           ,c_UnitValueEnd
           ,c_UnitValue
           ,c_RatingType
           ,c_ProrateOnUnsubscription
           ,c_ProrationCycleLength
           ,c_BilledRateDate
           ,c__SubscriptionID
           ,c__AccountID
           ,c__PayingAccountDebit AS c__PayingAccount
           ,c__PriceableItemInstanceID
           ,c__PriceableItemTemplateID
           ,c__ProductOfferingID
           ,c__IntervalID
           ,NEWID() AS idSourceSess INTO #tmp_rc FROM #tmp_rc_1
           
           UNION ALL
           		SELECT 'InitialCredit' AS c_RCActionType
           ,c_RCIntervalStart
           ,c_RCIntervalEnd
           ,c_BillingIntervalStart
           ,c_BillingIntervalEnd
           ,c_RCIntervalSubscriptionStart
           ,c_RCIntervalSubscriptionEnd
           ,c_SubscriptionStart
           ,c_SubscriptionEnd
           ,c_Advance
           ,c_ProrateOnSubscription
           ,c_ProrateInstantly
           ,c_UnitValueStart
           ,c_UnitValueEnd
           ,c_UnitValue
           ,c_RatingType
           ,c_ProrateOnUnsubscription
           ,c_ProrationCycleLength
           ,c_BilledRateDate
           ,c__SubscriptionID
           ,c__AccountID
           ,c__PayingAccountCredit AS c__PayingAccount
           ,c__PriceableItemInstanceID
           ,c__PriceableItemTemplateID
           ,c__ProductOfferingID
           ,c__IntervalID
           ,NEWID() AS idSourceSess FROM #tmp_rc_1 ;
           
	--If no charges to meter, return immediately
    IF NOT EXISTS (SELECT 1 FROM #tmp_rc) RETURN;
	
	exec InsertChargesIntoSvcTables;
	
	  
	UPDATE rw
	SET c_BilledThroughDate = @currentDate
	FROM #tmp_newrw rw
	where rw.c__IsAllowGenChargeByTrigger = 1;

END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[t_vw_expanded_sub]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_expanded_sub]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[VW_AJ_INFO]'
GO
EXEC sp_refreshview N'[dbo].[VW_AJ_INFO]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[t_vw_pilookup]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_pilookup]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[t_vw_rc_arrears_fixed]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_rc_arrears_fixed]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[vw_all_billing_groups_status]'
GO
EXEC sp_refreshview N'[dbo].[vw_all_billing_groups_status]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[t_vw_rc_arrears_relative]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_rc_arrears_relative]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[vw_interval_billgroup_counts]'
GO
EXEC sp_refreshview N'[dbo].[vw_interval_billgroup_counts]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[T_VW_ACCTRES_BYID]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_ACCTRES_BYID]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[vw_paying_accounts]'
GO
EXEC sp_refreshview N'[dbo].[vw_paying_accounts]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[vw_unassigned_accounts]'
GO
EXEC sp_refreshview N'[dbo].[vw_unassigned_accounts]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[MTSP_GENERATE_CHARGES_QUOTING]'
GO
CREATE PROCEDURE [dbo].[MTSP_GENERATE_CHARGES_QUOTING]
	@v_id_interval  int
	,@v_id_billgroup int
	,@v_id_run       int
	,@v_id_accounts VARCHAR(4000)
	,@v_id_poid VARCHAR(4000)
	,@v_id_batch     varchar(256)
	,@v_n_batch_size int
	,@v_run_date   datetime
	,@v_is_group_sub int
	,@dt_start datetime
	,@dt_end datetime,
	@p_count int OUTPUT

AS BEGIN

DECLARE @id_nonrec int,
		@n_batches  int,
		@total_nrcs int,
		@id_message bigint,
		@id_ss int,
		@tx_batch binary(16),
		@total_rcs  int,
        @total_flat int,
        @total_udrc int,
        @id_flat    int,
        @id_udrc    int
        
IF OBJECT_ID('tempdb..#TMP_RC_ACCOUNTS_FOR_RUN') IS NOT NULL
DROP TABLE #TMP_RC_ACCOUNTS_FOR_RUN

IF OBJECT_ID('tempdb..#TMP_RC_POID_FOR_RUN') IS NOT NULL
DROP TABLE #TMP_RC_POID_FOR_RUN

IF OBJECT_ID('tempdb..#TMP_NRC') IS NOT NULL
DROP TABLE #TMP_NRC

IF OBJECT_ID('tempdb..#TMP_RC') IS NOT NULL
DROP TABLE #TMP_RC

CREATE TABLE #TMP_NRC
  (
  id_source_sess uniqueidentifier,
  c_NRCEventType int,
  c_NRCIntervalStart datetime,
  c_NRCIntervalEnd datetime,
  c_NRCIntervalSubscriptionStart datetime,
  c_NRCIntervalSubscriptionEnd datetime,
  c__AccountID int,
  c__PriceableItemInstanceID int,
  c__PriceableItemTemplateID int,
  c__ProductOfferingID int,
  c__SubscriptionID int,
  c__IntervalID int,
  c__Resubmit int,
  c__TransactionCookie int,
  c__CollectionID binary (16)
  )


SELECT * INTO #TMP_RC_ACCOUNTS_FOR_RUN FROM(SELECT value as id_acc FROM CSVToInt(@v_id_accounts)) A;
SELECT * INTO #TMP_RC_POID_FOR_RUN FROM(SELECT value as id_po FROM CSVToInt(@v_id_poid)) A;

SELECT @tx_batch = cast(N'' as xml).value('xs:hexBinary(sql:variable("@v_id_batch"))', 'binary(16)');

SELECT
*
INTO
#TMP_RC
FROM(
SELECT
newid() AS idSourceSess,
      'Arrears' AS c_RCActionType
      ,pci.dt_start      AS c_RCIntervalStart
      ,pci.dt_end      AS c_RCIntervalEnd
      ,ui.dt_start      AS c_BillingIntervalStart
      ,ui.dt_end          AS c_BillingIntervalEnd
      ,dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart)          AS c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)          AS c_RCIntervalSubscriptionEnd
      ,rw.c_SubscriptionStart          AS c_SubscriptionStart
      ,rw.c_SubscriptionEnd          AS c_SubscriptionEnd
      ,case when rw.c_advance  ='Y' then '1' else '0' end          AS c_Advance
      ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end         AS c_ProrateOnSubscription
      ,case when rcr.b_prorate_instantly  ='Y' then '1' else '0' end          AS c_ProrateInstantly
      ,case when rcr.b_prorate_on_deactivate ='Y' then '1' else '0' end       AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END          AS c_ProrationCycleLength
      ,rw.c__accountid AS c__AccountID
      ,rw.c__payingaccount      AS c__PayingAccount
      ,rw.c__priceableiteminstanceid      AS c__PriceableItemInstanceID
      ,rw.c__priceableitemtemplateid      AS c__PriceableItemTemplateID
      ,rw.c__productofferingid      AS c__ProductOfferingID
      ,pci.dt_end      AS c_BilledRateDate
      ,rw.c__subscriptionid      AS c__SubscriptionID
	  ,rw.c_payerstart
	  ,rw.c_payerend
	  ,case when rw.c_unitvaluestart < '1970-01-01 00:00:00' THEN '1970-01-01 00:00:00' ELSE rw.c_unitvaluestart END AS c_unitvaluestart
	  ,rw.c_unitvalueend
	  ,rw.c_unitvalue
	  ,rcr.n_rating_type AS c_RatingType
      FROM t_usage_interval ui
      /*INNER LOOP JOIN t_billgroup bg ON bg.id_usage_interval = ui.id_interval
      INNER LOOP JOIN t_billgroup_member bgm ON bg.id_billgroup = bgm.id_billgroup*/
	  LEFT JOIN #TMP_RC_ACCOUNTS_FOR_RUN bgm ON 1=1
      INNER LOOP JOIN t_recur_window rw WITH(INDEX(rc_window_time_idx)) ON bgm.id_acc = rw.c__payingaccount
                                   AND rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* interval overlaps with payer */
                                   AND rw.c_cycleeffectivestart < ui.dt_end AND rw.c_cycleeffectiveend > ui.dt_start /* interval overlaps with cycle */
                                   AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* interval overlaps with membership */
                                   AND rw.c_subscriptionstart   < ui.dt_end AND rw.c_subscriptionend   > ui.dt_start /* interval overlaps with subscription */
                                   AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* interval overlaps with UDRC */
      INNER JOIN #TMP_RC_POID_FOR_RUN po on po.id_po = rw.c__ProductOfferingID
	  INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
      INNER LOOP JOIN t_usage_cycle ccl ON ccl.id_usage_cycle = CASE WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle WHEN rcr.tx_cycle_mode LIKE 'BCR%' THEN ui.id_usage_cycle WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type) ELSE NULL END
      /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
      INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
                                   AND pci.dt_end BETWEEN ui.dt_start        AND ui.dt_end                             /* rc end falls in this interval */
                                   AND pci.dt_end BETWEEN rw.c_payerstart    AND rw.c_payerend                         /* rc end goes to this payer */
                                   AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
                                   AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw.c_cycleeffectivestart < pci.dt_end AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
                                   AND rw.c_SubscriptionStart   < pci.dt_end AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
      INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
	  
      where 1=1
      and ui.id_interval = @v_id_interval
      /*and bg.id_billgroup = @v_id_billgroup*/
      and rcr.b_advance <> 'Y'
UNION ALL
SELECT
newid() AS idSourceSess,
      'Advance' AS c_RCActionType
      ,pci.dt_start      AS c_RCIntervalStart
      ,pci.dt_end      AS c_RCIntervalEnd
      ,ui.dt_start      AS c_BillingIntervalStart
      ,ui.dt_end          AS c_BillingIntervalEnd
      ,CASE WHEN rcr.tx_cycle_mode <> 'Fixed' AND nui.dt_start <> c_cycleEffectiveDate
       THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(c_cycleEffectiveDate), pci.dt_start)
       ELSE pci.dt_start END as c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)          AS c_RCIntervalSubscriptionEnd
      ,rw.c_SubscriptionStart          AS c_SubscriptionStart
      ,rw.c_SubscriptionEnd          AS c_SubscriptionEnd
      ,case when rw.c_advance  ='Y' then '1' else '0' end          AS c_Advance
      ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end         AS c_ProrateOnSubscription
      ,case when rcr.b_prorate_instantly  ='Y' then '1' else '0' end          AS c_ProrateInstantly
      ,case when rcr.b_prorate_on_deactivate ='Y' then '1' else '0' end       AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END          AS c_ProrationCycleLength
      ,rw.c__accountid AS c__AccountID
      ,rw.c__payingaccount      AS c__PayingAccount
      ,rw.c__priceableiteminstanceid      AS c__PriceableItemInstanceID
      ,rw.c__priceableitemtemplateid      AS c__PriceableItemTemplateID
      ,rw.c__productofferingid      AS c__ProductOfferingID
      ,pci.dt_start      AS c_BilledRateDate
      ,rw.c__subscriptionid      AS c__SubscriptionID
	  ,rw.c_payerstart
	  ,rw.c_payerend
	  ,case when rw.c_unitvaluestart < '1970-01-01 00:00:00' THEN '1970-01-01 00:00:00' ELSE rw.c_unitvaluestart END AS c_unitvaluestart
	  ,rw.c_unitvalueend
	  ,rw.c_unitvalue
	  ,rcr.n_rating_type AS c_RatingType
     FROM t_usage_interval ui
      INNER LOOP JOIN t_usage_interval nui ON ui.id_usage_cycle = nui.id_usage_cycle AND dbo.AddSecond(ui.dt_end) = nui.dt_start
      /*INNER LOOP JOIN t_billgroup bg ON bg.id_usage_interval = ui.id_interval
      INNER LOOP JOIN t_billgroup_member bgm ON bg.id_billgroup = bgm.id_billgroup*/
	  LEFT JOIN #TMP_RC_ACCOUNTS_FOR_RUN bgm ON 1=1
      INNER LOOP JOIN t_recur_window rw WITH(INDEX(rc_window_time_idx)) ON bgm.id_acc = rw.c__payingaccount
                                   AND rw.c_payerstart          < nui.dt_end AND rw.c_payerend          > nui.dt_start /* next interval overlaps with payer */
                                   AND rw.c_cycleeffectivestart < nui.dt_end AND rw.c_cycleeffectiveend > nui.dt_start /* next interval overlaps with cycle */
                                   AND rw.c_membershipstart     < nui.dt_end AND rw.c_membershipend     > nui.dt_start /* next interval overlaps with membership */
                                   AND rw.c_subscriptionstart   < nui.dt_end AND rw.c_subscriptionend   > nui.dt_start /* next interval overlaps with subscription */
                                   AND rw.c_unitvaluestart      < nui.dt_end AND rw.c_unitvalueend      > nui.dt_start /* next interval overlaps with UDRC */
      INNER JOIN #TMP_RC_POID_FOR_RUN po on po.id_po = rw.c__ProductOfferingID
	  INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
      INNER LOOP JOIN t_usage_cycle ccl ON ccl.id_usage_cycle = CASE WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle WHEN rcr.tx_cycle_mode LIKE 'BCR%' THEN ui.id_usage_cycle WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type) ELSE NULL END
      INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
                                   AND pci.dt_start BETWEEN nui.dt_start     AND nui.dt_end                            /* rc start falls in this interval */
                                   AND pci.dt_start BETWEEN rw.c_payerstart  AND rw.c_payerend                         /* rc start goes to this payer */
                                   AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
                                   AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
                                   AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
      INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
      where 1=1
      and ui.id_interval = @v_id_interval
      /*and bg.id_billgroup = @v_id_billgroup*/
      and rcr.b_advance = 'Y'
)A      ;

SELECT @total_rcs  = COUNT(1) FROM #tmp_rc;


IF @v_is_group_sub > 0
BEGIN

	INSERT INTO #TMP_NRC
	(
		id_source_sess,
		c_NRCEventType,
		c_NRCIntervalStart,
		c_NRCIntervalEnd,
		c_NRCIntervalSubscriptionStart,
		c_NRCIntervalSubscriptionEnd,
		c__AccountID,
		c__PriceableItemInstanceID,
		c__PriceableItemTemplateID,
		c__ProductOfferingID,
		c__SubscriptionID,
		c__IntervalID,
		c__Resubmit,
		c__TransactionCookie,
		c__CollectionID
	)
	
	SELECT
			newid() AS id_source_sess,
			nrc.n_event_type AS	c_NRCEventType,
			@dt_start AS c_NRCIntervalStart,
			@dt_end AS 	c_NRCIntervalEnd,
			mem.vt_start AS	c_NRCIntervalSubscriptionStart,
			mem.vt_end AS	c_NRCIntervalSubscriptionEnd,
			mem.id_acc AS	c__AccountID,
			plm.id_pi_instance AS	c__PriceableItemInstanceID,
			plm.id_pi_template AS	c__PriceableItemTemplateID,
			sub.id_po AS c__ProductOfferingID,
			sub.id_sub AS	c__SubscriptionID,
			@v_id_interval AS c__IntervalID,
			'0' AS c__Resubmit,
			NULL AS c__TransactionCookie,
			@tx_batch AS c__CollectionID
	FROM	t_sub sub
			inner join t_gsubmember mem on mem.id_group = sub.id_group
			inner join #TMP_RC_ACCOUNTS_FOR_RUN acc on acc.id_acc = mem.id_acc
			inner join #TMP_RC_POID_FOR_RUN po on po.id_po = sub.id_po
			inner join t_po on sub.id_po = t_po.id_po
			inner join t_pl_map plm on sub.id_po = plm.id_po and plm.id_paramtable IS NULL
			inner join t_base_props bp on bp.id_prop = plm.id_pi_instance and bp.n_kind = 30
			inner join t_nonrecur nrc on nrc.id_prop = bp.id_prop and nrc.n_event_type = 1
	;

END
ELSE
BEGIN

	INSERT INTO #TMP_NRC
	(
		id_source_sess,
		c_NRCEventType,
		c_NRCIntervalStart,
		c_NRCIntervalEnd,
		c_NRCIntervalSubscriptionStart,
		c_NRCIntervalSubscriptionEnd,
		c__AccountID,
		c__PriceableItemInstanceID,
		c__PriceableItemTemplateID,
		c__ProductOfferingID,
		c__SubscriptionID,
		c__IntervalID,
		c__Resubmit,
		c__TransactionCookie,
		c__CollectionID
	)
	SELECT
			newid() AS id_source_sess,
			nrc.n_event_type AS	c_NRCEventType,
			@dt_start AS c_NRCIntervalStart,
			@dt_end AS 	c_NRCIntervalEnd,
			sub.vt_start AS	c_NRCIntervalSubscriptionStart,
			sub.vt_end AS	c_NRCIntervalSubscriptionEnd,
			sub.id_acc AS	c__AccountID,
			plm.id_pi_instance AS	c__PriceableItemInstanceID,
			plm.id_pi_template AS	c__PriceableItemTemplateID,
			sub.id_po AS c__ProductOfferingID,
			sub.id_sub AS	c__SubscriptionID,
			@v_id_interval AS c__IntervalID,
			'0' AS c__Resubmit,
			NULL AS c__TransactionCookie,
			@tx_batch AS c__CollectionID
	FROM	t_sub sub
			inner join #TMP_RC_ACCOUNTS_FOR_RUN acc on acc.id_acc = sub.id_acc
			inner join #TMP_RC_POID_FOR_RUN po on po.id_po = sub.id_po
			inner join t_po on sub.id_po = t_po.id_po
			inner join t_pl_map plm on sub.id_po = plm.id_po and plm.id_paramtable IS NULL
			inner join t_base_props bp on bp.id_prop = plm.id_pi_instance and bp.n_kind = 30
			inner join t_nonrecur nrc on nrc.id_prop = bp.id_prop and nrc.n_event_type = 1
	;

END

SELECT @total_nrcs = count(1) from #tmp_nrc;

if @total_rcs > 0
BEGIN

SELECT @total_flat = COUNT(1) FROM #tmp_rc where c_unitvalue is null;
SELECT @total_udrc = COUNT(1) FROM #tmp_rc where c_unitvalue is not null;

if @total_flat > 0
begin

    
set @id_flat = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
	'metratech.com/flatrecurringcharge');
    
SET @n_batches = (@total_flat / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    idSourceSess AS id_source_sess
FROM #tmp_rc where c_unitvalue is null;
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, id_svc, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    @id_flat AS id_svc,
    1 AS b_root
FROM #tmp_rc
 where c_unitvalue is null) a
GROUP BY a.id_message, a.id_ss, a.id_svc, a.b_root;
 
INSERT INTO t_svc_FlatRecurringCharge
(id_source_sess
    ,id_parent_source_sess
    ,id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
    ,c_ProrateInstantly
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,c__IntervalID
    ,c__Resubmit
    ,c__TransactionCookie
    ,c__CollectionID)
SELECT
    idSourceSess AS id_source_sess
    ,NULL AS id_parent_source_sess
    ,NULL AS id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
    ,c_ProrateInstantly
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,@v_id_interval AS c__IntervalID
    ,'0' AS c__Resubmit
    ,NULL AS c__TransactionCookie
    ,@tx_batch AS c__CollectionID
FROM #tmp_rc
 where c_unitvalue is null;
          INSERT
          INTO t_message
            (
              id_message,
              id_route,
              dt_crt,
              dt_metered,
              dt_assigned,
              id_listener,
              id_pipeline,
              dt_completed,
              id_feedback,
              tx_TransactionID,
              tx_sc_username,
              tx_sc_password,
              tx_sc_namespace,
              tx_sc_serialized,
              tx_ip_address
            )
            SELECT
              id_message,
              NULL,
              @v_run_date,
              @v_run_date,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              '127.0.0.1'
            FROM
              (SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message
              FROM #tmp_rc
              WHERE c_unitvalue IS NULL
              ) a
            GROUP BY a.id_message;

END;
if @total_udrc > 0
begin

set @id_udrc = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
	'metratech.com/udrecurringcharge');
    
SET @n_batches = (@total_udrc / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    idSourceSess AS id_source_sess
FROM #tmp_rc where c_unitvalue is not null;
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, id_svc, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    @id_udrc AS id_svc,
    1 AS b_root
FROM #tmp_rc
 where c_unitvalue is not null) a
GROUP BY a.id_message, a.id_ss, a.id_svc, a.b_root;
 
INSERT INTO t_svc_UDRecurringCharge
(id_source_sess, id_parent_source_sess, id_external, c_RCActionType, c_RCIntervalStart,c_RCIntervalEnd,c_BillingIntervalStart,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
/*    ,c_ProrateInstantly */
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,c__IntervalID
    ,c__Resubmit
    ,c__TransactionCookie
    ,c__CollectionID
	,c_unitvaluestart
	,c_unitvalueend
	,c_unitvalue
	,c_ratingtype)
SELECT
    idSourceSess AS id_source_sess
    ,NULL AS id_parent_source_sess
    ,NULL AS id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
/*    ,c_ProrateInstantly */
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,@v_id_interval AS c__IntervalID
    ,'0' AS c__Resubmit
    ,NULL AS c__TransactionCookie
    ,@tx_batch AS c__CollectionID
	,c_unitvaluestart
	,c_unitvalueend
	,c_unitvalue
	,c_ratingtype
FROM #tmp_rc
 where c_unitvalue is not null;

          INSERT
          INTO t_message
            (
              id_message,
              id_route,
              dt_crt,
              dt_metered,
              dt_assigned,
              id_listener,
              id_pipeline,
              dt_completed,
              id_feedback,
              tx_TransactionID,
              tx_sc_username,
              tx_sc_password,
              tx_sc_namespace,
              tx_sc_serialized,
              tx_ip_address
            )
            SELECT
              id_message,
              NULL,
              @v_run_date,
              @v_run_date,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              '127.0.0.1'
            FROM
              (SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message
              FROM #tmp_rc
              WHERE c_unitvalue IS NOT NULL
              ) a
            GROUP BY a.id_message;
END;
 
 END;

if @total_nrcs > 0
BEGIN
set @id_nonrec = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
	'metratech.com/nonrecurringcharge');

SET @n_batches = (@total_nrcs / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_ss,
    id_source_sess
FROM #tmp_nrc
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, @id_nonrec, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_ss,
    1 AS b_root
FROM #tmp_nrc) a
GROUP BY a.id_message, a.id_ss, a.b_root;
 
INSERT INTO t_svc_NonRecurringCharge
(
	id_source_sess,
    id_parent_source_sess,
    id_external,
    c_NRCEventType,
	c_NRCIntervalStart,
	c_NRCIntervalEnd,
	c_NRCIntervalSubscriptionStart,
	c_NRCIntervalSubscriptionEnd,
	c__AccountID,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c__SubscriptionID,
    c__IntervalID,
    c__Resubmit,
    c__TransactionCookie,
    c__CollectionID
)
SELECT
    id_source_sess,
    NULL AS id_parent_source_sess,
    NULL AS id_external,
	c_NRCEventType,
	c_NRCIntervalStart,
	c_NRCIntervalEnd,
	c_NRCIntervalSubscriptionStart,
	c_NRCIntervalSubscriptionEnd,
	c__AccountID,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c__SubscriptionID,
    c__IntervalID,
    c__Resubmit,
    c__TransactionCookie,
    c__CollectionID
FROM #tmp_nrc

INSERT 	INTO t_message
(
	id_message,
	id_route,
	dt_crt,
	dt_metered,
	dt_assigned,
	id_listener,
	id_pipeline,
	dt_completed,
	id_feedback,
	tx_TransactionID,
	tx_sc_username,
	tx_sc_password,
	tx_sc_namespace,
	tx_sc_serialized,
	tx_ip_address
)
SELECT
	id_message,
	NULL,
	@v_run_date,
	@v_run_date,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'127.0.0.1'
FROM
	(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_message
	FROM #tmp_nrc
	) a
GROUP BY a.id_message;

drop table #tmp_nrc
END

SET @p_count = @total_rcs + @total_nrcs
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MTSP_GENERATE_ST_NRCS_QUOTING]'
GO
ALTER PROCEDURE [dbo].[MTSP_GENERATE_ST_NRCS_QUOTING]

@dt_start datetime,
@dt_end datetime,
@v_id_accounts VARCHAR(4000),
@v_id_poid VARCHAR(4000),
@v_id_interval int,
@v_id_batch varchar(256),
@v_n_batch_size int,
@v_run_date datetime,
@v_is_group_sub int,
@p_count int OUTPUT

AS BEGIN

DECLARE @id_nonrec int,
		@n_batches  int,
		@total_nrcs int,
		@id_message bigint,
		@id_ss int,
		@tx_batch binary(16);
		
IF OBJECT_ID('tempdb..#TMP_NRC_ACCOUNTS_FOR_RUN') IS NOT NULL
DROP TABLE #TMP_NRC_ACCOUNTS_FOR_RUN

IF OBJECT_ID('tempdb..#TMP_RC_POID_FOR_RUN') IS NOT NULL
DROP TABLE #TMP_RC_POID_FOR_RUN

IF OBJECT_ID('tempdb..#TMP_NRC') IS NOT NULL
DROP TABLE #TMP_NRC

CREATE TABLE #TMP_NRC
  (
  id_source_sess uniqueidentifier,
  c_NRCEventType int,
  c_NRCIntervalStart datetime,
  c_NRCIntervalEnd datetime,
  c_NRCIntervalSubscriptionStart datetime,
  c_NRCIntervalSubscriptionEnd datetime,
  c__AccountID int,
  c__PriceableItemInstanceID int,
  c__PriceableItemTemplateID int,
  c__ProductOfferingID int,
  c__SubscriptionID int,
  c__IntervalID int,
  c__Resubmit int,
  c__TransactionCookie int,
  c__CollectionID binary (16)
  )


SELECT * INTO #TMP_NRC_ACCOUNTS_FOR_RUN FROM(SELECT value as id_acc FROM CSVToInt(@v_id_accounts)) A;
SELECT * INTO #TMP_RC_POID_FOR_RUN FROM(SELECT value as id_po FROM CSVToInt(@v_id_poid)) A;

SELECT @tx_batch = cast(N'' as xml).value('xs:hexBinary(sql:variable("@v_id_batch"))', 'binary(16)');

IF @v_is_group_sub > 0
BEGIN

	INSERT INTO #TMP_NRC
	(
		id_source_sess,
		c_NRCEventType,
		c_NRCIntervalStart,
		c_NRCIntervalEnd,
		c_NRCIntervalSubscriptionStart,
		c_NRCIntervalSubscriptionEnd,
		c__AccountID,
		c__PriceableItemInstanceID,
		c__PriceableItemTemplateID,
		c__ProductOfferingID,
		c__SubscriptionID,
		c__IntervalID,
		c__Resubmit,
		c__TransactionCookie,
		c__CollectionID
	)
	
	SELECT
			newid() AS id_source_sess,
			nrc.n_event_type AS	c_NRCEventType,
			@dt_start AS c_NRCIntervalStart,
			@dt_end AS 	c_NRCIntervalEnd,
			mem.vt_start AS	c_NRCIntervalSubscriptionStart,
			mem.vt_end AS	c_NRCIntervalSubscriptionEnd,
			mem.id_acc AS	c__AccountID,
			plm.id_pi_instance AS	c__PriceableItemInstanceID,
			plm.id_pi_template AS	c__PriceableItemTemplateID,
			sub.id_po AS c__ProductOfferingID,
			sub.id_sub AS	c__SubscriptionID,
			@v_id_interval AS c__IntervalID,
			'0' AS c__Resubmit,
			NULL AS c__TransactionCookie,
			@tx_batch AS c__CollectionID
	FROM	t_sub sub
			inner join t_gsubmember mem on mem.id_group = sub.id_group
			inner join #TMP_NRC_ACCOUNTS_FOR_RUN acc on acc.id_acc = mem.id_acc
			inner join #TMP_RC_POID_FOR_RUN po on po.id_po = sub.id_po
			inner join t_po on sub.id_po = t_po.id_po
			inner join t_pl_map plm on sub.id_po = plm.id_po and plm.id_paramtable IS NULL
			inner join t_base_props bp on bp.id_prop = plm.id_pi_instance and bp.n_kind = 30
			inner join t_nonrecur nrc on nrc.id_prop = bp.id_prop and nrc.n_event_type = 1
	WHERE	sub.vt_start >= @dt_start and sub.vt_start < @dt_end
	;

END
ELSE
BEGIN

	INSERT INTO #TMP_NRC
	(
		id_source_sess,
		c_NRCEventType,
		c_NRCIntervalStart,
		c_NRCIntervalEnd,
		c_NRCIntervalSubscriptionStart,
		c_NRCIntervalSubscriptionEnd,
		c__AccountID,
		c__PriceableItemInstanceID,
		c__PriceableItemTemplateID,
		c__ProductOfferingID,
		c__SubscriptionID,
		c__IntervalID,
		c__Resubmit,
		c__TransactionCookie,
		c__CollectionID
	)
	SELECT
			newid() AS id_source_sess,
			nrc.n_event_type AS	c_NRCEventType,
			@dt_start AS c_NRCIntervalStart,
			@dt_end AS 	c_NRCIntervalEnd,
			sub.vt_start AS	c_NRCIntervalSubscriptionStart,
			sub.vt_end AS	c_NRCIntervalSubscriptionEnd,
			sub.id_acc AS	c__AccountID,
			plm.id_pi_instance AS	c__PriceableItemInstanceID,
			plm.id_pi_template AS	c__PriceableItemTemplateID,
			sub.id_po AS c__ProductOfferingID,
			sub.id_sub AS	c__SubscriptionID,
			@v_id_interval AS c__IntervalID,
			'0' AS c__Resubmit,
			NULL AS c__TransactionCookie,
			@tx_batch AS c__CollectionID
	FROM	t_sub sub
			inner join #TMP_NRC_ACCOUNTS_FOR_RUN acc on acc.id_acc = sub.id_acc
			inner join #TMP_RC_POID_FOR_RUN po on po.id_po = sub.id_po
			inner join t_po on sub.id_po = t_po.id_po
			inner join t_pl_map plm on sub.id_po = plm.id_po and plm.id_paramtable IS NULL
			inner join t_base_props bp on bp.id_prop = plm.id_pi_instance and bp.n_kind = 30
			inner join t_nonrecur nrc on nrc.id_prop = bp.id_prop and nrc.n_event_type = 1
	WHERE	sub.vt_start >= @dt_start and sub.vt_start < @dt_end
	;

END

set @total_nrcs = (select count(*) from #tmp_nrc)

set @id_nonrec = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
	'metratech.com/nonrecurringcharge');

SET @n_batches = (@total_nrcs / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_ss,
    id_source_sess
FROM #tmp_nrc
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, @id_nonrec, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_ss,
    1 AS b_root
FROM #tmp_nrc) a
GROUP BY a.id_message, a.id_ss, a.b_root;
 
INSERT INTO t_svc_NonRecurringCharge
(
	id_source_sess,
    id_parent_source_sess,
    id_external,
    c_NRCEventType,
	c_NRCIntervalStart,
	c_NRCIntervalEnd,
	c_NRCIntervalSubscriptionStart,
	c_NRCIntervalSubscriptionEnd,
	c__AccountID,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c__SubscriptionID,
    c__IntervalID,
    c__Resubmit,
    c__TransactionCookie,
    c__CollectionID
)
SELECT
    id_source_sess,
    NULL AS id_parent_source_sess,
    NULL AS id_external,
	c_NRCEventType,
	c_NRCIntervalStart,
	c_NRCIntervalEnd,
	c_NRCIntervalSubscriptionStart,
	c_NRCIntervalSubscriptionEnd,
	c__AccountID,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c__SubscriptionID,
    c__IntervalID,
    c__Resubmit,
    c__TransactionCookie,
    c__CollectionID
FROM #tmp_nrc

INSERT 	INTO t_message
(
	id_message,
	id_route,
	dt_crt,
	dt_metered,
	dt_assigned,
	id_listener,
	id_pipeline,
	dt_completed,
	id_feedback,
	tx_TransactionID,
	tx_sc_username,
	tx_sc_password,
	tx_sc_namespace,
	tx_sc_serialized,
	tx_ip_address
)
SELECT
	id_message,
	NULL,
	@v_run_date,
	@v_run_date,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'127.0.0.1'
FROM
	(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY id_source_sess) % @n_batches) AS id_message
	FROM #tmp_nrc
	) a
GROUP BY a.id_message;

drop table #tmp_nrc
SET @p_count = @total_nrcs
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[t_vw_adm_exchange_rates]'
GO
create view t_vw_adm_exchange_rates as
        select xmap.*,
  case
    when nm_country_source = 'AED' then CAST( 0.2722580000 as numeric(22,10))
    when nm_country_source = 'AFN' then CAST( 0.0177990000 as numeric(22,10))
    when nm_country_source = 'ALL' then CAST( 0.0097245500 as numeric(22,10))
    when nm_country_source = 'AMD' then CAST( 0.0024235400 as numeric(22,10))
    when nm_country_source = 'ANG' then CAST( 0.5586590000 as numeric(22,10))
    when nm_country_source = 'AOA' then CAST( 0.0102397000 as numeric(22,10))
    when nm_country_source = 'ARS' then CAST( 0.1238390000 as numeric(22,10))
    when nm_country_source = 'AUD' then CAST( 0.9223690000 as numeric(22,10))
    when nm_country_source = 'AWG' then CAST( 0.5586590000 as numeric(22,10))
    when nm_country_source = 'AZN' then CAST( 1.2748600000 as numeric(22,10))
    when nm_country_source = 'BAM' then CAST( 0.6950060000 as numeric(22,10))
    when nm_country_source = 'BBD' then CAST( 0.5000000000 as numeric(22,10))
    when nm_country_source = 'BDT' then CAST( 0.0129121000 as numeric(22,10))
    when nm_country_source = 'BGN' then CAST( 0.6950030000 as numeric(22,10))
    when nm_country_source = 'BHD' then CAST( 2.6521800000 as numeric(22,10))
    when nm_country_source = 'BIF' then CAST( 0.0006460000 as numeric(22,10))
    when nm_country_source = 'BMD' then CAST( 1.0000000000 as numeric(22,10))
    when nm_country_source = 'BND' then CAST( 0.7963100000 as numeric(22,10))
    when nm_country_source = 'BOB' then CAST( 0.1447180000 as numeric(22,10))
    when nm_country_source = 'BRL' then CAST( 0.4469190000 as numeric(22,10))
    when nm_country_source = 'BSD' then CAST( 1.0000000000 as numeric(22,10))
    when nm_country_source = 'BTN' then CAST( 0.0169592000 as numeric(22,10))
    when nm_country_source = 'BWP' then CAST( 0.1151990000 as numeric(22,10))
    when nm_country_source = 'BYR' then CAST( 0.0000991818 as numeric(22,10))
    when nm_country_source = 'BZD' then CAST( 0.5007580000 as numeric(22,10))
    when nm_country_source = 'CAD' then CAST( 0.9188030000 as numeric(22,10))
    when nm_country_source = 'CDF' then CAST( 0.0010938700 as numeric(22,10))
    when nm_country_source = 'CHF' then CAST( 1.1132400000 as numeric(22,10))
    when nm_country_source = 'CLP' then CAST( 0.0018138600 as numeric(22,10))
    when nm_country_source = 'CNY' then CAST( 0.1598730000 as numeric(22,10))
    when nm_country_source = 'COP' then CAST( 0.0005232900 as numeric(22,10))
    when nm_country_source = 'CRC' then CAST( 0.0018096300 as numeric(22,10))
    when nm_country_source = 'CUC' then CAST( 1.0000000000 as numeric(22,10))
    when nm_country_source = 'CUP' then CAST( 0.0377358000 as numeric(22,10))
    when nm_country_source = 'CVE' then CAST( 0.0126459000 as numeric(22,10))
    when nm_country_source = 'CZK' then CAST( 0.0494407000 as numeric(22,10))
    when nm_country_source = 'DJF' then CAST( 0.0055679700 as numeric(22,10))
    when nm_country_source = 'DKK' then CAST( 0.1821460000 as numeric(22,10))
    when nm_country_source = 'DOP' then CAST( 0.0231321000 as numeric(22,10))
    when nm_country_source = 'DZD' then CAST( 0.0126130000 as numeric(22,10))
    when nm_country_source = 'EGP' then CAST( 0.1396880000 as numeric(22,10))
    when nm_country_source = 'ERN' then CAST( 0.0955110000 as numeric(22,10))
    when nm_country_source = 'ETB' then CAST( 0.0511195000 as numeric(22,10))
    when nm_country_source = 'EUR' then CAST( 1.3595000000 as numeric(22,10))
    when nm_country_source = 'FJD' then CAST( 0.5477090000 as numeric(22,10))
    when nm_country_source = 'FKP' then CAST( 1.6713700000 as numeric(22,10))
    when nm_country_source = 'GBP' then CAST( 1.6713600000 as numeric(22,10))
    when nm_country_source = 'GEL' then CAST( 0.5650250000 as numeric(22,10))
    when nm_country_source = 'GGP' then CAST( 1.6713400000 as numeric(22,10))
    when nm_country_source = 'GHS' then CAST( 0.3352900000 as numeric(22,10))
    when nm_country_source = 'GIP' then CAST( 1.6713000000 as numeric(22,10))
    when nm_country_source = 'GMD' then CAST( 0.0252247000 as numeric(22,10))
    when nm_country_source = 'GNF' then CAST( 0.0001426310 as numeric(22,10))
    when nm_country_source = 'GTQ' then CAST( 0.1288410000 as numeric(22,10))
    when nm_country_source = 'GYD' then CAST( 0.0047973100 as numeric(22,10))
    when nm_country_source = 'HKD' then CAST( 0.1289740000 as numeric(22,10))
    when nm_country_source = 'HNL' then CAST( 0.0523560000 as numeric(22,10))
    when nm_country_source = 'HRK' then CAST( 0.1790270000 as numeric(22,10))
    when nm_country_source = 'HTG' then CAST( 0.0220996000 as numeric(22,10))
    when nm_country_source = 'HUF' then CAST( 0.0044728700 as numeric(22,10))
    when nm_country_source = 'IDR' then CAST( 0.0000859485 as numeric(22,10))
    when nm_country_source = 'ILS' then CAST( 0.2871490000 as numeric(22,10))
    when nm_country_source = 'IMP' then CAST( 1.6712900000 as numeric(22,10))
    when nm_country_source = 'INR' then CAST( 0.0169685000 as numeric(22,10))
    when nm_country_source = 'IQD' then CAST( 0.0008591100 as numeric(22,10))
    when nm_country_source = 'IRR' then CAST( 0.0000390700 as numeric(22,10))
    when nm_country_source = 'ISK' then CAST( 0.0088613300 as numeric(22,10))
    when nm_country_source = 'JEP' then CAST( 0.5983360000 as numeric(22,10))
    when nm_country_source = 'JMD' then CAST( 0.0090132500 as numeric(22,10))
    when nm_country_source = 'JOD' then CAST( 1.4120300000 as numeric(22,10))
    when nm_country_source = 'JPY' then CAST( 0.0098198000 as numeric(22,10))
    when nm_country_source = 'KES' then CAST( 0.0113766000 as numeric(22,10))
    when nm_country_source = 'KGS' then CAST( 0.0190549000 as numeric(22,10))
    when nm_country_source = 'KHR' then CAST( 0.0002474640 as numeric(22,10))
    when nm_country_source = 'KMF' then CAST( 0.0027628900 as numeric(22,10))
    when nm_country_source = 'KPW' then CAST( 0.0075692500 as numeric(22,10))
    when nm_country_source = 'KRW' then CAST( 0.0009794580 as numeric(22,10))
    when nm_country_source = 'KWD' then CAST( 3.5467600000 as numeric(22,10))
    when nm_country_source = 'KYD' then CAST( 1.2195100000 as numeric(22,10))
    when nm_country_source = 'KZT' then CAST( 0.0054429200 as numeric(22,10))
    when nm_country_source = 'LAK' then CAST( 0.0001240770 as numeric(22,10))
    when nm_country_source = 'LBP' then CAST( 0.0006607200 as numeric(22,10))
    when nm_country_source = 'LKR' then CAST( 0.0076687100 as numeric(22,10))
    when nm_country_source = 'LRD' then CAST( 0.0118343000 as numeric(22,10))
    when nm_country_source = 'LSL' then CAST( 0.0955714000 as numeric(22,10))
    when nm_country_source = 'LTL' then CAST( 0.3936730000 as numeric(22,10))
    when nm_country_source = 'LVL' then CAST( 1.9340800000 as numeric(22,10))
    when nm_country_source = 'LYD' then CAST( 0.8193360000 as numeric(22,10))
    when nm_country_source = 'MAD' then CAST( 0.1211340000 as numeric(22,10))
    when nm_country_source = 'MDL' then CAST( 0.0742115000 as numeric(22,10))
    when nm_country_source = 'MGA' then CAST( 0.0004291850 as numeric(22,10))
    when nm_country_source = 'MKD' then CAST( 0.0220556000 as numeric(22,10))
    when nm_country_source = 'MMK' then CAST( 0.0010330600 as numeric(22,10))
    when nm_country_source = 'MNT' then CAST( 0.0005529440 as numeric(22,10))
    when nm_country_source = 'MOP' then CAST( 0.1252120000 as numeric(22,10))
    when nm_country_source = 'MRO' then CAST( 0.0034188000 as numeric(22,10))
    when nm_country_source = 'MUR' then CAST( 0.0327118000 as numeric(22,10))
    when nm_country_source = 'MVR' then CAST( 0.0651466000 as numeric(22,10))
    when nm_country_source = 'MWK' then CAST( 0.0025310000 as numeric(22,10))
    when nm_country_source = 'MXN' then CAST( 0.0777022000 as numeric(22,10))
    when nm_country_source = 'MYR' then CAST( 0.3099050000 as numeric(22,10))
    when nm_country_source = 'MZN' then CAST( 0.0317460000 as numeric(22,10))
    when nm_country_source = 'NAD' then CAST( 0.0955762000 as numeric(22,10))
    when nm_country_source = 'NGN' then CAST( 0.0061406200 as numeric(22,10))
    when nm_country_source = 'NIO' then CAST( 0.0389029000 as numeric(22,10))
    when nm_country_source = 'NOK' then CAST( 0.1674840000 as numeric(22,10))
    when nm_country_source = 'NPR' then CAST( 0.0104083000 as numeric(22,10))
    when nm_country_source = 'NZD' then CAST( 0.8496230000 as numeric(22,10))
    when nm_country_source = 'OMR' then CAST( 2.5980800000 as numeric(22,10))
    when nm_country_source = 'PAB' then CAST( 1.0000000000 as numeric(22,10))
    when nm_country_source = 'PEN' then CAST( 0.3607520000 as numeric(22,10))
    when nm_country_source = 'PGK' then CAST( 0.3649640000 as numeric(22,10))
    when nm_country_source = 'PHP' then CAST( 0.0227809000 as numeric(22,10))
    when nm_country_source = 'PKR' then CAST( 0.0101258000 as numeric(22,10))
    when nm_country_source = 'PLN' then CAST( 0.3272110000 as numeric(22,10))
    when nm_country_source = 'PYG' then CAST( 0.0002254500 as numeric(22,10))
    when nm_country_source = 'QAR' then CAST( 0.2746800000 as numeric(22,10))
    when nm_country_source = 'RON' then CAST( 0.3093640000 as numeric(22,10))
    when nm_country_source = 'RSD' then CAST( 0.0117650000 as numeric(22,10))
    when nm_country_source = 'RUB' then CAST( 0.0289187000 as numeric(22,10))
    when nm_country_source = 'RWF' then CAST( 0.0014728100 as numeric(22,10))
    when nm_country_source = 'SAR' then CAST( 0.2665390000 as numeric(22,10))
    when nm_country_source = 'SBD' then CAST( 0.1371000000 as numeric(22,10))
    when nm_country_source = 'SCR' then CAST( 0.0819793000 as numeric(22,10))
    when nm_country_source = 'SDG' then CAST( 0.1756700000 as numeric(22,10))
    when nm_country_source = 'SEK' then CAST( 0.1505360000 as numeric(22,10))
    when nm_country_source = 'SGD' then CAST( 0.7962000000 as numeric(22,10))
    when nm_country_source = 'SHP' then CAST( 1.6712500000 as numeric(22,10))
    when nm_country_source = 'SLL' then CAST( 0.0002299930 as numeric(22,10))
    when nm_country_source = 'SOS' then CAST( 0.0008340400 as numeric(22,10))
    when nm_country_source = 'SRD' then CAST( 0.3053450000 as numeric(22,10))
    when nm_country_source = 'STD' then CAST( 0.0000555001 as numeric(22,10))
    when nm_country_source = 'SYP' then CAST( 0.0067091700 as numeric(22,10))
    when nm_country_source = 'SZL' then CAST( 0.0955923000 as numeric(22,10))
    when nm_country_source = 'THB' then CAST( 0.0305951000 as numeric(22,10))
    when nm_country_source = 'TJS' then CAST( 0.2037620000 as numeric(22,10))
    when nm_country_source = 'TMT' then CAST( 0.3508770000 as numeric(22,10))
    when nm_country_source = 'TND' then CAST( 0.6128200000 as numeric(22,10))
    when nm_country_source = 'TOP' then CAST( 0.5392000000 as numeric(22,10))
    when nm_country_source = 'TRY' then CAST( 0.4760410000 as numeric(22,10))
    when nm_country_source = 'TTD' then CAST( 0.1549330000 as numeric(22,10))
    when nm_country_source = 'TWD' then CAST( 0.0332036000 as numeric(22,10))
    when nm_country_source = 'TZS' then CAST( 0.0006018700 as numeric(22,10))
    when nm_country_source = 'UAH' then CAST( 0.0853628000 as numeric(22,10))
    when nm_country_source = 'UGX' then CAST( 0.0003932400 as numeric(22,10))
    when nm_country_source = 'USD' then CAST( 1.0000000000 as numeric(22,10))
    when nm_country_source = 'UYU' then CAST( 0.0433841000 as numeric(22,10))
    when nm_country_source = 'UZS' then CAST( 0.0004354600 as numeric(22,10))
    when nm_country_source = 'VEF' then CAST( 0.1590410000 as numeric(22,10))
    when nm_country_source = 'VND' then CAST( 0.0000472925 as numeric(22,10))
    when nm_country_source = 'VUV' then CAST( 0.0105485000 as numeric(22,10))
    when nm_country_source = 'WST' then CAST( 0.4410000000 as numeric(22,10))
    when nm_country_source = 'XAF' then CAST( 0.0020725400 as numeric(22,10))
    when nm_country_source = 'XAG' then CAST( 19.0235000000 as numeric(22,10))
    when nm_country_source = 'XAU' then CAST( 1258.3900000000 as numeric(22,10))
    when nm_country_source = 'XCD' then CAST( 0.3703700000 as numeric(22,10))
    when nm_country_source = 'XDR' then CAST( 1.5392900000 as numeric(22,10))
    when nm_country_source = 'XOF' then CAST( 0.0020725700 as numeric(22,10))
    when nm_country_source = 'XPD' then CAST( 836.7890000000 as numeric(22,10))
    when nm_country_source = 'XPF' then CAST( 0.0113929000 as numeric(22,10))
    when nm_country_source = 'XPT' then CAST( 1453.6000000000 as numeric(22,10))
    when nm_country_source = 'YER' then CAST( 0.0046553900 as numeric(22,10))
    when nm_country_source = 'ZAR' then CAST( 0.0955487000 as numeric(22,10))
    when nm_country_source = 'ZMK' then CAST( 0.0001418440 as numeric(22,10))
    when nm_country_source = 'CYP' then CAST( 2.3225400000 as numeric(22,10))
    when nm_country_source = 'DEM' then CAST( 0.6950170000 as numeric(22,10))
    when nm_country_source = 'EEK' then CAST( 0.0868872000 as numeric(22,10))
    when nm_country_source = 'ESP' then CAST( 0.0081707700 as numeric(22,10))
    when nm_country_source = 'FRF' then CAST( 0.2072550000 as numeric(22,10))
    when nm_country_source = 'IEP' then CAST( 1.7262700000 as numeric(22,10))
    when nm_country_source = 'MGF' then CAST( 0.0000858369 as numeric(22,10))
    when nm_country_source = 'MTL' then CAST( 3.1663200000 as numeric(22,10))
    when nm_country_source = 'ROL' then CAST( 0.0000309277 as numeric(22,10))
    when nm_country_source = 'SDD' then CAST( 0.0017567000 as numeric(22,10))
    when nm_country_source = 'SKK' then CAST( 0.0451157000 as numeric(22,10))
    when nm_country_source = 'SPL' then CAST( 6.0000000000 as numeric(22,10))
    when nm_country_source = 'SVC' then CAST( 0.1142860000 as numeric(22,10))
    when nm_country_source = 'TMM' then CAST( 0.0000701754 as numeric(22,10))
    when nm_country_source = 'TRL' then CAST( 0.0000004767 as numeric(22,10))
    when nm_country_source = 'TVD' then CAST( 0.9236910000 as numeric(22,10))
    when nm_country_source = 'VEB' then CAST( 0.0001590410 as numeric(22,10))
    when nm_country_source = 'ZWD' then CAST( 0.0027631900 as numeric(22,10))
    else                                CAST(     0.000000 as NUMERIC(22,10))
  end as c_exchange_rate
from
(
select convert(datetime, '2000-01-01 00:00:00',20) as vt_start,
       dbo.MTMaxDate() as vt_end,
       REVERSE(left(REVERSE(eds.nm_enum_data), charindex('/',REVERSE(eds.nm_enum_data))-1)) as nm_country_source,
       REVERSE(left(REVERSE(edt.nm_enum_data), charindex('/',REVERSE(edt.nm_enum_data))-1)) as nm_country_target,
       eds.id_enum_data as id_country_source,
       edt.id_enum_data as id_country_target
from t_enum_data eds
cross join t_enum_data edt
where eds.nm_enum_data LIKE 'Global/SystemCurrencies/SystemCurrencies/%'
  and edt.nm_enum_data LIKE 'Global/SystemCurrencies/SystemCurrencies/%'
  and edt.nm_enum_data    = 'Global/SystemCurrencies/SystemCurrencies/USD'
) xmap
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SubscriptionUnits]'
GO
CREATE TABLE [dbo].[SubscriptionUnits]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionId] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL,
[UdrcId] [int] NOT NULL,
[UdrcName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UnitName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Units] [numeric] (22, 10) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SubscriptionSummary]'
GO
CREATE TABLE [dbo].[SubscriptionSummary]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductOfferingId] [int] NOT NULL,
[Year] [int] NOT NULL,
[Month] [int] NOT NULL,
[TotalParticipants] [int] NOT NULL,
[DistinctHierarchies] [int] NOT NULL,
[NewParticipants] [int] NOT NULL,
[MRRPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRNewPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRBasePrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRRenewalPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRPriceChangePrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRChurnPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRCancelationPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[SubscriptionRevPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[DaysInMonth] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SubscriptionsByMonth]'
GO
CREATE TABLE [dbo].[SubscriptionsByMonth]
(
[InstanceId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionId] [int] NOT NULL,
[Year] [int] NOT NULL,
[Month] [int] NOT NULL,
[Currency] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MRR] [numeric] (22, 10) NOT NULL,
[MRRPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRNew] [numeric] (22, 10) NOT NULL,
[MRRNewPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRBase] [numeric] (22, 10) NOT NULL,
[MRRBasePrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRRenewal] [int] NOT NULL,
[MRRRenewalPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRPriceChange] [numeric] (22, 10) NOT NULL,
[MRRPriceChangePrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRChurn] [int] NOT NULL,
[MRRChurnPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[MRRCancelation] [int] NOT NULL,
[MRRCancelationPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[SubscriptionRevenue] [int] NOT NULL,
[SubscriptionRevPrimaryCurrency] [numeric] (22, 10) NOT NULL,
[DaysInMonth] [int] NOT NULL,
[DaysActiveInMonth] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SalesRep]'
GO
CREATE TABLE [dbo].[SalesRep]
(
[InstanceId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MetraNetId] [int] NOT NULL,
[ExternalId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CustomerId] [int] NOT NULL,
[Percentage] [int] NOT NULL,
[RelationshipType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[ProductOffering]'
GO
CREATE TABLE [dbo].[ProductOffering]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductOfferingId] [int] NOT NULL,
[ProductOfferingName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsUserSubscribable] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsUserUnsubscribable] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsHidden] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EffectiveStartDate] [datetime] NOT NULL,
[EffectiveEndDate] [datetime] NOT NULL,
[AvailableStartDate] [datetime] NOT NULL,
[AvailableEndDate] [datetime] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Customer]'
GO
CREATE TABLE [dbo].[Customer]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MetraNetId] [int] NOT NULL,
[AccountType] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExternalId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExternalIdSpace] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Currency] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyMetraNetId] [int] NOT NULL,
[HierarchyAccountType] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyExternalId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyExternalIdSpace] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyFirstName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyMiddleName] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyLastName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyCompany] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyCurrency] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyState] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyZipCode] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyEmail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyPhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Customer] on [dbo].[Customer]'
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([InstanceId], [MetraNetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CurrencyExchangeMonthly]'
GO
CREATE TABLE [dbo].[CurrencyExchangeMonthly]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL,
[SourceCurrency] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TargetCurrency] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExchangeRate] [numeric] (22, 10) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering c_RCActionType field to [dbo].[t_pv_FlatRecurringCharge]'
GO
ALTER TABLE [dbo].[t_pv_FlatRecurringCharge] ADD c_RCActionType nvarchar(32) NOT NULL DEFAULT ((''))
GO
UPDATE [dbo].[t_pv_FlatRecurringCharge]
SET c_RCActionType = sv.c_RCActionType
FROM dbo.t_pv_FlatRecurringCharge pv 
  INNER JOIN dbo.t_acc_usage au ON pv.id_sess = au.id_sess
  INNER JOIN dbo.t_svc_FlatRecurringCharge sv ON sv.id_source_sess = au.tx_UID
GO
PRINT N'Creating [dbo].[CreateAnalyticsDataMart]'
GO
CREATE PROCEDURE [dbo].[CreateAnalyticsDataMart] 
  @p_dt_now datetime, 
  @p_id_run int, 
  @p_nm_currency nvarchar(3), 
  @p_nm_instance varchar, 
  @p_n_months int, 
  @p_STAGINGDB_prefix varchar
AS
BEGIN

DECLARE @l_count int;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Starting Analytics DataMart');
end;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Flushing Analytics datamart tables');
end;

TRUNCATE TABLE Customer;
TRUNCATE TABLE SalesRep;
TRUNCATE TABLE SubscriptionsByMonth;
/* [TODO:] need to be implemented */
/*TRUNCATE TABLE Subscription; 
TRUNCATE TABLE SubscriptionPrice; */
TRUNCATE TABLE SubscriptionUnits;
TRUNCATE TABLE SubscriptionSummary;
/* [TODO:] need to be implemented */
/*TRUNCATE TABLE Counters;*/
TRUNCATE TABLE CurrencyExchangeMonthly;
TRUNCATE TABLE ProductOffering;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Cleaning out temporary tables');
end;

IF OBJECT_ID('tempdb..#tmp_unrooted') IS NOT NULL drop table #tmp_unrooted;
IF OBJECT_ID('tempdb..#tmp_all_customers') IS NOT NULL drop table #tmp_all_customers;
IF OBJECT_ID('tempdb..#tmp_corps') IS NOT NULL drop table #tmp_corps;
IF OBJECT_ID('tempdb..#tmp_accs') IS NOT NULL drop table #tmp_accs;
IF OBJECT_ID('tempdb..#all_rcs') IS NOT NULL drop table #all_rcs;
IF OBJECT_ID('tempdb..#all_rcs_linked') IS NOT NULL drop table #all_rcs_linked;
IF OBJECT_ID('tempdb..#all_rcs_by_month') IS NOT NULL drop table #all_rcs_by_month;
IF OBJECT_ID('tempdb..#sum_rcs_by_month') IS NOT NULL drop table #sum_rcs_by_month;
IF OBJECT_ID('tempdb..#tmp_fx') IS NOT NULL drop table #tmp_fx;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating Customers DataMart');
end;

/* TODO: info */
/* TODO: run incrementally instead of drop/recreate each time for usage etc. */
/* customers datamart */
;with root_accts as
(
	select /* corporate accounts */
	a.id_acc
	from t_account a with(nolock)
	inner join t_account_type t with(nolock) on t.id_type = a.id_type
	where 1=1
	and t.b_iscorporate = 1
	and t.b_isvisibleinhierarchy = 1
)
select
r.id_acc id_ancestor, aa.id_descendent, aa.num_generations
into #tmp_corps
from root_accts r with(nolock)
inner join t_account_ancestor aa with(nolock) on aa.id_ancestor = r.id_acc and @p_dt_now between aa.vt_start and aa.vt_end
where 1=1
OPTION(MAXDOP 1, FORCE ORDER)
;

select @l_count = count(1) from #tmp_corps;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Found Corporate Accounts: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

;with my_gens as
(
	select
	id_descendent, max(num_generations) num_generations
	from #tmp_corps
	group by id_descendent
)
select
max(a.id_ancestor) id_ancestor, a.id_descendent
into #tmp_accs
from #tmp_corps a
inner join my_gens g on a.id_descendent = g.id_descendent and a.num_generations = g.num_generations
where 1=1
group by a.id_descendent
OPTION(MAXDOP 1)
;

select @l_count = count(1) from #tmp_accs;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Found Corporate Hierarchy Accounts: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

; with root_accts as
(
	select
	aa.id_descendent id_acc
	from t_account_ancestor aa with(nolock)
	inner join t_account a with(nolock) on a.id_acc = aa.id_descendent
	inner join t_account_type t with(nolock) on t.id_type = a.id_type and (t.b_iscorporate = 0 or t.b_isvisibleinhierarchy = 0)
	where 1=1
	and @p_dt_now between aa.vt_start and aa.vt_end
	and aa.id_ancestor = 1
	and aa.num_generations = 1
	and aa.b_children = 'Y'
)
insert into #tmp_accs (id_ancestor, id_descendent)
select
r.id_acc id_ancestor, aa.id_descendent
from root_accts r with(nolock)
inner join t_account_ancestor aa with(nolock) on aa.id_ancestor = r.id_acc and @p_dt_now between aa.vt_start and aa.vt_end
left outer join #tmp_accs a on aa.id_descendent = a.id_descendent
where 1=1
and a.id_descendent is null
OPTION(MAXDOP 1, FORCE ORDER)
;

select @l_count = count(1) from #tmp_accs;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Added Non-Corporate Hierarchy Accounts, Total Now: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

/* non-corporate nodes without hierarchy */
insert into #tmp_accs (id_ancestor, id_descendent)
select
a.id_acc, a.id_acc
from t_account a with(nolock)
left outer join #tmp_accs b on a.id_acc = b.id_descendent
inner join t_account_ancestor aa with(nolock) on aa.id_descendent = a.id_acc and @p_dt_now between aa.vt_start and aa.vt_end and aa.id_ancestor = 1 and aa.num_generations > 0
where 1=1
and b.id_descendent is null
;

select @l_count = count(1) from #tmp_accs;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Added Non-Corporate Non-Hierarchy Accounts, Total Now: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

/* unrooted nodes */
select
aa.id_ancestor, aa.id_descendent, aa.num_generations
into #tmp_unrooted
from t_account a with(nolock)
left outer join #tmp_accs b on a.id_acc = b.id_descendent
inner join t_account_ancestor aa with(nolock) on aa.id_descendent = a.id_acc and @p_dt_now between aa.vt_start and aa.vt_end
where 1=1
and b.id_descendent is null
;

;with my_unrooted as
(
	select id_descendent, max(num_generations) num_generations
	from #tmp_unrooted
	group by id_descendent
)
insert into #tmp_accs (id_ancestor, id_descendent)
select
b.id_ancestor, b.id_descendent
from my_unrooted a
inner join #tmp_unrooted b on a.id_descendent = b.id_descendent and a.num_generations = b.num_generations
where 1=1
;

select @l_count = count(1) from #tmp_accs;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Added Non-Rooted Accounts, Total Now: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

declare @billTo int;

select @billTo = id_enum_data from t_enum_data where nm_enum_data = 'metratech.com/accountcreation/contacttype/bill-to';

select
@p_nm_instance as InstanceId,
c.id_acc as MetraNetId,
ct.name as AccountType,
cam.nm_login as ExternalId,
cam.nm_space as ExternalIdSpace,
cav.c_firstname as FirstName,
cav.c_middleinitial as MiddleName,
cav.c_lastname as LastName,
cav.c_company as Company,
cavi.c_currency as Currency,
cav.c_city as City,
cav.c_state as State,
cav.c_zip as ZipCode,
substring(ted2.nm_enum_data,20,100) as Country,
cav.c_email as Email,
cav.c_phonenumber as Phone,
p.id_acc as HierarchyMetraNetId,
pt.name as HierarchyAccountType,
pam.nm_login as HierarchyExternalId,
pam.nm_space as HierarchyExternalIdSpace,
pav.c_firstname as HierarchyFirstName,
pav.c_middleinitial as HierarchyMiddleName,
pav.c_lastname as HierarchyLastName,
pav.c_company as HierarchyCompany,
pavi.c_currency as HierarchyCurrency,
pav.c_city as HierarchyCity,
pav.c_state as HierarchyState,
pav.c_zip as HierarchyZipCode,
substring(ted3.nm_enum_data,20,100) as HierarchyCountry,
pav.c_email as HierarchyEmail,
pav.c_phonenumber as HierarchyPhone
into #tmp_all_customers
from #tmp_accs r with(nolock)
inner join t_account c with(nolock) on c.id_acc = r.id_descendent
inner join t_account_type ct with(nolock) on ct.id_type = c.id_type
inner join t_account_mapper cam with(nolock) on cam.id_acc = c.id_acc and cam.nm_space not in ('ar')
left outer join t_av_internal cavi with(nolock) on cavi.id_acc = c.id_acc
left outer join t_av_contact cav with(nolock) on c.id_acc = cav.id_acc and cav.c_contactType = @billTo
left outer join t_enum_data ted2 with(nolock) on ted2.id_enum_data = cav.c_country
inner join t_account p with(nolock) on p.id_acc = r.id_ancestor
inner join t_account_type pt with(nolock) on pt.id_type = p.id_type
inner join t_account_mapper pam with(nolock) on pam.id_acc = p.id_acc and pam.nm_space not in ('ar')
left outer join t_av_internal pavi with(nolock) on pavi.id_acc = p.id_acc
left outer join t_av_contact pav with(nolock) on p.id_acc = pav.id_acc and pav.c_contactType = @billTo
left outer join t_enum_data ted3 with(nolock) on ted3.id_enum_data = pav.c_country
where 1=1
OPTION(MAXDOP 1, FORCE ORDER)
;

select @l_count = count(1) from #tmp_all_customers;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Reducing duplicate aliases from total: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

insert into Customer
		(InstanceId,
		MetraNetId,
		AccountType,
		ExternalId,
		ExternalIdSpace,
		FirstName,
		MiddleName,
		LastName,
		Company,
		Currency,
		City,
		State,
		ZipCode,
		Country,
		Email,
		Phone,
		HierarchyMetraNetId,
		HierarchyAccountType,
		HierarchyExternalId,
		HierarchyExternalIdSpace,
		HierarchyFirstName,
		HierarchyMiddleName,
		HierarchyLastName,
		HierarchyCompany,
		HierarchyCurrency,
		HierarchyCity,
		HierarchyState,
		HierarchyZipCode,
		HierarchyCountry,
		HierarchyEmail,
		HierarchyPhone)
select
		InstanceId,
		MetraNetId,
		AccountType,
		ExternalId,
		ExternalIdSpace,
		FirstName,
		MiddleName,
		LastName,
		Company,
		Currency,
		City,
		State,
		ZipCode,
		Country,
		Email,
		Phone,
		HierarchyMetraNetId,
		HierarchyAccountType,
		HierarchyExternalId,
		HierarchyExternalIdSpace,
		HierarchyFirstName,
		HierarchyMiddleName,
		HierarchyLastName,
		HierarchyCompany,
		HierarchyCurrency,
		HierarchyCity,
		HierarchyState,
		HierarchyZipCode,
		HierarchyCountry,
		HierarchyEmail,
		HierarchyPhone
from (select *,
		DENSE_RANK() OVER (PARTITION BY MetraNetId, HierarchyMetraNetId ORDER BY ExternalIdSpace, HierarchyExternalIdSpace) as [priority_col]
		FROM #tmp_all_customers) a
where 1=1
and a.[priority_col] = 1

select @l_count = count(1) from Customer;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Customers: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating SalesRep DataMart');
end;

/* sales reps */
insert into SalesRep
(	InstanceId,
	MetraNetId,
	ExternalId,
	CustomerId,
	Percentage,
	RelationshipType)
select @p_nm_instance as InstanceId,
tao.id_owner as MetraNetId,
am.nm_login as ExternalId,
tao.id_owned as CustomerId,
tao.n_percent as Percentage,
substring(ted.nm_enum_data,37, 100) as RelationshipType
from t_acc_ownership tao with(nolock)
inner join t_enum_data ted with(nolock) on ted.id_enum_data = tao.id_relation_type
inner join t_account_mapper am with(nolock) on am.id_acc = tao.id_owner and am.nm_space = 'system_user'
where 1=1
and @p_dt_now between tao.vt_start and tao.vt_end
;

select @l_count = count(1) from SalesRep;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Sales Reps: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating CurrencyExchangeMonthly DataMart');
end;

/* TODO: change name of table */
select
@p_nm_instance as InstanceId,
vt_start as StartDate,
vt_end  as EndDate,
nm_country_source as SourceCurrency,
nm_country_target as TargetCurrency,
c_exchange_rate as ExchangeRate
into #tmp_fx
from t_vw_adm_exchange_rates;

insert into CurrencyExchangeMonthly
(	InstanceId,
	StartDate,
	EndDate,
	SourceCurrency,
	TargetCurrency,
	ExchangeRate
)
select InstanceId,
	StartDate,
	EndDate,
	SourceCurrency,
	TargetCurrency,
	ExchangeRate
from #tmp_fx;

select @l_count = count(1) from CurrencyExchangeMonthly;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Currency Exchange Rates: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating SubscriptionsByMonth DataMart');
end;

;
with my_pis as
(
select distinct
sub.id_sub,
sub.id_acc,
sub.id_po,
plm.id_pi_template,
plm.id_pi_instance,
sub.vt_start,
sub.vt_end
from t_sub sub with(nolock)
inner join t_pl_map plm with(nolock) on plm.id_po = sub.id_po and plm.id_paramtable is null and plm.id_sub is null
inner join t_recur tr with(nolock) on tr.id_prop = plm.id_pi_instance
where 1=1
and sub.id_group is null
union
select distinct
sub.id_sub,
mbr.id_acc,
sub.id_po,
plm.id_pi_template,
plm.id_pi_instance,
mbr.vt_start,
mbr.vt_end
from t_gsubmember mbr with(nolock)
inner join t_sub sub with(nolock) on sub.id_group = mbr.id_group
inner join t_pl_map plm with(nolock) on plm.id_po = sub.id_po and plm.id_paramtable is null and plm.id_sub is null
inner join t_recur tr with(nolock) on tr.id_prop = plm.id_pi_instance and tr.b_charge_per_participant = 'Y'
where 1=1
union
select distinct
sub.id_sub,
grm.id_acc,
sub.id_po,
plm.id_pi_template,
plm.id_pi_instance,
grm.vt_start,
grm.vt_end
from t_gsubmember mbr with(nolock)
inner join t_sub sub with(nolock) on sub.id_group = mbr.id_group
inner join t_pl_map plm with(nolock) on plm.id_po = sub.id_po and plm.id_paramtable is null and plm.id_sub is null
inner join t_recur tr with(nolock) on tr.id_prop = plm.id_pi_instance and tr.b_charge_per_participant = 'N'
inner join t_gsub_recur_map grm with(nolock) on grm.id_prop = tr.id_prop and grm.tt_end = dbo.mtmaxdate()
where 1=1
)
select
*
into #all_rcs
from (
select
@p_nm_instance as InstanceId,
svc.id_sub as SubscriptionId,
au.id_acc as PayerId,
au.id_payee as PayeeId,
pv.c_ProratedIntervalStart as StartDate,
pv.c_ProratedIntervalEnd as EndDate,
pv.c_RCActionType as ActionType,
au.am_currency as Currency,
pv.c_ProratedDailyRate as ProratedDailyRate,
au.amount/pv.c_prorateddays as DailyRate,
pv.c_RCAmount as Rate,
au.id_prod as ProductOfferingId,
au.id_pi_template as PriceableItemTemplateId,
au.id_pi_instance as PriceableItemInstanceId,
svc.vt_start as SubscriptionStartDate,
svc.vt_end as SubscriptionEndDate,
au.amount as MRR
from t_usage_interval tui with(nolock)
inner join t_pv_flatrecurringcharge pv with(nolock) on tui.id_interval = pv.id_usage_interval
inner join t_acc_usage au with(nolock) on au.id_usage_interval = pv.id_usage_interval and au.id_sess = pv.id_sess
inner join my_pis svc with(nolock) on svc.id_po = au.id_prod and svc.id_pi_template = au.id_pi_template and svc.id_pi_instance = au.id_pi_instance and svc.id_acc = au.id_payee
where 1=1
and au.amount <> 0.0
union all
select
@p_nm_instance as InstanceId,
svc.id_sub as SubscriptionId,
au.id_acc as PayerId,
au.id_payee as PayeeId,
pv.c_ProratedIntervalStart as StartDate,
pv.c_ProratedIntervalEnd as EndDate,
pv.c_RCActionType as ActionType,
au.am_currency as Currency,
pv.c_ProratedDailyRate as ProratedDailyRate,
au.amount/pv.c_prorateddays as DailyRate,
pv.c_RCAmount as Rate,
au.id_prod as ProductOfferingId,
au.id_pi_template as PriceableItemTemplateId,
au.id_pi_instance as PriceableItemInstanceId,
svc.vt_start as SubscriptionStartDate,
svc.vt_end as SubscriptionEndDate,
au.amount as MRR
from t_usage_interval tui with(nolock)
inner join t_pv_udrecurringcharge pv with(nolock) on tui.id_interval = pv.id_usage_interval
inner join t_acc_usage au with(nolock) on au.id_usage_interval = pv.id_usage_interval and au.id_sess = pv.id_sess
inner join my_pis svc with(nolock) on svc.id_po = au.id_prod and svc.id_pi_template = au.id_pi_template and svc.id_pi_instance = au.id_pi_instance and svc.id_acc = au.id_payee
where 1=1
and au.amount <> 0.0
) A
;

select @l_count = count(1) from #all_rcs;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Found RCs: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

create index idx_all_rcs on #all_rcs (InstanceId, SubscriptionId, PayeeId, PriceableItemTemplateId, PriceableItemInstanceId, StartDate, EndDate, ActionType, Currency);

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Created index for RC linkage');
end;

select
crc.*,
prc.Rate as OldRate,
prc.DailyRate as OldDailyRate,
prc.ProratedDailyRate as OldProratedDailyRate,
prc.SubscriptionStartDate as OldSubscriptionStartDate,
prc.SubscriptionEndDate as OldSubscriptionEndDate
into #all_rcs_linked
from #all_rcs crc
left outer join #all_rcs prc on  crc.InstanceId = prc.InstanceId
                             and crc.SubscriptionId = prc.SubscriptionId
                             and crc.PayeeId = prc.PayeeId
                             and crc.PriceableItemTemplateId = prc.PriceableItemTemplateId
                             and crc.PriceableItemInstanceId = prc.PriceableItemInstanceId
							 and crc.Currency = prc.Currency
                             and prc.EndDate = DATEADD(second,-1, crc.StartDate)
                             and prc.ActionType = crc.ActionType
                             and crc.ActionType IN ('Advance','Arrears')
where 1=1
;

select @l_count = count(1) from #all_rcs_linked;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Found Linked RCs: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

create index idx_all_rcs_linked on #all_rcs_linked (InstanceId, SubscriptionId, PriceableItemTemplateId, PriceableItemInstanceId, StartDate, EndDate);

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Created index for linked RCs');
end;

select
rcs.InstanceId,
rcs.SubscriptionId,
rcs.ProductOfferingId,
rcs.PriceableItemTemplateId,
rcs.PriceableItemInstanceId,
rcs.SubscriptionStartDate,
rcs.SubscriptionEndDate,
rcs.Currency,
case when months.number <> 0 then 'NotInitial' else rcs.ActionType end as ActionType,
year(dateadd(month, months.number, rcs.startdate)) as Year,
month(dateadd(month, months.number, rcs.startdate)) as Month,
rcs.DailyRate,
rcs.Rate,
rcs.OldDailyRate,
rcs.OldRate,
rcs.OldProratedDailyRate,
rcs.OldSubscriptionStartDate,
rcs.OldSubscriptionEndDate,
case when datediff(month, rcs.startdate, rcs.enddate) = months.number then day(rcs.enddate) - case when months.number = 0 then (day(rcs.startdate) - 1) else 0 end
	 else case when month(dateadd(month, months.number, rcs.startdate)) in (4,6,9,11) then 30
	           when month(dateadd(month, months.number, rcs.startdate)) = 2 then case when year(dateadd(month, months.number, rcs.startdate)) % 400 = 0 then 29
																					  when year(dateadd(month, months.number, rcs.startdate)) % 100 = 0 then 28
																					  when year(dateadd(month, months.number, rcs.startdate)) % 4   = 0 then 29
																					  else 28
																				 end
			   else 31
		  end
		  - case when months.number <> 0 then 0
				 else (day(rcs.startdate) - 1)
			end
end as Days
into #all_rcs_by_month
from #all_rcs_linked rcs
inner join master..spt_values months on months.type='P' and months.number between 0 and DATEDIFF(month,rcs.startdate, rcs.enddate)
where 1=1
;

select @l_count = count(1) from #all_rcs_by_month;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Found RCs by month: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

select
rcs.InstanceId,
rcs.SubscriptionId,
rcs.PriceableItemTemplateId,
rcs.PriceableItemInstanceId,
rcs.Currency,
rcs.Year,
rcs.Month,
case when rcs.Month in (4,6,9,11) then 30 when rcs.Month = 2 then case when rcs.Year % 400 = 0 then 29 when rcs.Year % 100 = 0 then 28 when rcs.Year % 4 = 0 then 29 else 28 end else 31 end as DaysInMonth,
max(rcs.Days) as DaysActiveInMonth,
sum(cast(rcs.DailyRate*rcs.Days as numeric(18,6))) as TotalAmount,
sum(case when rcs.OldRate is null then cast(rcs.DailyRate*rcs.Days as numeric(18,6))
		 when rcs.Rate = rcs.OldRate then cast(rcs.DailyRate*rcs.Days as numeric(18,6))
         when rcs.DailyRate = 0 then cast(rcs.DailyRate*rcs.Days as numeric(18,6))
         else cast((rcs.DailyRate*rcs.Days)*(cast(rcs.OldRate/rcs.Rate as numeric(29,17))) as numeric(18,6))
    end) as OldAmount,
sum(case when rcs.OldSubscriptionEndDate is null then rcs.DailyRate*rcs.Days else 0 end) as NewAmount
into #sum_rcs_by_month
from #all_rcs_by_month rcs
where 1=1
group by
rcs.InstanceId,
rcs.SubscriptionId,
rcs.Currency,
rcs.PriceableItemTemplateId,
rcs.PriceableItemInstanceId,
rcs.Year,
rcs.Month
;

select @l_count = count(1) from #sum_rcs_by_month;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Summarized RCs by month: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

create index idx_monthly_rcs on #sum_rcs_by_month (InstanceId, SubscriptionId, PriceableItemTemplateId, PriceableItemInstanceId, Year, Month, Currency);

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Created index for summarized subscriptions');
end;

create index idx_tmp_fx_rate on #tmp_fx (InstanceId,SourceCurrency,TargetCurrency,StartDate,EndDate);

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Debug', 'Created index for exchange rates');
end;

/* TODO: renewals */
/* TODO: churn */
/* TODO: cancellations */
/* TODO: subscription revenue */
insert into SubscriptionsByMonth
(	InstanceId,
	SubscriptionId,
	[Year],
	[Month],
	Currency,
	MRR,
	MRRPrimaryCurrency,
	MRRNew,
	MRRNewPrimaryCurrency,
	MRRBase,
	MRRBasePrimaryCurrency,
	MRRRenewal,
	MRRRenewalPrimaryCurrency,
	MRRPriceChange,
	MRRPriceChangePrimaryCurrency,
	MRRChurn,
	MRRChurnPrimaryCurrency,
	MRRCancelation,
	MRRCancelationPrimaryCurrency,
	SubscriptionRevenue,
	SubscriptionRevPrimaryCurrency,
	DaysInMonth,
	DaysActiveInMonth
)
select cMonth.InstanceId,
	cMonth.SubscriptionId,
	cMonth.Year,
	cMonth.Month,
	cMonth.Currency,
	cMonth.TotalAmount as MRR,
	cMonth.TotalAmount*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRPrimaryCurrency,
	cMonth.NewAmount as MRRNew,
	cMonth.NewAmount*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRNewPrimaryCurrency,
	IsNull(pMonth.TotalAmount,0) as MRRBase,
	IsNull(pMonth.TotalAmount,0)*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRBasePrimaryCurrency,
	0 as MRRRenewal,
	0*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRRenewalPrimaryCurrency,
	(cMonth.TotalAmount - cMonth.OldAmount) as MRRPriceChange,
	(cMonth.TotalAmount - cMonth.OldAmount)*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRPriceChangePrimaryCurrency,
	0 as MRRChurn,
	0*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRChurnPrimaryCurrency,
	0 as MRRCancelation,
	0*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as MRRCancelationPrimaryCurrency,
	0 as SubscriptionRevenue,
	0*(case when @p_nm_currency <> cMonth.Currency then exc.ExchangeRate else 1.0 end) as SubscriptionRevPrimaryCurrency,
	cMonth.DaysInMonth,
	cMonth.DaysActiveInMonth
from #sum_rcs_by_month cMonth
left outer join #sum_rcs_by_month pMonth on  cMonth.InstanceId = pMonth.InstanceId
										 and cMonth.SubscriptionId = pMonth.SubscriptionId
										 and cMonth.PriceableItemTemplateId = pMonth.PriceableItemTemplateId
										 and cMonth.PriceableItemInstanceId = pMonth.PriceableItemInstanceId
										 and cMonth.Currency = pMonth.Currency
										 and case when cMonth.Month = 1 then cMonth.Year - 1 else cMonth.Year end = pMonth.Year
										 and case when cMonth.Month = 1 then 12 else cMonth.Month - 1 end = pMonth.Month
left outer join #tmp_fx exc on exc.InstanceId = cMonth.InstanceId and exc.SourceCurrency = cMonth.Currency and exc.TargetCurrency = @p_nm_currency and @p_dt_now between exc.StartDate and exc.EndDate
where 1=1
;

select @l_count = count(1) from SubscriptionsByMonth;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Subscriptions by month: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating SubscriptionSummary DataMart');
end;

insert into SubscriptionSummary
(	InstanceId,
	ProductOfferingId,
	[Year],
	[Month],
	TotalParticipants,
	DistinctHierarchies,
	NewParticipants,
	MRRPrimaryCurrency,
	MRRNewPrimaryCurrency,
	MRRBasePrimaryCurrency,
	MRRRenewalPrimaryCurrency,
	MRRPriceChangePrimaryCurrency,
	MRRChurnPrimaryCurrency,
	MRRCancelationPrimaryCurrency,
	SubscriptionRevPrimaryCurrency,
	DaysInMonth)
select
mrr.InstanceId,
sub.id_po as ProductOfferingId,
mrr.Year,
mrr.Month,
count(1) as TotalParticipants,
count(distinct cust.HierarchyMetraNetId) as DistinctHierarchies,
sum(case when datediff(day, sub.vt_start, @p_dt_now) <= 30 then 1 else 0 end) as NewParticipants,
sum(mrr.MRRPrimaryCurrency) as MRRPrimaryCurrency,
sum(mrr.MRRNewPrimaryCurrency) as MRRNewPrimaryCurrency,
sum(mrr.MRRBasePrimaryCurrency) as MRRBasePrimaryCurrency,
sum(mrr.MRRRenewalPrimaryCurrency) as MRRRenewalPrimaryCurrency,
sum(mrr.MRRPriceChangePrimaryCurrency) as MRRPriceChangePrimaryCurrency,
sum(mrr.MRRChurnPrimaryCurrency) as MRRChurnPrimaryCurrency,
sum(mrr.MRRCancelationPrimaryCurrency) as MRRCancelationPrimaryCurrency,
sum(mrr.SubscriptionRevPrimaryCurrency) as SubscriptionRevPrimaryCurrency,
mrr.DaysInMonth
from SubscriptionsByMonth mrr
inner join t_sub sub with(nolock) on sub.id_sub = mrr.SubscriptionId
inner join Customer cust on cust.InstanceId = mrr.InstanceId and cust.MetraNetId = sub.id_acc
where 1=1
group by mrr.InstanceId, mrr.Year, mrr.Month, sub.id_po, mrr.DaysInMonth
;

select @l_count = count(1) from SubscriptionSummary;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Subscription summaries: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating SubscriptionUnits DataMart');
end;

/* NOTE: this is UDRC's not decision counters */
insert into SubscriptionUnits
(	InstanceId,
	SubscriptionId,
	StartDate,
	EndDate,
	UdrcId,
	UdrcName,
	UnitName,
	Units
)
select @p_nm_instance as InstanceId,
rv.id_sub as SubscriptionId,
rv.vt_start as StartDate,
rv.vt_end as EndDate,
bp.id_prop as UdrcId,
isnull(bp.nm_display_name, bp.nm_name) as UdrcName,
IsNull(rc.nm_unit_display_name, rc.nm_unit_name) as UnitName,
rv.n_value as Units
from t_recur_value rv
inner join t_base_props bp on bp.id_prop = rv.id_prop
inner join t_recur rc on rc.id_prop = rv.id_prop
where 1=1
and rv.tt_end = dbo.mtmaxdate()
;

select @l_count = count(1) from SubscriptionUnits;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Subscription units: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating ProductOffering DataMart');
end;

insert into ProductOffering
(	InstanceId,
	ProductOfferingId,
	ProductOfferingName,
	IsUserSubscribable,
	IsUserUnsubscribable,
	IsHidden,
	EffectiveStartDate,
	EffectiveEndDate,
	AvailableStartDate,
	AvailableEndDate)
select
@p_nm_instance as InstanceId,
po.id_po as ProductOfferingId,
IsNull(bp.nm_display_name, bp.nm_name) as ProductOfferingName,
po.b_user_subscribe as IsUserSubscribable,
po.b_user_unsubscribe as IsUserUnsubscribable,
po.b_hidden as IsHidden,
IsNull(eff.dt_start, dbo.mtmindate()) as EffectiveStartDate,
IsNull(eff.dt_end, dbo.mtmaxdate()) as EffectiveEndDate,
IsNull(avl.dt_start, dbo.mtmindate()) as AvailableStartDate,
IsNull(avl.dt_end, dbo.mtmaxdate()) as AvailableEndDate
from t_po po with(nolock)
inner join t_effectivedate eff with(nolock) on eff.id_eff_date = po.id_eff_date
inner join t_effectivedate avl with(nolock) on avl.id_eff_date = po.id_avail
inner join t_base_props bp with(nolock) on bp.id_prop = po.id_po
where 1=1
;

select @l_count = count(1) from SubscriptionUnits;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Product Offerings: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;

/* TODO: churn/renewal/cancellations */
/* TODO: projections */

/* TODO: subscription */
/* TODO: subscription price */

/* TODO: priceable items */
/* TODO: recurring charges */
/* TODO: non recurring charges */
/* TODO: counters */
/* TODO: revrec */

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Finished generating DataMart');
end;

end;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[VW_ADJUSTMENT_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_ADJUSTMENT_DETAILS]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Refreshing [dbo].[VW_NOTDELETED_ADJ_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_NOTDELETED_ADJ_DETAILS]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[mtsp_generate_stateful_rcs]'
GO
ALTER PROCEDURE [dbo].[mtsp_generate_stateful_rcs]
                                            @v_id_interval  int
                                           ,@v_id_billgroup int
                                           ,@v_id_run       int
                                           ,@v_id_batch     varchar(256)
                                           ,@v_n_batch_size int
                                                               ,@v_run_date   datetime
                                           ,@p_count      int OUTPUT
AS
BEGIN
      /* SET NOCOUNT ON added to prevent extra result sets from
         interfering with SELECT statements. */
      SET NOCOUNT ON;
	  SET XACT_ABORT ON;
  DECLARE @total_rcs  int,
          @total_flat int,
          @total_udrc int,
          @n_batches  int,
          @id_flat    int,
          @id_udrc    int,
          @id_message bigint,
          @id_ss      int,
          @tx_batch   binary(16);
          
  IF OBJECT_ID (N't_rec_win_bcp_for_reverse', N'U') IS NOT NULL
    DROP TABLE t_rec_win_bcp_for_reverse

  SELECT c_BilledThroughDate, c__PriceableItemInstanceID, c__PriceableItemTemplateID, c__ProductOfferingID, c__SubscriptionID
  INTO t_rec_win_bcp_for_reverse FROM t_recur_window

  
INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Retrieving RC candidates');
SELECT
*
INTO
#TMP_RC
FROM(
	SELECT
      'Arrears'                                                                            AS c_RCActionType
      ,pci.dt_start                                                                        AS c_RCIntervalStart
      ,pci.dt_end                                                                          AS c_RCIntervalEnd
      ,ui.dt_start                                                                         AS c_BillingIntervalStart
      ,ui.dt_end                                                                           AS c_BillingIntervalEnd
      ,dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart)                           AS c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)                               AS c_RCIntervalSubscriptionEnd
      ,rw.c_SubscriptionStart                                                              AS c_SubscriptionStart
      ,rw.c_SubscriptionEnd                                                                AS c_SubscriptionEnd
      ,pci.dt_end                                                                          AS c_BilledRateDate
      ,rcr.n_rating_type                                                                   AS c_RatingType
      ,case when rw.c_advance  ='Y' then '1' else '0' end                                  AS c_Advance
      ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end                      AS c_ProrateOnSubscription
      ,case when rcr.b_prorate_instantly  ='Y' then '1' else '0' end                       AS c_ProrateInstantly /* NOTE: c_ProrateInstantly - No longer used */
      ,case when rcr.b_prorate_on_deactivate ='Y' then '1' else '0' end                    AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END AS c_ProrationCycleLength
      ,rw.c__accountid                                                                     AS c__AccountID
      ,rw.c__payingaccount                                                                 AS c__PayingAccount
      ,rw.c__priceableiteminstanceid                                                       AS c__PriceableItemInstanceID
      ,rw.c__priceableitemtemplateid                                                       AS c__PriceableItemTemplateID
      ,rw.c__productofferingid                                                             AS c__ProductOfferingID
      ,rw.c_payerstart                                                                     AS c_payerstart
      ,rw.c_payerend                                                                       AS c_payerend
      ,case when rw.c_unitvaluestart < '1970-01-01 00:00:00'
         THEN '1970-01-01 00:00:00'
         ELSE rw.c_unitvaluestart END                                                      AS c_unitvaluestart
      ,rw.c_unitvalueend                                                                   AS c_unitvalueend
      ,rw.c_unitvalue                                                                      AS c_unitvalue
      ,rw.c__subscriptionid                                                                AS c__SubscriptionID
      ,newid()                                                                             AS idSourceSess
      FROM t_usage_interval ui
      INNER LOOP JOIN t_billgroup bg ON bg.id_usage_interval = ui.id_interval
      INNER LOOP JOIN t_billgroup_member bgm ON bg.id_billgroup = bgm.id_billgroup
      INNER LOOP JOIN t_recur_window rw WITH(INDEX(rc_window_time_idx)) ON bgm.id_acc = rw.c__payingaccount
                                   AND rw.c_payerstart          < ui.dt_end AND rw.c_payerend          > ui.dt_start /* interval overlaps with payer */
                                   AND rw.c_cycleeffectivestart < ui.dt_end AND rw.c_cycleeffectiveend > ui.dt_start /* interval overlaps with cycle */
                                   AND rw.c_membershipstart     < ui.dt_end AND rw.c_membershipend     > ui.dt_start /* interval overlaps with membership */
                                   AND rw.c_subscriptionstart   < ui.dt_end AND rw.c_subscriptionend   > ui.dt_start /* interval overlaps with subscription */
                                   AND rw.c_unitvaluestart      < ui.dt_end AND rw.c_unitvalueend      > ui.dt_start /* interval overlaps with UDRC */
      INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
      INNER LOOP JOIN t_usage_cycle ccl
           ON ccl.id_usage_cycle = CASE
                                         WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                         WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                         WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
                                         ELSE NULL
                                   END
      INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
      /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
      INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
                                   AND pci.dt_end BETWEEN ui.dt_start        AND ui.dt_end                             /* rc end falls in this interval */
                                   AND pci.dt_end BETWEEN rw.c_payerstart    AND rw.c_payerend                         /* rc end goes to this payer */
                                   AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
                                   AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw.c_cycleeffectivestart < pci.dt_end AND rw.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
                                   AND rw.c_SubscriptionStart   < pci.dt_end AND rw.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */
      WHERE
        ui.id_interval = @v_id_interval
        AND bg.id_billgroup = @v_id_billgroup
        AND rcr.b_advance <> 'Y'
 /* Exclude any accounts which have been billed through the charge range.
	     This is because they will have been billed through to the end of last period (advanced charged)
		 OR they will have ended their subscription in which case all of the charging has been done.
		 ONLY subscriptions which are scheduled to end this period which have not been ended by subscription change will be caught 
		 in these queries
		 */
	  and rw.c_BilledThroughDate < dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart)
UNION ALL
SELECT
      'Advance'                                                                            AS c_RCActionType
      ,pci.dt_start		                                                                     AS c_RCIntervalStart		/* Start date of Next RC Interval - the one we'll pay for In Advance in current interval */
      ,pci.dt_end		                                                                       AS c_RCIntervalEnd			/* End date of Next RC Interval - the one we'll pay for In Advance in current interval */
      ,ui.dt_start		                                                                     AS c_BillingIntervalStart	/* Start date of Current Billing Interval */
      ,ui.dt_end	                                                                      	 AS c_BillingIntervalEnd		/* End date of Current Billing Interval */
      ,CASE WHEN rcr.tx_cycle_mode <> 'Fixed' AND nui.dt_start <> c_cycleEffectiveDate
         THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(c_cycleEffectiveDate), pci.dt_start)
         ELSE dbo.mtmaxoftwodates(pci.dt_start, rw.c_SubscriptionStart) END                AS c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw.c_SubscriptionEnd)                               AS c_RCIntervalSubscriptionEnd
      ,rw.c_SubscriptionStart                                                              AS c_SubscriptionStart
      ,rw.c_SubscriptionEnd                                                                AS c_SubscriptionEnd
      ,pci.dt_start                                                                        AS c_BilledRateDate
      ,rcr.n_rating_type                                                                   AS c_RatingType
      ,case when rw.c_advance  ='Y' then '1' else '0' end                                  AS c_Advance
      ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end                      AS c_ProrateOnSubscription
      ,case when rcr.b_prorate_instantly  ='Y' then '1' else '0' end                       AS c_ProrateInstantly /* NOTE: c_ProrateInstantly - No longer used */
      ,case when rcr.b_prorate_on_deactivate ='Y' then '1' else '0' end                    AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END AS c_ProrationCycleLength
      ,rw.c__accountid                                                                     AS c__AccountID
      ,rw.c__payingaccount                                                                 AS c__PayingAccount
      ,rw.c__priceableiteminstanceid                                                       AS c__PriceableItemInstanceID
      ,rw.c__priceableitemtemplateid                                                       AS c__PriceableItemTemplateID
      ,rw.c__productofferingid                                                             AS c__ProductOfferingID
      ,rw.c_payerstart                                                                     AS c_payerstart
      ,rw.c_payerend                                                                       AS c_payerend
      ,case when rw.c_unitvaluestart < '1970-01-01 00:00:00'
         THEN '1970-01-01 00:00:00'
         ELSE rw.c_unitvaluestart END                                                      AS c_unitvaluestart
      ,rw.c_unitvalueend                                                                   AS c_unitvalueend
      ,rw.c_unitvalue                                                                      AS c_unitvalue
      ,rw.c__subscriptionid                                                                AS c__SubscriptionID
      ,newid()                                                                             AS idSourceSess
      FROM t_usage_interval ui
      INNER LOOP JOIN t_usage_interval nui ON ui.id_usage_cycle = nui.id_usage_cycle AND dbo.AddSecond(ui.dt_end) = nui.dt_start
      INNER LOOP JOIN t_billgroup bg ON bg.id_usage_interval = ui.id_interval
      INNER LOOP JOIN t_billgroup_member bgm ON bg.id_billgroup = bgm.id_billgroup
      INNER LOOP JOIN t_recur_window rw WITH(INDEX(rc_window_time_idx)) ON bgm.id_acc = rw.c__payingaccount
                                   AND rw.c_payerstart          < nui.dt_end AND rw.c_payerend          > nui.dt_start /* next interval overlaps with payer */
                                   AND rw.c_cycleeffectivestart < nui.dt_end AND rw.c_cycleeffectiveend > nui.dt_start /* next interval overlaps with cycle */
                                   AND rw.c_membershipstart     < nui.dt_end AND rw.c_membershipend     > nui.dt_start /* next interval overlaps with membership */
                                   AND rw.c_subscriptionstart   < nui.dt_end AND rw.c_subscriptionend   > nui.dt_start /* next interval overlaps with subscription */
                                   AND rw.c_unitvaluestart      < nui.dt_end AND rw.c_unitvalueend      > nui.dt_start /* next interval overlaps with UDRC */
      INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
      INNER LOOP JOIN t_usage_cycle ccl
           ON ccl.id_usage_cycle = CASE
                                         WHEN rcr.tx_cycle_mode = 'Fixed'           THEN rcr.id_usage_cycle
                                         WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
                                         WHEN rcr.tx_cycle_mode = 'EBCR'            THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
                                         ELSE NULL
                                   END
      INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
      INNER LOOP JOIN t_pc_interval pci WITH(INDEX(cycle_time_pc_interval_index)) ON pci.id_cycle = ccl.id_usage_cycle
                                   AND (
                                      pci.dt_start BETWEEN nui.dt_start AND nui.dt_end /* RCs that starts in Next Account's Billing Cycle */
                                      
                                      /* Fix for CORE-7060:
                                      In case subscription starts after current EOP we should also charge:
                                      RCs that ends in Next Account's Billing Cycle
                                      and if Next Account's Billing Cycle in the middle of RCs interval.
                                      As in this case, they haven't been charged as Instant RC (by trigger) */
                                      OR (
                                          rw.c_SubscriptionStart >= nui.dt_start
                                          AND pci.dt_end >= nui.dt_start
                                          AND pci.dt_start < nui.dt_end
                                        )
                                   )
                                   AND (
                                      pci.dt_start BETWEEN rw.c_payerstart  AND rw.c_payerend	/* rc start goes to this payer */
                                      
                                      /* Fix for CORE-7273:
                                      Logic above, that relates to Account Billing Cycle, should be duplicated for Payer's Billing Cycle.
                                      
                                      CORE-7273 related case: If Now = EOP = Subscription Start then:
                                      1. Not only RC's that starts in this payer's cycle should be charged, but also the one, that ends and overlaps it;
                                      2. Proration wasn't calculated by trigger and should be done by EOP. */
                                      OR (
                                          rw.c_SubscriptionStart >= rw.c_payerstart
                                          AND pci.dt_end >= rw.c_payerstart
                                          AND pci.dt_start < rw.c_payerend
                                        )
                                   )
                                   AND rw.c_unitvaluestart		< pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
                                   AND rw.c_membershipstart		< pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw.c_cycleeffectiveend	> pci.dt_start /* rc overlaps with this cycle */
                                   AND rw.c_subscriptionend		> pci.dt_start /* rc overlaps with this subscription */
      WHERE
        ui.id_interval = @v_id_interval
        AND bg.id_billgroup = @v_id_billgroup
        AND rcr.b_advance = 'Y'
 /* Exclude any accounts which have been billed through the charge range.
	     This is because they will have been billed through to the end of last period (advanced charged)
		 OR they will have ended their subscription in which case all of the charging has been done.
		 ONLY subscriptions which are scheduled to end this period which have not been ended by subscription change will be caught 
		 in these queries
		 */
        AND rw.c_BilledThroughDate < dbo.mtmaxoftwodates(
                   (
                       CASE
                           WHEN rcr.tx_cycle_mode <> 'Fixed' AND nui.dt_start <> c_cycleEffectiveDate
                           THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(c_cycleEffectiveDate), pci.dt_start)
                           ELSE pci.dt_start END
                   ),
                   rw.c_SubscriptionStart
               )
)A;

SELECT @total_rcs  = COUNT(1) FROM #tmp_rc;

INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'RC Candidate Count: ' + CAST(@total_rcs AS VARCHAR));

if @total_rcs > 0
BEGIN

SELECT @total_flat = COUNT(1) FROM #tmp_rc where c_unitvalue is null;
SELECT @total_udrc = COUNT(1) FROM #tmp_rc where c_unitvalue is not null;

INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Flat RC Candidate Count: ' + CAST(@total_flat AS VARCHAR));
INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'UDRC RC Candidate Count: ' + CAST(@total_udrc AS VARCHAR));

INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Session Set Count: ' + CAST(@v_n_batch_size AS VARCHAR));
INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Batch: ' + @v_id_batch);

SELECT @tx_batch = cast(N'' as xml).value('xs:hexBinary(sql:variable("@v_id_batch"))', 'binary(16)');
INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Batch ID: ' + CAST(@tx_batch AS varchar));

IF (@tx_batch IS NOT NULL)
BEGIN
UPDATE t_batch SET n_metered = @total_rcs, n_expected = @total_rcs WHERE tx_batch = @tx_batch;
END;

if @total_flat > 0
begin

    
set @id_flat = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
      'metratech.com/flatrecurringcharge');
    
SET @n_batches = (@total_flat / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    idSourceSess AS id_source_sess
FROM #tmp_rc where c_unitvalue is null;
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, id_svc, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    @id_flat AS id_svc,
    1 AS b_root
FROM #tmp_rc
where c_unitvalue is null) a
GROUP BY a.id_message, a.id_ss, a.id_svc, a.b_root;

INSERT INTO t_svc_FlatRecurringCharge
(id_source_sess
    ,id_parent_source_sess
    ,id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
    ,c_ProrateInstantly
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,c__IntervalID
    ,c__Resubmit
    ,c__TransactionCookie
    ,c__CollectionID)
SELECT
    idSourceSess AS id_source_sess
    ,NULL AS id_parent_source_sess
    ,NULL AS id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
    ,c_ProrateInstantly
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,@v_id_interval AS c__IntervalID
    ,'0' AS c__Resubmit
    ,NULL AS c__TransactionCookie
    ,@tx_batch AS c__CollectionID
FROM #tmp_rc
where c_unitvalue is null;
          INSERT
          INTO t_message
            (
              id_message,
              id_route,
              dt_crt,
              dt_metered,
              dt_assigned,
              id_listener,
              id_pipeline,
              dt_completed,
              id_feedback,
              tx_TransactionID,
              tx_sc_username,
              tx_sc_password,
              tx_sc_namespace,
              tx_sc_serialized,
              tx_ip_address
            )
            SELECT
              id_message,
              NULL,
              @v_run_date,
              @v_run_date,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              '127.0.0.1'
            FROM
              (SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message
              FROM #tmp_rc
              WHERE c_unitvalue IS NULL
              ) a
            GROUP BY a.id_message;

INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Done inserting Flat RCs');

END;
if @total_udrc > 0
begin

set @id_udrc = (SELECT id_enum_data FROM t_enum_data ted WHERE ted.nm_enum_data =
      'metratech.com/udrecurringcharge');
    
SET @n_batches = (@total_udrc / @v_n_batch_size) + 1;
    EXEC GetIdBlock @n_batches, 'id_dbqueuesch', @id_message OUTPUT;
    EXEC GetIdBlock @n_batches, 'id_dbqueuess',  @id_ss OUTPUT;

INSERT INTO t_session
(id_ss, id_source_sess)
SELECT @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    idSourceSess AS id_source_sess
FROM #tmp_rc where c_unitvalue is not null;
         
INSERT INTO t_session_set
(id_message, id_ss, id_svc, b_root, session_count)
SELECT id_message, id_ss, id_svc, b_root, COUNT(1) as session_count
FROM
(SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message,
    @id_ss + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_ss,
    @id_udrc AS id_svc,
    1 AS b_root
FROM #tmp_rc
where c_unitvalue is not null) a
GROUP BY a.id_message, a.id_ss, a.id_svc, a.b_root;

INSERT INTO t_svc_UDRecurringCharge
(id_source_sess, id_parent_source_sess, id_external, c_RCActionType, c_RCIntervalStart,c_RCIntervalEnd,c_BillingIntervalStart,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
/*    ,c_ProrateInstantly */
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,c__IntervalID
    ,c__Resubmit
    ,c__TransactionCookie
    ,c__CollectionID
      ,c_unitvaluestart
      ,c_unitvalueend
      ,c_unitvalue
      ,c_ratingtype)
SELECT
    idSourceSess AS id_source_sess
    ,NULL AS id_parent_source_sess
    ,NULL AS id_external
    ,c_RCActionType
    ,c_RCIntervalStart
    ,c_RCIntervalEnd
    ,c_BillingIntervalStart
    ,c_BillingIntervalEnd
    ,c_RCIntervalSubscriptionStart
    ,c_RCIntervalSubscriptionEnd
    ,c_SubscriptionStart
    ,c_SubscriptionEnd
    ,c_Advance
    ,c_ProrateOnSubscription
/*    ,c_ProrateInstantly */
    ,c_ProrateOnUnsubscription
    ,c_ProrationCycleLength
    ,c__AccountID
    ,c__PayingAccount
    ,c__PriceableItemInstanceID
    ,c__PriceableItemTemplateID
    ,c__ProductOfferingID
    ,c_BilledRateDate
    ,c__SubscriptionID
    ,@v_id_interval AS c__IntervalID
    ,'0' AS c__Resubmit
    ,NULL AS c__TransactionCookie
    ,@tx_batch AS c__CollectionID
      ,c_unitvaluestart
      ,c_unitvalueend
      ,c_unitvalue
      ,c_ratingtype
FROM #tmp_rc
where c_unitvalue is not null;

          INSERT
          INTO t_message
            (
              id_message,
              id_route,
              dt_crt,
              dt_metered,
              dt_assigned,
              id_listener,
              id_pipeline,
              dt_completed,
              id_feedback,
              tx_TransactionID,
              tx_sc_username,
              tx_sc_password,
              tx_sc_namespace,
              tx_sc_serialized,
              tx_ip_address
            )
            SELECT
              id_message,
              NULL,
              @v_run_date,
              @v_run_date,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              NULL,
              '127.0.0.1'
            FROM
              (SELECT @id_message + (ROW_NUMBER() OVER (ORDER BY idSourceSess) % @n_batches) AS id_message
              FROM #tmp_rc
              WHERE c_unitvalue IS NOT NULL
              ) a
            GROUP BY a.id_message;

                  INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Debug', 'Done inserting UDRC RCs');

    /** UPDATE THE BILLED THROUGH DATE TO THE END OF THE ADVANCED CHARGE 
			 ** (IN CASE THE END THE SUB BEFORE THE END OF THE MONTH)
			 ** THIS WILL MAKE SURE THE CREDIT IS CORRECT AND MAKE SURE THERE ARE NOT CHARGES 
			 ** REGENERATED FOR ALL THE MONTHS WHERE RC ADAPTER RAN (But forgot to mark)
			 ** Only for advanced charges.
		     **/
            UPDATE trw
			SET trw.c_BilledThroughDate = trc.c_RCIntervalSubscriptionEnd
			FROM t_recur_window trw
			INNER JOIN #tmp_rc trc ON trc.c_RCActionType = 'Advance' AND trw.c__AccountID = trc.c__AccountID AND trw.c__SubscriptionID = trc.c__SubscriptionID
END;

 END;

 SET @p_count = @total_rcs;

INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@v_id_run, GETUTCDATE(), 'Info', 'Finished submitting RCs, count: ' + CAST(@total_rcs AS VARCHAR));

END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[vwGetNewID]'
GO
CREATE VIEW vwGetNewID as select newid() as new_id
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[GenGuid]'
GO
CREATE  FUNCTION GenGuid() returns varbinary(16)
	AS
BEGIN
	RETURN (select new_id from vwGetNewID)
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[prtn_create_usage_partitions]'
GO
ALTER PROCEDURE prtn_create_usage_partitions
				AS
				BEGIN TRY
				IF dbo.IsSystemPartitioned() = 0
					RAISERROR('System not enabled for partitioning.', 16, 1)

				/* Vars for iterating through the new partition list
				*/
				DECLARE @cur CURSOR
				DECLARE @dt_start DATETIME
				DECLARE @dt_end DATETIME
				DECLARE @id_interval_start INT
				DECLARE @id_interval_end INT
				DECLARE @parts TABLE (
							partition_name NVARCHAR(100),
							dt_start DATETIME,
							dt_end DATETIME,
							interval_start INT,
							interval_end INT
						)
									
				EXEC GeneratePartitionSequence @cur OUT

				/* Get first row of partition info*/
				FETCH @cur INTO	@dt_start, @dt_end, @id_interval_start, @id_interval_end

				/* pause pipeline to reduce contention */
				IF (@@FETCH_STATUS = 0) EXEC PausePipelineProcessing 1

				/* Iterate through partition sequence */
				WHILE (@@fetch_status = 0)
				BEGIN
					DECLARE @partition_name NVARCHAR(100)
					
					IF NOT EXISTS (SELECT * FROM sys.partition_schemes WHERE name = dbo.prtn_GetUsagePartitionSchemaName())
					BEGIN
						EXEC prtn_create_partition_schema @id_interval_end, @dt_end, @partition_name OUT
						
						-- insert information about default partition						
						INSERT INTO t_partition
						(partition_name, b_default, dt_start, dt_end, id_interval_start, id_interval_end, b_active)
						VALUES
						(dbo.prtn_GetDefaultPartitionName(), 'Y', DATEADD(DAY, 1, @dt_end), dbo.MTMaxdate(), @id_interval_end + 1, 2147483647, 'N')
						
						INSERT INTO @parts
						VALUES
						(dbo.prtn_GetDefaultPartitionName(), DATEADD(DAY, 1, @dt_end), dbo.MTMaxdate(), @id_interval_end + 1, 2147483647)
					END
					ELSE
					BEGIN
						EXEC prtn_alter_partition_schema @id_interval_end, @dt_end, @partition_name OUT
						
						-- update start of default partition
						UPDATE t_partition
						SET
							dt_start = DATEADD(DAY, 1, @dt_end),
							id_interval_start = @id_interval_end + 1
						WHERE  b_default = 'Y'
					END
					
					-- insert information about created partition			
					INSERT INTO t_partition
						(partition_name, b_default, dt_start, dt_end, id_interval_start, id_interval_end, b_active)
						VALUES
						(@partition_name, 'N', @dt_start, @dt_end, @id_interval_start, @id_interval_end, 'Y')
						
					INSERT INTO @parts
						VALUES
						(@partition_name, @dt_start, @dt_end, @id_interval_start, @id_interval_end)
					
					/* Get next patition info */
					FETCH @cur INTO @dt_start, @dt_end, @id_interval_start, @id_interval_end
				END

				/* Deallocate the cursor */
				CLOSE @cur
				DEALLOCATE @cur

				/* unpause pipeline */
				EXEC PausePipelineProcessing 0

				/* Correct default partition start if it was just created */
				UPDATE @parts
				SET
					dt_start = DATEADD(DAY, 1, @dt_end),
					interval_start = @id_interval_end + 1
				WHERE dt_end = dbo.MTMaxdate()
				
				/* Returning partition info*/
				SELECT * FROM @parts ORDER BY dt_start
				
				END TRY
				BEGIN CATCH
				
				 /* unpause pipeline in any error   CORE-7640  */
					EXEC PausePipelineProcessing 0
				
					DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
					SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
					EXEC PausePipelineProcessing 0
					RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
				END CATCH
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[prtn_deploy_table]'
GO
ALTER PROCEDURE prtn_deploy_table
	@partition_table_name	VARCHAR(200),
	@pk_columns				VARCHAR(200),
	@partition_schema		VARCHAR(100),
	@partition_column		VARCHAR(32),
	@apply_uk_tables		BIT = 0
AS
BEGIN
	DECLARE @found_partition_schema  VARCHAR(100),
	        @error_message           VARCHAR(300),
	        @sql_command             VARCHAR(MAX)

	BEGIN TRY

		IF dbo.IsSystemPartitioned() = 0
			RAISERROR('Partitioning not enabled', 16, 1)
		
		IF @partition_table_name IS NULL
		   OR @partition_table_name = ''
			RAISERROR ('Table name wasn''t specified', 16, 1)
		
		IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @partition_table_name)
		BEGIN
			SET @error_message = 'Table "' + @partition_table_name + '" does not exist'
			RAISERROR (@error_message, 16, 1)
		END
			
		IF NOT EXISTS(SELECT * FROM sys.partition_schemes ps WHERE ps.name = @partition_schema)
		BEGIN
			SET @error_message = '"' + @partition_schema +
				'" schema was not created. Partitioning cannot be applied for table "' + @partition_table_name + '".'
			RAISERROR (@error_message, 16, 1)
		END
		
		IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @partition_table_name AND COLUMN_NAME = @partition_column)
		BEGIN
			SET @error_message = 'Table "' + @partition_table_name
			+ '" does not contain a partition column "'+ @partition_column + '". This field is required for partitioning.'
			RAISERROR (@error_message, 16, 1)
		END
		
		IF OBJECT_ID('RecreateIndexes') IS NULL
		BEGIN
			SET @error_message = 'Stored procedure "RecreateIndexes" does not exist in database'
			RAISERROR (@error_message, 16, 1)
		END
		
		SELECT DISTINCT @found_partition_schema = ps.name
		FROM   sys.partitions p
			   JOIN sys.objects o
					ON  o.object_id = p.object_id
			   JOIN sys.indexes i
					ON  p.object_id = i.object_id
					AND p.index_id = i.index_id
			   JOIN sys.data_spaces ds
					ON  i.data_space_id = ds.data_space_id
			   JOIN sys.partition_schemes ps
					ON  ds.data_space_id = ps.data_space_id
			   JOIN sys.partition_functions pf
					ON  ps.function_id = pf.function_id
		WHERE  o.name = @partition_table_name
		
		BEGIN TRANSACTION
		
		IF @found_partition_schema IS NULL
		BEGIN
			DECLARE @pk_name NVARCHAR(50)
			SELECT @pk_name = CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_NAME = @partition_table_name
			
			IF @pk_name IS NOT NULL
			BEGIN
				SET @sql_command = 'ALTER TABLE ' + @partition_table_name + ' DROP CONSTRAINT ' + @pk_name
				EXEC(@sql_command)
			END
			
			SET @sql_command = 'ALTER TABLE ' + @partition_table_name + ' ADD CONSTRAINT pk_' + @partition_table_name
							 + ' PRIMARY KEY CLUSTERED( '+ @pk_columns +' )
								WITH (
									 PAD_INDEX = OFF,
									 STATISTICS_NORECOMPUTE = OFF,
									 IGNORE_DUP_KEY = OFF,
									 ALLOW_ROW_LOCKS = ON,
									 ALLOW_PAGE_LOCKS = ON
								 ) ON ' + @partition_schema + '('+ @partition_column +')'
			EXEC(@sql_command)
			
			/* For now only Usage tables supports Non-Clustered Unique Constraints.
			't_uk_*' table is created for each Non-Clustered Unique constraint. */
			IF @apply_uk_tables = 1
			BEGIN
				/*
				* Cannot use DropUniqueConstraints for t_acc_usage, cause of missmach in constraint names.
				* Stored in t_unique_cons name:	"uk_acc_usage_tx_uid"
				* Real name: "C_t_acc_usage"
				*/
				IF @partition_table_name = 't_acc_usage'
					ALTER TABLE t_acc_usage DROP CONSTRAINT C_t_acc_usage
				ELSE
					EXEC DropUniqueConstraints @partition_table_name
			END
			
			EXEC RecreateIndexes @partition_table_name
			
		END
		ELSE
		BEGIN
			IF @found_partition_schema <> @partition_schema
			BEGIN
				SET @error_message = 'Table "' + @partition_table_name
					+ '" already under "' + @found_partition_schema
					+ '". Could not apply for "' + @partition_schema + '"'
				RAISERROR (@error_message, 16, 1)
			END
		END
		
		/* Now - for Usage tables only */
		IF @apply_uk_tables = 1
		BEGIN
			DECLARE @ret INT
			EXEC @ret = CreateUniqueKeyTables @partition_table_name
			IF (@ret <> 0)
				RAISERROR('Cannot create unique keys for table [%s]',16,1,@partition_table_name)
		END
		
		COMMIT
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK
	END CATCH
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[prtn_deploy_all_meter_tables]'
GO
ALTER PROCEDURE prtn_deploy_all_meter_tables
	AS
	BEGIN
		DECLARE @svc_table_name VARCHAR(200),
				@meter_partition_schema VARCHAR(100)

		BEGIN TRY
			SET @meter_partition_schema = dbo.prtn_GetMeterPartitionSchemaName()

			IF dbo.IsSystemPartitioned()=0
				RAISERROR('System not enabled for partitioning.', 16, 1)

			DECLARE svctablecur CURSOR FOR
								SELECT nm_table_name
								FROM t_service_def_log

			--------------------------------------------------------------------------
			------------------Deploy service definition tables -----------------------
			--------------------------------------------------------------------------
			OPEN svctablecur
			FETCH NEXT FROM svctablecur INTO @svc_table_name
			WHILE (@@FETCH_STATUS = 0)
			BEGIN
				EXEC prtn_deploy_table
						@svc_table_name,
						N'id_source_sess ASC, id_partition ASC',
						@meter_partition_schema,
						N'id_partition'
			
			FETCH NEXT FROM svctablecur INTO @svc_table_name
			END

			-------------------------------------------------------------------------
			-----------------Deploy message and session tables-----------------------
			-------------------------------------------------------------------------
			EXEC prtn_deploy_table
						N't_message',
						N'id_message ASC, id_partition ASC',
						@meter_partition_schema,
						N'id_partition'

			EXEC prtn_deploy_table
						N't_session',
						N'id_ss ASC, id_source_sess ASC, id_partition ASC',
						@meter_partition_schema,
						N'id_partition'

			EXEC prtn_deploy_table
						N't_session_set',
						N'id_ss ASC, id_partition ASC',
						@meter_partition_schema,
						N'id_partition'

			EXEC prtn_deploy_table
						N't_session_state',
						N'id_sess ASC, dt_end ASC, tx_state ASC, id_partition ASC',
						@meter_partition_schema,
						N'id_partition'
		END TRY
		BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		END CATCH
	END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[prtn_deploy_serv_def_table]'
GO
ALTER PROCEDURE prtn_deploy_serv_def_table
		@svc_table_name 		VARCHAR(200)
AS
DECLARE @meter_partition_schema	NVARCHAR(50),
		@error_message			NVARCHAR(4000)

BEGIN TRY
	IF dbo.IsSystemPartitioned() = 0
		RETURN

	SET @meter_partition_schema = dbo.prtn_GetMeterPartitionSchemaName()

	IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @svc_table_name AND COLUMN_NAME = 'id_source_sess' )
	BEGIN
		SET @error_message = 'Table "' + @svc_table_name  + '" suggests to have column "id_source_sess" as a part of PK. This field is required for partitioning.'
		RAISERROR (@error_message, 16, 1)
	END

	IF EXISTS(SELECT * FROM sys.partition_schemes ps WHERE ps.name = @meter_partition_schema)
	BEGIN
	IF OBJECT_ID(@svc_table_name) IS NOT NULL
		EXEC prtn_deploy_table
				@svc_table_name,
				N'id_source_sess ASC, id_partition ASC',
				@meter_partition_schema,
				N'id_partition'
	END
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
	SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	ROLLBACK
END CATCH
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CREATE_PARTITIONS_NAMESPACE]'
GO
CREATE PROCEDURE [dbo].[CREATE_PARTITIONS_NAMESPACE]
	@v_namespace 				VARCHAR(4000)
	,@v_namespaceDescription 	VARCHAR(4000)
	,@v_method       			VARCHAR(4000)
	,@v_namespaceType 			VARCHAR(4000)
	,@v_invoicePrefix 			VARCHAR(4000)
	,@v_invoiceSuffix     		VARCHAR(4000)
	,@v_invoiceNumDigits 		int
	,@v_invoiceDueDateOffset	int
	,@v_invoiceNumLast 			int
	,@v_accountNamespace 		VARCHAR(4000)
	,@v_errorNumber 			int OUTPUT
	,@v_namespaceInsertCount 	int OUTPUT
	,@v_invoiceNamespaceInsertCount int OUTPUT
	,@v_errorMessage 			VARCHAR(4000) OUTPUT

AS BEGIN

set @v_errorNumber = 0
set @v_errorMessage = ''
set @v_namespaceInsertCount = 0
set @v_invoiceNamespaceInsertCount = 0

-- check that namespace of partition account corresponds to namespace of root account
if not exists (SELECT * FROM t_account_mapper WHERE (id_acc = 1) AND (nm_space = @v_accountNamespace))
BEGIN
  select @v_namespaceInsertCount = -1, @v_errorNumber = -486604800, @v_errorMessage = 'Branded Site of partition account should be "MetraTech Sample Site"'
  return
END
  
if not exists (select * from t_namespace where nm_space = @v_namespace)
begin
  BEGIN TRY
    insert into t_namespace
           (nm_space,   tx_desc,               nm_method, tx_typ_space)
    values (@v_namespace, @v_namespaceDescription, @v_method,   @v_namespaceType)
  
    set @v_namespaceInsertCount = @@RowCount
  END TRY
  BEGIN CATCH
    select @v_namespaceInsertCount = -1, @v_errorNumber = ERROR_NUMBER(), @v_errorMessage = ERROR_MESSAGE()
  END CATCH
end

if not exists (select * from t_invoice_namespace where namespace = @v_namespace)
begin
  BEGIN TRY
    insert into t_invoice_namespace
           (namespace,  invoice_prefix, invoice_suffix, invoice_num_digits, invoice_due_date_offset, id_invoice_num_last)
    values (@v_namespace, @v_invoicePrefix, @v_invoiceSuffix, @v_invoiceNumDigits,  @v_invoiceDueDateOffset, @v_invoiceNumLast)

    set @v_invoiceNamespaceInsertCount = @@RowCount
  END TRY
  BEGIN CATCH
    select @v_namespaceInsertCount = -1, @v_errorNumber = ERROR_NUMBER(), @v_errorMessage = ERROR_MESSAGE()
  END CATCH
end


END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[InsertMeteredBatch]'
GO
ALTER proc InsertMeteredBatch (
				@tx_batch varbinary(16),
				@tx_batch_encoded varchar(255),
  			@tx_source varchar(255),
  			@tx_sequence varchar(255),
				@tx_name nvarchar(255),
				@tx_namespace nvarchar(255),
				@tx_status char(1),
				@dt_crt_source datetime,
				@dt_crt datetime,
				@n_completed int,
				@n_failed int,
				@n_expected int,
				@n_metered int,
				@id_batch INT OUTPUT )
			AS
			BEGIN
			  select @id_batch = -1
				IF NOT EXISTS (SELECT
				                 *
											 FROM
											   t_batch
					             WHERE
											   tx_name = @tx_name AND
												 tx_namespace = @tx_namespace AND
												 tx_sequence = @tx_sequence AND
												 tx_status != 'D')
				BEGIN
				  INSERT INTO t_batch (
						tx_batch,
						tx_batch_encoded,
  					tx_source,
  					tx_sequence,
						tx_name,
						tx_namespace,
						tx_status,
						dt_crt_source,
						dt_crt,
						n_completed,
						n_failed,
						n_expected,
						n_metered )
					values (
						@tx_batch,
						@tx_batch_encoded,
  					@tx_source,
  					@tx_sequence,
						@tx_name,
						@tx_namespace,
						UPPER(@tx_status),
						@dt_crt_source,
						@dt_crt,
						@n_completed,
						@n_failed,
						@n_expected,
						@n_metered )

					select @id_batch = max(id_batch) from t_batch
				END
				ELSE
				BEGIN
				  -- MTBATCH_BATCH_ALREADY_EXISTS ((DWORD)0xE4020001L)
				  SELECT @id_batch = -469630975
				END
			END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[GetICBMappingForSub]'
GO
ALTER proc [dbo].[GetICBMappingForSub]	(
  	@id_paramtable as int,
    @id_pi_instance as int,
    @id_sub as int,
    @p_systemdate as datetime,
    @status as int output,
    @id_pricelist as int output)
	as
		declare @id_pi_type as int
		declare @id_pi_template as int
		declare @id_pi_instance_parent as int
		declare @currency as nvarchar(10)
		declare @id_po as int
		declare @partitionId as int
					
		set @status = 0
					
		select
			@id_pi_type = id_pi_type,
			@id_pi_template = id_pi_template,
			@id_pi_instance_parent = id_pi_instance_parent
		from
			t_pl_map with(updlock)
		where id_pi_instance = @id_pi_instance and id_paramtable is NULL

		--CR 10884 fix: get the price list currency from product catalog, not
		--corporation. This will take care of the case when gsubs are generated "globally".
		--Also, this seems to be correct for all other cases as well
					
		select
			@currency = pl.nm_currency_code,
			@id_po = po.id_po,
			@partitionId = po.c_POPartitionId
		from t_po po
			inner join t_pricelist pl with(updlock) on po.id_nonshared_pl = pl.id_pricelist
			inner join t_sub s on po.id_po = s.id_po
		where s.id_sub = @id_sub

		select @id_pricelist = id_pricelist
		from t_pl_map with(updlock)
		where id_sub = @id_sub and id_pi_instance = @id_pi_instance and id_paramtable = @id_paramtable
								
			if(@@ROWCOUNT = 0)
			BEGIN
				if exists(select id_pricelist from t_pl_map where
									id_po = @id_po and id_pi_instance = @id_pi_instance and
									id_paramtable = @id_paramtable and
									id_sub is null and id_acc is null and
									B_CANICB = 'Y')
				BEGIN
					insert into t_base_props (n_kind,n_name,n_display_name,n_desc) values (150,0,0,0)
					set @id_pricelist = @@identity
					insert into t_pricelist(id_pricelist, n_type, nm_currency_code, c_PLPartitionId)
					values (@id_pricelist, 0, @currency, @partitionId)
					insert into t_pl_map(
					  id_paramtable,
					  id_pi_type,
					  id_pi_instance,
					  id_pi_template,
					  id_pi_instance_parent,
					  id_sub,
					  id_po,
					  id_pricelist,
					  b_canICB,
					  dt_modified
					  )
					values(
					  @id_paramtable,
					  @id_pi_type,
					  @id_pi_instance,
					  @id_pi_template,
					  @id_pi_instance_parent,
					  @id_sub,
					  @id_po,
					  @id_pricelist,
					  'N',
					  @p_systemdate)
				END
				ELSE
				BEGIN
					set @status = -10
				END
			END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[mvm_create_blk_upd_table2]'
GO
ALTER PROCEDURE [dbo].[mvm_create_blk_upd_table2](
    @p_table  VARCHAR(4000),           -- table to bulk update
    @p_prefix VARCHAR(4000),           -- prefix on blk_upd_table name
    @p_mvm_run_id INTEGER,           --  identifier of mvm run
    @p_node_id VARCHAR(4000),           --  identifier of mvm node_id
    @p_blk_upd_table VARCHAR(4000) OUTPUT, -- table we created
    @p_pk_col_string VARCHAR(4000)='' -- optional user specified pk (comma separated) needed if table is really an updateable view
  )
AS
begin
	declare @sql table(s varchar(1000), id int identity)
	declare @v_pk_cols table(s varchar(1000), id int identity)
	declare @v_pk_cols2 table(s varchar(1000), id int identity)
	declare @guid uniqueidentifier
	declare @is_partitioned integer

	--determine if table is partioned
	exec mvm_is_partitioned @p_table=@p_table, @p_is_partitioned=@is_partitioned OUTPUT
	--print 'is_partitioned='+CONVERT(varchar(5), @is_partitioned)

  -- Populate v_pk_cols with ordered list of primary key columns.
  -- Use comma delimited string p_pk_col_string if passed, else look at the pk fields
  -- in p_table
  IF @p_pk_col_string IS NULL
	begin
		if(@is_partitioned=0)
		begin
			insert into @v_pk_cols(s)
			SELECT ' '+ b.column_name + ','
				FROM information_schema.table_constraints a
				INNER JOIN information_schema.key_column_usage b ON a.constraint_name = b.CONSTRAINT_NAME
				WHERE a.constraint_type = 'PRIMARY KEY'
				AND a.table_name = @p_table
				order by ordinal_position
				
			insert into @v_pk_cols2(s)
			SELECT b.column_name
				FROM information_schema.table_constraints a
				INNER JOIN information_schema.key_column_usage b ON a.constraint_name = b.CONSTRAINT_NAME
				WHERE a.constraint_type = 'PRIMARY KEY'
				AND a.table_name = @p_table
				order by ordinal_position
		end
		else
		begin
			insert into @v_pk_cols(s)
			SELECT ' '+ b.column_name + ','
				FROM n_default.information_schema.table_constraints a
				INNER JOIN n_default.information_schema.key_column_usage b ON a.constraint_name = b.CONSTRAINT_NAME
				WHERE a.constraint_type = 'PRIMARY KEY'
				AND a.table_name = @p_table
				order by ordinal_position
				
			insert into @v_pk_cols2(s)
			SELECT b.column_name
				FROM n_default.information_schema.table_constraints a
				INNER JOIN n_default.information_schema.key_column_usage b ON a.constraint_name = b.CONSTRAINT_NAME
				WHERE a.constraint_type = 'PRIMARY KEY'
				AND a.table_name = @p_table
				order by ordinal_position
		end
   end
  ELSE
	begin
	  print 'spliting '+@p_pk_col_string
	  insert into @v_pk_cols(s)
	  SELECT items FROM mvm_split(@p_pk_col_string,',')

	  insert into @v_pk_cols2(s)
	  SELECT items FROM mvm_split(@p_pk_col_string,',')
	end
 
--	declare @stmt1 varchar(8000)
--	SELECT @stmt1 = coalesce(@stmt1 + CHAR(13)+ CHAR(10), '') + s
--	FROM @v_pk_cols
--	print 'got pk cols:'+ CHAR(13)+ CHAR(10)+@stmt1


	-- name of tmp bulk update table
	select @p_blk_upd_table=substring(@p_prefix + replace( newid(),'-',''),0,30)
	while (EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME=@p_blk_upd_table))
	begin
		select @p_blk_upd_table=substring(@p_prefix+replace( newid(),'-',''),0,30)
	end

	-- create statement
	insert into  @sql(s) values ('create table [' + @p_blk_upd_table + '] ( format_id int,')

    -- add the pk_N columns as not null allowable
	declare @pk_col_ctr int=0
	declare @pk_col_name nvarchar(1000)
	declare cursor1 CURSOR for select s from @v_pk_cols2 ORDER BY id
	open cursor1
	fetch next from cursor1 into @pk_col_name
	while @@FETCH_STATUS=0
	begin
		print 'here with pk_col_name:'+@pk_col_name + ' and ' + @p_table
		if(@is_partitioned=0)
		begin
			insert into @sql(s)
			select
			'  ['+'pk_'+convert(varchar,@pk_col_ctr)+'] '+data_type + case data_type when 'numeric' then '('+cast(numeric_precision as varchar)+',' + cast(numeric_scale as varchar) +')' else coalesce('('+cast(character_maximum_length as varchar)+')','') end + ' NOT NULL,'
			FROM  information_schema.columns
			WHERE upper(table_name) = upper(@p_table) and upper(COLUMN_NAME) = upper(@pk_col_name)
		end
		else
		begin
			insert into @sql(s)
			select
			'  ['+'pk_'+convert(varchar,@pk_col_ctr)+'] '+data_type + case data_type when 'numeric' then '('+cast(numeric_precision as varchar)+',' + cast(numeric_scale as varchar) +')' else coalesce('('+cast(character_maximum_length as varchar)+')','') end + ' NOT NULL,'
			FROM  n_default.information_schema.columns
			WHERE upper(table_name) = upper(@p_table) and upper(COLUMN_NAME) = upper(@pk_col_name)
		end

		set @pk_col_ctr=@pk_col_ctr+1
		fetch next from cursor1 into @pk_col_name
	end
	close cursor1
	deallocate cursor1

	-- add all columns all as null allowable
	if(@is_partitioned=0)
	begin
		insert into @sql(s)
		select
		'  ['+column_name+'] '+data_type + case data_type when 'numeric' then '('+cast(numeric_precision as varchar)+',' + cast(numeric_scale as varchar) +')' else coalesce('('+cast(character_maximum_length as varchar)+')','') end + ' NULL,'
		FROM  information_schema.columns
		WHERE table_name = @p_table
		order by ordinal_position
	end
	else
	begin
		insert into @sql(s)
		select
		'  ['+column_name+'] '+data_type + case data_type when 'numeric' then '('+cast(numeric_precision as varchar)+',' + cast(numeric_scale as varchar) +')' else coalesce('('+cast(character_maximum_length as varchar)+')','') end + ' NULL,'
		FROM  n_default.information_schema.columns
		WHERE table_name = @p_table
		order by ordinal_position
	end
	

	-- add primary key
	insert into @sql(s) values( ' CONSTRAINT pk_' + @p_blk_upd_table + ' PRIMARY KEY (' )

	-- specify the primary key columns 
	insert into @sql(s)
	SELECT
    rownum = 'pk_'+convert(varchar,ROW_NUMBER() OVER (ORDER BY t.id ASC)-1)+','
	FROM @v_pk_cols t ORDER BY id

	-- remove trailing comma
	update @sql set s=left(s,len(s)-1) where id=(select max(id) from @sql) --@@identity
	
	-- PK closing bracket
	insert into @sql(s) values( ')' )

	-- create closing bracket
	insert into @sql(s) values( ')' )

   -- result!
	declare @stmt varchar(8000)
	SELECT @stmt = coalesce(@stmt + CHAR(13)+ CHAR(10), '') + s
	FROM @sql order by id

	--print @stmt

	begin try
		EXECUTE( 'begin '+@stmt+' end')
		insert into amp_staging_tables (mvm_run_id, node_id, staging_table_name, create_dt) values(@p_mvm_run_id, @p_node_id, @p_blk_upd_table, getdate())

	end try
	begin catch

			DECLARE @FullMessage NVARCHAR(4000);
 		DECLARE @ErrorMessage NVARCHAR(4000);
    		DECLARE @ErrorSeverity INT;
    		DECLARE @ErrorState INT;
    		SELECT
        		@ErrorMessage = ERROR_MESSAGE(),
        		@ErrorSeverity = ERROR_SEVERITY(),
        		@ErrorState = ERROR_STATE();
        select @FullMessage='Error in mvm_create_blk_upd_table2. Got error ['+@ErrorMessage+'] running dynamic sql ['+ 'begin '+@stmt+' end'+']' ;
		RAISERROR(@fullMessage, 16, 1)
	end catch

end
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[UpdateBatchStatus]'
GO
ALTER procedure UpdateBatchStatus
	@tx_batch VARBINARY(16),
	@tx_batch_encoded varchar(24),
	@n_completed int,
	@sysdate datetime
as
declare @initialStatus char(1)
declare @finalStatus char(1)

BEGIN TRANSACTION
if not exists (select * from t_batch with(updlock) where tx_batch = @tx_batch)
begin
  insert into t_batch (tx_namespace, tx_name, tx_batch, tx_batch_encoded, tx_status, n_completed, n_failed, dt_first, dt_crt)
    values ('pipeline', @tx_batch_encoded, @tx_batch, @tx_batch_encoded, 'A', 0, 0, @sysdate, @sysdate)
end

select @initialStatus = tx_status from t_batch with(updlock) where tx_batch = @tx_batch

update t_batch
  set t_batch.n_completed = t_batch.n_completed + @n_completed,
    -- ESR-4575 MetraControl- failed batches have completed status. Corrected batches have failed status
    -- Added a condition to mark batches with failed transections as Failed
    t_batch.tx_status =
       case when ((t_batch.n_completed + t_batch.n_failed + ISNULL(t_batch.n_dismissed, 0) + @n_completed) = t_batch.n_expected
                   or
                  (((t_batch.n_completed + t_batch.n_failed + + ISNULL(t_batch.n_dismissed, 0) + @n_completed) = t_batch.n_metered)                      and t_batch.n_expected = 0))
            then 'C'
				    when ((t_batch.n_completed + t_batch.n_failed + ISNULL(t_batch.n_dismissed, 0) + @n_completed) < t_batch.n_expected
                   or
                 (((t_batch.n_completed + t_batch.n_failed + ISNULL(t_batch.n_dismissed, 0) + @n_completed) < t_batch.n_metered)
                    and t_batch.n_expected = 0))
            then 'A'
            when ((t_batch.n_completed + t_batch.n_failed + ISNULL(t_batch.n_dismissed, 0) + @n_completed) > t_batch.n_expected)
                   and t_batch.n_expected > 0
            then 'F'
            else t_batch.tx_status end,
     t_batch.dt_last = @sysdate,
     t_batch.dt_first =
       case when t_batch.n_completed = 0 then @sysdate else t_batch.dt_first end
  where tx_batch = @tx_batch

 IF ( @@ERROR != 0 )

     BEGIN
        ROLLBACK TRANSACTION
     END
         
COMMIT TRANSACTION

  
select @finalStatus = tx_status from t_batch where tx_batch = @tx_batch
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MoveAccount]'
GO
ALTER  procedure MoveAccount
	(@new_parent int,
	 @account_being_moved int,
   @vt_move_start datetime,
   @p_enforce_same_corporation varchar,
   @p_system_time datetime,
   @status int output,
   @p_id_ancestor_out int output,
   @p_ancestor_type varchar(40) output,
   @p_acc_type varchar(40) output)
as
begin
declare @vt_move_end datetime
set @vt_move_end = dbo.MTMaxDate()

declare @vt_move_start_trunc datetime
set @vt_move_start_trunc = dbo.MTStartOfDay(@vt_move_start)

-- plug business rules back in
declare @varMaxDateTime as datetime
declare @AccCreateDate as datetime
declare @AccMaxCreateDate as datetime
declare @p_dt_start datetime
declare @realstartdate as datetime
declare @p_id_ancestor as int
declare @p_id_descendent as int
declare @ancestor_acc_type as int
declare @descendent_acc_type as int


set @p_dt_start = @vt_move_start_trunc
set @p_id_ancestor = @new_parent
set @p_id_descendent = @account_being_moved


select @realstartdate = dbo.mtstartofday(@p_dt_start)

--Take update lock very early as we are deadlocking in MoveAccount
declare @old_parent int
declare @varMaxDateTimeAlex datetime
--lock the account to be moved
select @old_parent = id_ancestor
from t_account_ancestor aa with (updlock)
where id_descendent =@account_being_moved and num_generations = 1
--lock old and new parent in a bold sweeping move
--we need it as we will update b_children='Y' on the new parent and b_children='N' on the old parent
select @varMaxDateTimeAlex=max(vt_end) from t_account_ancestor with (updlock)
where id_descendent in ( @old_parent, @new_parent)

select @varMaxDateTime = max(vt_end) from t_account_ancestor with (updlock) where id_descendent = @p_id_descendent
and id_ancestor = 1

select @AccCreateDate = dbo.mtminoftwodates(dbo.mtstartofday(ancestor.dt_crt),dbo.mtstartofday(descendent.dt_crt)),
@ancestor_acc_type = ancestor.id_type,
@descendent_acc_type = descendent.id_type
from t_account ancestor with (updlock)
inner join t_account descendent with (updlock) ON
ancestor.id_acc = @p_id_ancestor and
descendent.id_acc = @p_id_descendent


select @p_ancestor_type = name
from t_account_type
where id_type = @ancestor_acc_type


select @p_acc_type = name
from t_account_type
where id_type = @descendent_acc_type


--begin business rules check

	select @AccMaxCreateDate =
	dbo.mtmaxoftwodates(dbo.mtstartofday(ancestor.dt_crt),dbo.mtstartofday(descendent.dt_crt))
	from t_account ancestor,t_account descendent where ancestor.id_acc = @p_id_ancestor and
	descendent.id_acc = @p_id_descendent
	if dbo.mtstartofday(@p_dt_start) < dbo.mtstartofday(@AccMaxCreateDate)  begin
		-- MT_CANNOT_MOVE_ACCOUNT_BEFORE_START_DATE
		select @status = -486604750
		return
	end
	
	-- step : make sure that the new ancestor is not actually a child
	select @status = count(*)
	from t_account_ancestor
	where id_ancestor = @p_id_descendent
	and id_descendent = @p_id_ancestor AND
  	@realstartdate between vt_start AND vt_end
	if @status > 0
   	begin
		-- MT_NEW_PARENT_IS_A_CHILD
	 select @status = -486604797
	 return
  	end

	select @status = count(*)
	from t_account_ancestor
	where id_ancestor = @p_id_ancestor
	and id_descendent = @p_id_descendent
	and num_generations = 1
	and @realstartdate >= vt_start
	and vt_end = @varMaxDateTime
	if @status > 0
	begin
		-- MT_NEW_ANCESTOR_IS_ALREADY_ A_ANCESTOR
	 select @status = 1
	 return
	end


      -- step : make sure that the account is not archived or closed
	select @status = count(*)  from t_account_state
	where id_acc = @p_id_Descendent
	and (dbo.IsClosed(@status) = 1 OR dbo.isArchived(@status) = 1)
	and @realstartdate between vt_start AND vt_end
	if (@status > 0 )
	begin
	   -- OPERATION_NOT_ALLOWED_IN_CLOSED_OR_ARCHIVED
	select @status = -469368827
	end

	-- step : make sure that the account is not a corporate account
	--only check next 2 business rules if p_enforce_same_corporation rule is turned on
	if @p_enforce_same_corporation = 1
	begin
		if (dbo.iscorporateaccount(@p_id_descendent,@p_dt_start) = 1)
		-- MT_CANNOT_MOVE_CORPORATE_ACCOUNT
			begin
			select @status = -486604770
			return
			end
		-- do this check if the original ancestor of the account being moved is not -1 
		-- or the new ancestor is not -1
		declare @originalAncestor integer
		select @originalAncestor = id_ancestor from t_account_ancestor
			where id_descendent =  @p_id_descendent
			and num_generations = 1
			and @vt_move_start_trunc >= vt_start and @vt_move_start_trunc <= vt_end

		if (@originalAncestor <> -1 AND @p_id_ancestor <> -1 AND dbo.IsInSameCorporateAccount(@p_id_ancestor,@p_id_descendent,@realstartdate) <> 1) begin
			-- MT_CANNOT_MOVE_BETWEEN_CORPORATE_HIERARCHIES
			select @status = -486604759
			return
		end
	end

	--check that both ancestor and descendent are subscriber accounts.  This check has to be recast.. you can 
	-- only move if the new ancestor allows children of type @descendent_acc_type
	if @descendent_acc_type not in (
	select id_descendent_type from t_acctype_descendenttype_map
	where id_type = @ancestor_acc_type)
	BEGIN
	-- MT_ANCESTOR_OF_INCORRECT_TYPE
	select @status = -486604714
	return
	END

	-- check that only accounts whose type says b_canHaveSyntheticRoot is true can have -1 as an ancestor.
	if (@p_id_ancestor = -1)
	BEGIN
	declare @syntheticroot varchar(1)
	select @syntheticroot = b_CanhaveSyntheticRoot from t_account_type where id_type = @descendent_acc_type
	if (@syntheticroot <> '1')
	BEGIN
	--MT_ANCESTOR_INVALID_SYNTHETIC_ROOT
		select @status = -486604713
		return
	END
	END
	--this check is removed in Kona.
	--if(@b_is_ancestor_folder <> '1')
	--BEGIN
	-- MT_CANNOT_MOVE_TO_NON_FOLDER_ACCOUNT
	--select @status = -486604726
	--return
	--END

-- end business rules

--METRAVIEW DATAMART 

declare @tmp_t_dm_account table(id_dm_acc int,id_acc int,vt_start datetime,vt_end datetime)
insert into @tmp_t_dm_account  select * from t_dm_account where id_acc in
(
select distinct id_descendent from t_account_ancestor where id_ancestor = @account_being_moved
)
--Deleting all the entries from ancestor table
delete from t_dm_account_ancestor where id_dm_descendent in (select id_dm_acc from @tmp_t_dm_account)
delete from t_dm_account where id_dm_acc in (select id_dm_acc from @tmp_t_dm_account)

select
aa2.id_ancestor,
aa2.id_descendent,
aa2.num_generations,
aa2.b_children,
dbo.MTMaxOfTwoDates(@vt_move_start_trunc, dbo.MTMaxOfTwoDates(dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start), aa3.vt_start)) as vt_start,
dbo.MTMinOfTwoDates(@vt_move_end, dbo.MTMinOfTwoDates(dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end), aa3.vt_end)) as vt_end,
aa2.tx_path
into #deletethese
from
t_account_ancestor aa1
inner join t_account_ancestor aa2    on aa1.id_ancestor=aa2.id_ancestor
                                     and aa1.vt_start <= aa2.vt_end
                                     and aa2.vt_start <= aa1.vt_end
                                     and aa2.vt_start <= @vt_move_end
                                     and @vt_move_start_trunc <= aa2.vt_end
                                     and aa2.id_descendent in (select id_descendent from t_account_ancestor where id_ancestor = @account_being_moved)
inner join t_account_ancestor aa3 on aa2.id_descendent=aa3.id_descendent and aa3.vt_start <= aa2.vt_end and aa2.vt_start <= aa3.vt_end and aa3.vt_start <= @vt_move_end and @vt_move_start_trunc <= aa3.vt_end
where
aa1.id_descendent=@account_being_moved
and
aa1.num_generations > 0
and
aa1.vt_start <= @vt_move_end
and
@vt_move_start_trunc <= aa1.vt_end
and
aa3.id_ancestor=@account_being_moved

--Creating index on temp table #deletethese
CREATE UNIQUE CLUSTERED INDEX IX_Clus_idacc_iddesc on #deletethese (id_ancestor, id_descendent)

-- select old direct ancestor id
select @p_id_ancestor_out = id_ancestor from #deletethese
where num_generations = 1 and @vt_move_start_trunc between vt_start and vt_end

--select * from #deletethese

-- The four statements of the sequenced delete follow.  Watch carefully :-)
--
-- Create a new interval for the case in which the applicability interval of the update
-- is contained inside the period of validity of the existing interval
-- [------------------] (existing)
--    [-----------] (update)
insert into t_account_ancestor(id_ancestor, id_descendent, num_generations,b_children, vt_start, vt_end,tx_path)
select aa.id_ancestor, aa.id_descendent, aa.num_generations, d.b_children,d.vt_start, d.vt_end,
case when aa.id_descendent = 1 then
    aa.tx_path + d.tx_path
    else
    d.tx_path + '/' + aa.tx_path
    end
from
t_account_ancestor aa
inner join #deletethese d on aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
	aa.num_generations=d.num_generations and aa.vt_start < d.vt_start and aa.vt_end > d.vt_end

-- Update end date of existing records for which the applicability interval of the update
-- starts strictly inside the existing record:
-- [---------] (existing)
--    [-----------] (update)
-- or
-- [---------------] (existing)
--    [-----------] (update)
update t_account_ancestor
set
t_account_ancestor.vt_end = dateadd(s, -1, d.vt_start)
--select *
from
t_account_ancestor aa
inner join #deletethese d on aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
	aa.num_generations=d.num_generations and aa.vt_start < d.vt_start and aa.vt_end > d.vt_start

-- Update start date of existing records for which the effectivity interval of the update
-- ends strictly inside the existing record:
--              [---------] (existing)
--    [-----------] (update)
update t_account_ancestor
set
t_account_ancestor.vt_start = dateadd(s, 1, d.vt_end)
--select *
from
t_account_ancestor aa
inner join #deletethese d on aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
	aa.num_generations=d.num_generations and aa.vt_start <= d.vt_end and aa.vt_end > d.vt_end

-- Delete existing records for which the effectivity interval of the update
-- contains the existing record:
--       [---------] (existing)
--     [---------------] (update)
delete aa
--select *
from
t_account_ancestor aa
inner join #deletethese d on aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
	aa.num_generations=d.num_generations and aa.vt_start >= d.vt_start and aa.vt_end <= d.vt_end

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- SEQUENCED INSERT JOIN
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Now do the sequenced insert into select from with the sequenced
-- cross join as the source of the data.

insert into t_account_ancestor(id_ancestor, id_descendent, num_generations,b_children, vt_start, vt_end,tx_path)
select aa1.id_ancestor,
aa2.id_descendent,
aa1.num_generations+aa2.num_generations+1 as num_generations,
aa2.b_children,
dbo.MTMaxOfTwoDates(@vt_move_start_trunc, dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start)) as vt_start,
dbo.MTMinOfTwoDates(@vt_move_end, dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end)) as vt_end,
case when aa2.id_descendent = 1 then
    aa1.tx_path + aa2.tx_path
    else
    aa1.tx_path + '/' + aa2.tx_path
    end
from
t_account_ancestor aa1
inner join t_account_ancestor aa2 with (updlock) on aa1.vt_start < aa2.vt_end and aa2.vt_start < aa1.vt_end and aa2.vt_start < @vt_move_end and @vt_move_start_trunc < aa2.vt_end
where
aa1.id_descendent = @new_parent
and
aa1.vt_start < @vt_move_end
and
@vt_move_start_trunc < aa1.vt_end
and
aa2.id_ancestor = @account_being_moved

-- Implement the coalescing step.
-- TODO: Improve efficiency by restricting the updates to the rows that
-- might need coalesing.
WHILE 1=1
BEGIN
update t_account_ancestor
set t_account_ancestor.vt_end = (
	select max(aa2.vt_end)
	from
	t_account_ancestor as aa2
	where
	t_account_ancestor.id_ancestor=aa2.id_ancestor
	and
	t_account_ancestor.id_descendent=aa2.id_descendent
	and
	t_account_ancestor.num_generations=aa2.num_generations
	and
	t_account_ancestor.vt_start < aa2.vt_start
	and
	dateadd(s,1,t_account_ancestor.vt_end) >= aa2.vt_start
	and
	t_account_ancestor.vt_end < aa2.vt_end
	and
	t_account_ancestor.tx_path=aa2.tx_path
)
where
exists (
	select *
	from
	t_account_ancestor as aa2
	where
	t_account_ancestor.id_ancestor=aa2.id_ancestor
	and
	t_account_ancestor.id_descendent=aa2.id_descendent
	and
	t_account_ancestor.num_generations=aa2.num_generations
	and
	t_account_ancestor.vt_start < aa2.vt_start
	and
	dateadd(s,1,t_account_ancestor.vt_end) >= aa2.vt_start
	and
	t_account_ancestor.vt_end < aa2.vt_end
	and
	t_account_ancestor.tx_path=aa2.tx_path
)
and id_descendent in (select id_descendent from #deletethese)

IF @@rowcount <= 0 BREAK
END

delete from t_account_ancestor
where
exists (
	select *
	from t_account_ancestor aa2 with (updlock)
	where
	t_account_ancestor.id_ancestor=aa2.id_ancestor
	and
	t_account_ancestor.id_descendent=aa2.id_descendent
	and
	t_account_ancestor.num_generations=aa2.num_generations
	and
	t_account_ancestor.tx_path=aa2.tx_path
	and
 	(
	(aa2.vt_start < t_account_ancestor.vt_start and t_account_ancestor.vt_end <= aa2.vt_end)
	or
	(aa2.vt_start <= t_account_ancestor.vt_start and t_account_ancestor.vt_end < aa2.vt_end)
	)
)
and id_descendent in (select id_descendent from #deletethese)

/* update t_path_capabilities */
update pc
set param_value = aa.tx_path + '/'
from
t_account_ancestor aa
inner join #deletethese d on aa.id_descendent=d.id_descendent and aa.id_ancestor = 1
inner join t_principal_policy p on p.id_acc = aa.id_descendent
inner join t_capability_instance ci on ci.id_policy = p.id_policy
inner join t_path_capability pc on ci.id_cap_instance = pc.id_cap_instance
where @p_system_time between aa.vt_start and aa.vt_end

	update new set b_Children = 'Y' from t_account_ancestor new where
	id_descendent = @new_parent
	and b_children='N'

	update old set b_Children = 'N' from t_account_ancestor old where
	id_descendent = @p_id_ancestor_out and
	not exists (select 1 from t_account_ancestor new where new.id_ancestor=old.id_descendent
	and num_generations <>0 )
	-- to avoid update locks only update one that need to be updated
	and b_children = 'Y'
  
--DataMart insert new id_dm_acc for moving account and descendents
		insert into t_dm_account(id_acc,vt_start,vt_end) select anc.id_descendent, anc.vt_start, anc.vt_end
		from t_account_ancestor	anc
		inner join @tmp_t_dm_account acc on anc.id_descendent = acc.id_acc
		where anc.id_ancestor=1
		and acc.vt_end = @varMaxDateTime
	
		insert into t_dm_account_ancestor
		select dm2.id_dm_acc, dm1.id_dm_acc, aa1.num_generations
		from
		t_account_ancestor aa1
		inner join t_dm_account dm1 on aa1.id_descendent=dm1.id_acc and aa1.vt_start <= dm1.vt_end and dm1.vt_start <= aa1.vt_end
		inner join t_dm_account dm2 on aa1.id_ancestor=dm2.id_acc and aa1.vt_start <= dm2.vt_end and dm2.vt_start <= aa1.vt_end
		inner join @tmp_t_dm_account acc on aa1.id_descendent = acc.id_acc
		where dm1.id_acc <> dm2.id_acc
		and dm1.vt_start >= dm2.vt_start
		and dm1.vt_end <= dm2.vt_end
		and acc.vt_end = @varMaxDateTime

		--we are adding 0 level record for all children of moving account
		insert into t_dm_account_ancestor select dm1.id_dm_acc,dm1.id_dm_acc,0
		from
		t_dm_account dm1
		inner join @tmp_t_dm_account acc on dm1.id_acc = acc.id_acc
		and acc.vt_end = @varMaxDateTime

	-- Process templates after moving account


	DECLARE @allTypesSupported INT
    SELECT @allTypesSupported = all_types
        FROM t_acc_tmpl_types

	SET @allTypesSupported = ISNULL(@allTypesSupported,0)

	DECLARE @templateId INT
	DECLARE @templateOwner INT
	DECLARE @templateType VARCHAR(200)

	select top 1 @templateId = id_acc_template
			, @templateOwner = template.id_folder
			, @templateType = atype.name
	from
				t_acc_template template
	INNER JOIN t_account_ancestor ancestor on template.id_folder = ancestor.id_ancestor
	INNER JOIN t_account_mapper mapper on mapper.id_acc = ancestor.id_ancestor
	inner join t_account_type atype on template.id_acc_type = atype.id_type
			WHERE id_descendent = @new_parent AND
				@p_system_time between vt_start AND vt_end AND
				(atype.name = @p_acc_type OR @allTypesSupported = 1)
	ORDER BY num_generations asc

	DECLARE @sessionId INTEGER
	IF @templateId IS NOT NULL
	BEGIN
		EXECUTE UpdatePrivateTempates @templateId, @p_system_time
		EXECUTE GetCurrentID 'id_template_session', @sessionId OUT
        insert into t_acc_template_session(id_session, id_template_owner, nm_acc_type, dt_submission, id_submitter, nm_host, n_status, n_accts, n_subs)
        values (@sessionId, @templateOwner, @p_acc_type, @p_system_time, 0, '', 0, 0, 0)
		execute ApplyAccountTemplate @templateId, @sessionId, @p_system_time, NULL, NULL, 'N', 'N', NULL, NULL, NULL
	END
	ELSE BEGIN
		DECLARE tmpl CURSOR FOR
            SELECT template.id_acc_template, template.id_folder, atype.name
                FROM t_account_ancestor ancestor
                JOIN t_acc_template template ON ancestor.id_descendent = template.id_folder
                JOIN t_account_type atype on template.id_acc_type = atype.id_type
                WHERE ancestor.id_ancestor = @new_parent AND
				    @p_system_time between vt_start AND vt_end
		OPEN tmpl
		FETCH NEXT FROM tmpl INTO @templateId, @templateOwner, @templateType
		WHILE @@FETCH_STATUS = 0 BEGIN
			EXECUTE UpdatePrivateTempates @templateId, @p_system_time
			EXECUTE GetCurrentID 'id_template_session', @sessionId OUT
			insert into t_acc_template_session(id_session, id_template_owner, nm_acc_type, dt_submission, id_submitter, nm_host, n_status, n_accts, n_subs)
			values (@sessionId, @templateOwner, @p_acc_type, @p_system_time, 0, '', 0, 0, 0)
			execute ApplyAccountTemplate @templateId, @sessionId, @p_system_time, NULL, NULL, 'N', 'N', NULL, NULL, NULL
			FETCH NEXT FROM tmpl INTO @templateId, @templateOwner, @templateType
		END
		CLOSE tmpl
		DEALLOCATE tmpl
	END

	select @status=1
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CreateAdjustmentTable]'
GO
ALTER procedure CreateAdjustmentTable(@p_id_pi_type INTEGER,  @p_status INTEGER OUTPUT, @p_err_msg VARCHAR(512) OUTPUT)
as
  declare @CursorVar CURSOR
  declare @columncursor CURSOR
  declare @count integer
  declare @i integer
  declare @pvname nvarchar(256)
  declare @adjname nvarchar(256)
  declare @ddlstr as varchar(max)
  declare @idpi as int
  declare @innercount as int
  declare @j as int
  declare @columnname as nvarchar(256)
  declare @datatype as nvarchar(256)
  declare @pv nvarchar(255)
  declare @newpiname nvarchar(255)
  declare @piname nvarchar(255)
  declare @old_pi as int
  declare @new_pi as int
  declare @pvTable as nvarchar(256)
  declare @ajColumnName as nvarchar(256)
  declare @columnDescription as nvarchar(max)
  declare @cursorColumnDescription CURSOR
  declare @countColumnDescriptions as int
  declare @indexColumnDescriptions as int

  set @p_status = 0
  select TOP 1 @pv = pi1.nm_productview, @piname = bp.nm_name, @newpiname = bpnew.nm_name,
               @old_pi = pi2.id_pi, @new_pi = pi1.id_pi
  from t_pi pi1
  inner join t_pi pi2 on pi1.nm_productview = pi2.nm_productview
  inner join t_base_props bp on bp.id_prop = pi2.id_pi
  inner join t_base_props bpnew on bpnew.id_prop = pi1.id_pi
  where pi1.id_pi = @p_id_pi_type AND pi2.id_pi <> pi1.id_pi
  if LEN(@pv) > 0
  BEGIN
  
      select @p_status = count(*)
      from (

          -- Fast way to compare two tables, from
          -- http://weblogs.sqlteam.com/jeffs/archive/2004/11/10/2737.aspx
          -- Look for rows that are in one table, but not the other.
          select min(TableName) as TableName, colname, coltype
          from
          (

              select 'Table A' as TableName, a.colname, a.coltype
              from
              (
                  -- Select name and type of PV properties for charges associated with @new_pi 
                  select prop.nm_column_name as colname,
                         prop.nm_data_type as coltype
                  from t_charge join t_prod_view_prop prop
                  on prop.id_prod_view_prop = t_charge.id_amt_prop
                  where id_pi = @new_pi
              ) a

              UNION ALL

              select 'Table B' as TableName, b.colname, b.coltype
              from
              (
                  -- Select name and type of PV properties for charges associated with @old_pi 
                  select prop.nm_column_name as colname,
                         prop.nm_data_type as coltype
                  from t_charge join t_prod_view_prop prop
                  on prop.id_prod_view_prop = t_charge.id_amt_prop
                  where id_pi = @old_pi
              ) b
      
          ) y
          group by colname, coltype
          having count(*) = 1

      ) z;

      if @p_status <> 0
      begin
        SELECT @p_err_msg = 'Product View ''' + @pv + ''' is shared between ''' +  @newpiname + ''' and ''' + @piname + '''';
        SELECT @p_err_msg = @p_err_msg + '. If ''' + @newpiname + ''' is adjustable, make sure that charges in these priceable item types are the same.';
      end
  END

	CREATE TABLE #ColumnDescriptionTbl
	(
		ColumnDescriptionStatement nvarchar(max)
	)

	SET @CursorVar = CURSOR FORWARD_ONLY STATIC
	FOR
	select distinct(pv.nm_table_name),
	't_aj_' + substring(pv.nm_table_name,6,1000),
	t_pi.id_pi
	from
	t_pi
	-- all of the product views references by priceable items
	INNER JOIN t_prod_view pv on upper(pv.nm_name) = upper(t_pi.nm_productview)
	-- BP changed next join to 'left outer' from 'inner'
	-- in order to support Amount adjustments for PIs that don't
	-- have any charges
	LEFT OUTER JOIN t_charge on t_charge.id_pi = t_pi.id_pi
  WHERE t_pi.id_pi = @p_id_pi_type
	select @i = 0
	OPEN @CursorVar
	Set @count = @@cursor_rows
	while(@i < @count) begin
		select @i = @i + 1
		FETCH NEXT FROM @CursorVar into @pvname,@adjname,@idpi
	-- create the table
		set @columncursor = CURSOR FORWARD_ONLY STATIC
		for
		select prop.nm_column_name,prop.nm_data_type from t_charge
			INNER JOIN t_prod_view_prop prop on prop.id_prod_view_prop = t_charge.id_amt_prop
			where id_pi = @idpi
		OPEN @columncursor
		set @innercount = @@cursor_rows
		select @j = 0
    set @columnDescription = ''
    select @ddlstr =  ('if NOT exists (select * from dbo.sysobjects where id = object_id(''' + @adjname + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) ')
    select @ddlstr = @ddlstr + 'create table ' + @adjname + ' (id_adjustment int'
		while (@j < @innercount) begin
			FETCH NEXT FROM @columncursor into @columnname,@datatype
			set @ajColumnName = 'c_aj_' + right(@columnname,len(@columnname)-2)
			select @ddlstr = (@ddlstr + ', ' + @ajColumnName + ' ' + @datatype)
			select @columnDescription = 'DECLARE @columnDesc nvarchar(256) '
			-- gets column description from t_pv_* table			
			+ 'SELECT @columnDesc = CONVERT(nvarchar(256), value) '
			+ 'FROM fn_listextendedproperty (''MS_Description'', ''SCHEMA'', ''dbo'', ''table'', '''+@pvname+''', ''column'', '''+@columnname+''') '
			-- creates column description 
			+ ' IF EXISTS (SELECT 1 FROM fn_listextendedproperty(N''MS_Description'', N''SCHEMA'', N''dbo'', N''TABLE'', ''' + @adjname + ''', ''column'', ''' + @ajColumnName + ''')) '
			  + 'BEGIN EXEC sp_dropextendedproperty @name = N''MS_Description'', @level0type = N''SCHEMA'', @level0name = N''dbo'','
						+ '@level1type = N''TABLE'', @level1name = '''+ @adjname+''','
						+ '@level2type=N''COLUMN'',@level2name='''+  @ajColumnName +''' '
			  +	'END '
					+ 'EXEC sys.sp_addextendedproperty '
					+ '@name=N''MS_Description'', @value=@columnDesc,'
					+ '@level0type=N''SCHEMA'',@level0name=N''dbo'','
					+ '@level1type=N''TABLE'',@level1name='''+@adjname+''','
					+ '@level2type=N''COLUMN'',@level2name='''+  @ajColumnName +''' '
			insert into #ColumnDescriptionTbl(ColumnDescriptionStatement) values (@columnDescription)
			
			select @j = @j+1
		end
		select @ddlstr = (@ddlstr + ')')
		exec (@ddlstr)
		-- creates table description
		exec (
		' IF EXISTS (SELECT 1 FROM fn_listextendedproperty(N''MS_Description'', N''SCHEMA'', N''dbo'', N''TABLE'', ''' + @adjname + ''', default, default)) '
		  + 'BEGIN EXEC sp_dropextendedproperty @name = N''MS_Description'', @level0type = N''SCHEMA'', @level0name = N''dbo'','
					+ '@level1type = N''TABLE'', @level1name = '''+ @adjname +''''
		  +	'END '
		  + 'EXEC sys.sp_addextendedproperty'
					+ ' @name=N''MS_Description'', @value=''Autogenerated adjustment table. Contains adjustments for charges in product view table "' + @pvname + '"'','
					+ ' @level0type=N''SCHEMA'',@level0name=N''dbo'','
					+ ' @level1type=N''TABLE'',@level1name='''+ @adjname + '''')
		-- creates columns descriptions
		--exec ('DECLARE @columnDesc varchar(100) ' + @columdDescription)
		set @cursorColumnDescription = CURSOR FORWARD_ONLY STATIC
		for
		select ColumnDescriptionStatement from #ColumnDescriptionTbl
		OPEN @cursorColumnDescription
		set @countColumnDescriptions = @@cursor_rows
		set @indexColumnDescriptions = 0
		while (@indexColumnDescriptions < @countColumnDescriptions) begin
			FETCH NEXT FROM @cursorColumnDescription into @columnDescription
			exec (@columnDescription)
			set @indexColumnDescriptions = @indexColumnDescriptions+1
		end
		CLOSE @CursorColumnDescription
		DEALLOCATE @CursorColumnDescription
		
		CLOSE @columncursor
		DEALLOCATE @columncursor
	end
	CLOSE @CursorVar
	DEALLOCATE @CursorVar
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[t_active_tickets]'
GO
ALTER TABLE [dbo].[t_active_tickets] ADD
[id_lang_code] [int] NOT NULL CONSTRAINT [DF__t_active___id_la__07C12930] DEFAULT ((840))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[agg_decision_audit_trail]'
GO
ALTER TABLE [dbo].[agg_decision_audit_trail] ADD
[tt_end] [datetime] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[t_acc_usage_quoting]'
GO
CREATE TABLE [dbo].[t_acc_usage_quoting]
(
[quote_id] [int] NOT NULL,
[id_sess] [bigint] NOT NULL,
[tx_UID] [varbinary] (16) NOT NULL,
[id_acc] [int] NOT NULL,
[id_payee] [int] NOT NULL,
[id_view] [int] NOT NULL,
[id_usage_interval] [int] NOT NULL,
[id_parent_sess] [bigint] NULL,
[id_prod] [int] NULL,
[id_svc] [int] NOT NULL,
[dt_session] [datetime] NOT NULL,
[amount] [numeric] (22, 10) NOT NULL,
[am_currency] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dt_crt] [datetime] NOT NULL,
[tx_batch] [varbinary] (16) NULL,
[tax_federal] [numeric] (22, 10) NULL,
[tax_state] [numeric] (22, 10) NULL,
[tax_county] [numeric] (22, 10) NULL,
[tax_local] [numeric] (22, 10) NULL,
[tax_other] [numeric] (22, 10) NULL,
[id_pi_instance] [int] NULL,
[id_pi_template] [int] NULL,
[id_se] [int] NOT NULL,
[div_currency] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[div_amount] [numeric] (22, 10) NULL,
[is_implied_tax] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[tax_calculated] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_informational] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_t_acc_usage_quoting] on [dbo].[t_acc_usage_quoting]'
GO
ALTER TABLE [dbo].[t_acc_usage_quoting] ADD CONSTRAINT [PK_t_acc_usage_quoting] PRIMARY KEY CLUSTERED  ([quote_id], [id_sess], [id_usage_interval])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[t_rec_win_bcp_for_reverse]'
GO
CREATE TABLE [dbo].[t_rec_win_bcp_for_reverse]
(
[c_BilledThroughDate] [datetime] NULL,
[c__PriceableItemInstanceID] [int] NULL,
[c__PriceableItemTemplateID] [int] NULL,
[c__ProductOfferingID] [int] NULL,
[c__SubscriptionID] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [idx_adj_txn_dt_crt_ndel_usage] on [dbo].[t_adjustment_transaction]'
GO
CREATE NONCLUSTERED INDEX [idx_adj_txn_dt_crt_ndel_usage] ON [dbo].[t_adjustment_transaction] ([dt_crt], [c_status], [id_sess])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [idx_t_audit_dt_crt] on [dbo].[t_audit]'
GO
CREATE NONCLUSTERED INDEX [idx_t_audit_dt_crt] ON [dbo].[t_audit] ([dt_crt] DESC)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IDX_TB_DATE] on [dbo].[t_batch]'
GO
CREATE NONCLUSTERED INDEX [IDX_TB_DATE] ON [dbo].[t_batch] ([dt_crt] DESC) INCLUDE ([n_expected])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IDX_FT_DATE] on [dbo].[t_failed_transaction]'
GO
CREATE NONCLUSTERED INDEX [IDX_FT_DATE] ON [dbo].[t_failed_transaction] ([dt_FailureTime] DESC)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering trigger [dbo].[trig_update_t_recur_window_with_t_payment_redirection] on [dbo].[t_payment_redirection]'
GO
ALTER trigger [dbo].[trig_update_t_recur_window_with_t_payment_redirection]
ON [dbo].[t_payment_redirection]
/* We don't want to trigger on delete, because the insert comes right after a delete, and we can get the info that was deleted
  from payment_redir_history*/
for insert
as
begin
--Grab everything that was changed
--Get the old vt_start and vt_end for payees that have changed
select distinct redirold.id_payer, redirold.id_payee, redirold.vt_start, redirold.vt_end
  into #tmp_redir from inserted
  inner loop join t_payment_redir_history redirnew on redirnew.id_payee = inserted.id_payee
       and redirnew.tt_end = dbo.MTMaxDate()
  inner loop join t_payment_redir_history redirold on redirnew.id_payee = redirold.id_payee
       and redirold.tt_end  = dbo.subtractSecond(redirnew.tt_start);
    
--Get the old windows for payees that have changed
select *  into #tmp_oldrw from t_recur_window trw JOIN #tmp_redir ON trw.c__AccountID = #tmp_redir.id_payee
  AND trw.c_PayerStart = #tmp_redir.vt_start AND trw.c_PayerEnd = #tmp_redir.vt_end;
 
DECLARE @currentDate DATETIME
SET @currentDate = dbo.metratime(1,'RC');
 
SELECT orw.c_CycleEffectiveDate
       ,orw.c_CycleEffectiveStart
       ,orw.c_CycleEffectiveEnd
       ,orw.c_SubscriptionStart
       ,orw.c_SubscriptionEnd
       ,orw.c_Advance
       ,orw.c__AccountID
       ,INSERTED.id_payer AS c__PayingAccount
       ,orw.c__PriceableItemInstanceID
       ,orw.c__PriceableItemTemplateID
       ,orw.c__ProductOfferingID
       ,inserted.vt_start as c_PayerStart
       ,INSERTED.vt_end AS c_PayerEnd
       ,orw.c__SubscriptionID
       ,orw.c_UnitValueStart
       ,orw.c_UnitValueEnd
       ,orw.c_UnitValue
       ,orw.c_BilledThroughDate
       ,orw.c_LastIdRun
       ,orw.c_MembershipStart
       ,orw.c_MembershipEnd
       , dbo.AllowInitialArrersCharge(orw.c_Advance, INSERTED.id_payer, orw.c_SubscriptionEnd, @currentDate) AS c__IsAllowGenChargeByTrigger

        INTO #tmp_newrw FROM #tmp_oldrw orw JOIN INSERTED ON orw.c__AccountId = INSERTED.id_payee;

exec MeterPayerChangesFromRecurWindow @currentDate;

delete FROM t_recur_window WHERE EXISTS (SELECT 1 FROM
 #tmp_oldrw orw where
   t_recur_window.c__PayingAccount = orw.c__PayingAccount
       and t_recur_window.c__ProductOfferingID = orw.c__ProductOfferingID
       and t_recur_window.c_PayerStart = orw.c_PayerStart
       and t_recur_window.c_PayerEnd = orw.c_PayerEnd
       and t_recur_window.c__SubscriptionID = orw.c__SubscriptionID
);
  
INSERT INTO t_recur_window
	SELECT DISTINCT c_CycleEffectiveDate,
	c_CycleEffectiveStart,
	c_CycleEffectiveEnd,
	c_SubscriptionStart,
	c_SubscriptionEnd,
	c_Advance,
	c__AccountID,
	c__PayingAccount,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c_PayerStart,
	c_PayerEnd,
	c__SubscriptionID,
	c_UnitValueStart,
	c_UnitValueEnd,
	c_UnitValue,
	c_BilledThroughDate,
	c_LastIdRun,
	c_MembershipStart,
	c_MembershipEnd
	FROM #tmp_newrw;


UPDATE t_recur_window
SET c_CycleEffectiveEnd =
 (
  SELECT MIN(IsNull(c_CycleEffectiveDate,c_SubscriptionEnd)) FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate
)
WHERE 1=1
AND c__PayingAccount in (select c__PayingAccount from #tmp_newrw)
AND EXISTS
(SELECT 1 FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId
    AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate)
;
end
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering trigger [dbo].[trig_update_recur_window_on_t_gsub_recur_map] on [dbo].[t_gsub_recur_map]'
GO
ALTER trigger dbo.trig_update_recur_window_on_t_gsub_recur_map
ON dbo.t_gsub_recur_map
for insert, UPDATE, delete
as
begin
declare @temp datetime;

delete from t_recur_window where exists (
    select 1 from deleted gsrm
      join t_sub sub on gsrm.id_group = sub.id_group
	  join t_pl_map plm on sub.id_po = plm.id_po
		  and t_recur_window.c__PriceableItemInstanceID = plm.id_pi_instance and t_recur_window.c__PriceableItemTemplateID = plm.id_pi_template
         and t_recur_window.c__SubscriptionID = sub.id_sub
         and t_recur_window.c__AccountID = gsrm.id_acc
		  and t_recur_window.c__PriceableItemInstanceID = gsrm.id_prop);

  MERGE into t_recur_window USING (
    select distinct sub.id_sub, gsrm.id_acc, gsrm.vt_start, gsrm.vt_end
      FROM
       INSERTED gsrm inner join t_recur_window trw on
         trw.c__AccountID = gsrm.id_acc
         inner join t_sub sub on sub.id_group = gsrm.id_group
            and trw.c__SubscriptionID = sub.id_sub) AS source
     ON (t_recur_window.c__SubscriptionID = source.id_sub
       and t_recur_window.c__AccountID = source.id_acc)
   WHEN matched AND t_recur_window.c__AccountID = source.id_acc THEN
	UPDATE SET c_MembershipStart = source.vt_start,
	           c_MembershipEnd = source.vt_end;
			   
	select @temp = tt_start from inserted
	           
 SELECT
       sub.vt_start AS c_CycleEffectiveDate
      ,sub.vt_start AS c_CycleEffectiveStart
      ,sub.vt_end AS c_CycleEffectiveEnd
      ,sub.vt_start          AS c_SubscriptionStart
      ,sub.vt_end          AS c_SubscriptionEnd
      ,rcr.b_advance          AS c_Advance
      ,pay.id_payee AS c__AccountID
      ,pay.id_payer      AS c__PayingAccount
      ,plm.id_pi_instance      AS c__PriceableItemInstanceID
      ,plm.id_pi_template      AS c__PriceableItemTemplateID
      ,plm.id_po      AS c__ProductOfferingID
      ,pay.vt_start AS c_PayerStart
      ,pay.vt_end AS c_PayerEnd
      ,sub.id_sub      AS c__SubscriptionID
      , IsNull(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart
      , IsNull(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd
      , rv.n_value AS c_UnitValue
      , @temp as c_BilledThroughDate
      , -1 AS c_LastIdRun
      , grm.vt_start AS c_MembershipStart
      , grm.vt_end AS c_MembershipEnd
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, sub.dt_crt) AS c__IsAllowGenChargeByTrigger
	  into #recur_window_holder
FROM inserted grm
      /* TODO: GRM dates or sub dates or both for filtering */
      INNER JOIN t_sub sub ON grm.id_group = sub.id_group
      INNER JOIN t_payment_redirection pay ON pay.id_payee = grm.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL and plm.id_sub is null and plm.id_pi_instance = grm.id_prop
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      LEFT OUTER JOIN t_recur_value rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub
        AND rv.tt_end = dbo.MTMaxDate()
        AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
        AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
      WHERE
		not EXISTS
	        (SELECT 1 FROM T_RECUR_WINDOW where c__AccountID = grm.id_acc
	          	AND c__SubscriptionID = sub.id_sub
				AND c__priceableiteminstanceid = grm.id_prop
				AND c__priceableitemtemplateid = plm.id_pi_template
			)
	      AND grm.tt_end = dbo.mtmaxdate()
	      AND rcr.b_charge_per_participant = 'N'
	      AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL);
      
    
	/* adds charges to METER tables */
	EXEC MeterInitialFromRecurWindow @currentDate = @temp;
    EXEC MeterCreditFromRecurWindow @currentDate = @temp;
	 
	INSERT INTO t_recur_window
	SELECT c_CycleEffectiveDate,
	c_CycleEffectiveStart,
	c_CycleEffectiveEnd,
	c_SubscriptionStart,
	c_SubscriptionEnd,
	c_Advance,
	c__AccountID,
	c__PayingAccount,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c_PayerStart,
	c_PayerEnd,
	c__SubscriptionID,
	c_UnitValueStart,
	c_UnitValueEnd,
	c_UnitValue,
	c_BilledThroughDate,
	c_LastIdRun,
	c_MembershipStart,
	c_MembershipEnd
	FROM #recur_window_holder;
	
/* step 2) update the cycle effective windows */
UPDATE t_recur_window
 SET c_CycleEffectiveEnd =
 (
  SELECT MIN(IsNull(c_CycleEffectiveDate,c_SubscriptionEnd)) FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate
 )
 WHERE 1=1
 AND EXISTS
(SELECT 1 FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId
    AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate)
;
END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering trigger [dbo].[trig_update_recur_window_on_t_gsubmember] on [dbo].[t_gsubmember]'
GO
ALTER trigger trig_update_recur_window_on_t_gsubmember
ON t_gsubmember
for insert, UPDATE, delete
as
begin
declare @startDate datetime;
delete from t_recur_window where exists (
  select 1 from deleted gsm
         join t_sub sub on gsm.id_group = sub.id_group and
         t_recur_window.c__SubscriptionID = sub.id_sub and t_recur_window.c__AccountID = gsm.id_acc
	    join t_pl_map plm on sub.id_po = plm.id_po
		  and t_recur_window.c__PriceableItemInstanceID = plm.id_pi_instance and t_recur_window.c__PriceableItemTemplateID = plm.id_pi_template
INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
AND rcr.b_charge_per_participant = 'Y');
         
         
MERGE into t_recur_window USING (
	select distinct sub.id_sub, gsubmember.id_acc, gsubmember.vt_start, gsubmember.vt_end, plm.id_pi_template, plm.id_pi_instance
	FROM
       INSERTED gsubmember inner join t_recur_window trw on
         trw.c__AccountID = gsubmember.id_acc
         inner join t_sub sub on sub.id_group = gsubmember.id_group
            and trw.c__SubscriptionID = sub.id_sub
         inner join t_pl_map plm on sub.id_po = plm.id_po
            and plm.id_sub = null and plm.id_paramtable = null
			) AS source
     ON (t_recur_window.c__SubscriptionID = source.id_sub
     and t_recur_window.c__AccountID = source.id_acc)
WHEN matched AND t_recur_window.c__SubscriptionID = source.id_sub
    AND t_recur_window.c__AccountID = source.id_acc
    and t_recur_window.c__PriceableItemInstanceID = source.id_pi_instance
    AND t_recur_window.c__PriceableItemTemplateID = source.id_pi_template	THEN
	UPDATE SET c_MembershipStart = source.vt_start,
	           c_MembershipEnd = source.vt_end;
	
	
	SET @startDate = dbo.metratime(1,'RC');
			   
	SELECT
       gsm.vt_start AS c_CycleEffectiveDate
      ,gsm.vt_start AS c_CycleEffectiveStart
      ,gsm.vt_end AS c_CycleEffectiveEnd
      ,gsm.vt_start          AS c_SubscriptionStart
      ,gsm.vt_end          AS c_SubscriptionEnd
      ,rcr.b_advance          AS c_Advance
      ,pay.id_payee AS c__AccountID
      ,pay.id_payer      AS c__PayingAccount
      ,plm.id_pi_instance      AS c__PriceableItemInstanceID
      ,plm.id_pi_template      AS c__PriceableItemTemplateID
      ,plm.id_po      AS c__ProductOfferingID
      ,pay.vt_start AS c_PayerStart
      ,pay.vt_end AS c_PayerEnd
      ,sub.id_sub      AS c__SubscriptionID
      , IsNull(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart
      , IsNull(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd
      , rv.n_value AS c_UnitValue
      , @startDate as c_BilledThroughDate
      , -1 AS c_LastIdRun
      , dbo.mtmindate() AS c_MembershipStart
      , dbo.mtmaxdate() AS c_MembershipEnd
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, @startDate) AS c__IsAllowGenChargeByTrigger
	INTO #recur_window_holder
    FROM INSERTED gsm
      INNER JOIN t_sub sub ON sub.id_group = gsm.id_group
      INNER JOIN t_payment_redirection pay ON pay.id_payee = gsm.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start AND pay.vt_start < gsm.vt_end AND pay.vt_end > gsm.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      LEFT OUTER JOIN t_recur_value rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub AND rv.tt_end = dbo.MTMaxDate() AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start AND rv.vt_start < gsm.vt_end AND rv.vt_end > gsm.vt_start
      WHERE
		not EXISTS
        (SELECT 1 FROM T_RECUR_WINDOW where c__AccountID = gsm.id_acc
          AND c__SubscriptionID = sub.id_sub
		  and c__PriceableItemInstanceID = plm.id_pi_instance
		  and c__PriceableItemTemplateID = plm.id_pi_template)
      AND rcr.b_charge_per_participant = 'Y'
      AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL);
	
	/* adds charges to METER tables */
    EXEC MeterInitialFromRecurWindow @currentDate = @startDate;
    EXEC MeterCreditFromRecurWindow @currentDate = @startDate;
	  
	INSERT INTO t_recur_window
	SELECT c_CycleEffectiveDate,
	c_CycleEffectiveStart,
	c_CycleEffectiveEnd,
	c_SubscriptionStart,
	c_SubscriptionEnd,
	c_Advance,
	c__AccountID,
	c__PayingAccount,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c_PayerStart,
	c_PayerEnd,
	c__SubscriptionID,
	c_UnitValueStart,
	c_UnitValueEnd,
	c_UnitValue,
	c_BilledThroughDate,
	c_LastIdRun,
	c_MembershipStart,
	c_MembershipEnd
	FROM #recur_window_holder;
	
/* step 2) update the cycle effective windows */

/* sql */
UPDATE t_recur_window
 SET c_CycleEffectiveEnd =
 (
  SELECT MIN(IsNull(c_CycleEffectiveDate,c_SubscriptionEnd)) FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate
 )
 WHERE EXISTS
(SELECT 1 FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId
    AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate)
;
END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering trigger [dbo].[trig_update_t_recur_window_with_recur_value] on [dbo].[t_recur_value]'
GO
ALTER TRIGGER trig_update_t_recur_window_with_recur_value
ON t_recur_value FOR INSERT, UPDATE, DELETE
AS
BEGIN
/* Notes:
Trigger is executed 7 times after each update of UDRC values.
5 first times INSERTED and DELETED tables are empty.
On 6 time we have update (INSERTED and DELETED have same number of rows)
On 7 time we have insert (INSERTED only have rows)
*/
  IF @@ROWCOUNT = 0 RETURN;

  DECLARE @startDate datetime;
  SELECT @startDate = tt_start FROM inserted;

  SELECT *, 1 AS c__IsAllowGenChargeByTrigger INTO #recur_window_holder FROM t_recur_window WHERE 1=0;
  SELECT * INTO #tmp_changed_units FROM t_recur_value WHERE 1=0;

  IF EXISTS (SELECT * FROM DELETED)
  BEGIN
    INSERT INTO #tmp_changed_units SELECT * FROM DELETED;

    INSERT INTO #recur_window_holder
    SELECT *, 1 AS c__IsAllowGenChargeByTrigger
    FROM   t_recur_window
    WHERE  EXISTS
           (
               SELECT 1 FROM DELETED d
               WHERE  t_recur_window.c__SubscriptionID = d.id_sub
                      AND t_recur_window.c__PriceableItemInstanceID = d.id_prop
                      AND t_recur_window.c_UnitValueStart = d.vt_start
                      AND t_recur_window.c_UnitValueEnd = d.vt_end
           );

    UPDATE rw
    SET rw.c_SubscriptionStart = current_sub.vt_start,
        rw.c_SubscriptionEnd = current_sub.vt_end
    FROM #recur_window_holder rw
        INNER LOOP JOIN t_sub_history new_sub ON new_sub.id_acc = rw.c__AccountID
            AND new_sub.id_sub = rw.c__SubscriptionID
            AND new_sub.tt_end = dbo.MTMaxDate()
        INNER LOOP JOIN t_sub_history current_sub ON current_sub.id_acc = rw.c__AccountID
            AND current_sub.id_sub = rw.c__SubscriptionID
            AND current_sub.tt_end = dbo.SubtractSecond(new_sub.tt_start);

    DELETE
    FROM   t_recur_window
    WHERE  EXISTS
           (
               SELECT 1 FROM DELETED d
               WHERE  t_recur_window.c__SubscriptionID = d.id_sub
                      AND t_recur_window.c__PriceableItemInstanceID = d.id_prop
                      AND t_recur_window.c_UnitValueStart = d.vt_start
                      AND t_recur_window.c_UnitValueEnd = d.vt_end
           );

    EXEC MeterUdrcFromRecurWindow @currentDate = @startDate, @actionType = 'AdvanceCorrection';
    RETURN;
  END;
  
  INSERT INTO #tmp_changed_units SELECT * FROM INSERTED;
  
  INSERT INTO #recur_window_holder
  SELECT
       sub.vt_start AS c_CycleEffectiveDate
      ,sub.vt_start AS c_CycleEffectiveStart
      ,sub.vt_end AS c_CycleEffectiveEnd
      ,sub.vt_start          AS c_SubscriptionStart
      ,sub.vt_end          AS c_SubscriptionEnd
      ,rcr.b_advance          AS c_Advance
      ,pay.id_payee AS c__AccountID
      ,pay.id_payer      AS c__PayingAccount
      ,plm.id_pi_instance      AS c__PriceableItemInstanceID
      ,plm.id_pi_template      AS c__PriceableItemTemplateID
      ,plm.id_po      AS c__ProductOfferingID
      ,pay.vt_start AS c_PayerStart
      ,pay.vt_end AS c_PayerEnd
      ,sub.id_sub      AS c__SubscriptionID
      , IsNull(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart
      , IsNull(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd
      , rv.n_value AS c_UnitValue
      , dbo.mtmindate() as c_BilledThroughDate
      , -1 AS c_LastIdRun
      , dbo.mtmindate() AS c_MembershipStart
      , dbo.mtmaxdate() AS c_MembershipEnd
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, @startDate) AS c__IsAllowGenChargeByTrigger
      FROM t_sub sub
      INNER JOIN t_payment_redirection pay ON pay.id_payee = sub.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      JOIN #tmp_changed_units rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub AND rv.tt_end = dbo.MTMaxDate()
        AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
        AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
      WHERE 1=1
      AND sub.id_group IS NULL
      AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL)

UNION ALL
SELECT
       gsm.vt_start AS c_CycleEffectiveDate
      ,gsm.vt_start AS c_CycleEffectiveStart
      ,gsm.vt_end AS c_CycleEffectiveEnd
      ,gsm.vt_start          AS c_SubscriptionStart
      ,gsm.vt_end          AS c_SubscriptionEnd
      ,rcr.b_advance          AS c_Advance
      ,pay.id_payee AS c__AccountID
      ,pay.id_payer      AS c__PayingAccount
      ,plm.id_pi_instance      AS c__PriceableItemInstanceID
      ,plm.id_pi_template      AS c__PriceableItemTemplateID
      ,plm.id_po      AS c__ProductOfferingID
      ,pay.vt_start AS c_PayerStart
      ,pay.vt_end AS c_PayerEnd
      ,sub.id_sub      AS c__SubscriptionID
      , IsNull(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart
      , IsNull(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd
      , rv.n_value AS c_UnitValue
      , dbo.mtmindate() as c_BilledThroughDate
      , -1 AS c_LastIdRun
      , dbo.mtmindate() AS c_MembershipStart
      , dbo.mtmaxdate() AS c_MembershipEnd
	  , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payee, gsm.vt_end, @startDate) AS c__IsAllowGenChargeByTrigger
      FROM t_gsubmember gsm
      INNER JOIN t_sub sub ON sub.id_group = gsm.id_group
      INNER JOIN t_payment_redirection pay ON pay.id_payee = gsm.id_acc
        AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
        AND pay.vt_start < gsm.vt_end AND pay.vt_end > gsm.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      JOIN #tmp_changed_units rv ON rv.id_prop = rcr.id_prop
        AND sub.id_sub = rv.id_sub
        AND rv.tt_end = dbo.MTMaxDate()
        AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
        AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
        AND rv.vt_start < gsm.vt_end AND rv.vt_end > gsm.vt_start
      WHERE
      	rcr.b_charge_per_participant = 'Y'
      	AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL)
UNION ALL
SELECT
       sub.vt_start AS c_CycleEffectiveDate
      ,sub.vt_start AS c_CycleEffectiveStart
      ,sub.vt_end AS c_CycleEffectiveEnd
      ,sub.vt_start          AS c_SubscriptionStart
      ,sub.vt_end          AS c_SubscriptionEnd
      ,rcr.b_advance          AS c_Advance
      ,pay.id_payee AS c__AccountID
      ,pay.id_payer      AS c__PayingAccount
      ,plm.id_pi_instance      AS c__PriceableItemInstanceID
      ,plm.id_pi_template      AS c__PriceableItemTemplateID
      ,plm.id_po      AS c__ProductOfferingID
      ,pay.vt_start AS c_PayerStart
      ,pay.vt_end AS c_PayerEnd
      ,sub.id_sub      AS c__SubscriptionID
      , IsNull(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart
      , IsNull(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd
      , rv.n_value AS c_UnitValue
      , dbo.mtmindate() as c_BilledThroughDate
      , -1 AS c_LastIdRun
      , grm.vt_start AS c_MembershipStart
      , grm.vt_end AS c_MembershipEnd
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, @startDate) AS c__IsAllowGenChargeByTrigger
      FROM t_gsub_recur_map grm
      /* TODO: GRM dates or sub dates or both for filtering */
      INNER JOIN t_sub sub ON grm.id_group = sub.id_group
      INNER JOIN t_payment_redirection pay ON pay.id_payee = grm.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      JOIN #tmp_changed_units rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub
      AND rv.tt_end = dbo.MTMaxDate()
      AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
      AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
      WHERE
      	grm.tt_end = dbo.mtmaxdate()
      	AND rcr.b_charge_per_participant = 'N'
      	AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL);


  EXEC MeterInitialFromRecurWindow @currentDate = @startDate;
  EXEC MeterUdrcFromRecurWindow @currentDate = @startDate, @actionType = 'DebitCorrection';


	INSERT INTO t_recur_window
	SELECT DISTINCT c_CycleEffectiveDate,
	c_CycleEffectiveStart,
	c_CycleEffectiveEnd,
	c_SubscriptionStart,
	c_SubscriptionEnd,
	c_Advance,
	c__AccountID,
	c__PayingAccount,
	c__PriceableItemInstanceID,
	c__PriceableItemTemplateID,
	c__ProductOfferingID,
	c_PayerStart,
	c_PayerEnd,
	c__SubscriptionID,
	c_UnitValueStart,
	c_UnitValueEnd,
	c_UnitValue,
	c_BilledThroughDate,
	c_LastIdRun,
	c_MembershipStart,
	c_MembershipEnd
	FROM #recur_window_holder;


UPDATE t_recur_window
SET c_CycleEffectiveEnd =
 (
  SELECT MIN(IsNull(c_CycleEffectiveDate,c_SubscriptionEnd)) FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate
)
WHERE EXISTS
(SELECT 1 FROM t_recur_window w2
    WHERE w2.c__SubscriptionId = t_recur_window.c__SubscriptionId
    AND t_recur_window.c_PayerStart = w2.c_PayerStart
    AND t_recur_window.c_PayerEnd = w2.c_PayerEnd
    AND t_recur_window.c_UnitValueStart = w2.c_UnitValueStart
    AND t_recur_window.c_UnitValueEnd = w2.c_UnitValueEnd
    AND t_recur_window.c_membershipstart = w2.c_membershipstart
    AND t_recur_window.c_membershipend = w2.c_membershipend
    AND t_recur_window.c__accountid = w2.c__accountid
    AND t_recur_window.c__payingaccount = w2.c__payingaccount
    AND w2.c_CycleEffectiveDate > t_recur_window.c_CycleEffectiveDate)
    ;
end;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering trigger [dbo].[trig_update_recur_window_on_t_sub] on [dbo].[t_sub]'
GO
ALTER TRIGGER trig_update_recur_window_on_t_sub
ON t_sub
FOR  INSERT, UPDATE, DELETE
AS
BEGIN
  DECLARE @now          DATETIME,
          @newSubStart  DATETIME,
          @newSubEnd    DATETIME,
          @curSubStart  DATETIME,
          @curSubEnd    DATETIME,
          @idAcc        INT,
          @idSub        INT

  DELETE
  FROM   t_recur_window
  WHERE  EXISTS (
             SELECT 1
             FROM   DELETED sub
             WHERE  t_recur_window.c__AccountID = sub.id_acc
                    AND t_recur_window.c__SubscriptionID = sub.id_sub
                    AND t_recur_window.c_SubscriptionStart = sub.vt_start
                    AND t_recur_window.c_SubscriptionEnd = sub.vt_end
         );

  MERGE INTO t_recur_window
    USING (
              SELECT DISTINCT sub.id_sub,
                     sub.id_acc,
                     sub.vt_start,
                     sub.vt_end,
                     plm.id_pi_template,
                     plm.id_pi_instance
              FROM   INSERTED sub
                     INNER JOIN t_recur_window trw
                          ON  trw.c__AccountID = sub.id_acc
                          AND trw.c__SubscriptionID = sub.id_sub
                     INNER JOIN t_pl_map plm
                          ON  sub.id_po = plm.id_po
                          AND plm.id_sub = sub.id_sub
                          AND plm.id_paramtable = NULL
          ) AS source
    ON (
           t_recur_window.c__SubscriptionID = source.id_sub
           AND t_recur_window.c__AccountID = source.id_acc
       )
  WHEN MATCHED AND t_recur_window.c__SubscriptionID = source.id_sub
               AND t_recur_window.c__AccountID      = source.id_acc
    THEN UPDATE SET c_SubscriptionStart = source.vt_start,
                    c_SubscriptionEnd   = source.vt_end;

  SELECT sub.vt_start AS c_CycleEffectiveDate,
         sub.vt_start AS c_CycleEffectiveStart,
         sub.vt_end AS c_CycleEffectiveEnd,
         sub.vt_start AS c_SubscriptionStart,
         sub.vt_end AS c_SubscriptionEnd,
         rcr.b_advance AS c_Advance,
         pay.id_payee AS c__AccountID,
         pay.id_payer AS c__PayingAccount,
         plm.id_pi_instance AS c__PriceableItemInstanceID,
         plm.id_pi_template AS c__PriceableItemTemplateID,
         plm.id_po AS c__ProductOfferingID,
         pay.vt_start AS c_PayerStart,
         pay.vt_end AS c_PayerEnd,
         sub.id_sub AS c__SubscriptionID,
         ISNULL(rv.vt_start, dbo.mtmindate()) AS c_UnitValueStart,
         ISNULL(rv.vt_end, dbo.mtmaxdate()) AS c_UnitValueEnd,
         rv.n_value AS c_UnitValue,
         dbo.mtmindate() AS c_BilledThroughDate,
         -1 AS c_LastIdRun,
         dbo.mtmindate() AS c_MembershipStart,
         dbo.mtmaxdate() AS c_MembershipEnd,
         dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, sub.dt_crt) AS c__IsAllowGenChargeByTrigger
         /* We'll use #recur_window_holder in the stored proc that operates only on the latest data */
         INTO #recur_window_holder
  FROM   INSERTED sub
         INNER JOIN t_payment_redirection pay ON pay.id_payee = sub.id_acc
         /* AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start */
         INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
         INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
         INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
         LEFT OUTER JOIN t_recur_value rv ON  rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub
              AND rv.tt_end = dbo.MTMaxDate()
              AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
              AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
  WHERE  /* Make sure not to insert a row that already takes care of this account/sub id */
         NOT EXISTS
         (
             SELECT 1
             FROM   T_RECUR_WINDOW
             WHERE  c__AccountID = sub.id_acc
                    AND c__SubscriptionID = sub.id_sub
         )
         AND sub.id_group IS NULL
         AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL)

  SELECT @now = tsh.tt_start FROM t_sub_history tsh JOIN INSERTED sub ON tsh.id_acc = sub.id_acc AND tsh.id_sub = sub.id_sub AND tsh.tt_end = dbo.MTMaxDate();

   /* adds charges to METER tables */
  EXEC MeterInitialFromRecurWindow @currentDate = @now;
  /* If this is update of existing subscription add also Credit/Debit charges */
  EXEC MeterCreditFromRecurWindow  @currentDate = @now;

  INSERT INTO t_recur_window
  SELECT c_CycleEffectiveDate,
         c_CycleEffectiveStart,
         c_CycleEffectiveEnd,
         c_SubscriptionStart,
         c_SubscriptionEnd,
         c_Advance,
         c__AccountID,
         c__PayingAccount,
         c__PriceableItemInstanceID,
         c__PriceableItemTemplateID,
         c__ProductOfferingID,
         c_PayerStart,
         c_PayerEnd,
         c__SubscriptionID,
         c_UnitValueStart,
         c_UnitValueEnd,
         c_UnitValue,
         c_BilledThroughDate,
         c_LastIdRun,
         c_MembershipStart,
         c_MembershipEnd
  FROM   #recur_window_holder;

END;
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CustomDescription'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CustomIdentifier'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EndDate'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteID'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StartDate'
GO

PRINT N'Renaming columns'
GO

EXEC sp_rename 't_be_cor_qu_quoteheader.c_CustomIdentifier', 'c_QuoteIdentifier', 'COLUMN';
GO
EXEC sp_rename 't_be_cor_qu_quoteheader.c_CustomDescription', 'c_QuoteDescription', 'COLUMN';
GO

PRINT N'Adding columns'
GO
ALTER TABLE dbo.t_be_cor_qu_quoteheader ADD 
  [c_GroupSubscription] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_CorporateAccountId] [bigint] NULL, 
  [c_ReportLink] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
  [c_TotalTax] [decimal] (22, 10) NULL,
  [c_Currency] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_FailedMessage] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_Localization] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_EffectiveDate] [datetime] NULL,
  [c_EffectiveEndDate] [datetime] NULL,
  [c_IdQuote] [int] NULL,
  [c_TotalAmount] [decimal] (22, 10) NULL,
  [c_ReportURL] [varbinary] (8000) NULL,
  [c_Status] [int] NULL,
  [c_StatusCleanup] [int] NULL,
  [c_StatusReport] [int] NULL,
  [c_AccountsInfo] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_POsInfo] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [c_QuoteCreationDate] [datetime] NULL;  
GO

PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', 'String for display accounts in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_AccountsInfo'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Corporate AccountId for group subscription', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CorporateAccountId'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Currency of quote amount', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Currency'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date the quote is started', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EffectiveDate'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date the quote is finished.', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EffectiveEndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Error message', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_FailedMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Indicates then quote is generated for group subscription', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_GroupSubscription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Quoute number. Should be unique.', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_IdQuote'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Localization', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Localization'
GO
EXEC sp_addextendedproperty N'MS_Description', 'String for display POs in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_POsInfo'
GO
EXEC sp_addextendedproperty N'MS_Description', '', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteCreationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Custom description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Description of quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteIdentifier'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Link to PDF file with report', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_ReportLink'
GO
EXEC sp_addextendedproperty N'MS_Description', 'URL to quote report file', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_ReportURL'
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - None, 1 - In progress, 2 - Failed, 3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Status'
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - None, 1 - In progress, 2 - Failed, 3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StatusCleanup'
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - Skipped, 1 - In progress, 2 - Failed, 3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StatusReport'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Total sum of charges in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_TotalAmount'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Total sum of taxes in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_TotalTax'
GO

PRINT N'Rebuilding [dbo].[t_be_cor_qu_quoteheader]'
GO
UPDATE dbo.t_be_cor_qu_quoteheader 
SET 
  c_reportlink = qc.c_reportlink,
  c_reporturl = qc.c_reportcontent,
  c_totalamount = qc.c_total,
  c_totaltax = qc.c_totaltax,  
  c_currency = qc.c_currency,  
  c_status = qc.c_status,
  c_effectivedate = qh.c_startdate,
  c_effectiveenddate = qh.c_enddate,
  c_idquote = qh.c_quoteid,
  c_QuoteCreationDate = qh.c_CreationDate,
  c_FailedMessage = qc.c_FailedMessage 
FROM dbo.t_be_cor_qu_quoteheader qh 
  INNER JOIN dbo.t_be_cor_qu_quotecontent qc ON
    qh.c_QuoteHeader_Id = qc.c_QuoteHeader_Id;
GO

PRINT N'Set c_IdQuote to NOT NULL'
GO
ALTER TABLE dbo.t_be_cor_qu_quoteheader ALTER COLUMN [c_IdQuote] [int] NOT NULL;
GO

PRINT N'Deleting old objects'
GO
ALTER TABLE dbo.t_be_cor_qu_quoteheader DROP COLUMN c_StartDate, c_EndDate, c_QuoteID;
GO
ALTER TABLE dbo.t_be_cor_qu_quoteheader ALTER COLUMN [c_QuoteDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;
GO

PRINT N'Updating detail fields [dbo].[t_be_cor_qu_quoteheader]'
GO
UPDATE dbo.t_be_cor_qu_quoteheader 
SET
  c_GroupSubscription = 'F',
  c_AccountsInfo = (
    SELECT STUFF(
      CAST(
        (
          SELECT [text()] = ', ' + CAST(c_AccountID AS VARCHAR(50))
          FROM t_be_cor_qu_accountforquote ac
          WHERE ac.c_QuoteHeader_Id = qh.c_QuoteHeader_Id
          FOR XML PATH(''), TYPE
        ) AS VARCHAR(2000)
      ), 
      1, 2, ''
    )
  ),
  c_POsInfo = (
    SELECT STUFF(
      CAST(
        (
          SELECT [text()] = ', ' + CAST(c_POID AS VARCHAR(50))
          FROM t_be_cor_qu_poforquote po
          WHERE po.c_QuoteHeader_Id = qh.c_QuoteHeader_Id
          FOR XML PATH(''), TYPE
        ) AS VARCHAR(2000)
      ), 
      1, 2, ''
    )
  )
FROM dbo.t_be_cor_qu_quoteheader qh;
GO

DECLARE @SQLString NVARCHAR(500);
DECLARE @constrName VARCHAR(50);
SELECT @constrName = constraint_name FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE WHERE TABLE_NAME = 't_be_cor_qu_quoteicb' AND column_name = 'c_QuoteHeader_Id';
SET @SQLString = 'ALTER TABLE dbo.t_be_cor_qu_quoteicb DROP CONSTRAINT ' + @constrName;
EXECUTE sp_executesql @SQLString;
GO

ALTER TABLE dbo.t_be_cor_qu_quoteicb DROP COLUMN c_QuoteHeader_Id
GO

DROP TABLE [dbo].[t_be_cor_qu_quotecontent];
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Dropping [dbo].[QuoteIndividualPrice]'
GO
DROP TABLE [dbo].[QuoteIndividualPrice]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Dropping constraints from [dbo].[mvm_scheduled_tasks]'
GO
DECLARE @SQLString NVARCHAR(500);
DECLARE @constrName VARCHAR(50);
SELECT @constrName = constraint_name FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE WHERE TABLE_NAME = 'mvm_scheduled_tasks' AND column_name = 'mvm_poll_guid';
SET @SQLString = 'ALTER TABLE dbo.mvm_scheduled_tasks DROP CONSTRAINT ' + @constrName;
EXECUTE sp_executesql @SQLString;
/*ALTER TABLE [dbo].[mvm_scheduled_tasks] DROP CONSTRAINT [DF__mvm_sched__mvm_p__7E22B05D]*/
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping index [mvm_scheduled_tasks_ndx2] from [dbo].[mvm_scheduled_tasks]'
GO
DROP INDEX [mvm_scheduled_tasks_ndx2] ON [dbo].[mvm_scheduled_tasks]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[mvm_scheduled_tasks]'
GO
ALTER TABLE [dbo].[mvm_scheduled_tasks] ALTER COLUMN [mvm_poll_guid] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[mvm_scheduled_tasks] SET ( LOCK_ESCALATION = DISABLE )
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [mvm_scheduled_tasks_ndx2] on [dbo].[mvm_scheduled_tasks]'
GO
CREATE NONCLUSTERED INDEX [mvm_scheduled_tasks_ndx2] ON [dbo].[mvm_scheduled_tasks] ([mvm_poll_guid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Turning on InstantRc in t_db_values'
GO
UPDATE t_db_values SET value = 'true' WHERE parameter = N'InstantRc'
GO

PRINT N'Updating upgrade information to [dbo].[t_sys_upgrade] table'
GO
UPDATE [dbo].[t_sys_upgrade]
SET db_upgrade_status = 'C',
dt_end_db_upgrade = getdate()
WHERE upgrade_id = (SELECT MAX(upgrade_id) FROM [dbo].[t_sys_upgrade])	
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
