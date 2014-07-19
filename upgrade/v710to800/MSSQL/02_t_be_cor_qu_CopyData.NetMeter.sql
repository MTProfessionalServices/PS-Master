/*
Run this script on:

        (local).NetMeter    -  This database will be modified

to synchronize it with:

        10.200.86.158.NetMeter

You are recommended to back up your database before running this script

Script created by SQL Compare version 10.7.0 from Red Gate Software Ltd at 7/16/2014 2:47:43 AM

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
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', NULL, NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c__version'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CreationDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CustomDescription'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CustomIdentifier'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EndDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteID'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StartDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_UID'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_UpdateDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [dbo].[t_be_cor_qu_quotecontent]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quotecontent] DROP CONSTRAINT [FK11F4836B4018C0CD]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [dbo].[t_be_cor_qu_poforquote]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_poforquote] DROP CONSTRAINT [FK4D75E5624018C0CD]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [dbo].[t_be_cor_qu_accountforquote]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_accountforquote] DROP CONSTRAINT [FK72F3DB6E4018C0CD]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping foreign keys from [dbo].[t_be_cor_qu_quoteicb]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteicb] DROP CONSTRAINT [FK78CC1DCB4018C0CD]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[t_be_cor_qu_quoteheader]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteheader] DROP CONSTRAINT [PK__t_be_cor__CFDDFCDB959D2C36]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[t_be_cor_qu_quoteheader]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteheader] DROP CONSTRAINT [UQ__t_be_cor__8BE5C40C2E4827BF]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Rebuilding [dbo].[t_be_cor_qu_quoteheader]'
GO
CREATE TABLE [dbo].[tmp_rg_xx_t_be_cor_qu_quoteheader]
(
[c_QuoteHeader_Id] [uniqueidentifier] NOT NULL,
[c__version] [int] NOT NULL,
[c_internal_key] [uniqueidentifier] NOT NULL,
[c_CreationDate] [datetime] NULL,
[c_UpdateDate] [datetime] NULL,
[c_UID] [int] NULL,
[c_GroupSubscription] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_CorporateAccountId] [bigint] NULL,
[c_ReportLink] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_TotalTax] [decimal] (22, 10) NULL,
[c_Currency] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_FailedMessage] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_Localization] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_QuoteIdentifier] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_QuoteDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_EffectiveDate] [datetime] NULL,
[c_EffectiveEndDate] [datetime] NULL,
[c_IdQuote] [int] NOT NULL,
[c_TotalAmount] [decimal] (22, 10) NULL,
[c_ReportURL] [varbinary] (8000) NULL,
[c_Status] [int] NULL,
[c_StatusCleanup] [int] NULL,
[c_StatusReport] [int] NULL,
[c_AccountsInfo] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_POsInfo] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c_QuoteCreationDate] [datetime] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
INSERT INTO [dbo].[tmp_rg_xx_t_be_cor_qu_quoteheader]
  ([c_QuoteHeader_Id], [c__version], [c_internal_key], [c_CreationDate], [c_UpdateDate], [c_UID], [c_ReportLink], [c_QuoteIdentifier], [c_EffectiveDate], [c_EffectiveEndDate], [c_IdQuote],
   [c_ReportLink], [c_ReportContent], [c_Total], [c_TotalTax], [c_Currency], [c_BatchIDs], [c_FailedMessage],[c_Status]) 
  SELECT qh.[c_QuoteHeader_Id], qh.[c__version], qh.[c_internal_key], qh.[c_CreationDate], qh.[c_UpdateDate], qh.[c_UID], 
  qh.[c_CustomDescription], qh.[c_CustomIdentifier], qh.[c_EndDate], qh.[c_StartDate], qh.[c_QuoteID], 
  qc.[c_ReportLink],qc.[c_ReportContent],qc.[c_Total],qc.[c_TotalTax],qc.[c_Currency],qc.[c_BatchIDs],qc.[c_Status]
FROM [dbo].[t_be_cor_qu_quoteheader] qh inner join [dbo].[t_be_cor_qu_quotecontent] qc on qh.[c_QuoteHeader_Id] = qc.[c_QuoteHeader_Id]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
DROP TABLE [dbo].[t_be_cor_qu_quoteheader]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_rename N'[dbo].[tmp_rg_xx_t_be_cor_qu_quoteheader]', N't_be_cor_qu_quoteheader'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__t_be_cor__CFDDFCDB2C259D79] on [dbo].[t_be_cor_qu_quoteheader]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteheader] ADD PRIMARY KEY CLUSTERED  ([c_QuoteHeader_Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[t_be_cor_qu_quoteheader]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteheader] ADD UNIQUE NONCLUSTERED  ([c_internal_key])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[t_be_cor_qu_poforquote]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_poforquote] ADD CONSTRAINT [FK4D75E5624018C0CD] FOREIGN KEY ([c_QuoteHeader_Id]) REFERENCES [dbo].[t_be_cor_qu_quoteheader] ([c_QuoteHeader_Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[t_be_cor_qu_accountforquote]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_accountforquote] ADD CONSTRAINT [FK72F3DB6E4018C0CD] FOREIGN KEY ([c_QuoteHeader_Id]) REFERENCES [dbo].[t_be_cor_qu_quoteheader] ([c_QuoteHeader_Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'General data for quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', NULL, NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Version of Business Model Entity', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c__version'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'String for display accounts in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_AccountsInfo'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Corporate AccountId for group subscription', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CorporateAccountId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date of creation Business Model Entity', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_CreationDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Currency of quote amount', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Currency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date the quote is started', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EffectiveDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date the quote is finished.', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_EffectiveEndDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Error message', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_FailedMessage'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Indicates then quote is generated for group subscription', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_GroupSubscription'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Quoute number. Should be unique.', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_IdQuote'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Localization', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Localization'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'String for display POs in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_POsInfo'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', '', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteCreationDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Custom description', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteDescription'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Description of quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_QuoteIdentifier'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Link to PDF file with report', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_ReportLink'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'URL to quote report file', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_ReportURL'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - None
1 - In progress
2 - Failed
3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_Status'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - None
1 - In progress
2 - Failed
3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StatusCleanup'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', '0 - Skipped
1 - In progress
2 - Failed
3 - Completed', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_StatusReport'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Total sum of charges in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_TotalAmount'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Total sum of taxes in quote', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_TotalTax'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'User Id', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_UID'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Date of update Business Model Entity', 'SCHEMA', N'dbo', 'TABLE', N't_be_cor_qu_quoteheader', 'COLUMN', N'c_UpdateDate'
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
