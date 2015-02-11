
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
DECLARE @version varchar(50)
SET @version='8.1.0'

    INSERT INTO [dbo].[t_sys_upgrade]
      (       
        target_db_version,
        dt_start_db_upgrade,
        db_upgrade_status
      )
    VALUES
      (
        @version,
        GETDATE(),
        'R'
      );
GO

IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

PRINT N'Dropping constraints from [dbo].[t_ep_nonrecurring]'
GO
ALTER TABLE [dbo].[t_ep_nonrecurring] DROP CONSTRAINT [pk_t_ep_nonrecurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[t_ep_recurring]'
GO
ALTER TABLE [dbo].[t_ep_recurring] DROP CONSTRAINT [pk_t_ep_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[t_ep_unit_dependent_recurring]'
GO
ALTER TABLE [dbo].[t_ep_unit_dependent_recurring] DROP CONSTRAINT [pk_t_ep_unit_dependent_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[t_aj_PercentDiscount_NoCond]'
GO
DROP TABLE [dbo].[t_aj_PercentDiscount_NoCond]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[t_aj_PercentDiscount]'
GO
DROP TABLE [dbo].[t_aj_PercentDiscount]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[t_aj_FlatDiscount_NoCond]'
GO
DROP TABLE [dbo].[t_aj_FlatDiscount_NoCond]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[t_aj_FlatDiscount]'
GO
DROP TABLE [dbo].[t_aj_FlatDiscount]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_billgroup]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup] ADD
[id_partition] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup] ALTER COLUMN [tx_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vw_paying_accounts]'
GO
EXEC sp_refreshview N'[dbo].[vw_paying_accounts]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vw_unassigned_accounts]'
GO
EXEC sp_refreshview N'[dbo].[vw_unassigned_accounts]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_billgroup_tmp]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup_tmp] ADD
[id_partition] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup_tmp] ALTER COLUMN [tx_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
ALTER TABLE [dbo].[t_billgroup_tmp] ALTER COLUMN [tx_description] [nvarchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_billgroup_member_tmp]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup_member_tmp] ADD
[id_partition] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_billgroup_member_tmp] ALTER COLUMN [tx_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[T_VW_EFFECTIVE_SUBS]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_EFFECTIVE_SUBS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[InsertBaseProps]'
GO
ALTER proc [dbo].[InsertBaseProps]
			@id_lang_code int,
			@a_kind int,
			@a_approved char(1),
			@a_archive char(1),
			@a_nm_name NVARCHAR(255),
			@a_nm_desc NVARCHAR(255),
			@a_nm_display_name NVARCHAR(255),
			@a_id_prop int OUTPUT,
			@id_display_name int OUTPUT,
			@id_display_desc int OUTPUT
			
		AS
		begin
		  declare @id_name int
			exec UpsertDescription @id_lang_code, @a_nm_display_name, NULL, @id_display_name output
			exec UpsertDescription @id_lang_code, @a_nm_name, NULL, @id_name output
			exec UpsertDescription @id_lang_code, @a_nm_desc, NULL, @id_display_desc output
			insert into t_base_props (n_kind, n_name, n_desc,nm_name,nm_desc,b_approved,b_archive,
			n_display_name, nm_display_name) values
			(@a_kind, @id_name, @id_display_desc, @a_nm_name,@a_nm_desc,@a_approved,@a_archive,
			 @id_display_name,@a_nm_display_name)
			select @a_id_prop =@@identity
	   end
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[AddCounterInstance]'
GO
ALTER proc [dbo].[AddCounterInstance]
					            @id_lang_code int,
											@n_kind int,
											@nm_name nvarchar(255),
											@nm_desc nvarchar(255),
											@counter_type_id int,
											@id_prop int OUTPUT
					as
					begin
						DECLARE @identity_value int
						DECLARE @id_display_name int
						DECLARE @id_display_desc int
						exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, @nm_desc, null, @identity_value output, @id_display_name output, @id_display_desc output
					INSERT INTO t_counter (id_prop, id_counter_type) values (@identity_value, @counter_type_id)
					SELECT
						@id_prop = @identity_value
					end
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CheckGroupSubBusinessRules]'
GO
ALTER procedure [dbo].[CheckGroupSubBusinessRules](
	@p_name nvarchar(255),
	@p_desc nvarchar(255),
	@p_startdate datetime,
	@p_enddate datetime,
	@p_id_po int,
	@p_proportional varchar,
	@p_discountaccount int,
	@p_CorporateAccount int,
	@p_existingID int,
	@p_id_usage_cycle integer,
	@p_systemdate datetime,
	@p_enforce_same_corporation varchar,
	@p_allow_acc_po_curr_mismatch int = 0,
	@p_status int OUTPUT
)
as
begin
declare @existingPO integer
declare @constrainedcycletype integer
declare @groupsubCycleType integer
declare @corporatestartdate datetime
select @p_status = 0

-- verify that the corporate account and the product offering have the same currency.
if (@p_enforce_same_corporation = '1')
begin
	if (dbo.IsAccountAndPOSameCurrency(@p_CorporateAccount, @p_id_po) = '0')
	begin

		-- MT_ACCOUNT_PO_CURRENCY_MISMATCH
    if (@p_allow_acc_po_curr_mismatch <> 0)
		select @p_status = 1
	else
		select @p_status = -486604729
		return
	end
end

-- verify that the discount account, if not null has the same currency as the po.
if (@p_enforce_same_corporation = '0' AND @p_discountaccount is not NULL)
begin
   if (dbo.IsAccountAndPOSameCurrency(@p_discountaccount, @p_id_po) = '0')
   begin
	-- MT_ACCOUNT_PO_CURRENCY_MISMATCH
    if (@p_allow_acc_po_curr_mismatch <> 0)
		select @p_status = 1
	else
		select @p_status = -486604729
		return
	end
end

if @p_enddate is NULL
	select @p_enddate = dbo.MTMaxDate()
	
	
	-- verify that the product offering exists and the effective date is kosher
if (@p_proportional = 'N' )
 begin
 if (@p_discountaccount is NULL AND dbo.POContainsDiscount(@p_id_po) = 1)
	begin
	-- MT_GROUP_SUB_DISCOUNT_ACCOUNT_REQUIRED
	select @p_status = -486604787
	return
	end
 end
	-- verify that the account is actually a corporate account
  -- during the interval [@p_startdate, @p_enddate]
  -- this is done by requiring that the account is corporate
	-- at @p_startdate and at @p_enddate and that there are no
  -- gaps during [@p_startdate, @p_enddate] such that the account
  -- is not a corporate account.
  -- DBlair - Note that this is more complicated than it really needs
  -- to be because I have written it as a "generic" sequenced
  -- referential integrity constraint (see Snodgrass' book for definition).
  -- I wanted to follow the pattern, since it is very easy to make
  -- mistakes inventing temporal database constructs in an ad-hoc
  -- way.
--BP: Only return MT_GROUP_SUB_CORPORATE_ACCOUNT_INVALID error if
-- a business rule that prohibits cross-corporation operations is enforced
-- Otherwise we create all group subscriptions as global (id_corp = 1)
--Another way to do this would be to ignore below check if corporation id
-- is 1. However this would introduce some complications during pc import/export and upgrades
if(@p_enforce_same_corporation = '1')
begin
	if
		not exists(
			select *
			from t_account_ancestor aa
			inner join t_account a on a.id_acc = aa.id_descendent
			inner join t_account_type at on at.id_type = a.id_type
			where
			at.b_IsCorporate = '1'
			and
			aa.id_descendent=@p_CorporateAccount
			and
			aa.vt_start <= @p_startdate
			and
			aa.vt_end >= @p_startdate
		)
		or not exists (
			select *
			from t_account_ancestor aa
			inner join t_account a on a.id_acc = aa.id_descendent
			inner join t_account_type at on at.id_type = a.id_type
			where
			at.b_IsCorporate = '1'
			and
			aa.id_descendent=@p_CorporateAccount
			and
			aa.vt_start <= @p_enddate
			--and
			--aa.vt_end >= @p_enddate
		)
		or exists (
			select *
			-- This finds a record that ends during the
			-- interval...
			from t_account_ancestor aa
			inner join t_account a on a.id_acc = aa.id_descendent
			inner join t_account_type at on at.id_type = a.id_type
			where
			at.b_IsCorporate = '1'
			and
			aa.id_descendent=@p_CorporateAccount
			and
			@p_startdate <= aa.vt_end
			and
			aa.vt_end < @p_enddate
			-- ... and there is not corp. account record that extends
			-- its validity.
			and
			not exists (
				select *
				from t_account_ancestor aa2
			  inner join t_account a on a.id_acc = aa2.id_descendent
			  inner join t_account_type at on at.id_type = a.id_type
			  where
			  at.b_IsCorporate = '1'
				and
				aa2.vt_start <= dateadd(s, 1, aa.vt_end)
			--	and
			--	aa2.vt_end > aa.vt_end	
			)
		)
    begin
    declare @accStart datetime, @accEnd datetime

    select @accStart = vt_start, @accEnd = vt_end from t_account_ancestor
    where id_descendent = @p_CorporateAccount and num_generations = 0 -- Clustered Index

    if (@p_startdate < @accStart)
      begin
        -- MT_GROUP_SUB_STARTS_BEFORE_ACCOUNT
        select @p_status = -486604710
        return
      end
    if (@p_enddate > @accEnd)
      begin
        -- MT_GROUP_SUB_ENDS_AFTER_ACCOUNT
        select @p_status = -486604709
        return
      end
    -- MT_GROUP_SUB_CORPORATE_ACCOUNT_INVALID
    select @p_status = -486604786
    return
    end
end
 -- make sure start date is before end date
	-- MT_GROUPSUB_STARTDATE_AFTER_ENDDATE
if (@p_enddate is not null )
	begin
	if (@p_startdate > @p_enddate)
		begin
		select @p_status = -486604782
		return
		end
	end
	-- verify that the group subscription name does not conflict with an existing
	-- group subscription
	--  MT_GROUP_SUB_NAME_EXISTS -486604784
begin
	select @p_status = 0
	select @p_status = id_group  from t_group_sub where lower(@p_name) = lower(tx_name) AND
	(@p_existingID <> id_group OR @p_existingID is NULL)
	if (@p_status <> 0) begin
		select @p_status = -486604784
		return
	end
	if (@p_status is null) begin
		select @p_status = 0
		end
end
-- verify that the usage cycle type matched that of the 
-- product offering
select @constrainedcycletype = dbo.poconstrainedcycletype(@p_id_po),
		@groupsubCycleType = id_cycle_type
from
t_usage_cycle
where id_usage_cycle = @p_id_usage_cycle
if @constrainedcycletype > 0 AND
	@constrainedcycletype <> @groupsubCycleType begin
-- MT_GROUP_SUB_CYCLE_TYPE_MISMATCH
	select @p_status = -486604762
return
end
 -- check that the discount account has in its ancestory tree 
	-- the corporate account
-- BP: Only return MT_DISCOUNT_ACCOUNT_MUST_BE_IN_CORPORATE_HIERARCHY error if
-- a business rule that prohibits cross-corporation operations is enforced.
-- Otherwise we create all group subscriptions as global (id_corp = 1)
-- Another way to do this would be to ignore below check if corporation id
-- is 1. However this would introduce some complications during pc import/export and upgrades
if (@p_enforce_same_corporation = '1' AND @p_discountaccount is not NULL)
	begin
		select @p_status = max(id_ancestor)
		from t_account_ancestor
		where id_descendent = @p_discountaccount
		and id_ancestor = @p_CorporateAccount
	if (@p_status is NULL)
		begin
		-- MT_DISCOUNT_ACCOUNT_MUST_BE_IN_CORPORATE_HIERARCHY
		select @p_status = -486604760
		return
		end
	end

	-- make sure the start date is after the start date of the corporate account
	-- BP: Only return MT_CANNOT_CREATE_GROUPSUB_BEFORE_CORPORATE_START_DATE error if
	-- a business rule that prohibits cross-corporation operations is enforced.
	-- Otherwise we create all group subscriptions as global (id_corp = 1)
	-- Another way to do this would be to ignore below check if corporation id
	-- is 1. However this would introduce some complications during pc import/export and upgrades
	if (@p_enforce_same_corporation = '1')
	begin
		select @corporatestartdate = dbo.mtstartofday(dt_crt) from t_account where id_acc = @p_CorporateAccount
		if @corporatestartdate > @p_startdate begin
			-- MT_CANNOT_CREATE_GROUPSUB_BEFORE_CORPORATE_START_DATE
			select @p_status = -486604747
			return
		end
	end

-- done
select @p_status = 1
end
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[AddCounterParam]'
GO
ALTER proc [dbo].[AddCounterParam]
                  @id_lang_code int,
									@id_counter int,
									@id_counter_param_type int,
									@nm_counter_Value nvarchar(255),
                  @nm_name nvarchar(255),
                  @nm_desc nvarchar(255),
                  @nm_display_name nvarchar(255),
									@identity int OUTPUT
			AS
			DECLARE @identity_value int
			DECLARE @id_display_name int
			DECLARE @id_display_desc int
			BEGIN TRAN
				exec InsertBaseProps @id_lang_code, 190, 'N', 'N', @nm_name, @nm_desc, @nm_display_name, @identity_value output, @id_display_name output, @id_display_desc output
				INSERT INTO t_counter_params
					(id_counter_param, id_counter, id_counter_param_meta, Value)
				VALUES
					(@identity_value, @id_counter, @id_counter_param_type, @nm_counter_value)
				SELECT
					@identity = @identity_value
			COMMIT TRAN
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[AddCounterParamType]'
GO
ALTER PROC [dbo].[AddCounterParamType]
									@id_lang_code int,
									@n_kind int,
									@nm_name nvarchar(255),
									@id_counter_type int,
									@nm_param_type varchar(255),
									@nm_param_dbtype varchar(255),
									@id_prop int OUTPUT
			      AS
			      DECLARE @identity_value int
				  DECLARE @id_display_name int
				  DECLARE @id_display_desc int
			      BEGIN TRAN
			      exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, NULL, NULL, @identity_value output, @id_display_name output, @id_display_desc output
			      INSERT INTO t_counter_params_metadata
					              (id_prop, id_counter_meta, ParamType, DBType)
				    VALUES
					              (@identity_value, @id_counter_type, @nm_param_type, @nm_param_dbtype)
            select @id_prop = @identity_value
      			COMMIT TRAN
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[t_vw_base_props]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_base_props]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[AddCounterType]'
GO
ALTER proc [dbo].[AddCounterType]
					  		  @id_lang_code int,
									@n_kind int,
									@nm_name nvarchar(255),
									@nm_desc nvarchar(255),
									@nm_formula_template varchar(1000),
									@valid_for_dist char(1),
									@id_prop int OUTPUT
			AS
			begin
			declare @t_count int
			declare @temp_nm_name nvarchar(255)
			declare @temp_id_lang_code int
			declare @identity_value int
			declare @t_base_props_count int
			declare @id_display_name int
			declare @id_display_desc int
				  
			select @id_prop = -1
      select @temp_nm_name = @nm_name
			select @temp_id_lang_code = @id_lang_code

      SELECT @t_base_props_count = COUNT(*) FROM T_BASE_PROPS
      WHERE T_BASE_PROPS.nm_name = @nm_name
			SELECT @t_count = COUNT(*) FROM t_vw_base_props
				WHERE t_vw_base_props.nm_name = @temp_nm_name and t_vw_base_props.id_lang_code = @temp_id_lang_code
      IF (@t_base_props_count <> 0)
				begin
 				select @id_prop = -1
				end

			IF (@t_count = 0)
			  begin
				exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, @nm_desc, null, @identity_value OUTPUT, @id_display_name OUTPUT, @id_display_desc OUTPUT
		    INSERT INTO t_counter_metadata (id_prop, FormulaTemplate, b_valid_for_dist) values (@identity_value,
				    @nm_formula_template, @valid_for_dist)
				select @id_prop = @identity_value
			  end
       end
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CreateCounterPropDef]'
GO
ALTER PROC [dbo].[CreateCounterPropDef]
											@id_lang_code int,
											@n_kind int,
											@nm_name nvarchar(255),
											@nm_display_name nvarchar(255),
											@id_pi int,
											@nm_servicedefprop nvarchar(255),
											@nm_preferredcountertype nvarchar(255),
											@n_order int,
											@id_prop int OUTPUT
					AS
					DECLARE @identity_value int
					DECLARE @id_locale int
					DECLARE @id_display_name int
					DECLARE @id_display_desc int
					BEGIN TRAN
						exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, NULL, @nm_display_name, @identity_value output, @id_display_name output, @id_display_desc output
						INSERT INTO t_counterpropdef
							(id_prop, id_pi, nm_servicedefprop, n_order, nm_preferredcountertype)
						VALUES
							(@identity_value, @id_pi, @nm_servicedefprop, @n_order, @nm_preferredcountertype)
						SELECT
						@id_prop = @identity_value
					COMMIT TRAN
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[UpdateBaseProps]'
GO
ALTER procedure [dbo].[UpdateBaseProps](
			@a_id_prop int,
			@a_id_lang int,
			@a_nm_name NVARCHAR(255),
			@a_nm_desc NVARCHAR(4000),
			@a_nm_display_name NVARCHAR(255),
			@updated_id_display_name int OUTPUT,
			@updated_id_display_desc int OUTPUT )
		AS
		begin
      declare @old_id_name int
      declare @id_name int
      declare @old_id_desc int
      declare @old_id_display_name int
			select @old_id_name = n_name, @old_id_desc = n_desc,
			@old_id_display_name = n_display_name
     	from t_base_props where id_prop = @a_id_prop
			exec UpsertDescription @a_id_lang, @a_nm_name, @old_id_name, @id_name output
			exec UpsertDescription @a_id_lang, @a_nm_desc, @old_id_desc, @updated_id_display_desc output
			exec UpsertDescription @a_id_lang, @a_nm_display_name, @old_id_display_name, @updated_id_display_name output
			UPDATE t_base_props
				SET n_name = @id_name, n_desc = @updated_id_display_desc, n_display_name = @updated_id_display_name,
						nm_name = @a_nm_name, nm_desc = @a_nm_desc, nm_display_name = @a_nm_display_name
				WHERE id_prop = @a_id_prop
		END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[SubscribeBatchGroupSub]'
GO
ALTER PROC [dbo].[SubscribeBatchGroupSub] @tmp_subscribe_batch nvarchar(64), @tmp_account_state_rules nvarchar(64), @corp_business_rule_enforced int, @dt_now datetime, @allow_acc_po_curr_mismatch int = 0, @allow_multiple_pi_sub_rcnrc int = 0
AS
declare @stmt nvarchar(1024)
create table #tmp_subscribe_batch_sproc
(
      id_acc int NOT NULL,
      id_po int NOT NULL,
      id_group int NOT NULL,
      vt_start datetime NOT NULL,
      vt_end datetime NULL,
      uncorrected_vt_start datetime NOT NULL,
      uncorrected_vt_end datetime NULL,
      tt_now datetime NOT NULL,
      id_gsub_corp_account int NOT NULL,
      status int NOT NULL,

      -- audit info
      id_audit int NOT NULL,
      id_event int NOT NULL,
      id_userid int NOT NULL,
      id_entitytype int NOT NULL,

      -- Values set by the SQL execution.
      id_sub int NULL,
      nm_display_name nvarchar(255) NULL
)

CREATE CLUSTERED INDEX idx_acc_group_sub ON #tmp_subscribe_batch_sproc(id_acc, id_group)


create table #tmp_account_state_rules_sproc(state char(2), can_subscribe int)
CREATE CLUSTERED INDEX idx_state ON  #tmp_account_state_rules_sproc(state)

-- move data from temporary table whose name is passed in and the temp tables at sproc scope
set @stmt = 'INSERT INTO #tmp_subscribe_batch_sproc SELECT * FROM ' + @tmp_subscribe_batch
exec sp_executesql @stmt
set @stmt = 'INSERT INTO #tmp_account_state_rules_sproc SELECT * FROM ' + @tmp_account_state_rules
exec sp_executesql @stmt


-- If the vt_end is null then use subscription end date
UPDATE #tmp_subscribe_batch_sproc
SET
#tmp_subscribe_batch_sproc.vt_end=dbo.MTMaxDate(),
#tmp_subscribe_batch_sproc.uncorrected_vt_end=dbo.MTMaxDate()
WHERE
#tmp_subscribe_batch_sproc.vt_end is null

-- First clip the start and end date with the effective date on the subscription
-- and validate that the intersection of the effective date on the sub and the
-- delete interval is non-empty.
UPDATE #tmp_subscribe_batch_sproc
SET
#tmp_subscribe_batch_sproc.vt_start = dbo.MTMaxOfTwoDates(ub.vt_start, s.vt_start),
#tmp_subscribe_batch_sproc.vt_end = dbo.MTMinOfTwoDates(ub.vt_end, s.vt_end),
#tmp_subscribe_batch_sproc.status = case when ub.vt_start < s.vt_end and ub.vt_end > s.vt_start then 0 else -486604712  end,
#tmp_subscribe_batch_sproc.id_sub = s.id_sub,
#tmp_subscribe_batch_sproc.id_po = s.id_po
from
#tmp_subscribe_batch_sproc ub
inner join t_sub s on s.id_group = ub.id_group

-- Next piece of data massaging is to clip the start date of the request
-- with the creation date of the account (provided the account was created 
-- before the end date of the subscription request).
UPDATE #tmp_subscribe_batch_sproc
SET
#tmp_subscribe_batch_sproc.vt_start = dbo.MTMaxOfTwoDates(ub.vt_start, acc.dt_crt)
FROM
#tmp_subscribe_batch_sproc ub
INNER JOIN t_account acc on ub.id_acc=acc.id_acc AND acc.dt_crt <= ub.vt_end

-- CR 13298: Eliminate duplicates
-- MTPCUSER_DUPLICATE_ITEMS_IN_BATCH -289472432
update args
set status = -289472432 FROM
#tmp_subscribe_batch_sproc args
inner join
(
SELECT id_acc, id_group
FROM
#tmp_subscribe_batch_sproc
GROUP BY id_acc, id_group
HAVING count(1) > 1
) args1 on args.id_acc = args1.id_acc AND args.id_group = args1.id_group
WHERE args.status =0

--Check that all potential group subscription members have the same currency on their profiles
--as the product offering.
--TODO: t_po table does not have an index on id_nonshared_pl.
-- if below query affects performance, create it later.
--If Allow Account PO Currency Mismatch Business Rule is enabled then skip the following update 

IF @allow_acc_po_curr_mismatch <> 1
BEGIN

UPDATE #tmp_subscribe_batch_sproc
-- MT_ACCOUNT_PO_CURRENCY_MISMATCH
SET
#tmp_subscribe_batch_sproc.status = -486604729
FROM
#tmp_subscribe_batch_sproc ub
WHERE EXISTS
(
	SELECT 1 FROM
	t_payment_redirection pr
	inner join t_av_internal tav ON tav.id_acc = pr.id_payer
	inner join t_po po ON ub.id_po = po.id_po
	inner join t_pricelist pl1 on pl1.id_pricelist = po.id_nonshared_pl
	where
	(pr.vt_start <= ub.vt_end AND pr.vt_end >= ub.vt_start)
	AND pr.id_payee = ub.id_acc
	AND tav.c_Currency <> pl1.nm_currency_code
) -- EXISTS
AND ub.status=0
END

UPDATE #tmp_subscribe_batch_sproc
-- Error out if the account doesn't exist until after the end date of the 
-- subscription request.  I don't want to create a new error message for
-- this corner case (porting back to 3.0 for BT); so borrow account state
-- message.
-- MT_ADD_TO_GROUP_SUB_BAD_STATE
SET
#tmp_subscribe_batch_sproc.status = -486604774
FROM
#tmp_subscribe_batch_sproc ub
INNER JOIN t_account acc on ub.id_acc=acc.id_acc AND acc.dt_crt > ub.vt_end
WHERE
ub.status=0

UPDATE #tmp_subscribe_batch_sproc
-- Check to see if the account is in a state in which we can
-- subscribe it.
-- TODO: This is the business rule as implemented in 3.5 and 3.0 (check only
-- the account state in effect at the wall clock time that the subscription is made).
-- What would be better is to ensure that there is no overlap between
-- the valid time interval of any "invalid" account state and the subscription
-- interval.  
-- MT_ADD_TO_GROUP_SUB_BAD_STATE
SET
#tmp_subscribe_batch_sproc.status = -486604774
FROM
#tmp_subscribe_batch_sproc ar
INNER JOIN t_account_state ast ON ar.id_acc=ast.id_acc AND ast.vt_start <= ar.tt_now AND ast.vt_end >= ar.tt_now
INNER JOIN #tmp_account_state_rules_sproc asr ON ast.status=asr.state
WHERE
asr.can_subscribe=0
AND
ar.status=0

-- Check that we're not already in the group sub with overlapping date
-- MT_ACCOUNT_ALREADY_IN_GROUP_SUBSCRIPTION
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -486604790
from
#tmp_subscribe_batch_sproc ar
inner join t_gsubmember s on s.id_acc=ar.id_acc and s.id_group=ar.id_group and s.vt_start <= ar.vt_end and ar.vt_start <= s.vt_end
where
ar.status = 0

-- Check for different subscription to the same PO by the same account with overlapping date
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -289472485
from
#tmp_subscribe_batch_sproc ar
where
exists (
 -- Check for conflicting individual sub
 select * from t_sub s
 where
 s.id_po=ar.id_po and s.id_acc=ar.id_acc and s.id_sub<>ar.id_sub and s.vt_start <= ar.vt_end and ar.vt_start <= s.vt_end
 and
 s.id_group is null
)
or
exists (
 -- Check for conflicting group sub
 select * from t_gsubmember gs
 inner join t_sub s on gs.id_group = s.id_group
 where
 gs.id_acc=ar.id_acc and s.id_po=ar.id_po and s.id_sub<>ar.id_sub and gs.vt_start <= ar.vt_end and ar.vt_start <= gs.vt_end
)
and
ar.status = 0

-- Check to make sure that effective date of PO intersects the corrected interval
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -289472472
from
#tmp_subscribe_batch_sproc ar
inner join t_po p on ar.id_po=p.id_po
inner join t_effectivedate ed on ed.id_eff_date=p.id_eff_date
where
(ed.dt_start > ar.vt_start or ed.dt_end < ar.vt_end)
and
ar.status = 0

-- Check to see if there is another PO with the same PI template for which an overlapping subscription exists.
-- Only do this if other business rules have passed.
IF (@allow_multiple_pi_sub_rcnrc <> 1)
	BEGIN
	update #tmp_subscribe_batch_sproc
	set #tmp_subscribe_batch_sproc.status = -289472484
	where
	exists (
	select *
	from
 	t_pl_map plm1
	inner join t_vw_effective_subs s2 on s2.id_acc=#tmp_subscribe_batch_sproc.id_acc and s2.id_po<>#tmp_subscribe_batch_sproc.id_po and s2.dt_start < #tmp_subscribe_batch_sproc.vt_end and #tmp_subscribe_batch_sproc.vt_start < s2.dt_end
	inner join t_pl_map plm2 on s2.id_po=plm2.id_po and plm1.id_pi_template = plm2.id_pi_template
	where
	#tmp_subscribe_batch_sproc.id_po=plm1.id_po
	and
	plm1.id_paramtable is null
	and
	plm2.id_paramtable is null
)
and
#tmp_subscribe_batch_sproc.status = 0
	END
ELSE /*Fix for CORE-5849*/
	BEGIN
	update #tmp_subscribe_batch_sproc
	set #tmp_subscribe_batch_sproc.status = -289472484
	where
	exists (
	select *
	from
 	t_pl_map plm1
	inner join t_vw_effective_subs s2 on s2.id_acc=#tmp_subscribe_batch_sproc.id_acc and s2.id_po<>#tmp_subscribe_batch_sproc.id_po and s2.dt_start < #tmp_subscribe_batch_sproc.vt_end and #tmp_subscribe_batch_sproc.vt_start < s2.dt_end
	inner join t_pl_map plm2 on s2.id_po=plm2.id_po and plm1.id_pi_template = plm2.id_pi_template AND plm2.id_pi_type NOT IN
	(SELECT id_pi FROM t_pi WHERE nm_servicedef IN ('metratech.com/udrecurringcharge','metratech.com/nonrecurringcharge','metratech.com/flatrecurringcharge'))
	where
	#tmp_subscribe_batch_sproc.id_po=plm1.id_po
	and
	plm1.id_paramtable is null
	and
	plm2.id_paramtable is null
)
and
#tmp_subscribe_batch_sproc.status = 0
END

-- MT_GSUB_DATERANGE_NOT_IN_SUB_RANGE
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -486604789
from
#tmp_subscribe_batch_sproc ar
inner join t_sub s on s.id_group=ar.id_group
where
(ar.vt_start < s.vt_start or ar.vt_end > s.vt_end)
and
ar.status = 0

-- Check that the group subscription exists
-- MT_GROUP_SUBSCRIPTION_DOES_NOT_EXIST
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -486604788
from
#tmp_subscribe_batch_sproc ar
where
not exists (
	select *
	from t_group_sub
	where
	t_group_sub.id_group=ar.id_group
)
and
ar.status = 0

-- If corp account business rule is enforced, check that
-- all potential gsub members are located in the same corporate hierarchy
-- as group subscription
--bug fix 13689 corporate account need not be under root.
-- MT_ACCOUNT_NOT_IN_GSUB_CORPORATE_ACCOUNT
IF @corp_business_rule_enforced = 1
BEGIN
	update #tmp_subscribe_batch_sproc
	set #tmp_subscribe_batch_sproc.status = -486604769
	from
	#tmp_subscribe_batch_sproc ar
	inner join t_group_sub gs on ar.id_group=gs.id_group
	inner join t_account_ancestor aa on aa.id_descendent=ar.id_acc and aa.vt_start <= ar.tt_now and ar.tt_now <= aa.vt_end
	inner join t_account acc on aa.id_ancestor = acc.id_acc
	inner join t_account_type atype on atype.id_type = acc.id_type
	where
	atype.b_isCorporate = '1' and
	aa.num_generations = 0 and
	aa.id_ancestor <> gs.id_corporate_account and
	ar.status = 0
END

-- MT_GROUP_SUB_MEMBER_CYCLE_MISMATCH
-- Check for billing cycle relative 
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -486604730
from
#tmp_subscribe_batch_sproc ar
inner join t_sub s on ar.id_group=s.id_group
inner join t_group_sub gs on ar.id_group=gs.id_group
where
s.vt_end >= ar.tt_now
and
(
	-- Only consider this business rule when the target PO
	-- has a billing cycle relative instance
	exists (
		select *
		from
		t_pl_map plm
		inner join t_discount piinst on piinst.id_prop=plm.id_pi_instance
		where
		plm.id_po=s.id_po
		and
		plm.id_paramtable is null
		and
		piinst.id_usage_cycle is null
	)
	or
	exists (
		select *
		from
		t_pl_map plm
		inner join t_recur piinst on piinst.id_prop=plm.id_pi_instance
		where
		plm.id_po=s.id_po
		and
		plm.id_paramtable is null
		and
		piinst.tx_cycle_mode IN ('BCR', 'BCR Constrained')
	)
	or
	exists (
		select *
		from
		t_pl_map plm
		inner join t_aggregate piinst on piinst.id_prop=plm.id_pi_instance
		where
		plm.id_po=s.id_po
		and
		plm.id_paramtable is null
		and
		piinst.id_usage_cycle is null
	)
)
and
exists (
	-- All payers must have the same cycle as the cycle as the group sub itself
	select *
	from
	t_payment_redirection pr
	inner join t_acc_usage_cycle auc on auc.id_acc=pr.id_payer
	where
	pr.id_payee=ar.id_acc
	and
	pr.vt_start <= s.vt_end
	and
	s.vt_start <= pr.vt_end
	and
	auc.id_usage_cycle <> gs.id_usage_cycle
)
and
ar.status = 0

--
-- EBCR membership business rules
--

DECLARE @ebcrResults TABLE
(
  id_acc INT, -- member account (payee)
  id_usage_cycle INT, -- payer's cycle
  b_compatible INT -- EBCR compatibility: 1 or 0
)

-- fills the results table with a row for each member/payer combination
INSERT INTO @ebcrResults
SELECT
  batch.id_acc,
  payercycle.id_usage_cycle,
  dbo.CheckEBCRCycleTypeCompatibility(payercycle.id_cycle_type, rc.id_cycle_type)
FROM #tmp_subscribe_batch_sproc batch
INNER JOIN t_group_sub gs ON gs.id_group = batch.id_group
INNER JOIN t_sub sub ON sub.id_group = gs.id_group
INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po
INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance
INNER JOIN t_payment_redirection pay ON
  pay.id_payee = batch.id_acc AND
  -- checks all payer's who overlap with the group sub
  pay.vt_end >= sub.vt_start AND
  pay.vt_start <= sub.vt_end
INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = pay.id_payer
INNER JOIN t_usage_cycle payercycle ON payercycle.id_usage_cycle = auc.id_usage_cycle
WHERE
  rc.tx_cycle_mode = 'EBCR' AND
  rc.b_charge_per_participant = 'Y' AND
  plmap.id_paramtable IS NULL AND
  -- TODO: it would be better if we didn't consider subscriptions that ended
  --       in a hard closed interval so that retroactive changes would be properly guarded.
  -- only consider current or future group subs
  -- don't worry about group subs in the past
  ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR
   (sub.vt_start > @dt_now)) AND
  batch.status = 0

-- checks that members' payers are compatible with the EBCR cycle type
UPDATE #tmp_subscribe_batch_sproc
SET status = -289472443 -- MTPCUSER_EBCR_CYCLE_CONFLICTS_WITH_PAYER_OF_MEMBER
FROM #tmp_subscribe_batch_sproc batch
INNER JOIN @ebcrResults res ON res.id_acc = batch.id_acc
WHERE res.b_compatible = 0

-- checks that each member has only one billing cycle across all payers
UPDATE #tmp_subscribe_batch_sproc
SET status = -289472442 -- MTPCUSER_EBCR_MEMBERS_CONFLICT_WITH_EACH_OTHER
FROM #tmp_subscribe_batch_sproc batch
INNER JOIN @ebcrResults res ON res.id_acc = batch.id_acc
INNER JOIN @ebcrResults res2 ON res2.id_acc = res.id_acc AND
                                res2.b_compatible = res.b_compatible AND
                                res2.id_usage_cycle <> res.id_usage_cycle
WHERE
  res.b_compatible = 1 AND
  batch.status = 0
  

-- check that account type of each member is compatible with the product offering
-- since the absense of ANY mappings for the product offering means that PO is "wide open"
-- we need to do 2 EXISTS queries.

UPDATE #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -289472435 -- MTPCUSER_CONFLICTING_PO_ACCOUNT_TYPE
from
#tmp_subscribe_batch_sproc ar
where
(
exists (

SELECT 1
FROM t_po_account_type_map atmap
WHERE atmap.id_po = ar.id_po

)

--PO is not wide open - see if susbcription is permitted for the account type

AND
not exists (

SELECT 1
FROM t_account tacc
INNER JOIN t_po_account_type_map atmap ON atmap.id_account_type = tacc.id_type
WHERE atmap.id_po = ar.id_po AND ar.id_acc = tacc.id_acc

)
)

AND status = 0

-- Check MTPCUSER_ACCOUNT_TYPE_CANNOT_PARTICIPATE_IN_GSUB 0xEEBF004FL -289472433
update #tmp_subscribe_batch_sproc
set #tmp_subscribe_batch_sproc.status = -289472433
from
#tmp_subscribe_batch_sproc ar
inner join t_account acc ON ar.id_acc = acc.id_acc
inner join t_account_type acctype on acc.id_type = acctype.id_type
where
acctype.b_CanParticipateInGSub = '0' AND status = 0



-- This is a sequenced insert.  For sequenced updates/upsert, run the delete (unsubscribe) first.
INSERT INTO t_gsubmember_historical (id_group, id_acc, vt_start, vt_end, tt_start, tt_end)
SELECT ar.id_group, ar.id_acc, ar.vt_start, ar.vt_end, ar.tt_now, dbo.MTMaxDate()
FROM
#tmp_subscribe_batch_sproc ar
WHERE
ar.status=0;
INSERT INTO t_gsubmember (id_group, id_acc, vt_start, vt_end)
SELECT ar.id_group, ar.id_acc, ar.vt_start, ar.vt_end
FROM
#tmp_subscribe_batch_sproc ar
WHERE
ar.status=0;

-- Coalecse to merge abutting records
-- Implement coalescing to merge any gsubmember records to the
-- same subscription that are adjacent.  Still need to work on
-- what a bitemporal coalesce looks like.
WHILE 1=1
BEGIN
update t_gsubmember
set t_gsubmember.vt_end = (
	select max(aa2.vt_end)
	from
	t_gsubmember as aa2
	where
	t_gsubmember.id_group=aa2.id_group
	and
	t_gsubmember.id_acc=aa2.id_acc
	and
	t_gsubmember.vt_start < aa2.vt_start
	and
	dateadd(s,1,t_gsubmember.vt_end) >= aa2.vt_start
	and
	t_gsubmember.vt_end < aa2.vt_end
)
where
exists (
	select *
	from
	t_gsubmember as aa2
	where
	t_gsubmember.id_group=aa2.id_group
	and
	t_gsubmember.id_acc=aa2.id_acc
	and
	t_gsubmember.vt_start < aa2.vt_start
	and
	dateadd(s,1,t_gsubmember.vt_end) >= aa2.vt_start
	and
	t_gsubmember.vt_end < aa2.vt_end
)
and
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = t_gsubmember.id_group and ar.id_acc = t_gsubmember.id_acc
)

IF @@rowcount <= 0 BREAK
END

delete
from t_gsubmember
where
exists (
	select *
	from t_gsubmember aa2
	where
	t_gsubmember.id_group=aa2.id_group
	and
	t_gsubmember.id_acc=aa2.id_acc
	and
 	(
	(aa2.vt_start < t_gsubmember.vt_start and t_gsubmember.vt_end <= aa2.vt_end)
	or
	(aa2.vt_start <= t_gsubmember.vt_start and t_gsubmember.vt_end < aa2.vt_end)
	)
)
and
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = t_gsubmember.id_group and ar.id_acc = t_gsubmember.id_acc
)

if object_id( 'tempdb..#coalesce_args' ) is not null
  DROP TABLE #coalesce_args

CREATE TABLE #coalesce_args(id_acc int, id_group int, vt_start datetime, vt_end datetime, tt_start datetime, tt_end datetime, update_tt_start datetime, update_tt_end datetime, update_vt_end datetime)

CREATE CLUSTERED INDEX idx_acc_group ON #coalesce_args(id_acc, id_group)

-- Here is another approach.
-- Select a record that can be extended in valid time direction.
-- Issue an update statement to extend the vt_end and to set the
-- [tt_start, tt_end] to be the intersection of the original records
-- transaction time interval and the transaction time interval of the
-- extender.
-- Issue an insert statement to create 0,1 or 2 records that have the
-- same valid time interval as the original record but that have a new
-- tt_end or tt_start in the case that their associated tt_start or tt_end
-- extends beyond that of the extending record.
--
--  --------
--  |      |
--  |      |
--  |   ---------
--  |   |  |    |
--  |   |  |    |
--  |   |  |    |
--  --------    |
--      |       | 
--      |       |  
--      ---------
WHILE 1=1
BEGIN
insert into #coalesce_args(id_group, id_acc, vt_start, vt_end, tt_start, tt_end, update_tt_start, update_tt_end, update_vt_end)
select
gsm.id_group,
gsm.id_acc,
gsm.vt_start,
gsm.vt_end,
gsm.tt_start,
gsm.tt_end,
dbo.MTMaxOfTwoDates(gsm.tt_start, gsm2.tt_start) as update_tt_start,
dbo.MTMinOfTwoDates(gsm.tt_end, gsm2.tt_end) as update_tt_end,
max(gsm2.vt_end) as update_vt_end
from
t_gsubmember_historical gsm
inner join t_gsubmember_historical gsm2 on
gsm.id_group=gsm2.id_group
and
gsm.id_acc=gsm2.id_acc
and
gsm.vt_start < gsm2.vt_start
and
gsm2.vt_start <= dateadd(s, 1, gsm.vt_end)
and
gsm.vt_end < gsm2.vt_end
and
gsm.tt_start <= gsm2.tt_end
and
gsm2.tt_start <= gsm.tt_end
where
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = gsm.id_group and ar.id_acc = gsm.id_acc
)
group by
gsm.id_group,
gsm.id_acc,
gsm.vt_start,
gsm.vt_end,
gsm.tt_start,
gsm.tt_end,
dbo.MTMaxOfTwoDates(gsm.tt_start, gsm2.tt_start),
dbo.MTMinOfTwoDates(gsm.tt_end, gsm2.tt_end)

IF @@rowcount <= 0 BREAK

-- These are the records whose extender transaction time ends strictly within the record being
-- extended
insert into t_gsubmember_historical(id_group, id_acc, vt_start, vt_end, tt_start, tt_end)
select
gsm.id_group, gsm.id_acc, gsm.vt_start, gsm.vt_end, dateadd(s, 1, gsm2.vt_end) as tt_start, gsm.tt_end
from
t_gsubmember_historical gsm
inner join t_gsubmember_historical gsm2 on
gsm.id_group=gsm2.id_group
and
gsm.id_acc=gsm2.id_acc
and
gsm.vt_start < gsm2.vt_start
and
gsm2.vt_start <= dateadd(s, 1, gsm.vt_end)
and
gsm.vt_end < gsm2.vt_end
and
gsm.tt_start <= gsm2.tt_end
and
gsm2.tt_end < gsm.tt_end
where
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = gsm.id_group and ar.id_acc = gsm.id_acc
)

-- These are the records whose extender starts strictly within the record being
-- extended
insert into t_gsubmember_historical(id_group, id_acc, vt_start, vt_end, tt_start, tt_end)
select
gsm.id_group, gsm.id_acc, gsm.vt_start, gsm.vt_end, gsm.tt_start, dateadd(s, -1, gsm2.tt_start) as tt_end
from
t_gsubmember_historical gsm
inner join t_gsubmember_historical gsm2 on
gsm.id_group=gsm2.id_group
and
gsm.id_acc=gsm2.id_acc
and
gsm.vt_start < gsm2.vt_start
and
gsm2.vt_start <= dateadd(s, 1, gsm.vt_end)
and
gsm.vt_end < gsm2.vt_end
and
gsm.tt_start < gsm2.tt_start
and
gsm2.tt_start <= gsm.tt_end
where
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = gsm.id_group and ar.id_acc = gsm.id_acc
)

update  t_gsubmember_historical
set t_gsubmember_historical.vt_end = ca.update_vt_end,
t_gsubmember_historical.tt_start = ca.update_tt_start,
t_gsubmember_historical.tt_end = ca.update_tt_end
from
t_gsubmember_historical gsm
inner join #coalesce_args ca on
gsm.id_group=ca.id_group
and
gsm.id_acc=ca.id_acc
and
gsm.vt_start=ca.vt_start
and
gsm.vt_end=ca.vt_end
and
gsm.tt_start=ca.tt_start
and
gsm.tt_end=ca.tt_end

TRUNCATE TABLE #coalesce_args
END

-- Don't need #coalesce_args table anymore, delete it here.  There are some goofy
-- interactions between temp tables and DTC that we want to avoid.
DROP TABLE #coalesce_args

-- Here we select stuff to "delete"
-- In all cases we have containment invalid time.
-- Consider the four overlapping cases for transaction time.
-- 
update t_gsubmember_historical
set
t_gsubmember_historical.tt_start = (
	select dateadd(s, 1, max(tt_end))
	from
	t_gsubmember_historical gsm
	where
	t_gsubmember_historical.id_group=gsm.id_group
	and
	t_gsubmember_historical.id_acc=gsm.id_acc
	and
	gsm.vt_start <= t_gsubmember_historical.vt_start
	and
	t_gsubmember_historical.vt_end <= gsm.vt_end
	and
	gsm.tt_end >= t_gsubmember_historical.tt_start
	and
	gsm.tt_end < t_gsubmember_historical.tt_end
)
where
exists (
	select *
	from
	t_gsubmember_historical gsm
	where
	t_gsubmember_historical.id_group=gsm.id_group
	and
	t_gsubmember_historical.id_acc=gsm.id_acc
	and
	gsm.vt_start <= t_gsubmember_historical.vt_start
	and
	t_gsubmember_historical.vt_end <= gsm.vt_end
	and
	gsm.tt_end >= t_gsubmember_historical.tt_start
	and
	gsm.tt_end < t_gsubmember_historical.tt_end
)
and
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = t_gsubmember_historical.id_group and ar.id_acc = t_gsubmember_historical.id_acc
)

update t_gsubmember_historical
set
t_gsubmember_historical.tt_end = (
	select dateadd(s, -1, min(tt_start))
	from
	t_gsubmember_historical gsm
	where
	t_gsubmember_historical.id_group=gsm.id_group
	and
	t_gsubmember_historical.id_acc=gsm.id_acc
	and
	gsm.vt_start <= t_gsubmember_historical.vt_start
	and
	t_gsubmember_historical.vt_end <= gsm.vt_end
	and
	gsm.tt_start > t_gsubmember_historical.tt_start
	and
	gsm.tt_start <= t_gsubmember_historical.tt_end
)
where
exists (
	select *
	from
	t_gsubmember_historical gsm
	where
	t_gsubmember_historical.id_group=gsm.id_group
	and
	t_gsubmember_historical.id_acc=gsm.id_acc
	and
	gsm.vt_start <= t_gsubmember_historical.vt_start
	and
	t_gsubmember_historical.vt_end <= gsm.vt_end
	and
	gsm.tt_start > t_gsubmember_historical.tt_start
	and
	gsm.tt_start <= t_gsubmember_historical.tt_end
)
and
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = t_gsubmember_historical.id_group and ar.id_acc = t_gsubmember_historical.id_acc
)

delete gsm
--select *
from
t_gsubmember_historical gsm
inner join t_gsubmember_historical gsm2 on
gsm.id_group=gsm2.id_group
and
gsm.id_acc=gsm2.id_acc
and
(
(gsm2.vt_start < gsm.vt_start and gsm.vt_end <= gsm2.vt_end)
or
(gsm2.vt_start <= gsm.vt_start and gsm.vt_end < gsm2.vt_end)
)
and
gsm2.tt_start <= gsm.tt_start
and
gsm.tt_end <= gsm2.tt_end
where
exists (
  select * from #tmp_subscribe_batch_sproc ar
  where ar.id_group = gsm.id_group and ar.id_acc = gsm.id_acc
)

-- Update audit information.

UPDATE tmp
SET tmp.nm_display_name = gsub.tx_name
FROM #tmp_subscribe_batch_sproc tmp
  INNER JOIN t_group_sub gsub ON gsub.id_group = tmp.id_group
WHERE tmp.status = 0

INSERT INTO t_audit(id_audit,      id_event,  id_userid,
                    id_entitytype, id_entity, dt_crt)
SELECT tmp.id_audit,      tmp.id_event, tmp.id_userid,
       tmp.id_entitytype, tmp.id_acc,   tmp.tt_now
FROM #tmp_subscribe_batch_sproc tmp WITH(READCOMMITTED)
WHERE tmp.status = 0

INSERT INTO t_audit_details(id_audit, tx_details)
SELECT tmp.id_audit, tmp.nm_display_name
FROM #tmp_subscribe_batch_sproc tmp WITH(READCOMMITTED)
WHERE tmp.status = 0


-- move data from temp tables at sproc scope to input table
set @stmt = 'TRUNCATE TABLE ' + @tmp_subscribe_batch
exec sp_executesql @stmt
set @stmt = 'INSERT INTO ' + @tmp_subscribe_batch + ' SELECT * FROM #tmp_subscribe_batch_sproc '
exec sp_executesql @stmt
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[UpdateCounterInstance]'
GO
ALTER proc [dbo].[UpdateCounterInstance]
											@id_lang_code int,
                      @id_prop int,
											@counter_type_id int,
											@nm_name nvarchar(255),
											@nm_desc nvarchar(255)
					AS
					DECLARE @updated_id_display_name int
					DECLARE @updated_id_display_desc int
					BEGIN TRAN
            exec UpdateBaseProps @id_prop, @id_lang_code, NULL, @nm_desc, NULL, @updated_id_display_name OUTPUT, @updated_id_display_desc OUTPUT
						UPDATE
 							t_base_props
						SET
 							nm_name = @nm_name, nm_desc = @nm_desc
						WHERE
 							id_prop = @id_prop
 						UPDATE
 							t_counter
						SET
 							id_counter_type = @counter_type_id
						WHERE
 							id_prop = @id_prop
					COMMIT TRAN
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[T_VW_ACCTRES]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_ACCTRES]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[VW_AJ_INFO]'
GO
EXEC sp_refreshview N'[dbo].[VW_AJ_INFO]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vw_all_billing_groups_status]'
GO
EXEC sp_refreshview N'[dbo].[vw_all_billing_groups_status]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_approvals]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_approvals] ADD
[c_PartitionId] [int] NOT NULL CONSTRAINT [DF_t_approvals_c_PartitionId] DEFAULT ((1))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vw_audit_log]'
GO
EXEC sp_refreshview N'[dbo].[vw_audit_log]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vw_interval_billgroup_counts]'
GO
EXEC sp_refreshview N'[dbo].[vw_interval_billgroup_counts]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[UpdateCounterPropDef]'
GO
ALTER PROC [dbo].[UpdateCounterPropDef]
											@id_lang_code int,
											@id_prop int,
											@nm_name nvarchar(255),
											@nm_display_name nvarchar(255),
											@id_pi int,
											@nm_servicedefprop nvarchar(255),
											@nm_preferredcountertype nvarchar(255),
											@n_order int
					AS
						DECLARE @identity_value int
						DECLARE @id_locale int
						DECLARE @updated_id_display_name int
						DECLARE @updated_id_display_desc int
					BEGIN TRAN
						exec UpdateBaseProps @id_prop, @id_lang_code, @nm_name, NULL, @nm_display_name, @updated_id_display_name OUTPUT, @updated_id_display_desc OUTPUT
						UPDATE t_counterpropdef
						SET
							nm_servicedefprop = @nm_servicedefprop,
							n_order = @n_order,
							nm_preferredcountertype = @nm_preferredcountertype
						WHERE id_prop = @id_prop
					COMMIT TRAN
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[t_vw_expanded_sub]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_expanded_sub]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[t_vw_pilookup]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_pilookup]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[t_vw_rc_arrears_fixed]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_rc_arrears_fixed]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[t_vw_rc_arrears_relative]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_rc_arrears_relative]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[T_VW_ACCTRES_BYID]'
GO
EXEC sp_refreshview N'[dbo].[T_VW_ACCTRES_BYID]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[vw_bus_partition_accounts]'
GO
CREATE VIEW [dbo].[vw_bus_partition_accounts] (id_acc,
                                     id_partition,
                                     partition_name,
                                     partition_nm_space
                                    )
AS
  SELECT      aa.id_descendent id_acc,
              a.id_acc id_partition,
              am.nm_login partition_name,
              am.nm_space partition_namespace
  FROM        t_account a
        INNER JOIN t_account_type at ON a.id_type = at.id_type
        INNER JOIN t_account_ancestor aa ON a.id_acc = aa.id_ancestor and aa.vt_end = '2038-01-01 00:00:00.000'
        INNER JOIN t_account_mapper am on am.id_acc = a.id_acc
  WHERE  at.name = 'Partition'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[AddApproval]'
GO
ALTER PROCEDURE [dbo].[AddApproval]
  @SubmittedDate DATETIME,
  @SubmitterId INT,
  @ChangeType VARCHAR(100),
  @ChangeDetails VARBINARY(MAX),
  @ItemDisplayName VARCHAR(100) = '',
  @UniqueItemId VARCHAR(100),
  @Comment VARCHAR(255) = '',
  @CurrentState VARCHAR(50),
  @PartitionId INT = 1,
  @AllowMultiplePendingChangesForThisChangeType BIT,
  @IdApproval INT OUTPUT,
  @Status INT OUTPUT
AS

  SET NOCOUNT ON

  DECLARE @PendingChangeCount  INT,
          @SQLError            INT
  
  IF (@AllowMultiplePendingChangesForThisChangeType <> 1)
  BEGIN
      SELECT @PendingChangeCount = COUNT(*)
      FROM   t_approvals
      WHERE  c_changetype = @ChangeType
             AND c_UniqueItemId = @UniqueItemId
             AND c_CurrentState = 'Pending'
      
      IF (ISNULL(@PendingChangeCount, 0) <> 0)
      BEGIN
          SELECT @IdApproval = 0
          SELECT @Status = -1 /* Multiple pending changes are not allowed for this change type */
          RETURN
      END
  END

  BEGIN
    INSERT INTO t_approvals
      (
        c_SubmittedDate,
        c_SubmitterId,
        c_ChangeType,
        c_ChangeDetails,
        c_ApproverId,
        c_ChangeLastModifiedDate,
        c_ItemDisplayName,
        c_UniqueItemId,
        c_Comment,
        c_CurrentState,
        c_PartitionId
      )
    SELECT @SubmittedDate,
           @SubmitterId,
           @ChangeType,
           @ChangeDetails,
           NULL,
           NULL,
           @ItemDisplayName,
           @UniqueItemId,
           @Comment,
           @CurrentState,
           @PartitionId
  END

  SELECT @SQLError = @@ERROR
  IF @SQLError <> 0
  BEGIN
      SELECT @Status = -1
      RETURN -1
  END
  ELSE
  BEGIN
      SELECT @Status = 0
      SELECT @IdApproval = SCOPE_IDENTITY()
  END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_localized_items]'
GO
CREATE TABLE [dbo].[t_localized_items]
(
[id_local_type] [int] NOT NULL,
[id_item] [int] NOT NULL,
[id_item_second_key] [int] NOT NULL DEFAULT ((-1)),
[id_lang_code] [int] NOT NULL,
[tx_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tx_desc] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_t_localized_items] on [dbo].[t_localized_items]'
GO
ALTER TABLE [dbo].[t_localized_items] ADD CONSTRAINT [PK_t_localized_items] PRIMARY KEY CLUSTERED  ([id_local_type], [id_item], [id_item_second_key], [id_lang_code])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CanExecuteEvents]'
GO
ALTER PROCEDURE [dbo].[CanExecuteEvents](@dt_now DATETIME, @id_instances VARCHAR(4000), @lang_code INT = 840 )
AS

BEGIN
  BEGIN TRAN

  DECLARE @results TABLE
  (
    id_instance INT NOT NULL,
    tx_display_name nvarchar(255),
    tx_reason VARCHAR(80)
  )

  --
  -- initially all instances are considered okay
  -- a succession of queries attempt to find a problem with executing them
  --

  -- builds up a table from the comma separated list of instance IDs
  INSERT INTO @results
  SELECT
    args.value,
    COALESCE(loc.tx_name, evt.tx_display_name) tx_display_name,
    'OK'
  FROM CSVToInt(@id_instances) args
  INNER JOIN t_recevent_inst inst ON inst.id_instance = args.value
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  LEFT OUTER JOIN t_localized_items loc on (id_local_type = 1  /*Adapter type*/ AND id_lang_code = @lang_code AND evt.id_event=loc.id_item)

  -- is the event not active?
  UPDATE @results SET tx_reason = 'EventNotActive'
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE
    -- event is NOT active
    evt.dt_activated > @dt_now AND
    (evt.dt_deactivated IS NOT NULL OR @dt_now >= evt.dt_deactivated)

  -- is the instance in an invalid state?
  UPDATE @results SET tx_reason = inst.tx_status
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  WHERE
    inst.tx_status NOT IN ('NotYetRun', 'ReadyToRun')

  -- is the interval hard closed?
  UPDATE @results SET tx_reason = 'HardClosed'
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE
    ui.tx_interval_status = 'H'

  SELECT
    id_instance InstanceID,
    tx_display_name EventDisplayName,
    tx_reason Reason
  FROM @results

  COMMIT
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[VW_ADJUSTMENT_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_ADJUSTMENT_DETAILS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CanReverseEvents]'
GO
ALTER PROCEDURE [dbo].[CanReverseEvents](@dt_now DATETIME, @id_instances VARCHAR(4000), @lang_code INT = 840)
AS

BEGIN
  BEGIN TRAN

  DECLARE @results TABLE
  (
    id_instance INT NOT NULL,
    tx_display_name nvarchar(255),
    tx_reason VARCHAR(80)
  )

  --
  -- initially all instances are considered okay
  -- a succession of queries attempt to find a reason
  -- why an instance can not be reversed

  -- builds up a table from the comma separated list of instance IDs
  INSERT INTO @results
  SELECT
    args.value,
    COALESCE(loc.tx_name, evt.tx_display_name) tx_display_name,
    'OK'
  FROM CSVToInt(@id_instances) args
  INNER JOIN t_recevent_inst inst ON inst.id_instance = args.value
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  LEFT OUTER JOIN t_localized_items loc on (id_local_type = 1  /*Adapter type*/ AND id_lang_code = @lang_code AND evt.id_event=loc.id_item)

  -- is the event not active?
  UPDATE @results SET tx_reason = 'EventNotActive'
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE
    -- event is NOT active
    evt.dt_activated > @dt_now AND
    (evt.dt_deactivated IS NOT NULL OR @dt_now >= evt.dt_deactivated)

  -- is the event not reversible?
  UPDATE @results SET tx_reason = evt.tx_reverse_mode
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE
    -- event is NOT reversible
    evt.tx_reverse_mode = 'NotImplemented'

  -- is the instance in an invalid state?
  UPDATE @results SET tx_reason = inst.tx_status
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  WHERE
    inst.tx_status NOT IN ('ReadyToReverse', 'Succeeded', 'Failed')

  -- is the interval hard closed?
  UPDATE @results SET tx_reason = 'HardClosed'
  FROM @results results
  INNER JOIN t_recevent_inst inst ON inst.id_instance = results.id_instance
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE
    ui.tx_interval_status = 'H'

  SELECT
    id_instance InstanceID,
    tx_display_name EventDisplayName,
    tx_reason Reason
  FROM @results

  COMMIT
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[VW_NOTDELETED_ADJ_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_NOTDELETED_ADJ_DETAILS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[SubscriptionsByMonth]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[SubscriptionsByMonth] ADD
[ReportingCurrency] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[SubscriptionParticipants]'
GO
CREATE TABLE [dbo].[SubscriptionParticipants]
(
[InstanceId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductOfferingId] [int] NOT NULL,
[Year] [int] NOT NULL,
[Month] [int] NOT NULL,
[TotalParticipants] [int] NOT NULL,
[DistinctHierarchies] [int] NOT NULL,
[NewParticipants] [int] NOT NULL,
[UnsubscribedParticipants] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Customer]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Customer] ADD
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CreateAnalyticsDataMart]'
GO
ALTER PROCEDURE [dbo].[CreateAnalyticsDataMart] @p_dt_now datetime, @p_id_run int, @p_nm_currency nvarchar(3), @p_nm_instance nvarchar(128), @p_n_months int, @p_STAGINGDB_prefix varchar
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
TRUNCATE TABLE SubscriptionUnits;
TRUNCATE TABLE SubscriptionSummary;
TRUNCATE TABLE CurrencyExchangeMonthly;
TRUNCATE TABLE ProductOffering;
TRUNCATE TABLE SubscriptionParticipants;

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
IF OBJECT_ID('tempdb..#tmp_previous_two_months') IS NOT NULL drop table #tmp_previous_two_months;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating Customers DataMart');
end;

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
pav.c_phonenumber as HierarchyPhone,
c.dt_crt as StartDate,
case when state.status != 'AC' then state.vt_start else state.vt_end end as EndDate
into #tmp_all_customers
from #tmp_accs r with(nolock)
inner join t_account c with(nolock) on c.id_acc = r.id_descendent
inner join t_account_state state with(nolock) on state.id_acc = c.id_acc
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
		HierarchyPhone,
		StartDate,
		EndDate)
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
		HierarchyPhone,
		StartDate,
		EndDate
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
case when pv.c_prorateddays = 0 then au.amount else au.amount/pv.c_prorateddays end as DailyRate,
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
									and svc.id_sub = pv.c__SubscriptionID
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
case when pv.c_prorateddays = 0 then au.amount else au.amount/pv.c_prorateddays end as DailyRate,
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
									and svc.id_sub = pv.c__SubscriptionID
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
	DaysActiveInMonth,
	ReportingCurrency
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
	cMonth.DaysActiveInMonth,
	@p_nm_currency
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
sum(case when datediff(day, sub.dt_start, @p_dt_now) <= 30 then 1 else 0 end) as NewParticipants,
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
inner join t_vw_effective_subs sub with(nolock) on sub.id_sub = mrr.SubscriptionId
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
  INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Generating SubscriptionParticipants DataMart');
end;

select
@p_nm_instance as InstanceId,
datepart(month,@p_dt_now) as [Month],
datepart(year,@p_dt_now) as [Year],
DATEADD(month, DATEDIFF(month, 0, @p_dt_now), 0) as FirstDayOfMonth,
DATEADD(ss, -1, DATEADD(m, DATEDIFF(m, 0, @p_dt_now) + 1, 0)) as LastDayOfMonth
into #tmp_previous_two_months
;
insert into #tmp_previous_two_months(InstanceId,[Month],[Year],FirstDayOfMonth,LastDayOfMonth)
select
@p_nm_instance as InstanceId,
datepart(month,dateadd(mm, -1, @p_dt_now)) as [Month],
datepart(year,dateadd(mm, -1, @p_dt_now)) as [Year],
DATEADD(month, DATEDIFF(month, 0,   dateadd(mm, -1, @p_dt_now)), 0) as FirstDayOfMonth,
DATEADD(ss, -1, DATEADD(m, DATEDIFF(m, 0, dateadd(mm, -1, @p_dt_now)) + 1, 0)) as LastDayOfMonth
;
insert into #tmp_previous_two_months(InstanceId,[Month],[Year],FirstDayOfMonth,LastDayOfMonth)
select
@p_nm_instance as InstanceId,
datepart(month,dateadd(mm, -2, @p_dt_now)) as [Month],
datepart(year,dateadd(mm, -2, @p_dt_now)) as [Year],
DATEADD(month, DATEDIFF(month, 0,   dateadd(mm, -2, @p_dt_now)), 0) as FirstDayOfMonth,
DATEADD(ss, -1, DATEADD(m, DATEDIFF(m, 0, dateadd(mm, -2, @p_dt_now)) + 1, 0)) as LastDayOfMonth
;
insert into SubscriptionParticipants
(	InstanceId,
	ProductOfferingId,
	[Year],
	[Month],
	TotalParticipants,
	DistinctHierarchies,
	NewParticipants,
  UnsubscribedParticipants)
select
months.InstanceId,
sub.id_po as ProductOfferingId,
months.Year,
months.Month,
count(1) as TotalParticipants,
count(distinct cust.HierarchyMetraNetId) as DistinctHierarchies,
sum (case when sub.dt_start >= months.FirstDayOfMonth and sub.dt_start <= months.LastDayOfMonth then 1 else 0 end) as NewParticipants,
sum (case when sub.dt_end >= months.FirstDayOfMonth and sub.dt_end <= months.LastDayOfMonth then 1 else 0 end) as UnsubscribedParticipants
from t_vw_effective_subs sub with(nolock)
inner join Customer cust on cust.MetraNetId = sub.id_acc and cust.InstanceId = @p_nm_instance
/*was this subscription active during any part of this month?*/
inner join #tmp_previous_two_months months on (sub.dt_end >= months.FirstDayOfMonth and sub.dt_end <= months.LastDayOfMonth) or (sub.dt_start >= months.FirstDayOfMonth and sub.dt_start <= months.LastDayOfMonth) or (sub.dt_start <= months.FirstDayOfMonth and sub.dt_end >= months.LastDayOfMonth)
where 1=1
group by months.InstanceId, months.Year, months.Month, sub.id_po
;

select @l_count = count(1) from SubscriptionParticipants;

if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'SubscriptionParticipants rows: ' + CAST(IsNull(@l_count, 0) AS VARCHAR(64)));
end;


if (@p_id_run is not null)
begin
	INSERT INTO [dbo].[t_recevent_run_details] ([id_run], [dt_crt], [tx_type], [tx_detail]) VALUES (@p_id_run, @p_dt_now, 'Info', 'Finished generating DataMart');
end;

end;
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CompleteChildGroupCreation]'
GO
ALTER PROCEDURE [dbo].[CompleteChildGroupCreation]
(
  @id_materialization INT,
  @dt_end DATETIME,
  @status INT OUTPUT
)
AS

BEGIN
   -- initialize @status to failure (-1)
   SET @status = -1

   -- BEGIN TRAN
   
   DECLARE @id_parent_billgroup INT
   DECLARE @id_partition INT

   SELECT @id_parent_billgroup = id_parent_billgroup
   FROM t_billgroup_materialization
   WHERE id_materialization = @id_materialization

   /* Error if there is no id_parent_billgroup is NULL */
   IF @id_parent_billgroup IS NULL
      BEGIN
         SET @status = -2
         -- ROLLBACK
         RETURN
      END

   -- delete child group accounts for parent billing group from t_billgroup_member
   DELETE  bgm
   FROM t_billgroup_member bgm
   INNER JOIN t_billgroup_member_tmp bgmt
      ON bgmt.id_acc = bgm.id_acc
   WHERE bgmt.id_materialization = @id_materialization AND
               bgm.id_billgroup = @id_parent_billgroup
   
   -- update t_billgroup_member_history to reflect the deletion
   UPDATE bgmh
   SET tt_end = @dt_end
   FROM t_billgroup_member_history bgmh
   INNER JOIN t_billgroup_member_tmp bgmt
      ON bgmt.id_acc = bgmh.id_acc
   WHERE bgmt.id_materialization = @id_materialization AND
               bgmh.id_billgroup = @id_parent_billgroup

   -- get id_partition of the parent bill group
   SELECT @id_partition = id_partition
   FROM t_billgroup bg
   WHERE id_billgroup = @id_parent_billgroup

   -- insert child billing group data into t_billgroup from t_billgroup_tmp
   INSERT INTO t_billgroup (id_billgroup,
                                           tx_name,
                                           tx_description,
                                           id_usage_interval,
                                           id_parent_billgroup,
                                           tx_type,
                                          id_partition)
   SELECT bgt.id_billgroup,
               bgt.tx_name,
               bgt.tx_description,
               bgm.id_usage_interval,
               bgm.id_parent_billgroup,
               bgm.tx_type,
               @id_partition
   FROM t_billgroup_tmp bgt
   INNER JOIN t_billgroup_materialization bgm
       ON bgm.id_materialization = bgt.id_materialization
   WHERE bgm.id_materialization = @id_materialization
  

   -- insert child billing group data into t_billgroup_member
  INSERT INTO t_billgroup_member (id_billgroup, id_acc, id_materialization, id_root_billgroup)
  SELECT bgt.id_billgroup, bgmt.id_acc, @id_materialization,
              dbo.GetBillingGroupAncestor(bgt.id_billgroup)
  FROM t_billgroup_member_tmp bgmt
  INNER JOIN t_billgroup_tmp bgt
     ON bgt.tx_name = bgmt.tx_name
  WHERE bgmt.id_materialization =  @id_materialization AND
              bgt.id_materialization = @id_materialization

   -- update t_billgroup_member_history to reflect the addition
  INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                      id_acc,
                                                                      id_materialization,
                                                                      tx_status,
                                                                      tt_start,
                                                                      tt_end)
  SELECT bgt.id_billgroup,
              bgmt.id_acc,
              @id_materialization,
              'Succeeded',
              @dt_end,
              dbo.MTMaxDate()
  FROM t_billgroup_member_tmp bgmt
  INNER JOIN t_billgroup_tmp bgt
     ON bgt.tx_name = bgmt.tx_name
  WHERE bgmt.id_materialization =  @id_materialization AND
              bgt.id_materialization = @id_materialization

   -- set @status to success
   SET @status = 0

   -- COMMIT TRAN

END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CompleteMaterialization]'
GO
ALTER PROCEDURE [dbo].[CompleteMaterialization]
(
  @id_materialization INT,
  @dt_end DATETIME,
  @status INT OUTPUT
)
AS

BEGIN
   declare @v_sampling_ratio as int;
    declare @v_table_name as varchar(128);
    declare @v_status as int;
    
     -- initialize @status to failure (-1)
    SET @status = -1
    SET @v_sampling_ratio = 0
    
   /* ESR-2814 & ESR-3553 analyze table */
   --update statistics t_billgroup_tmp with sample 20 percent ;
  set  @v_table_name = 't_billgroup_tmp';
  exec mt_sys_analyze_table  @v_table_name ,@v_sampling_ratio, @v_status output;
   IF (@v_status != 0)
       BEGIN
          SET @status = -1
          RETURN
       END
       
   /* ESR-2814 & ESR-3553 analyze table */
  set @v_table_name = 't_billgroup_member_tmp';
  exec  mt_sys_analyze_table  @v_table_name ,@v_sampling_ratio,  @v_status output;
   IF (@v_status != 0)
       BEGIN
          SET @status = -1
          RETURN
       END

   BEGIN TRAN
   -- copy data from t_billgroup_tmp to t_billgroup
   INSERT INTO t_billgroup (id_billgroup, tx_name, tx_description, id_usage_interval, id_parent_billgroup, tx_type, id_partition)
   SELECT bgt.id_billgroup, bgt.tx_name, bgt.tx_description, bgm.id_usage_interval, bgm.id_parent_billgroup, bgm.tx_type, bgt.id_partition
   FROM t_billgroup_tmp bgt
   INNER JOIN t_billgroup_materialization bgm ON bgm.id_materialization = bgt.id_materialization
   WHERE bgm.id_materialization = @id_materialization

	--create temp table to hold all the ancestor accounts
  DECLARE @RootBillGroup TABLE (id_billgroup int primary key,id_root_billgroup int)
  INSERT INTO @RootBillGroup select id_billgroup,dbo.GetBillingGroupAncestor(id_billgroup) from t_billgroup_tmp
-- copy data from t_billgroup_member_tmp to t_billgroup_member
  INSERT INTO t_billgroup_member (id_billgroup, id_acc, id_materialization, id_root_billgroup)
  SELECT bgt.id_billgroup,
              bgmt.id_acc,
              @id_materialization,
              rg.id_root_billgroup
  FROM t_billgroup_member_tmp bgmt
  INNER JOIN t_billgroup_tmp bgt
     ON bgt.tx_name = bgmt.tx_name
  inner join @RootBillGroup rg on rg.id_billgroup = bgt.id_billgroup
  WHERE bgmt.id_materialization =  @id_materialization AND
              bgt.id_materialization = @id_materialization
   

-- update t_billgroup_member_history
  declare @maxdate datetime
  set @maxdate = dbo.MTMaxDate()
  INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                      id_acc,
                                                                      id_materialization,
                                                                      tx_status,
                                                                      tt_start,
                                                                      tt_end)
  SELECT bgt.id_billgroup,
              bgmt.id_acc,
              @id_materialization,
              'Succeeded',
              @dt_end,
              @maxdate
  FROM t_billgroup_member_tmp bgmt
  INNER JOIN t_billgroup_tmp bgt
     ON bgt.tx_name = bgmt.tx_name
  WHERE bgmt.id_materialization =  @id_materialization AND
              bgt.id_materialization = @id_materialization

  -- store the id_usage_interval
  DECLARE @id_usage_interval INT
  SELECT @id_usage_interval = id_usage_interval
  FROM t_billgroup_materialization
  WHERE id_materialization = @id_materialization
  
  /* Copy over billing group constraints */
  EXEC ResetBillingGroupConstraints @id_usage_interval, @status OUTPUT
  IF (@status != 0)
       BEGIN
          SET @status = -2
          ROLLBACK
          RETURN
       END
   /* Reset status */
   SET @status = -1

   /* Check that each billing group in t_billgroup has atleast one account  */
   IF EXISTS (SELECT bg.id_billgroup
                   FROM t_billgroup bg
                   WHERE bg.id_billgroup NOT IN (SELECT id_billgroup
                                                                     FROM t_billgroup_member bgm)
					and id_usage_interval = @id_usage_interval)
   BEGIN
      SET @status = -3
      ROLLBACK
      RETURN
   END

   /* Delete temporary data and update t_billgroup_materialization */
   EXEC CleanupMaterialization @id_materialization,
                                                @dt_end,
                                                'Succeeded',
                                                NULL,
                                                @status OUTPUT

    IF (@status != 0)
       BEGIN
          SET @status = -4
          ROLLBACK
          RETURN
       END

   -- set @status to success
   SET @status = 0

   COMMIT TRAN

END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CompleteReMaterialization]'
GO
ALTER PROCEDURE [dbo].[CompleteReMaterialization]
(
  @id_materialization INT,
  @dt_end DATETIME,
  @status INT OUTPUT
)
AS

BEGIN
   declare @v_sampling_ratio as int;
    declare @v_table_name as varchar(128);
     declare @v_status as int;
   BEGIN TRAN
   -- initialize @status to failure (-1)
   SET @status = -1
   SET @v_sampling_ratio = 0
   DECLARE @billGroupMemberMoves TABLE (id_materialization_new INT NOT NULL,
                                                                      id_materialization_old INT NOT NULL,
                                                                      id_acc INT NOT NULL,
                                                                      id_billgroup_new INT NOT NULL,
                                                                      id_billgroup_old INT NOT NULL,
                                                                      billgroup_name_new NVARCHAR(50) NOT NULL,
                                                                      billgroup_name_old NVARCHAR(50) NOT NULL,
                                                                      newStatus VARCHAR(1),
                                                                      oldStatus VARCHAR(1) NOT NULL)
   DECLARE @id_usage_interval INT
   
   -- Get the id_usage_interval for the given @id_materialization
   SELECT @id_usage_interval = id_usage_interval
   FROM t_billgroup_materialization
   WHERE id_materialization = @id_materialization

   -- copy billing groups from t_billgroup_tmp to t_billgroup
   -- only if they don't exist in t_billgroup for the interval associated with
   -- this @id_materialization
   INSERT INTO t_billgroup (id_billgroup, tx_name, tx_description, id_usage_interval, id_parent_billgroup, tx_type, id_partition)
   SELECT bgt.id_billgroup, bgt.tx_name, bgt.tx_description,
               bgm.id_usage_interval, bgm.id_parent_billgroup, bgm.tx_type, bgt.id_partition
   FROM t_billgroup_tmp bgt
   INNER JOIN t_billgroup_materialization bgm
     ON bgm.id_materialization = bgt.id_materialization
     WHERE bgt.id_materialization = @id_materialization AND
                 bgt.tx_name NOT IN (SELECT tx_name
                                                   FROM t_billgroup
                                                   WHERE id_usage_interval = @id_usage_interval)
    
    /* 
    copy data from t_billgroup_member_tmp (bgmt) to 
    t_billgroup_member(bgm) with the following conditions:
    
    if  (account in bgmt exists in bgm)
    {
       if (billing group for account in bgmt and billing group for account in bgm are not the same)
       {
          if (both billing groups are 'Open')
          {
             (1) 
             Move account to new billing group
             Record 'succeeded'
             (1a) 
             If the old billing group becomes empty (ie. loses all accounts)
             then delete the old billing group and update history associated with it.
          }
          else 
          {
             (2)
             Record 'failed'
          }
       }
    }
    else
    {
       if (account lands in a billing group that's 'Open'')
       {
          (3)
          Move account to bgm
          Record 'succeeded'
       }
       else 
       {
          (4)
          Record 'failed'
       }
    }
   */
       
    /* ESR-2814 & ESR-3553 analyze table */
  set @v_table_name = 't_billgroup_member_tmp';
  exec mt_sys_analyze_table  @v_table_name ,@v_sampling_ratio, @v_status output
 IF (@v_status != 0)
       BEGIN
          SET @status = -1
          ROLLBACK
          RETURN
       END
   
   /* Doing (1) from the above algorithm
        In t_billgroup_member, the id_acc will be unique amongst the billgroups for
        a given interval
   */
   INSERT @billGroupMemberMoves
   SELECT bgmt.id_materialization id_materialization_new,
               bgmem.id_materialization id_materialization_old,
               bgmt.id_acc,
               bg1.id_billgroup id_billgroup_new,
               bg.id_billgroup id_billgroup_old,
               bg1.tx_name billgroup_name_new,
               bg.tx_name billgroup_name_old,
               bgsNew.status newStatus,
               bgsOld.status oldStatus
   FROM t_billgroup_member_tmp bgmt
   INNER JOIN t_billgroup_member bgmem
      ON bgmem.id_acc = bgmt.id_acc
   INNER JOIN t_billgroup bg
      ON bg.id_billgroup = bgmem.id_billgroup AND
            bg.tx_name != bgmt.tx_name
   INNER JOIN t_billgroup_tmp bgt
      ON bgt.tx_name = bgmt.tx_name AND
            bgt.id_materialization = bgmt.id_materialization
   INNER JOIN t_billgroup bg1
      ON bg1.tx_name = bgmt.tx_name
   LEFT OUTER JOIN vw_all_billing_groups_status bgsNew
      ON bgsNew.id_billgroup = bg1.id_billgroup
   LEFT OUTER JOIN vw_all_billing_groups_status bgsOld
      ON bgsOld.id_billgroup = bg.id_billgroup
   WHERE
       bgmt.id_materialization =  @id_materialization AND
       bg.id_billgroup IN (SELECT id_billgroup
                                     FROM t_billgroup
                                     WHERE id_usage_interval = @id_usage_interval) AND
       bg1.id_billgroup IN (SELECT id_billgroup
                                       FROM t_billgroup
                                       WHERE id_usage_interval = @id_usage_interval)
 
   /* Update history for account */
   UPDATE bgmh
   SET tt_end = @dt_end
   FROM t_billgroup_member_history bgmh
   INNER JOIN @billGroupMemberMoves bgmt
      ON bgmt.id_acc = bgmh.id_acc AND
            bgmt.id_billgroup_old = bgmh.id_billgroup AND
            bgmt.id_materialization_old = bgmh.id_materialization
   WHERE bgmt.oldStatus = 'O' AND
               (bgmt.newStatus = 'O' OR bgmt.newStatus IS NULL)

   /* Delete account(s) from t_billgroup_member */
   DELETE t_billgroup_member
   FROM t_billgroup_member bgm
   INNER JOIN @billGroupMemberMoves bgmt
      ON bgmt.id_billgroup_old = bgm.id_billgroup AND
            bgmt.id_acc = bgm.id_acc
   WHERE bgmt.oldStatus = 'O' AND
               (bgmt.newStatus = 'O' OR bgmt.newStatus IS NULL)

    /* Insert updated account(s) into t_billgroup_member */
    INSERT INTO t_billgroup_member (id_billgroup, id_acc, id_materialization, id_root_billgroup)
    SELECT bgmt.id_billgroup_new, bgmt.id_acc, bgmt.id_materialization_new,
                dbo.GetBillingGroupAncestor(bgmt.id_billgroup_new)
    FROM @billGroupMemberMoves bgmt
    WHERE bgmt.oldStatus = 'O' AND
                (bgmt.newStatus = 'O' OR bgmt.newStatus IS NULL)

   /* Insert new history for account */
   INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                      id_acc,
                                                                      id_materialization,
                                                                      tx_status,
                                                                      tt_start,
                                                                      tt_end)
   SELECT bgmt.id_billgroup_new,
               bgmt.id_acc,
               bgmt.id_materialization_new,
               'Succeeded',
               @dt_end,
               dbo.MTMaxDate()
   FROM @billGroupMemberMoves bgmt
   WHERE bgmt.oldStatus = 'O' AND
               (bgmt.newStatus = 'O' OR bgmt.newStatus IS NULL)

  /*
     Doing (1a) from the above algorithm
  */
   -- Delete old billgroup if it doesn't have any accounts
   IF EXISTS (SELECT 1
                FROM dbo.sysobjects
                WHERE id = OBJECT_ID(N't_deleted_billgroups') AND
                                   OBJECTPROPERTY(id, N'IsUserTable') = 1)
   BEGIN
      DROP TABLE t_deleted_billgroups
   END
   CREATE TABLE t_deleted_billgroups (id_billgroup INT NOT NULL)
 
   INSERT INTO t_deleted_billgroups
   SELECT id_billgroup
   FROM t_billgroup bg
   INNER JOIN @billGroupMemberMoves bgmoves
      ON bgmoves.id_billgroup_old = bg.id_billgroup AND
            bgmoves.id_billgroup_old NOT IN (SELECT id_billgroup
                                                                    FROM t_billgroup_member)
   WHERE bgmoves.oldStatus = 'O' AND
                (bgmoves.newStatus = 'O' OR bgmoves.newStatus IS NULL)

   EXEC DeleteBillGroupData 't_deleted_billgroups'
   DROP TABLE t_deleted_billgroups
 
  /* Doing (2) from the above algorithm. 
       Insert rows into t_billgroup_member_history for account moves into and out of 'Soft Closed' or
       'Hard Closed' billing groups. These are not 'history' rows because
       no change is happening to the account. The tt_start and tt_end times on these rows
       don't matter. They are filtered based on tx_status = 'Failed'
   */
    INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                        id_acc,
                                                                        id_materialization,
                                                                        tx_status,
                                                                        tt_start,
                                                                        tt_end,
                                                                        tx_failure_reason)
   SELECT NULL,
               bgmt.id_acc,
               bgmt.id_materialization_new,
               'Failed',
               @dt_end,
               @dt_end,
               'Attempting to move this account from billing group [' +
               bgmt.billgroup_name_old +
                ']  to billing group [' +
               bgmt.billgroup_name_new  +
               '] when one (or both) billing group is not in an Open state.'
   FROM @billGroupMemberMoves bgmt
   WHERE bgmt.oldStatus != 'O' OR
               (bgmt.newStatus != 'O' AND bgmt.newStatus IS NOT NULL)

    /* Clear billGroupMemberMoves */
   DELETE  @billGroupMemberMoves

   DECLARE @billUnassignedAccountMoves TABLE (id_materialization INT NOT NULL,
                                                                                id_acc INT NOT NULL,
                                                                                id_billgroup INT NOT NULL,
                                                                                billgroup_name NVARCHAR(50) NOT NULL,
                                                                                status VARCHAR(1))

   /* Doing (3) from the above algorithm */
   INSERT @billUnassignedAccountMoves
   SELECT bgmt.id_materialization,
               bgmt.id_acc,
               bg.id_billgroup,
               bg.tx_name,
               bgs.status
   FROM t_billgroup_member_tmp bgmt
   INNER JOIN t_billgroup_tmp bgt
      ON bgt.tx_name = bgmt.tx_name AND
            bgt.id_materialization = bgmt.id_materialization
   INNER JOIN t_billgroup bg
      ON bg.tx_name = bgt.tx_name
   LEFT OUTER JOIN vw_all_billing_groups_status bgs
      ON bgs.id_billgroup = bg.id_billgroup
   WHERE
       bgmt.id_acc NOT IN (SELECT id_acc
                                         FROM t_billgroup_member
                                         WHERE id_billgroup IN (SELECT id_billgroup
                                                                              FROM t_billgroup
                                                                              WHERE id_usage_interval = @id_usage_interval)) AND
       bgmt.id_materialization = @id_materialization AND
       bg.id_billgroup IN (SELECT id_billgroup
                                     FROM t_billgroup
                                     WHERE id_usage_interval = @id_usage_interval)
 
    /* Insert updated account(s) into t_billgroup_member */
    INSERT INTO t_billgroup_member (id_billgroup, id_acc, id_materialization, id_root_billgroup)
    SELECT buam.id_billgroup, buam.id_acc, buam.id_materialization,
                dbo.GetBillingGroupAncestor(buam.id_billgroup)
    FROM @billUnassignedAccountMoves buam
    WHERE buam.status = 'O' OR buam.status IS NULL
    
   /* Insert new history for account */
   INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                      id_acc,
                                                                      id_materialization,
                                                                      tx_status,
                                                                      tt_start,
                                                                      tt_end)
   SELECT buam.id_billgroup,
               buam.id_acc,
               buam.id_materialization,
               'Succeeded',
               @dt_end,
               dbo.MTMaxDate()
   FROM @billUnassignedAccountMoves buam
   WHERE buam.status = 'O' OR buam.status IS NULL
 
    /* Doing (4) from the above algorithm.
        Insert rows into t_billgroup_member_history. These are not 'history' rows because
        no change is happening to the account. The tt_start and tt_end times on these rows
        don't matter. They are filtered based on tx_status = 'Failed'
   */
    INSERT INTO t_billgroup_member_history (id_billgroup,
                                                                        id_acc,
                                                                        id_materialization,
                                                                        tx_status,
                                                                        tt_start,
                                                                        tt_end,
                                                                        tx_failure_reason)
   SELECT NULL,
               buam.id_acc,
               buam.id_materialization,
               'Failed',
               @dt_end,
               @dt_end,
                'Attempting to assign this account to the billing group [' +
               buam.billgroup_name +
                ']  when the  billing group is not in an Open state.'
   FROM @billUnassignedAccountMoves buam
   WHERE status != 'O' AND status IS NOT NULL
 
   /* Check that each billing group in t_billgroup has atleast one account  */
   IF EXISTS (SELECT bg.id_billgroup
                   FROM t_billgroup bg
                   WHERE bg.id_billgroup NOT IN (SELECT id_billgroup
                                                                     FROM t_billgroup_member bgm)
																	 and id_usage_interval = @id_usage_interval)
   BEGIN
      SET @status = -2
      ROLLBACK
      RETURN
   END

   /* Clear @billUnassignedAccountMoves */
   DELETE  @billUnassignedAccountMoves

   /* Copy over billing group constraints */
  EXEC ResetBillingGroupConstraints @id_usage_interval, @status OUTPUT
  IF (@status != 0)
       BEGIN
          SET @status = -3
          ROLLBACK
          RETURN
       END
   /* Reset status */
   SET @status = -1

   /* Delete temporary data and update t_billgroup_materialization */
   EXEC CleanupMaterialization @id_materialization,
                                                 @dt_end,
                                                 'Succeeded',
                                                 NULL,
                                                 @status OUTPUT

    IF (@status != 0)
       BEGIN
          SET @status = -4
          ROLLBACK
          RETURN
       END

   -- set @status to success
   SET @status = 0

   COMMIT TRAN

END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CanExecuteEventDeps]'
GO
ALTER PROCEDURE [dbo].[CanExecuteEventDeps] (
	@dt_now DATETIME,
	@id_instances VARCHAR(4000),
    @lang_code INT = 840
	)
AS

BEGIN

  if object_id('tempdb..#tmp_deps') is not null drop table #tmp_deps
  CREATE TABLE #tmp_deps
  (
    id_orig_event INT NOT NULL,
    tx_orig_billgroup_support VARCHAR(15),         -- useful for debugging
    id_orig_instance INT NOT NULL,
    id_orig_billgroup INT,                               -- useful for debugging
    tx_orig_name VARCHAR(255) NOT NULL, -- useful for debugging
    tx_name nvarchar(255) NOT NULL,           -- useful for debugging
    id_event INT NOT NULL,
    tx_billgroup_support VARCHAR(15),         -- useful for debugging
    id_instance INT,
    id_billgroup INT,                                       -- useful for debugging
    id_arg_interval INT,
    dt_arg_start DATETIME,
    dt_arg_end DATETIME,
    tx_status VARCHAR(14),
    b_critical_dependency VARCHAR(1)
  )
  
  -- GetEventExecutionDeps populates #tmp_deps table
  -- Parameter table have bad performance when >100 records returned, so using temp table for that.
  EXEC GetEventExecutionDeps @dt_now, @id_instances


  SELECT
    orig_evt.tx_name OriginalEventName,
    orig_evt.tx_display_name OriginalEventDisplayName,
    COALESCE(loc.tx_name, evt.tx_display_name) EventDisplayName,
    evt.tx_type EventType,
    deps.OriginalInstanceID,
    deps.EventID,
    deps.EventName,
    deps.InstanceID,
    deps.ArgIntervalID,
    deps.ArgStartDate,
    deps.ArgEndDate,
    deps.Status,
    /*  the corrective action that must occur */
    CASE deps.Status WHEN 'NotYetRun' THEN 'Execute'
                    WHEN 'Failed' THEN 'Reverse'
                    WHEN 'ReadyToRun' THEN 'Cancel'
                    WHEN 'Reversing' THEN 'TryAgainLater'
                    ELSE 'Unknown' END AS Action,
    isnull(deps.BillGroupName, 'Not Available') BillGroupName
  FROM
  (
    SELECT
      MIN(deps.id_orig_instance) OriginalInstanceID,
      deps.id_event EventID,
      deps.tx_name EventName,
      deps.id_instance InstanceID,
      deps.id_arg_interval ArgIntervalID,
      deps.dt_arg_start ArgStartDate,
      deps.dt_arg_end ArgEndDate,
      deps.tx_status Status,
      bg.tx_name BillGroupName
    FROM #tmp_deps deps
    LEFT OUTER JOIN t_billgroup bg ON bg.id_billgroup = deps.id_billgroup
    WHERE
      /* excludes input instances */
      (deps.id_instance NOT IN (select * from dbo.csvtoint(@id_instances))
			  OR deps.id_instance IS NULL) AND
      /* only look at deps that need an action to be taken */
      deps.tx_status NOT IN ('Succeeded', 'ReadyToRun', 'Running')
    GROUP BY
      deps.id_instance,
      deps.id_event,
      deps.tx_name,
      deps.id_arg_interval,
      deps.dt_arg_start,
      deps.dt_arg_end,
      deps.tx_status,
      bg.tx_name
  ) deps
  INNER JOIN t_recevent evt ON evt.id_event = deps.EventID
  INNER JOIN t_recevent_inst orig_inst ON orig_inst.id_instance = deps.OriginalInstanceID
  INNER JOIN t_recevent orig_evt ON orig_evt.id_event = orig_inst.id_event
  LEFT OUTER JOIN t_localized_items loc on (id_local_type = 1  /*Adapter type*/ AND id_lang_code = @lang_code AND evt.id_event=loc.id_item)

END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[CanReverseEventDeps]'
GO
ALTER PROCEDURE [dbo].[CanReverseEventDeps] (
	@dt_now DATETIME,
	@id_instances VARCHAR(4000),
  @lang_code INT = 840
	)
AS

BEGIN

  SELECT
    orig_evt.tx_name OriginalEventName,
    orig_evt.tx_display_name OriginalEventDisplayName,
    COALESCE(loc.tx_name, evt.tx_display_name) EventDisplayName,
    evt.tx_type EventType,
    evt.tx_reverse_mode ReverseMode,
    deps.OriginalInstanceID,
    deps.EventID,
    deps.EventName,
    deps.InstanceID,
    deps.ArgIntervalID,
    deps.ArgStartDate,
    deps.ArgEndDate,
    deps.Status,
    /* the corrective action that must occur */
    CASE deps.Status WHEN 'Succeeded' THEN 'Reverse'
                    WHEN 'Failed' THEN 'Reverse'
                    WHEN 'ReadyToRun' THEN 'Cancel'
                    WHEN 'Running' THEN 'TryAgainLater'
                    ELSE 'Unknown' END Action,
    {fn ifnull(deps.BillGroupName, 'Not Available')} BillGroupName
  FROM
  (
    SELECT
      MIN(deps.id_orig_instance) OriginalInstanceID,
      deps.id_event EventID,
      deps.tx_name EventName,
      deps.id_instance InstanceID,
      deps.id_arg_interval ArgIntervalID,
      deps.dt_arg_start ArgStartDate,
      deps.dt_arg_end ArgEndDate,
      deps.tx_status Status,
      bg.tx_name BillGroupName
    FROM GetEventReversalDeps(@dt_now, @id_instances) deps
    LEFT OUTER JOIN t_billgroup bg ON bg.id_billgroup = deps.id_billgroup
    WHERE
      /* excludes input instances */
      (deps.id_instance NOT IN (select * from dbo.csvtoint(@id_instances))
          OR deps.id_instance IS NULL) AND
      /* only look at deps that need an action to be taken */
      deps.tx_status NOT IN ('NotYetRun', 'ReadyToReverse', 'Reversing')
    GROUP BY
      deps.id_instance,
      deps.id_event,
      deps.tx_name,
      deps.id_arg_interval,
      deps.dt_arg_start,
      deps.dt_arg_end,
      deps.tx_status,
      bg.tx_name
  ) deps
  INNER JOIN t_recevent evt ON evt.id_event = deps.EventID
  INNER JOIN t_recevent_inst orig_inst ON orig_inst.id_instance = deps.OriginalInstanceID
  INNER JOIN t_recevent orig_evt ON orig_evt.id_event = orig_inst.id_event
  LEFT OUTER JOIN t_localized_items loc on (id_local_type = 1  /*Adapter type*/ AND id_lang_code = @lang_code AND evt.id_event=loc.id_item)

end
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_ep_discount]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_ep_discount] ADD
[c_IsLiabilityProduct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_RevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_DeferredRevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[t_ep_nonrecurring]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_t_ep_nonrecurring]
(
[id_prop] [int] NOT NULL,
[c_glcode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_IsLiabilityProduct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[c_RevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_DeferredRevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_1_t_ep_nonrecurring]([id_prop], [c_glcode], [c_IsLiabilityProduct]) SELECT [id_prop], [c_glcode], 'F' as [c_IsLiabilityProduct] FROM [dbo].[t_ep_nonrecurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[t_ep_nonrecurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_t_ep_nonrecurring]', N't_ep_nonrecurring', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [pk_t_ep_nonrecurring] on [dbo].[t_ep_nonrecurring]'
GO
ALTER TABLE [dbo].[t_ep_nonrecurring] ADD CONSTRAINT [pk_t_ep_nonrecurring] PRIMARY KEY CLUSTERED  ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[t_ep_recurring]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_t_ep_recurring]
(
[id_prop] [int] NOT NULL,
[c_glcode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_IsLiabilityProduct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[c_RevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_DeferredRevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_2_t_ep_recurring]([id_prop], [c_glcode], [c_IsLiabilityProduct]) SELECT [id_prop], [c_glcode], 'F' as [c_IsLiabilityProduct] FROM [dbo].[t_ep_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[t_ep_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_t_ep_recurring]', N't_ep_recurring', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [pk_t_ep_recurring] on [dbo].[t_ep_recurring]'
GO
ALTER TABLE [dbo].[t_ep_recurring] ADD CONSTRAINT [pk_t_ep_recurring] PRIMARY KEY CLUSTERED  ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[t_ep_unit_dependent_recurring]'
GO
CREATE TABLE [dbo].[RG_Recovery_3_t_ep_unit_dependent_recurring]
(
[id_prop] [int] NOT NULL,
[c_glcode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_IsLiabilityProduct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[c_RevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_DeferredRevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_3_t_ep_unit_dependent_recurring]([id_prop], [c_glcode]) SELECT [id_prop], [c_glcode] FROM [dbo].[t_ep_unit_dependent_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[t_ep_unit_dependent_recurring]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_3_t_ep_unit_dependent_recurring]', N't_ep_unit_dependent_recurring', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [pk_t_ep_unit_dependent_recurring] on [dbo].[t_ep_unit_dependent_recurring]'
GO
ALTER TABLE [dbo].[t_ep_unit_dependent_recurring] ADD CONSTRAINT [pk_t_ep_unit_dependent_recurring] PRIMARY KEY CLUSTERED  ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_ep_usage]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_ep_usage] ADD
[c_IsLiabilityProduct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_RevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_DeferredRevenueCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_notification_events]'
GO
CREATE TABLE [dbo].[t_notification_events]
(
[id_notification_event] [bigint] NOT NULL,
[id_notification_event_type] [int] NOT NULL,
[notification_event_prop_values] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[id_partition] [int] NULL,
[dt_crt] [datetime] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_t_Notification_Events] on [dbo].[t_notification_events]'
GO
ALTER TABLE [dbo].[t_notification_events] ADD CONSTRAINT [PK_t_Notification_Events] PRIMARY KEY CLUSTERED  ([id_notification_event])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_notification_event_consumers]'
GO
CREATE TABLE [dbo].[t_notification_event_consumers]
(
[id_not_evnt_consumer] [bigint] NOT NULL,
[id_notification_event] [bigint] NOT NULL,
[id_acc] [int] NOT NULL,
[dt_crt] [datetime] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_t_Notification_Event_Consumers] on [dbo].[t_notification_event_consumers]'
GO
ALTER TABLE [dbo].[t_notification_event_consumers] ADD CONSTRAINT [PK_t_Notification_Event_Consumers] PRIMARY KEY CLUSTERED  ([id_not_evnt_consumer])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_notification_event_types]'
GO
CREATE TABLE [dbo].[t_notification_event_types]
(
[id_notification_event_type] [int] NOT NULL,
[notification_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_t_Notification_Event_Types] on [dbo].[t_notification_event_types]'
GO
ALTER TABLE [dbo].[t_notification_event_types] ADD CONSTRAINT [PK_t_Notification_Event_Types] PRIMARY KEY CLUSTERED  ([id_notification_event_type])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_localized_items_type]'
GO
CREATE TABLE [dbo].[t_localized_items_type]
(
[id_local_type] [int] NOT NULL,
[local_type_description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_t_localized_items_type] on [dbo].[t_localized_items_type]'
GO
ALTER TABLE [dbo].[t_localized_items_type] ADD CONSTRAINT [PK_t_localized_items_type] PRIMARY KEY CLUSTERED  ([id_local_type])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_rec_win_bcp_for_reverse]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Insert default values into t_localized_items_type'
GO
INSERT INTO t_localized_items_type(id_local_type, local_type_description)
VALUES (1, 'Localization type for Adapters (see t_recevent table)');
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO t_localized_items_type(id_local_type, local_type_description)
VALUES (2, 'Localization type for Composite Capability (see t_composite_capability_type table)');
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO t_localized_items_type(id_local_type, local_type_description)
VALUES (3, 'Localization type for Atomic Capability (see t_atomic_capability_type table)');
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO t_localized_items_type(id_local_type, local_type_description)
VALUES (4, 'Localization type for Security Roles (see t_role table)');
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_rec_win_bcp_for_reverse] ALTER COLUMN [c_CycleEffectiveDate] [datetime] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_message_mapping]'
GO
CREATE TABLE [dbo].[t_message_mapping]
(
[id_message] [int] NOT NULL,
[id_origin_message] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [pk_t_message_mapping] on [dbo].[t_message_mapping]'
GO
ALTER TABLE [dbo].[t_message_mapping] ADD CONSTRAINT [pk_t_message_mapping] PRIMARY KEY CLUSTERED  ([id_origin_message])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_ep_nonrecurring]'
GO
ALTER TABLE [dbo].[t_ep_nonrecurring] ADD FOREIGN KEY ([id_prop]) REFERENCES [dbo].[t_base_props] ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_ep_recurring]'
GO
ALTER TABLE [dbo].[t_ep_recurring] ADD FOREIGN KEY ([id_prop]) REFERENCES [dbo].[t_base_props] ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_ep_unit_dependent_recurring]'
GO
ALTER TABLE [dbo].[t_ep_unit_dependent_recurring] ADD FOREIGN KEY ([id_prop]) REFERENCES [dbo].[t_base_props] ([id_prop])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_localized_items]'
GO
ALTER TABLE [dbo].[t_localized_items] ADD CONSTRAINT [FK1_LOCALIZE_TO_T_LOCALIZED_ITEMS_TYPE] FOREIGN KEY ([id_local_type]) REFERENCES [dbo].[t_localized_items_type] ([id_local_type])
ALTER TABLE [dbo].[t_localized_items] ADD CONSTRAINT [FK2_LOCALIZE_TO_T_LANGUAGE] FOREIGN KEY ([id_lang_code]) REFERENCES [dbo].[t_language] ([id_lang_code])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_notification_event_consumers]'
GO
ALTER TABLE [dbo].[t_notification_event_consumers] ADD CONSTRAINT [FK_t_Notification_Event_Consumers] FOREIGN KEY ([id_notification_event]) REFERENCES [dbo].[t_notification_events] ([id_notification_event])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[t_notification_events]'
GO
ALTER TABLE [dbo].[t_notification_events] ADD CONSTRAINT [FK_t_Notification_Events] FOREIGN KEY ([id_notification_event_type]) REFERENCES [dbo].[t_notification_event_types] ([id_notification_event_type])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering trigger [dbo].[trig_update_t_recur_window_with_recur_value] on [dbo].[t_recur_value]'
GO
ALTER TRIGGER [dbo].[trig_update_t_recur_window_with_recur_value]
ON [dbo].[t_recur_value] FOR INSERT, UPDATE, DELETE
AS
BEGIN
/* Notes:
Trigger is executed 7 times after each update of UDRC values.
5 first times INSERTED and DELETED tables are empty.
On 6 time we have update (INSERTED and DELETED have same number of rows)
On 7 time we have insert (INSERTED only have rows)
*/
  IF @@ROWCOUNT = 0 RETURN;

  DECLARE @startDate              datetime,
          @num_notnull_quote_batchids   INT
          
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
        rw.c_SubscriptionEnd = current_sub.vt_end,
        rw.c_CycleEffectiveStart = current_sub.vt_start,
        rw.c_CycleEffectiveEnd = current_sub.vt_end
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
  
   SELECT @num_notnull_quote_batchids = count(1)
    FROM t_sub sub
      INNER JOIN t_payment_redirection pay ON pay.id_payee = sub.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      JOIN #tmp_changed_units rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub AND rv.tt_end = dbo.MTMaxDate()
        AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
        AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
    WHERE tx_quoting_batch is not null
        AND tx_quoting_batch!=0x00000000000000000000000000000000;

		--SET @num_notnull_quote_batchids=0;
  
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
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, @startDate, @num_notnull_quote_batchids) AS c__IsAllowGenChargeByTrigger
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
	  , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payee, gsm.vt_end, @startDate, @num_notnull_quote_batchids) AS c__IsAllowGenChargeByTrigger
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
      , dbo.AllowInitialArrersCharge(rcr.b_advance, pay.id_payer, sub.vt_end, @startDate, @num_notnull_quote_batchids) AS c__IsAllowGenChargeByTrigger
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
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Active End Date for the Customer', 'SCHEMA', N'dbo', 'TABLE', N'Customer', 'COLUMN', N'EndDate'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Active Start Date for the Customer', 'SCHEMA', N'dbo', 'TABLE', N'Customer', 'COLUMN', N'StartDate'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'The SubscriptionParticipants reports on a total number of subscriptions (including both indivudal subscriptions and group subscription partipants) to each product offering in a calendar month. The SubscriptionParticipants table holds data for the current calendar month and the two preceeding calendar months.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of unique customers. For example, a company may have 200 users with the subscription, that would be ONE here and 200 in Subscriptions above.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'DistinctHierarchies'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MetraNet instance from which the data originated.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'InstanceId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The calendar month in which the subscription participants were active.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'Month'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Total number of new subscriptions to this product offering that became active during this calendar month that were not active in the previous calendar month.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'NewParticipants'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product Offering Identifier.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'ProductOfferingId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Total number of subscriptions to  this product offering that were active during the calendar month.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'TotalParticipants'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Total number of subscriptions to this product offering that expired during this calendar month.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'UnsubscribedParticipants'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The calendar year in which the subscription participants were active.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionParticipants', 'COLUMN', N'Year'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Currency for the Subscription', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionsByMonth', 'COLUMN', N'ReportingCurrency'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Id of account, who Approved, Denied or Dissmissed the change', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_ApproverId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Encrypted full information about the change, that will be given to MT Service on Apply', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_ChangeDetails'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'When the change was modified last time', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_ChangeLastModifiedDate'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Type of the Change ("RateUpdate", "AccountUpdate", "ProductOfferingUpdate", ect.)', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_ChangeType'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Comment that Approver provided on changing state of the Change', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_Comment'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'State of the change ("Pending", "Approved", "FailedToApply"?)', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_CurrentState'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Change?s description that will be displayed for user', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_ItemDisplayName'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Partition ID of the Change (e.g.: For Subscription, Product Offering or Rate updates, the Partition Id of the related Product Offering will be saved)', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_PartitionId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'When the change was submitted', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_SubmittedDate'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Id of account, who did the change', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_SubmitterId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Field with unique value', 'SCHEMA', N'dbo', 'TABLE', N't_approvals', 'COLUMN', N'c_UniqueItemId'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique Partition identifier', 'SCHEMA', N'dbo', 'TABLE', N't_billgroup', 'COLUMN', N'id_partition'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique Partition identifier', 'SCHEMA', N'dbo', 'TABLE', N't_billgroup_member_tmp', 'COLUMN', N'id_partition'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique Partition identifier', 'SCHEMA', N'dbo', 'TABLE', N't_billgroup_tmp', 'COLUMN', N'id_partition'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Deferred Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_discount', 'COLUMN', N'c_DeferredRevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Shows is this a liability product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_discount', 'COLUMN', N'c_IsLiabilityProduct'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_discount', 'COLUMN', N'c_RevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'A charge that is not based on usage or periodic events such as a one-time activation or sign up fee. Its properties.', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Deferred Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', 'COLUMN', N'c_DeferredRevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Sample GL Code field', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Shows is this a liability product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', 'COLUMN', N'c_IsLiabilityProduct'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_nonrecurring', 'COLUMN', N'c_RevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Recurring charges are applied on a regular cycle.', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Deferred Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', 'COLUMN', N'c_DeferredRevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Sample GL Code field', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Shows is this a liability product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', 'COLUMN', N'c_IsLiabilityProduct'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_recurring', 'COLUMN', N'c_RevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unit-dependent recurring charges (UDRCs) are also applied on a regular cycle, but are variable-based on a specific quantity.', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Deferred Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', 'COLUMN', N'c_DeferredRevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Sample GL Code field', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', 'COLUMN', N'c_glcode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Shows is this a liability product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', 'COLUMN', N'c_IsLiabilityProduct'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_unit_dependent_recurring', 'COLUMN', N'c_RevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Deferred Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_usage', 'COLUMN', N'c_DeferredRevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Shows is this a liability product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_usage', 'COLUMN', N'c_IsLiabilityProduct'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Revenue Code for product', 'SCHEMA', N'dbo', 'TABLE', N't_ep_usage', 'COLUMN', N'c_RevenueCode'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The t_localized_items table contains the localized DisplayName and Description of entyties (for example t_recevent, t_composite_capability_type, t_atomic_capability_type tables) for the languages supported by the MetraTech platform.(Package:Pipeline) ', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Composite key: Localize identifier. This is foreign key to t_recevent and other tables', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'id_item'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Composite key: Second localize identifier. This is foreign key, for example, to t_compositor (it is atomoc capability) and other tables with composite PK. In case second key is not used set -1 as default value', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'id_item_second_key'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Composite key: Language identifier displayed on the MetraNet Presentation Server', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'id_lang_code'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Composite key: This is foreign key to t_localized_items_type.', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'id_local_type'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The localized Description', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'tx_desc'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'The localized DisplayName', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items', 'COLUMN', N'tx_name'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Dictionary table for t_localized_items.id_local_type colum. Contains id localization type and their description', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items_type', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key.', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items_type', 'COLUMN', N'id_local_type'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description type.', 'SCHEMA', N'dbo', 'TABLE', N't_localized_items_type', 'COLUMN', N'local_type_description'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mapping table for linking between parents messages and childs messages.', 'SCHEMA', N'dbo', 'TABLE', N't_message_mapping', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Child message.', 'SCHEMA', N'dbo', 'TABLE', N't_message_mapping', 'COLUMN', N'id_message'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key. Parents message', 'SCHEMA', N'dbo', 'TABLE', N't_message_mapping', 'COLUMN', N'id_origin_message'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'The table maps notification events to account ids who can see the generated notification events.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_consumers', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Row creation date.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_consumers', 'COLUMN', N'dt_crt'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique identifier of the account to which the notification event should be displayed.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_consumers', 'COLUMN', N'id_acc'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique row identifier', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_consumers', 'COLUMN', N'id_not_evnt_consumer'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique identifier of the notification event.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_consumers', 'COLUMN', N'id_notification_event'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'The table contains notification event types configured in the system.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_types', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique identifier of the notification event type.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_types', 'COLUMN', N'id_notification_event_type'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Name of the notification event type.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_event_types', 'COLUMN', N'notification_event_name'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'The table contains notification events generated for notification types configured in the system.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Notification event creation date.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', 'COLUMN', N'dt_crt'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique identifier of the notification event.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', 'COLUMN', N'id_notification_event'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique identifier of the notification event type.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', 'COLUMN', N'id_notification_event_type'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Partition Id of the notification event if applicable otherwise null.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', 'COLUMN', N'id_partition'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'XML string containing property names and values for the notification event.', 'SCHEMA', N'dbo', 'TABLE', N't_notification_events', 'COLUMN', N'notification_event_prop_values'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'The view gets list of business partition accounts and it consists of four tables "t_account", "t_account_type", "t_account_ancestor" and "t_account_mapper" ', 'SCHEMA', N'dbo', 'VIEW', N'vw_bus_partition_accounts', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

PRINT N'Updating upgrade information to [dbo].[t_sys_upgrade] table'
GO
UPDATE [dbo].[t_sys_upgrade]
SET db_upgrade_status = 'C',
dt_end_db_upgrade = getdate()
WHERE upgrade_id = (SELECT MAX(upgrade_id) FROM [dbo].[t_sys_upgrade])    
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO

