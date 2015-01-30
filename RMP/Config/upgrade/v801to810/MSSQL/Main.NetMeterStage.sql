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
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[t_svc_TranslationServDef]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[t_svc_TranslationServDef] ADD
[c_StartTime] [datetime] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[t_svc_TranslationDuplicate]'
GO
CREATE TABLE [dbo].[t_svc_TranslationDuplicate]
(
[id_source_sess] [binary] (16) NOT NULL,
[id_parent_source_sess] [binary] (16) NULL,
[id_external] [binary] (16) NULL,
[c_Account] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_Duration] [numeric] (22, 10) NULL,
[c_Language] [int] NULL,
[c_ConferenceID] [int] NULL,
[c_ConferenceName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c__IntervalID] [int] NULL,
[c__Resubmit] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c__TransactionCookie] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c__CollectionID] [binary] (16) NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Input to translation priceable item pipeline', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Reserved column. Collection identifier.', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c__CollectionID'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Reserved column. Interval identifier.', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c__IntervalID'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Reserved column. Can Service Definition be resubmitted?', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c__Resubmit'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Reserved column. Transaction Cookie.', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c__TransactionCookie'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Billable account for the session', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c_Account'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Unique ID for the conference', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c_ConferenceID'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Name of the conference', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c_ConferenceName'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Length of the conference (in minutes)', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c_Duration'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Language translated to', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationDuplicate', 'COLUMN', N'c_Language'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_addextendedproperty N'MS_Description', 'Time the conference started', 'SCHEMA', N'dbo', 'TABLE', N't_svc_TranslationServDef', 'COLUMN', N'c_StartTime'
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
