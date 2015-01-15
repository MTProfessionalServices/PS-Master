
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

PRINT N'Creating [dbo].[t_localized_items]'
GO

CREATE TABLE [dbo].[t_localized_items]
(
	[id_local_type] int NOT NULL,     				/* Composite key: This is foreign key to t_localized_items_type.*/
	[id_item] int NOT NULL,							/* Composite key: Localize identifier. This is foreign key to t_recevent and other tables */
	[id_item_second_key] int NOT NULL DEFAULT -1 ,	/* Composite key: Second localize identifier. This is foreign key, for example, to t_compositor (it is atomoc capability) and other tables with composite PK. In case second key is not used set -1 as default value */
	[id_lang_code] int NOT NULL,      				/* Composite key: Language identifier displayed on the MetraNet Presentation Server */
	[tx_name] [nvarchar](255) NULL, 				/* The localized DisplayName */
	[tx_desc] [nvarchar](2000) NULL,				/* The localized Description */
CONSTRAINT [PK_t_localized_items] PRIMARY KEY CLUSTERED 
(
[id_local_type],
[id_item],
[id_item_second_key],
[id_lang_code]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering [dbo].[t_localized_items] descriptions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The t_localized_items table contains the localized DisplayName and Description of entyties (for example t_recevent, t_composite_capability_type, t_atomic_capability_type tables) for the languages supported by the MetraTech platform.(Package:Pipeline) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Composite key: This is foreign key to t_localized_items_type.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'id_local_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Composite key: Localize identifier. This is foreign key to t_recevent and other tables' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'id_item'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Composite key: Second localize identifier. This is foreign key, for example, to t_compositor (it is atomoc capability) and other tables with composite PK. In case second key is not used set -1 as default value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'id_item_second_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Composite key: Language identifier displayed on the MetraNet Presentation Server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'id_lang_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The localized DisplayName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'tx_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The localized Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items', @level2type=N'COLUMN',@level2name=N'tx_desc'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Creating [dbo].[t_localized_items_type]'
GO
CREATE TABLE [dbo].[t_localized_items_type]
(
	[id_local_type] int NOT NULL,     	/* PK, where '1' - Localization type for Recurring Adapters,
													 '2' - 'Localization type for Composite Capability,
													 '3' - 'Localization type for Atomic Capability */	
	[local_type_description] [nvarchar](255) NULL,	/* The type description */
CONSTRAINT [PK_t_localized_items_type] PRIMARY KEY CLUSTERED 
(
[id_local_type]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering [dbo].[t_localized_items_type] descriptions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dictionary table for t_localized_items.id_local_type colum. Contains id localization type and their description', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key.', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items_type', @level2type=N'COLUMN',@level2name=N'id_local_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description type.', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_localized_items_type', @level2type=N'COLUMN',@level2name=N'local_type_description'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering [dbo].[t_localized_items] adding FK1_LOCALIZE_TO_T_LOCALIZED_ITEMS_TYPE'
GO
	ALTER TABLE [dbo].[t_localized_items] WITH CHECK ADD CONSTRAINT [FK1_LOCALIZE_TO_T_LOCALIZED_ITEMS_TYPE] 
				FOREIGN KEY([id_local_type]) REFERENCES [t_localized_items_type] ([id_local_type])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering [dbo].[t_localized_items] adding FK2_LOCALIZE_TO_T_LANGUAGE'
GO
	ALTER TABLE [dbo].[t_localized_items] WITH CHECK ADD CONSTRAINT [FK2_LOCALIZE_TO_T_LANGUAGE] 
				FOREIGN KEY([id_lang_code]) REFERENCES [t_language] ([id_lang_code])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO


PRINT N'Altering CanExecuteEvents'
GO
	ALTER PROCEDURE CanExecuteEvents(@dt_now DATETIME, @id_instances VARCHAR(4000), @lang_code INT = 840 )
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
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering CanReverseEvents'
GO
	ALTER PROCEDURE CanReverseEvents(@dt_now DATETIME, @id_instances VARCHAR(4000), @lang_code INT = 840)
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
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering CanExecuteEventDeps'
GO
	ALTER PROCEDURE CanExecuteEventDeps (
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
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Altering CanReverseEventDeps'
GO
	ALTER PROCEDURE CanReverseEventDeps (
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
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO





IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
UPDATE
    [dbo].[t_sys_upgrade]
SET
    [dt_end_db_upgrade] = GETDATE(),
	[db_upgrade_status] = 'C'
where [dt_end_db_upgrade] is null 
		and [db_upgrade_status] = 'R'
 
PRINT 'The database update succeeded on'	 
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO