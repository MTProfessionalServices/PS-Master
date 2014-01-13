if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddSecond]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AddSecond]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CSVToInt]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[CSVToInt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckEBCRCycleTypeCompatibility]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[CheckEBCRCycleTypeCompatibility]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckGroupMembershipCycleConstraint]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[CheckGroupMembershipCycleConstraint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckGroupMembershipEBCRConstraint]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[CheckGroupMembershipEBCRConstraint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckGroupReceiverEBCRConstraint]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[CheckGroupReceiverEBCRConstraint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ConvertIntegerToUID]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[ConvertIntegerToUID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ConvertUIDToInteger]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[ConvertUIDToInteger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeriveEBCRCycle]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[DeriveEBCRCycle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DoesAccountHavePayees]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[DoesAccountHavePayees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EnclosedDateRange]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[EnclosedDateRange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetCurrentIntervalID]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[GetCurrentIntervalID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEventExecutionDeps]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[GetEventExecutionDeps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEventReversalDeps]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[GetEventReversalDeps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsAccountAndPOSameCurrency]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsAccountAndPOSameCurrency]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsAccountBillable]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsAccountBillable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsAccountFolder]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsAccountFolder]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsAccountPayingForOthers]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsAccountPayingForOthers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsActive]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsActive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsArchived]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsArchived]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsBillingCycleUpdateProhibitedByGroupEBCR]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsBillingCycleUpdateProhibitedByGroupEBCR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsClosed]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsClosed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsCorporateAccount]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsCorporateAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsInSameCorporateAccount]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsInSameCorporateAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsInVisableState]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsInVisableState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsIntervalOpen]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsIntervalOpen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsPendingFinalBill]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsPendingFinalBill]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsSuspended]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsSuspended]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LookupAccount]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[LookupAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTComputeEffectiveBeginDate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTComputeEffectiveBeginDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTComputeEffectiveEndDate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTComputeEffectiveEndDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTDateInRange]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTDateInRange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTEndOfDay]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTEndOfDay]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTHexFormat]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTHexFormat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTMaxDate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTMaxDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTMaxOfTwoDates]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTMaxOfTwoDates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTMinDate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTMinDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTMinOfTwoDates]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTMinOfTwoDates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTRateScheduleScore]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTRateScheduleScore]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTStartOfDay]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MTStartOfDay]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageQueueLength]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[MessageQueueLength]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NextDateAfterBillingCycle]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[NextDateAfterBillingCycle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OverlappingDateRange]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[OverlappingDateRange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[POContainsBillingCycleRelative]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[POContainsBillingCycleRelative]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[POContainsDiscount]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[POContainsDiscount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[POContainsOnlyAbsoluteRates]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[POContainsOnlyAbsoluteRates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubtractSecond]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[SubtractSecond]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WarnOnEBCRMemberStartDateChange]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[WarnOnEBCRMemberStartDateChange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WarnOnEBCRStartDateChange]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[WarnOnEBCRStartDateChange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[checksubscriptionconflicts]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[checksubscriptionconflicts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mtconcat]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[mtconcat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[poConstrainedCycleType]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[poConstrainedCycleType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Abandon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Abandon]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AcknowledgeCheckpoint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AcknowledgeCheckpoint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddAccToHierarchy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddAccToHierarchy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddAccountToGroupSub]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddAccountToGroupSub]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCalendarHoliday]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCalendarHoliday]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCalendarPeriod]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCalendarPeriod]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCalendarWeekday]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCalendarWeekday]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCounterInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCounterInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCounterParam]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCounterParam]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCounterParamPredicate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCounterParamPredicate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCounterParamType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCounterParamType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddCounterType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddCounterType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddICBMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddICBMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddMemberToRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddMemberToRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddNewAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddNewAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddNewSub]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddNewSub]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddOwnedFolder]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddOwnedFolder]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddServiceEndpoint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddServiceEndpoint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddServiceEndpointIDMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AddServiceEndpointIDMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AdjustGsubMemberDates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AdjustGsubMemberDates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AdjustSubDates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AdjustSubDates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Analyze]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Analyze]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ApprovePayments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ApprovePayments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Backout]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Backout]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BulkSubscriptionChange]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BulkSubscriptionChange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CanBulkSubscribe]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CanBulkSubscribe]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CanExecuteEvents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CanExecuteEvents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CanReverseEvents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CanReverseEvents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CancelSubmittedEvent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CancelSubmittedEvent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckAccountCreationBusinessRules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckAccountCreationBusinessRules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckAccountStateDateRules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckAccountStateDateRules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckForNotArchivedDescendents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckForNotArchivedDescendents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckForNotClosedDescendents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckForNotClosedDescendents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckGroupSubBusinessRules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckGroupSubBusinessRules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CloneSecurityPolicy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CloneSecurityPolicy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ConnectServiceEndpoint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ConnectServiceEndpoint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateAccountStateRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateAccountStateRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateAdjustmentTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateAdjustmentTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateAdjustmentType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateAdjustmentType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateCalculationFormula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateCalculationFormula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateCompositeAdjustmentDetails]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateCompositeAdjustmentDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateCompositeAdjustmentType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateCompositeAdjustmentType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateCounterPropDef]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateCounterPropDef]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateGSubMemberRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateGSubMemberRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateGroupSubscription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateGroupSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreatePaymentRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreatePaymentRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreatePaymentRecordBitemporal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreatePaymentRecordBitemporal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateReportingDB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateReportingDB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateSubscriptionRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateSubscriptionRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateTestRecurringEventInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateTestRecurringEventInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateUsageIntervals]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateUsageIntervals]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CreateUsageIntervalsForAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreateUsageIntervalsForAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Dearchive_account]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Dearchive_account]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DelPVRecordsForAcct]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DelPVRecordsForAcct]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteAccounts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteAccounts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteBaseProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteBaseProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteCounterParamInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteCounterParamInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteCounterParamTypes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteCounterParamTypes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteDescription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteDescription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteProductViewRecords]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteProductViewRecords]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteSourceData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteSourceData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteTemplate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteTemplate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DetermineExecutableEvents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DetermineExecutableEvents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DetermineReversibleEvents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DetermineReversibleEvents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DropAdjustmentTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DropAdjustmentTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DropAndCreateAdjustmentTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DropAndCreateAdjustmentTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ExecSpProcOnKind]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ExecSpProcOnKind]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ExtendedUpsert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ExtendedUpsert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FailZombieRecurringEvents]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[FailZombieRecurringEvents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GenerateAdjustmentTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GenerateAdjustmentTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetBalances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetBalances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetBalances_Datamart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetBalances_Datamart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetCurrentID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetCurrentID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetDatabaseVersionInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetDatabaseVersionInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetIdBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetIdBlock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLastBalance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLastBalance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLocalizedSiteInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLocalizedSiteInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetMetaDataForProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetMetaDataForProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetPCViewHierarchy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPCViewHierarchy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetRateSchedules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetRateSchedules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GrantAllCapabilityToAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GrantAllCapabilityToAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HardCloseUsageIntervals]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[HardCloseUsageIntervals]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertAcctToIntervalMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertAcctToIntervalMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertAcctUsageWithUID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertAcctUsageWithUID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertAuditEvent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertAuditEvent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertBaseProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertBaseProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertChargeProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertChargeProperty]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertDefaultTariff]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertDefaultTariff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertEnumData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertEnumData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertIntoQueryLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertIntoQueryLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertMeteredBatch]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertMeteredBatch]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertProductView]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertProductView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertProductViewProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertProductViewProperty]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertUsageCycleInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertUsageCycleInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertUsageIntervalInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertUsageIntervalInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstantiateScheduledEvent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InstantiateScheduledEvent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsAccBillableNPayingForOthers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[IsAccBillableNPayingForOthers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTSP_INSERTINVOICE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MTSP_INSERTINVOICE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTSP_INSERTINVOICE_BALANCES]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MTSP_INSERTINVOICE_BALANCES]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTSP_INSERTINVOICE_DEFLTINVNUM]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MTSP_INSERTINVOICE_DEFLTINVNUM]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MTSP_RATE_AGGREGATE_CHARGE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MTSP_RATE_AGGREGATE_CHARGE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MT_SYS_ANALYZE_ALL_TABLES]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MT_SYS_ANALYZE_ALL_TABLES]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MarkEventAsFailed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MarkEventAsFailed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MarkEventAsNotYetRun]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MarkEventAsNotYetRun]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MarkEventAsSucceeded]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MarkEventAsSucceeded]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ModifyBatchStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ModifyBatchStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MoveAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MoveAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OpenUsageInterval]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[OpenUsageInterval]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PIResolutionByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PIResolutionByID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PIResolutionByName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PIResolutionByName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PopFirstMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PopFirstMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PropagateProperties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PropagateProperties]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PurgeAuditTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PurgeAuditTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReRunAbandon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReRunAbandon]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReRunAnalyze]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReRunAnalyze]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReRunCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReRunCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReRunIdentifyCompounds]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReRunIdentifyCompounds]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReRunRollback]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReRunRollback]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveAdjustmentTypeProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveAdjustmentTypeProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveCompositeAdjustmentDetails]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveCompositeAdjustmentDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveCounterInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveCounterInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveCounterPropDef]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveCounterPropDef]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveGroupSubMember]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveGroupSubMember]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveGroupSubscription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveGroupSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveMemberFromRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveMemberFromRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveServiceEndpointIDMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveServiceEndpointIDMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveSubscription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RemoveSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RetrieveEnumCode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RetrieveEnumCode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReversePayments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReversePayments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reverse_UpdStateFromClosedToArchived]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Reverse_UpdStateFromClosedToArchived]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reverse_UpdateStateFromClosedToPFB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Reverse_UpdateStateFromClosedToPFB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reverse_UpdateStateFromPFBToClosed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Reverse_UpdateStateFromPFBToClosed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reverse_UpdateStateRecordSet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Reverse_UpdateStateRecordSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SelectAccountsToBeDeleted]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SelectAccountsToBeDeleted]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedDeleteAccountOwnership]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedDeleteAccountOwnership]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedDeleteGsubRecur]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedDeleteGsubRecur]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedInsertAccountOwnership]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedInsertAccountOwnership]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedInsertGsubRecur]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedInsertGsubRecur]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedUpsertAccountOwnership]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedUpsertAccountOwnership]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequencedUpsertGsubRecur]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SequencedUpsertGsubRecur]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetTariffs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetTariffs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SoftCloseUsageIntervals]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SoftCloseUsageIntervals]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubmitEventForExecution]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SubmitEventForExecution]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubmitEventForReversal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SubmitEventForReversal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UnacknowledgeCheckpoint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UnacknowledgeCheckpoint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UndoAccounts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UndoAccounts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdStateFromClosedToArchived]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdStateFromClosedToArchived]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateAccountState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateAccountState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateBaseProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateBaseProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateBatchStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateBatchStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateCounterInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateCounterInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateCounterPropDef]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateCounterPropDef]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateDataForEnumToString]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateDataForEnumToString]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateDataForStringToEnum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateDataForStringToEnum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateGroupSubMembership]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateGroupSubMembership]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateGroupSubscription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateGroupSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateMeteredCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateMeteredCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdatePaymentRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdatePaymentRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateProductViewProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateProductViewProperty]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateProductViewPropertyFromName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateProductViewPropertyFromName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateServiceEndpointConnection]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateServiceEndpointConnection]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateServiceEndpointDates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateServiceEndpointDates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateServiceEndpointIDMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateServiceEndpointIDMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateStateFromClosedToPFB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateStateFromClosedToPFB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateStateFromPFBToClosed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateStateFromPFBToClosed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateStateRecordSet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateStateRecordSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpsertDescription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpsertDescription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpsertListener]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpsertListener]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpsertPipeline]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpsertPipeline]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[account_bucket_mapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[account_bucket_mapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[addsubscriptionbase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[addsubscriptionbase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[archive_delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[archive_delete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[archive_export]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[archive_export]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[archive_queue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[archive_queue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[archive_trash]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[archive_trash]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[copytemplate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[copytemplate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[databaseproperties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[databaseproperties]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dearchive_files]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dearchive_files]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mtsp_BackoutInvoices]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[mtsp_BackoutInvoices]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[refreshdatamart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[refreshdatamart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[resubmit]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[resubmit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DeletePricelist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeletePricelist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DeleteRateSchedule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeleteRateSchedule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertAtomicCapType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertAtomicCapType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertBaseProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertBaseProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertCapabilityInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertCapabilityInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertCompositeCapType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertCompositeCapType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertPolicy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertPolicy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[updatesub]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[updatesub]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_ADJUSTMENT_DETAILS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_ADJUSTMENT_DETAILS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_NOTDELETED_ADJUSTMENT_DETAILS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_NOTDELETED_ADJUSTMENT_DETAILS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_ADJUSTMENT_SUMMARY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_ADJUSTMENT_SUMMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_ADJUSTMENT_SUMMARY_DATAMART]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_ADJUSTMENT_SUMMARY_DATAMART]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_AJ_INFO]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_AJ_INFO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_allrateschedules]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_allrateschedules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_pilookup]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_pilookup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_VW_ACCTRES]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[T_VW_ACCTRES]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_VW_EFFECTIVE_SUBS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[T_VW_EFFECTIVE_SUBS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_allrateschedules_po]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_allrateschedules_po]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_allrateschedules_po_icb]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_allrateschedules_po_icb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_allrateschedules_po_noicb]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_allrateschedules_po_noicb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_expanded_sub]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_expanded_sub]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_rc_arrears_fixed]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_rc_arrears_fixed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_rc_arrears_relative]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_rc_arrears_relative]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_VW_I_ACCTRES]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[T_VW_I_ACCTRES]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_allrateschedules_pl]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_allrateschedules_pl]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_AR_ACC_MAPPER]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_AR_ACC_MAPPER]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_HIERARCHYNAME]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_HIERARCHYNAME]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_MPS_ACC_MAPPER]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_MPS_ACC_MAPPER]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_MPS_OR_SYSTEM_HIERARCHYNAME]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_MPS_OR_SYSTEM_HIERARCHYNAME]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[t_vw_base_props]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[t_vw_base_props]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_mps_or_system_acc_mapper]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_mps_or_system_acc_mapper]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function AddSecond(@RefDate datetime) returns datetime 

				as

				begin

				 return (dateadd(s,1,@RefDate))

				end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE FUNCTION CSVToInt (@array VARCHAR(4000)) 

RETURNS @IntTable TABLE (value INT)

AS

BEGIN
  DECLARE @separator CHAR(1)

  SET @separator = ','



	DECLARE @separator_position INT 

	DECLARE @array_value VARCHAR(100) 

	

	SET @array = @array + ','

	

	WHILE PATINDEX('%,%' , @array) <> 0 

	BEGIN

	  SELECT @separator_position = PATINDEX('%,%' , @array)
	  SELECT @array_value = LEFT(@array, @separator_position - 1)

	

		INSERT @IntTable

		VALUES (CAST(@array_value AS INT))



	  SELECT @array = STUFF(@array, 1, @separator_position, '')

	END



	RETURN

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		

CREATE FUNCTION CheckEBCRCycleTypeCompatibility

  (@EBCRCycleType INT, @OtherCycleType INT)

RETURNS INT 

BEGIN

  -- checks weekly based cycle types

  IF (((@EBCRCycleType = 4) OR (@EBCRCycleType = 5)) AND

      ((@OtherCycleType = 4) OR (@OtherCycleType = 5)))

    RETURN 1   -- success



  -- checks monthly based cycle types

  IF (((@EBCRCycleType = 1) OR (@EBCRCycleType = 7) OR (@EBCRCycleType = 8)) AND

      ((@OtherCycleType = 1) OR (@OtherCycleType = 7) OR (@OtherCycleType = 8)))

    RETURN 1   -- success



  RETURN 0     -- failure

END

		
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE FUNCTION CheckGroupMembershipCycleConstraint

(

  @dt_now DATETIME, -- system date

  @id_group INT     -- group ID to check

)

RETURNS INT  -- 1 for success, otherwise negative decimal error code 

AS

BEGIN



  -- this function enforces the business rule given in CR9906

  -- a group subscription to a PO containing a BCR priceable item

  -- should only have member's with payers that have a usage cycle

  -- that matches the one specified by the group subscription.

  -- at any point in time, this cycle consistency should hold true. 



  -- looks up the PO the group is subscribed to

  DECLARE @id_po INT

  SELECT @id_po = sub.id_po

  FROM t_group_sub gs

  INNER JOIN t_sub sub ON sub.id_group = gs.id_group

  WHERE gs.id_group = @id_group



  -- this check only applies to PO's that contain a BCR priceable item

  IF dbo.POContainsBillingCycleRelative(@id_po) = 1 -- true

  BEGIN

    

    -- attempts to find a usage cycle mismatch for the member's payers of the group sub

    -- ideally there should be none

    DECLARE @violator INT

    SELECT TOP 1 @violator = gsm.id_acc

    FROM t_gsubmember gsm

    INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group

    INNER JOIN t_sub sub ON sub.id_group = gs.id_group

    INNER JOIN t_payment_redirection payer ON 

      payer.id_payee = gsm.id_acc AND

      -- checks all payer's who overlap with the group sub

      payer.vt_end >= sub.vt_start AND

      payer.vt_start <= sub.vt_end

    INNER JOIN t_acc_usage_cycle auc ON

      auc.id_acc = payer.id_payer AND

      -- cycle mismatch

      auc.id_usage_cycle <> gs.id_usage_cycle

    WHERE 

      -- checks only the requested group

      gs.id_group = @id_group AND

      -- only consider current or future group subs

      -- don't worry about group subs in the past

      ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR

       (sub.vt_start > @dt_now))



    IF @@rowcount > 0

      -- MT_GROUP_SUB_MEMBER_CYCLE_MISMATCH

      RETURN -486604730

  END

  

  -- success

  RETURN 1

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


  

CREATE FUNCTION CheckGroupMembershipEBCRConstraint

(

  @dt_now DATETIME, -- system date

  @id_group INT     -- group ID to check

)

RETURNS INT  -- 1 for success, negative HRESULT for failure

AS

BEGIN



  -- checks to see if a group subscription and all of its

  -- members comply with EBCR payer cycle constraints:

  --   1) that for a member, all of its payers have the same billing cycle

  --   2) that this billing cycle is EBCR compatible.



  DECLARE @results TABLE 

  (

    id_acc INT, -- member account (payee)

    id_usage_cycle INT, -- payer's cycle

    b_compatible INT -- EBCR compatibility: 1 or 0

  )



  -- checks group member's payers

  INSERT INTO @results

  SELECT 

    pay.id_payee,

    payercycle.id_usage_cycle,

    dbo.CheckEBCRCycleTypeCompatibility(payercycle.id_cycle_type, rc.id_cycle_type)

  FROM t_gsubmember gsm

  INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group

  INNER JOIN t_sub sub ON sub.id_group = gs.id_group

  INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po

  INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

  INNER JOIN t_payment_redirection pay ON 

    pay.id_payee = gsm.id_acc AND

    -- checks all payer's who overlap with the group sub

    pay.vt_end >= sub.vt_start AND

    pay.vt_start <= sub.vt_end

  INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = pay.id_payer

  INNER JOIN t_usage_cycle payercycle ON payercycle.id_usage_cycle = auc.id_usage_cycle

  WHERE 

    rc.tx_cycle_mode = 'EBCR' AND

    rc.b_charge_per_participant = 'Y' AND

    gs.id_group = @id_group AND

    plmap.id_paramtable IS NULL AND

    -- TODO: it would be better if we didn't consider subscriptions that ended

    --       in a hard closed interval so that retroactive changes would be properly guarded.

    -- only consider current or future group subs

    -- don't worry about group subs in the past

    ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR

     (sub.vt_start > @dt_now))



  -- checks that members' payers are compatible with the EBCR cycle type

  IF EXISTS 

  (

    SELECT NULL

    FROM @results

    WHERE b_compatible = 0

  )

    RETURN -289472443 -- MTPCUSER_EBCR_CYCLE_CONFLICTS_WITH_PAYER_OF_MEMBER



  -- checks for each member there is only one payer cycle across all payers

  IF EXISTS

  (

    SELECT NULL

    FROM @results r

    INNER JOIN @results r2 ON r2.id_acc = r.id_acc AND

                              r2.id_usage_cycle <> r.id_usage_cycle

  )

    RETURN -289472442 -- MTPCUSER_EBCR_MEMBERS_CONFLICT_WITH_EACH_OTHER



  RETURN 1 -- success

END

  
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


  

CREATE FUNCTION CheckGroupReceiverEBCRConstraint

(

  @dt_now DATETIME, -- system date

  @id_group INT     -- group ID to check

)

RETURNS INT  -- 1 for success, negative HRESULT for failure

AS

BEGIN

  -- checks to see if a group subscription and all of its'

  -- receivers' payers comply with the EBCR payer cycle constraints:

  -- 1) that all receivers' payers must have the same billing cycle

  -- 2) that billing cycle must be EBCR compatible.



  DECLARE @results TABLE 

  (

    id_acc INT, -- receiver account

    id_usage_cycle INT, -- payer's cycle

    b_compatible INT -- EBCR compatibility: 1 or 0

  )



  -- store intermediate results away for later use since different groupings will need to be made

  INSERT INTO @results

  SELECT gsrm.id_acc, payercycle.id_usage_cycle, dbo.CheckEBCRCycleTypeCompatibility(payercycle.id_cycle_type, rc.id_cycle_type)

  FROM t_gsub_recur_map gsrm

  INNER JOIN t_group_sub gs ON gs.id_group = gsrm.id_group

  INNER JOIN t_sub sub ON sub.id_group = gs.id_group

  INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po AND

                               plmap.id_pi_instance = gsrm.id_prop

  INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

  INNER JOIN t_payment_redirection payer ON 

    payer.id_payee = gsrm.id_acc AND

    -- checks all payer's who overlap with the group sub

    payer.vt_end >= sub.vt_start AND

    payer.vt_start <= sub.vt_end

  INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = payer.id_payer

  INNER JOIN t_usage_cycle payercycle ON payercycle.id_usage_cycle = auc.id_usage_cycle

  WHERE 

    rc.tx_cycle_mode = 'EBCR' AND

    rc.b_charge_per_participant = 'N' AND

    -- checks only the requested group

    gs.id_group = @id_group AND

    plmap.id_paramtable IS NULL AND

    -- only consider receivers based on wall-clock transaction time

    @dt_now BETWEEN gsrm.tt_start AND gsrm.tt_end AND

    -- TODO: it would be better if we didn't consider subscriptions that ended

    --       in a hard closed interval so that retroactive changes would be properly guarded.

    -- only consider current or future group subs

    -- don't worry about group subs in the past
    ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR

     (sub.vt_start > @dt_now))



  -- checks that receivers' payers are compatible with the EBCR cycle type

  IF EXISTS 

  (

    SELECT NULL

    FROM @results

    WHERE b_compatible = 0

    GROUP BY id_acc

  )

    RETURN -289472441 -- MTPCUSER_EBCR_CYCLE_CONFLICTS_WITH_PAYER_OF_RECEIVER





  -- checks that only one payer cycle was found

  DECLARE @count INT

  SELECT @count = COUNT(*)

  FROM

  ( 

    SELECT 1 a

    FROM @results

    GROUP BY id_usage_cycle 

  ) cycles

  IF (@count > 1)

    RETURN -289472440 -- MTPCUSER_EBCR_RECEIVERS_CONFLICT_WITH_EACH_OTHER



  RETURN 1 -- success

END

  
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

	CREATE  function ConvertIntegerToUID(@id_sess integer) returns varbinary(16)

	as

	begin

		declare @uid varbinary(16)

		set @uid = cast(@id_sess % 256 as varbinary(1)) +

			   cast((@id_sess/256) % 256 as varbinary(1)) +

			   cast((@id_sess/65536) % 256 as varbinary(1)) +

			   cast((@id_sess/16777216) % 256 as varbinary(1)) 

		return @uid



	end

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

	CREATE  function ConvertUIDToInteger (@UID varbinary(16)) returns int

	as

	begin

	declare @intID int

	set @intID = cast(substring(@UID, 1, 1) as integer) |

		cast(substring(@UID, 2, 1) as integer) * 256 |

		cast(substring(@UID, 3, 1) as integer) * 65536 | 

		cast(substring(@UID, 4, 1) as integer) * 16777216

	return @intID

	end



    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		

CREATE FUNCTION DeriveEBCRCycle 

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

      -- only Quarterly and Annual billing cycle types are legal for this case

      IF (@usageCycleType NOT IN (7, 8))

         RETURN -3 -- ERROR: unsupported EBCR cycle combination



      -- the usage cycle type is either Quarterly or Annual

      -- both of which use the same start_day property

      SELECT @startDay = start_day

      FROM t_usage_cycle uc

      WHERE uc.id_usage_cycle = @usageCycle



      -- translates the start day to an end day since Monthly cycle types

      -- use end days and Quarterly and Annual cycle types use start days

      IF (@startDay > 27) -- wraps around to EOM

        SET @endDay = 27

      ELSE

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

         SELECT @endDay = day_of_month

         FROM t_usage_cycle uc

         WHERE uc.id_usage_cycle = @usageCycle



         -- infers the start month from the subscription start date   

         SELECT @startMonth = DATEPART(month, @subStart)



         -- translates the end day to a start day since Monthly cycle types

         -- use end days and Quarterly and Annual cycle types use start days

         SET @startDay = @endDay + 1



         -- wraps to beginning of month

         -- NOTE: it is important to have the start date of the EBCR cycle

         -- come after the sub start date so that certain RC charges 

         -- are generated.

         IF (@startDay > 31)

         BEGIN 

            SET @startDay = 1 

            SET @startMonth = @startMonth + 1



            IF (@startMonth > 12)

              SET @startMonth = 1

         END

  

         -- KLUDGE: it is impossible to align to a Monthly ending on 27th billing cycle

         -- because Quartery EOM does not exist. Instead the derived cycle will end on

         -- the 26th (one day off).

         IF (@startDay > 27)

           SET @startDay = 27



         -- reduces start month to a value between 1 and 3 since there are

         -- really only 3 months of quarterly cycles:

         -- Original Month: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

         --                   1   2   3   4   5   6   7   8   9  10  11  12

         -- Reduced Month:    1   2   3   1   2   3   1   2   3   1   2   3

         SET @startMonth = @startMonth % 3

         IF (@startMonth = 0)

            SET @startMonth = 3 

      END

      -- Annual billing cycle type

      ELSE IF (@usageCycleType = 8)

      BEGIN

         SELECT 

            @startDay = start_day,

            @startMonth = start_month

         FROM t_usage_cycle uc

         WHERE uc.id_usage_cycle = @usageCycle



         -- annual start days can occur in the range [1 - 31] while Quarterly start days

         -- only occur in [1 - 27, 31]. the start date will be translated to the 27th

         IF (@startDay > 27) 

            SET @startDay = 27

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

         SELECT @endDay = day_of_month

         FROM t_usage_cycle uc

         WHERE uc.id_usage_cycle = @usageCycle



         -- translates the end day to a start day since Monthly cycle types

         -- use end days and Quarterly and Annual cycle types use start days

         SET @startDay = @endDay + 1



         -- infers the start month from the subscription start date   

         SET @startMonth = DATEPART(month, @subStart)



         -- wraps to beginning of the next month

         -- NOTE: it is important to have the start date of the EBCR cycle

         -- come after the sub start date so that certain RC charges 

         -- are generated.

         IF (@startDay > 31)

         BEGIN 

            SET @startDay = 1 

            SET @startMonth = @startMonth + 1



            IF (@startMonth > 12)

              SET @startMonth = 1

         END



      END   



      -- Quarterly billing cycle type

      ELSE IF (@usageCycleType = 7)

      BEGIN

         SELECT 

            @startDay = start_day,

            @startMonth = start_month  

         FROM t_usage_cycle uc

         WHERE uc.id_usage_cycle = @usageCycle

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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function DoesAccountHavePayees(@id_acc int,@dt_ref datetime) 

				returns varchar

				as

        begin

				declare @returnValue char(1)

				SELECT @returnValue = CASE WHEN count(*) > 0 THEN 'Y' ELSE 'N' END

				FROM t_payment_redirection

				WHERE id_payer = @id_acc and

				((@dt_ref between vt_start and vt_end) OR @dt_ref < vt_start)

				if (@returnValue is null)

					begin

					select @returnValue = 'N'

					end

				return @returnValue

				end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function EnclosedDateRange(@dt_start datetime,

	      @dt_end datetime,

  			@dt_checkstart datetime,

				@dt_checkend datetime) returns int

				as

				begin

        declare @test as int

				 -- check if the range specified by temp_dt_checkstart and

				 -- temp_dt_checkend is completely inside the range specified

				 -- by temp_dt_start, temp_dt_end

				if (@dt_checkstart >= @dt_start AND @dt_checkend <= @dt_end ) 

					begin

			    select @test=1

			    end

        else

					begin

          select @test=0

				  end

        return(@test)

        end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create function GetCurrentIntervalID (@aDTNow datetime, @aDTSession datetime, @aAccountID int) returns int

		as

		begin

      declare @retVal as int

      SELECT  @retVal =  id_usage_interval FROM  t_acc_usage_interval aui  

         INNER JOIN t_usage_interval ui ON ui.id_interval = aui.id_usage_interval

         WHERE ui.tx_interval_status IN ('N', 'O') AND

 		     @aDTSession BETWEEN ui.dt_start AND ui.dt_end AND

	      ((aui.dt_effective IS NULL) OR (aui.dt_effective <= @aDTNow))

        AND aui.id_acc = @aAccountID

      return @retVal

    end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE FUNCTION GetEventExecutionDeps(@dt_now DATETIME, @id_instances VARCHAR(4000))

RETURNS @deps TABLE

(

  id_orig_event INT NOT NULL,

  id_orig_instance INT NOT NULL,

  tx_orig_name VARCHAR(255) NOT NULL, -- useful for debugging

  tx_name nvarchar(255) NOT NULL,      -- useful for debugging

  id_event INT NOT NULL,

  id_instance INT,

  id_arg_interval INT,

  dt_arg_start DATETIME,

  dt_arg_end DATETIME,

  tx_status VARCHAR(14)

)

AS

BEGIN



  DECLARE @args TABLE

  ( 

    id_instance INT NOT NULL

  )

  

  -- builds up a table from the comma separated list of instance IDs

  -- if the list is null, then add all ReadyToRun instances

  IF (@id_instances IS NOT NULL)

  BEGIN

    INSERT INTO @args

    SELECT value FROM CSVToInt(@id_instances)

  END

  ELSE

  BEGIN

    INSERT INTO @args

    SELECT id_instance 

    FROM t_recevent_inst

    WHERE tx_status = 'ReadyToRun'

  END





  DECLARE @instances TABLE

  (

    id_event INT NOT NULL,

    tx_type VARCHAR(11) NOT NULL,

    tx_name nvarchar(255) NOT NULL,

    id_instance INT NOT NULL,

    id_arg_interval INT,

    dt_arg_start DATETIME,

    dt_arg_end DATETIME

  )



  --

  -- inserts all active 'ReadyToRun' instances or the instance ID's passed in

  --

  INSERT INTO @instances

  SELECT

    evt.id_event,

    evt.tx_type,

    evt.tx_name,

    inst.id_instance,

    inst.id_arg_interval,

    -- in the case of EOP then, use the interval's start date

    CASE WHEN evt.tx_type = 'Scheduled' THEN inst.dt_arg_start ELSE intervals.dt_start END,

    -- in the case of EOP then, use the interval's end date

    CASE WHEN evt.tx_type = 'Scheduled' THEN inst.dt_arg_end ELSE intervals.dt_end END

  FROM t_recevent_inst inst

  INNER JOIN @args args ON args.id_instance = inst.id_instance

  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

  LEFT OUTER JOIN t_pc_interval intervals ON intervals.id_interval = inst.id_arg_interval

  WHERE

    -- event is active

    evt.dt_activated <= @dt_now AND

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated)



  --

  -- inserts EOP to EOP dependencies

  --

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,

    depinst.id_instance,

    depinst.id_arg_interval,

    NULL,

    NULL,

    CASE WHEN inst.id_instance = depinst.id_instance THEN

      -- treats the identity dependency as successful

      'Succeeded'

    ELSE

      depinst.tx_status

    END

  FROM @instances inst

  INNER JOIN t_recevent_dep dep ON dep.id_event = inst.id_event

  INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_dependent_on_event

  INNER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

                                        depinst.id_arg_interval = inst.id_arg_interval

  WHERE

    -- dep event is active

    depevt.dt_activated <= @dt_now AND

    (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

    -- the original instance's event is root, EOP or a checkpoint event

    inst.tx_type IN ('Root', 'EndOfPeriod', 'Checkpoint') AND

    -- the dependency instance's event is an EOP or Checkpoint event

    depevt.tx_type IN ('EndOfPeriod', 'Checkpoint') 



--SELECT * FROM @deps  



  --

  -- inserts EOP cross-interval dependencies

  --

  INSERT INTO @deps

  SELECT 

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,

    depinst.id_instance,

    ui.id_interval,

    NULL,

    NULL,

    ISNULL(depinst.tx_status, 'Missing')

  FROM @instances inst

  INNER JOIN t_usage_interval ui ON ui.dt_end < inst.dt_arg_end

  CROSS JOIN 

  (

    -- returns the event dependencies of the end root event

    -- this event depends on all EOP events

    SELECT

      depevt.id_event,

      depevt.tx_name

    FROM t_recevent evt

    INNER JOIN t_recevent_dep dep ON dep.id_event = evt.id_event

    INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_dependent_on_event

    WHERE

      evt.tx_name = '_EndRoot' AND

      -- end root event is active

      evt.dt_activated <= @dt_now AND

      (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

      -- dep event is active

      depevt.dt_activated <= @dt_now AND

      (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

      -- the dependency instance's event is an EOP or Checkpoint event

      depevt.tx_type IN ('EndOfPeriod', 'Checkpoint') 

  ) depevt

  LEFT OUTER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

                                             depinst.id_arg_interval = ui.id_interval

  WHERE

    -- the original instance's event is root, EOP or a checkpoint event

    inst.tx_type IN ('Root', 'EndOfPeriod', 'Checkpoint') AND

    -- don't consider hard closed intervals

    ui.tx_interval_status <> 'H'





  --

  -- inserts scheduled dependencies (including complete missing instances)

  --

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,
    depinst.id_instance,

    NULL, -- id_arg_interval

    ISNULL(depinst.dt_arg_start, inst.dt_arg_start),

    ISNULL(depinst.dt_arg_end, inst.dt_arg_end),

    CASE WHEN inst.id_instance = depinst.id_instance THEN

      -- treats the identity dependency as successful

      'Succeeded'

    ELSE

      ISNULL(depinst.tx_status, 'Missing')

    END

  FROM @instances inst

  INNER JOIN t_recevent_dep dep ON dep.id_event = inst.id_event

  INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_dependent_on_event

  LEFT OUTER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

    -- enforce that the instance's dependency's start arg and end arg

    -- at least partially overlap with the original instance's start and end arguments

    depinst.dt_arg_start <= inst.dt_arg_end AND

    depinst.dt_arg_end >= inst.dt_arg_start

  WHERE

    -- dep event is active

    depevt.dt_activated <= @dt_now AND

    (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

    depevt.tx_type = 'Scheduled'



--SELECT * FROM @deps ORDER BY tx_orig_name ASC



  -- inserts partially missing scheduled dependency instances (start to min)

  -- covers the original instance's start date to the minimum start date

  -- of all scheduled instances of an event

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    missingdeps.tx_name,

    missingdeps.id_event,

    NULL, -- id_instance,

    NULL, -- id_arg_interval

    inst.dt_arg_start,

    dbo.SubtractSecond(missingdeps.dt_min_arg_start),

    'Missing' -- tx_status

  FROM @instances inst

  INNER JOIN

  (

    -- gets the minimum arg start date per scheduled event

    SELECT

      deps.id_orig_instance,

      deps.id_event,

      deps.tx_name,

      MIN(deps.dt_arg_start) dt_min_arg_start

    FROM @deps deps

    INNER JOIN t_recevent evt ON evt.id_event = deps.id_event

    WHERE

      evt.tx_type = 'Scheduled' AND

      deps.tx_status <> 'Missing'

    GROUP BY

      deps.id_orig_instance,

      deps.id_event,

      deps.tx_name

  ) missingdeps ON missingdeps.id_orig_instance = inst.id_instance

  WHERE

    -- only adds a missing instance if the minimum start date is too late

    missingdeps.dt_min_arg_start > inst.dt_arg_start 





--SELECT * FROM @deps ORDER BY tx_orig_name ASC



  -- inserts partially missing scheduled dependency instances (max to end)

  -- covers the maximum end date of all scheduled instances of an event to the

  -- original instance's end date

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    missingdeps.tx_name,

    missingdeps.id_event,

    NULL, -- id_instance,

    NULL, -- id_arg_interval

    dbo.AddSecond(missingdeps.dt_max_arg_end),

    inst.dt_arg_end,

    'Missing' -- tx_status

  FROM @instances inst

  INNER JOIN

  (

    -- gets the maximum arg end date per scheduled event

    SELECT

      deps.id_orig_instance,

      deps.id_event,

      deps.tx_name,

      MAX(deps.dt_arg_end) dt_max_arg_end

    FROM @deps deps

    INNER JOIN t_recevent evt ON evt.id_event = deps.id_event

    WHERE

      evt.tx_type = 'Scheduled' AND

      deps.tx_status <> 'Missing'

    GROUP BY

      deps.id_orig_instance,

      deps.id_event,

      deps.tx_name

  ) missingdeps ON missingdeps.id_orig_instance = inst.id_instance

  WHERE

    -- only adds a missing instance if the maximum end date is too early

    missingdeps.dt_max_arg_end < inst.dt_arg_end 



--SELECT * FROM @deps ORDER BY tx_orig_name ASC

  RETURN

END


      
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE FUNCTION GetEventReversalDeps(@dt_now DATETIME, @id_instances VARCHAR(4000))

RETURNS @deps TABLE

(

  id_orig_event INT NOT NULL,

  id_orig_instance INT NOT NULL,

  tx_orig_name VARCHAR(255) NOT NULL, -- useful for debugging

  tx_name nvarchar(255) NOT NULL,      -- useful for debugging

  id_event INT NOT NULL,

  id_instance INT,

  id_arg_interval INT,

  dt_arg_start DATETIME,

  dt_arg_end DATETIME,

  tx_status VARCHAR(14)

)

AS

BEGIN



  DECLARE @args TABLE

  ( 

    id_instance INT NOT NULL

  )

  

  -- builds up a table from the comma separated list of instance IDs

  -- if the list is null, then add all ReadyToReverse instances

  IF (@id_instances IS NOT NULL)

  BEGIN
    INSERT INTO @args

    SELECT value FROM CSVToInt(@id_instances)

  END

  ELSE

  BEGIN

    INSERT INTO @args

    SELECT id_instance 

    FROM t_recevent_inst

    WHERE tx_status = 'ReadyToReverse'

  END





  DECLARE @instances TABLE

  (

    id_event INT NOT NULL,

    tx_type VARCHAR(11) NOT NULL,

    tx_name nvarchar(255) NOT NULL,

    id_instance INT NOT NULL,

    id_arg_interval INT,

    dt_arg_start DATETIME,

    dt_arg_end DATETIME

  )



  --

  -- inserts all active instances found in @args

  --

  INSERT INTO @instances

  SELECT

    evt.id_event,

    evt.tx_type,

    evt.tx_name,

    inst.id_instance,

    inst.id_arg_interval,

    -- in the case of EOP then, use the interval's start date

    CASE WHEN evt.tx_type = 'Scheduled' THEN inst.dt_arg_start ELSE intervals.dt_start END,

    -- in the case of EOP then, use the interval's end date

    CASE WHEN evt.tx_type = 'Scheduled' THEN inst.dt_arg_end ELSE intervals.dt_end END

  FROM t_recevent_inst inst

  INNER JOIN @args args ON args.id_instance = inst.id_instance

  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

  LEFT OUTER JOIN t_pc_interval intervals ON intervals.id_interval = inst.id_arg_interval

  WHERE

    -- event is active

    evt.dt_activated <= @dt_now AND

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated)



  --

  -- inserts EOP to EOP dependencies

  --

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,

    depinst.id_instance,

    depinst.id_arg_interval,

    NULL,

    NULL,

    CASE WHEN inst.id_instance = depinst.id_instance THEN

      -- treats the identity dependency as NotYetRun

      'NotYetRun'

    ELSE

      depinst.tx_status

    END

  FROM @instances inst

  INNER JOIN t_recevent_dep dep ON dep.id_dependent_on_event = inst.id_event

  INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_event

  INNER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

                                        depinst.id_arg_interval = inst.id_arg_interval

  WHERE

    -- dep event is active

    depevt.dt_activated <= @dt_now AND

    (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

    -- the original instance's event is root, EOP or a checkpoint event

    inst.tx_type IN ('Root', 'EndOfPeriod', 'Checkpoint') AND

    -- the dependency instance's event is an EOP or Checkpoint event

    depevt.tx_type IN ('EndOfPeriod', 'Checkpoint') 



--SELECT * FROM @deps ORDER BY tx_orig_name ASC





  --

  -- inserts EOP cross-interval dependencies (every instance in future intervals)

  --

  INSERT INTO @deps

  SELECT 

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,

    depinst.id_instance,

    ui.id_interval,

    NULL,

    NULL,

    depinst.tx_status

  FROM @instances inst

  INNER JOIN t_usage_interval ui ON ui.dt_end > inst.dt_arg_end

  CROSS JOIN 

  (

    -- returns the event dependencies of the end root event

    -- this event depends on all EOP events

    SELECT

      depevt.id_event,

      depevt.tx_name

    FROM t_recevent evt

    INNER JOIN t_recevent_dep dep ON dep.id_event = evt.id_event

    INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_dependent_on_event

    WHERE

      evt.tx_name = '_EndRoot' AND

      -- end root event is active

      evt.dt_activated <= @dt_now AND

      (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

      -- dep event is active

      depevt.dt_activated <= @dt_now AND

      (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

      -- the dependency instance's event is an EOP or Checkpoint event

      depevt.tx_type IN ('EndOfPeriod', 'Checkpoint') 

  ) depevt

  INNER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

                                        depinst.id_arg_interval = ui.id_interval

  WHERE

    -- the original instance's event is root, EOP or a checkpoint event

    inst.tx_type IN ('Root', 'EndOfPeriod', 'Checkpoint')





  --

  -- inserts scheduled dependencies

  --

  INSERT INTO @deps

  SELECT

    inst.id_event,

    inst.id_instance,

    inst.tx_name,

    depevt.tx_name,

    depevt.id_event,

    depinst.id_instance,

    NULL, -- id_arg_interval

    ISNULL(depinst.dt_arg_start, inst.dt_arg_start),

    ISNULL(depinst.dt_arg_end, inst.dt_arg_end),

    CASE WHEN inst.id_instance = depinst.id_instance THEN

      -- treats the identity dependency as NotYetRun

      'NotYetRun'

    ELSE

      depinst.tx_status

    END

  FROM @instances inst

  INNER JOIN t_recevent_dep dep ON dep.id_dependent_on_event = inst.id_event

  INNER JOIN t_recevent depevt ON depevt.id_event = dep.id_event

  INNER JOIN t_recevent_inst depinst ON depinst.id_event = depevt.id_event AND

    -- enforce that the instance's dependency's start arg and end arg

    -- at least partially overlap with the original instance's start and end arguments

    depinst.dt_arg_start <= inst.dt_arg_end AND

    depinst.dt_arg_end >= inst.dt_arg_start

  WHERE

    -- dep event is active

    depevt.dt_activated <= @dt_now AND

    (depevt.dt_deactivated IS NULL OR @dt_now < depevt.dt_deactivated) AND

    depevt.tx_type = 'Scheduled'



--SELECT * FROM @deps ORDER BY tx_orig_name ASC

  RETURN

END


      
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create function IsAccountAndPOSameCurrency(@id_acc int, @id_po int) 

		returns varchar

		as

		begin 

		declare @sameCurrency char(1)

		select @sameCurrency = 

		CASE WHEN 

		(SELECT COUNT(id_po)  from t_pricelist pl

		inner join t_po po on po.id_nonshared_pl = pl.id_pricelist AND po.id_po = @id_po

		inner join t_av_internal av ON av.c_currency = pl.nm_currency_code AND av.id_acc = @id_acc

		) = 0

		THEN '0' ELSE '1' END

		return @sameCurrency

		end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function IsAccountBillable(@id_acc int) 

        returns varchar

		    as

        begin

	      declare @billableFlag as char(1)

		    select @billableFlag = c_billable  from t_av_internal where 

		    id_acc = @id_acc

		    if (@billableFlag is NULL) 

					begin

		      select @billableFlag = '0'

          end  

		    return (@billableFlag)

		    end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function IsAccountFolder(@id_acc int) 

				returns varchar

				as

				begin 

				declare @folderFlag char(1)

				select @folderFlag = c_folder  from t_av_internal where 

				id_acc = @id_acc

				if (@folderFlag is NULL)

					begin

					select @folderFlag = '0'

					end  

				return @folderFlag

				end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function IsAccountPayingForOthers(@id_acc int,@dt_ref datetime) 

				returns varchar

				as

        begin

				declare @returnValue char(1)

				SELECT @returnValue = CASE WHEN count(*) > 0 THEN 'Y' ELSE 'N' END

				FROM t_payment_redirection

				WHERE id_payer = @id_acc and

				-- this is the key difference between this and DoesAccountHavePayees

				id_payer <> id_payee and

				((@dt_ref between vt_start and vt_end) OR @dt_ref < vt_start)

				if (@returnValue is null)

					begin

					select @returnValue = 'N'

					end

				return @returnValue

				end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



                  create FUNCTION IsActive(@state varchar(2)) returns int

                  as

                  begin

                  declare @retval as int

	          if (@state = 'AC')

                        begin

		        select @retval = 1

                        end

	          else

                        begin

		        select @retval = 0

                        end 

	          return @retval

                  end

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



             CREATE FUNCTION IsArchived(@state varchar(2)) returns integer

             as

             begin

             declare @retval int

	     if (@state = 'AR')

                 begin
		 select @retval = 1

                 end

	     else

                 begin

		 select @retval = 0

	     end 

             return @retval

             end

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


  

CREATE FUNCTION IsBillingCycleUpdateProhibitedByGroupEBCR

(

  @dt_now DATETIME,

  @id_acc INT

)

RETURNS INT 

BEGIN



  -- checks if the account pays for a member of a group subscription

  -- associated with a Per Participant EBCR RC

  IF EXISTS 

  (

    SELECT NULL

    FROM t_gsubmember gsm

    INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group

    INNER JOIN t_sub sub ON sub.id_group = gs.id_group

    INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po

    INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

    INNER JOIN t_payment_redirection payer ON 

    payer.id_payee = gsm.id_acc AND

    -- checks all payer's who overlap with the group sub

    payer.vt_end >= sub.vt_start AND

    payer.vt_start <= sub.vt_end

    INNER JOIN t_acc_usage_cycle payercycle ON payercycle.id_acc = payer.id_payer

    WHERE 

      rc.tx_cycle_mode = 'EBCR' AND

      rc.b_charge_per_participant = 'Y' AND

      payer.id_payer = @id_acc AND

      plmap.id_paramtable IS NULL AND

      -- TODO: it would be better if we didn't consider subscriptions that ended

      --       in a hard closed interval so that retroactive changes would be properly guarded.

      -- only consider current or future group subs

      -- don't worry about group subs in the past

      ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR

       (sub.vt_start > @dt_now))

  )

    RETURN -289472439  -- MTPCUSER_CANNOT_CHANGE_BILLING_CYCLE_EBCR_PAYER_OF_MEMBER





  -- checks if the account pays for a receiver of a group subscription

  -- associated with a Per Subscriber EBCR RC

  IF EXISTS

  (

    SELECT NULL

    FROM t_gsub_recur_map gsrm

    INNER JOIN t_group_sub gs ON gs.id_group = gsrm.id_group

    INNER JOIN t_sub sub ON sub.id_group = gs.id_group

    INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po AND

                                 plmap.id_pi_instance = gsrm.id_prop

    INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

    INNER JOIN t_payment_redirection payer ON 

      payer.id_payee = gsrm.id_acc AND

      -- checks all payer's who overlap with the group sub

      payer.vt_end >= sub.vt_start AND

      payer.vt_start <= sub.vt_end

    INNER JOIN t_acc_usage_cycle payercycle ON payercycle.id_acc = payer.id_payer

    WHERE 

      rc.tx_cycle_mode = 'EBCR' AND

      rc.b_charge_per_participant = 'N' AND

      -- checks only the requested group

      payer.id_payer = @id_acc AND

      plmap.id_paramtable IS NULL AND

      -- only consider receivers based on wall-clock transaction time

      @dt_now BETWEEN gsrm.tt_start AND gsrm.tt_end AND

      -- TODO: it would be better if we didn't consider subscriptions that ended

      --       in a hard closed interval so that retroactive changes would be properly guarded.

      -- only consider current or future group subs

      -- don't worry about group subs in the past

      ((@dt_now BETWEEN sub.vt_start AND sub.vt_end) OR

       (sub.vt_start > @dt_now))

  )

    RETURN -289472438  -- MTPCUSER_CANNOT_CHANGE_BILLING_CYCLE_EBCR_PAYER_OF_RECEIVER

	

  RETURN 1 -- success, can update the billing cycle

END

  
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



             CREATE FUNCTION IsClosed(@state varchar(2)) returns int

             as

             begin

             declare @retval int

	     if (@state = 'CL')

                begin

	        select @retval = 1

                end

	     else

		begin

                select @retval = 0

	        end

             return @retval

             end

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		    create FUNCTION IsCorporateAccount(
				@id_acc int,@RefDate Datetime) returns INT
				as
				begin
				declare @retval int
				 select @retval = id_descendent from t_account_ancestor 
				 where
         @RefDate between vt_start and vt_end AND
				 id_ancestor = 1 AND id_descendent = @id_acc AND num_generations = 1
				 if (@retval = @id_acc)
				  begin
					select @retval = 1
					end 
         if (@retval is null)
				  begin
					select @retval = 0
					end
				return @retval
				end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create function IsInSameCorporateAccount(@acc1 int,@acc2 int,@refdate datetime) returns int

as

begin

declare @retval int

  select @retval =  

  case when parentcorporate.id_ancestor = desccorporate.id_ancestor then

    1 else 0 end

  from

  t_account_ancestor descendent

  INNER JOIN t_account_ancestor parent on parent.id_descendent = @acc2 AND

  parent.id_ancestor = 1 AND @refdate between parent.vt_start AND parent.vt_end

  INNER JOIN t_account_ancestor parentcorporate on parentcorporate.id_descendent = @acc2 AND

  @refdate between parentcorporate.vt_start AND parentcorporate.vt_end AND

  parentcorporate.num_generations = parent.num_generations - 1

  INNER JOIN t_account_ancestor desccorporate on desccorporate.id_descendent = @acc1 AND

  @refdate between desccorporate.vt_start AND desccorporate.vt_end AND

  desccorporate.num_generations = descendent.num_generations - 1

  where

  descendent.id_descendent = @acc1 AND

  @refdate between descendent.vt_start AND descendent.vt_end

  and descendent.id_ancestor = 1

	if @@error <> 0 OR @retval is NULL begin

		select @retval = 0

	end



	return @retval

end

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



              CREATE FUNCTION IsInVisableState(@state varchar(2)) returns int

              as

              begin

              declare @retval int

           -- if the account is closed or archived

	      if (@state <> 'CL' AND @state <> 'AR')

                begin

		select @retval = 1

	        end

              else

		begin

                select @retval = 0

	        end 

	      return @retval        

              end

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		

		CREATE  function IsIntervalOpen (@aDTNow datetime, @aIntervalID int) returns int

		as

		begin

      declare @retVal as int

      SET @retval = 0

      SELECT  @retVal = 

      CASE WHEN  

      ( 

        SELECT  tx_interval_status 

        FROM  t_usage_interval ui 

        WHERE @aDTNow BETWEEN ui.dt_start AND ui.dt_end AND id_interval = @aIntervalID

       )

        IN ('N', 'O') THEN 1 ELSE 0 END

        return @retVal

    end

		
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



            CREATE FUNCTION IsPendingFinalBill(@state varchar(2)) returns int

              as

              begin

              declare @retval int

	      if (@state = 'PF')

                  begin
		  select @retval = 1

	          end

              else

                  begin

                  select @retval = 0

        	  end

	      return @retval

              end

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



                 CREATE FUNCTION IsSuspended(@state varchar(2)) returns int

                 as

                 begin

									declare @retval int

									if (@state = 'SU')

                     begin

												select @retval = 1

                     end

								 else

										 begin

												select @retval = 0

										 end 

								 return @retval

                 end

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					create function LookupAccount(@login nvarchar(255),@namespace nvarchar(40)) 

					returns int

					as

					begin

					declare @retval as int

					select @retval = id_acc  from t_account_mapper 

					where nm_login = @login AND

					lower(@namespace) = nm_space

					if @retval is null

					  begin

						set @retval = -1

					  end

					return @retval

					end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



	create function MTComputeEffectiveBeginDate(@type as int, @offset as int, @base as datetime,  

	@sub_begin datetime, @id_usage_cycle int) returns datetime  

	as

	begin  

	if (@type = 1)  

	begin  

	return @base  

	end  

	else if (@type = 2)  

	begin   

	return @sub_begin + @offset  

	end  

	else if (@type = 3)  

	begin  

	declare @next_interval_begin datetime  

	select @next_interval_begin = DATEADD(second, 1, dt_end) from t_pc_interval where @base between dt_start and dt_end and id_cycle = @id_usage_cycle  

	return @next_interval_begin  

	end  

	return null  

	end  

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



	create function MTComputeEffectiveEndDate(@type as int, @offset as int, @base as datetime,  

	@sub_begin datetime, @id_usage_cycle int) returns datetime  

	as

	begin  

	if (@type = 1)  

	begin  

	return @base

	end  

	else if (@type = 2)  

	begin   

	return dbo.MTEndOfDay(@sub_begin + @offset)

	end  

	else if (@type = 3)  

	begin  

	declare @current_interval_end datetime  

	select @current_interval_end = dt_end from t_pc_interval where @base between dt_start and dt_end and id_cycle = @id_usage_cycle  

	return @current_interval_end

	end  

	return null

	end  

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create function MTDateInRange (

                                    @startdate datetime,

                                    @enddate datetime,

                                    @CompareDate datetime)

				returns int

			as

			begin

                                  declare @abc as int

                                  if @startdate <= @CompareDate AND @CompareDate < @enddate 

                                   begin

                                   select @abc = 1

                                   end 

                                else

                                   begin

                                   select @abc = 0

                                   end 

			   return @abc

                           end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function MTEndOfDay(@indate as datetime) returns datetime

				as

				begin

					declare @retval as datetime

					set @retval =

						DATEADD(s,-1,

							DATEADD(d,1,	

								DATEADD(hh,-DATEPART(hh,@indate),

									DATEADD(mi,-DATEPART(mi,@indate),

										DATEADD(s,-DATEPART (s,@indate),

											DATEADD(ms,-DATEPART (ms,@indate),@indate)

										)

									)

								)

							)

						)

					return @retval

				end

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create function MTHexFormat(@value integer) returns varchar(255)

as

begin

 declare @binvalue varbinary(255)
	      ,@charvalue varchar(255)

        ,@i int

        ,@length int

        ,@hexstring char(16)

 select @charvalue = ''

       ,@i=1

       ,@binvalue = cast(@value as varbinary(4))

       ,@length=datalength(@binvalue)

       ,@hexstring = '0123456789abcdef'

 WHILE (@i<=@length)

   begin

     declare @tempint int

            ,@firstint int

            ,@secondint int

     select @tempint=CONVERT(int, SUBSTRING(@binvalue,@i,1))

     select @firstint=FLOOR(@tempint/16)

     select @secondint=@tempint - (@firstint*16)

     select @charvalue=@charvalue

           +SUBSTRING(@hexstring,@firstint+1,1)

           +SUBSTRING(@hexstring, @secondint+1, 1)

    select @i=@i+1

   end

 return @charvalue

end	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				create function MTMaxDate() returns datetime
				as
				begin
					return '2038'
				end
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



	-- Function returns the maximum of two dates.  A null date is considered

	-- to be infinitely small.

	create function MTMaxOfTwoDates(@chargeIntervalLeft datetime, @subIntervalLeft datetime) returns datetime

	as

	begin

	return case when @subIntervalLeft is null or @chargeIntervalLeft > @subIntervalLeft then @chargeIntervalLeft else @subIntervalLeft end

	end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create function MTMinDate() returns datetime
			as
			begin
				return '1753'
			end
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



	-- Function returns the minimum of two dates.  A null date is considered

	-- to be infinitely large.

	create function MTMinOfTwoDates(@chargeIntervalLeft datetime, @subIntervalLeft datetime) returns datetime

	as

	begin

	return case when @subIntervalLeft is null or @chargeIntervalLeft < @subIntervalLeft then @chargeIntervalLeft else @subIntervalLeft end

	end		

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



	create function MTRateScheduleScore(@type as int, @begindate datetime) returns int  

	as

	begin  

	declare @datescore int  

	set @datescore = case @type when 4 then 0 else datediff(s, '1970-01-01', isnull(@begindate, '1970-01-01')) end  

	declare @typescore int  

	set @typescore = case @type   

	when 2 then 2   

	when 4 then 0   

	else 1   

	end  

	return cast(@typescore as int) * 0x20000000 + (cast(@datescore as int) / 8)

	end 

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      

              create FUNCTION MTStartOfDay (@indate datetime) returns datetime

              as

              begin

                -- This commented line of code also works.  I have commented

                -- it out until we get a chance to test it and see which of

                -- these two ways is fastest.

                --

                -- return CAST(ROUND(CAST(@indate AS FLOAT), 0, 1) AS DATETIME)

                declare @retval as datetime

                select @retval =  DATEADD(hh,-DATEPART(hh, @indate),

                                  DATEADD(mi,-DATEPART(mi, @indate),

                                  DATEADD(s,-DATEPART (s, @indate),

                                  DATEADD(ms,-DATEPART(ms, @indate), @indate))))

                return @retval

              end

      
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create function MessageQueueLength()

returns int

as

begin

  declare @queueLength int

  SELECT @queueLength = count(*) from t_message with (READPAST) where dt_assigned is null

  return @queueLength

end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create function NextDateAfterBillingCycle(@id_acc as int,@datecheck as datetime) returns datetime

		as

		begin

			return(

			select DATEADD(s,1,tpc.dt_end) from t_pc_interval tpc,t_acc_usage_cycle

			where t_acc_usage_cycle.id_acc = @id_acc AND

			tpc.id_cycle = t_acc_usage_cycle.id_usage_cycle AND

			tpc.dt_start <= @datecheck AND @datecheck <= tpc.dt_end

		)

		end

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create function OverlappingDateRange(@dt_start as datetime,

		  @dt_end as datetime,

			@dt_checkstart as datetime,

			@dt_checkend as datetime) returns integer

			as 

			begin

               if (@dt_start is not null and @dt_start > @dt_checkend) OR

               (@dt_checkstart is not null and @dt_checkstart > @dt_end)

               begin			   

               return (0)

               end

               return (1)

               end

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE FUNCTION POContainsBillingCycleRelative

(

  @id_po INT  -- product offering ID

)

RETURNS INT  -- 1 if the PO contains BCR PIs, otherwise 0

AS

BEGIN

  DECLARE @found INT



  -- checks for billing cycle relative discounts

	SELECT @found = CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END 

	FROM t_pl_map plm 

	INNER JOIN t_base_props bp ON bp.id_prop = plm.id_pi_template

  INNER JOIN t_discount disc ON disc.id_prop = bp.id_prop

	WHERE 

    plm.id_po = @id_po AND

    disc.id_usage_cycle IS NULL



  IF @found = 1

	  RETURN @found



  -- checks for billing cycle relative recurring charges

	SELECT @found = CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END 

	FROM t_pl_map plm 

	INNER JOIN t_base_props bp ON bp.id_prop = plm.id_pi_template

  INNER JOIN t_recur rc ON rc.id_prop = bp.id_prop

	WHERE 

    plm.id_po = @id_po AND

    (rc.tx_cycle_mode = 'BCR' OR rc.tx_cycle_mode = 'BCR Constrained')



  IF @found = 1

	  RETURN @found



  -- checks for billing cycle relative aggregate charges

	SELECT @found = CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END 

	FROM t_pl_map plm 

	INNER JOIN t_base_props bp ON bp.id_prop = plm.id_pi_template

  INNER JOIN t_aggregate agg ON agg.id_prop = bp.id_prop

	WHERE 

    plm.id_po = @id_po AND

    agg.id_usage_cycle IS NULL



  RETURN @found

END

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				create function POContainsDiscount
				(@id_po int) returns int
				as
				begin
				declare @retval int
					select @retval = case when count(id_pi_template) > 0 then 1 else 0 end 
					from t_pl_map 
					INNER JOIN t_base_props tb on tb.id_prop = t_pl_map.id_pi_template
					where t_pl_map.id_po = @id_po AND tb.n_kind = 40
					return @retval
				end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



    create function POContainsOnlyAbsoluteRates(@id_po int) returns int

    as

    begin

    declare @retval as integer

	    select @retval = count(te.id_eff_date)

	    from

	    t_effectivedate te

	    INNER JOIN t_po on t_po.id_po = @id_po

	    INNER JOIN t_pl_map map on map.id_po = t_po.id_po AND id_paramtable is not NULL AND id_sub is NULL

	    LEFT OUTER JOIN t_rsched sched on sched.id_pt = map.id_paramtable AND sched.id_pricelist = map.id_pricelist

	    AND sched.id_pi_template = map.id_pi_template

	    where

	    te.id_eff_date = sched.id_eff_date AND

	    -- only absolute or NULL dates

	    (te.n_begintype in (2,3) OR te.n_endtype in (2,3))

	    if @retval > 0  begin

		    return 0

	    end

	    else begin

		    return 1

	    end

	    return 0

    end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create function SubtractSecond(@RefDate datetime) returns datetime 

				as

				begin

				 return (dateadd(s,-1,@RefDate))

				end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				

CREATE FUNCTION WarnOnEBCRMemberStartDateChange

(

  @id_sub INT, -- subscription ID

  @id_acc INT  -- member account ID

)

RETURNS INT  -- 1 if a warning should be raised, 0 otherwise

AS

BEGIN



  -- checks to see if the subscription is associated with an EBCR RC

  -- and that the EBCR cycle type and the subscriber's billing cycle

  -- are such that the start date would be used in derivations

  IF EXISTS 

    (

      SELECT *

      FROM t_sub sub 

      INNER JOIN t_group_sub gs ON gs.id_group = sub.id_group

      INNER JOIN t_gsubmember gsm ON gsm.id_group = gs.id_group

      INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po

      INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

      INNER JOIN t_payment_redirection pay ON 

        pay.id_payee = gsm.id_acc AND

        -- checks all payer's who overlap with the group sub

        pay.vt_end >= sub.vt_start AND

        pay.vt_start <= sub.vt_end

      INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = pay.id_payer

      INNER JOIN t_usage_cycle payercycle ON payercycle.id_usage_cycle = auc.id_usage_cycle

      WHERE 

        rc.tx_cycle_mode = 'EBCR' AND

        rc.b_charge_per_participant = 'Y' AND

        sub.id_sub = @id_sub AND

        gsm.id_acc = @id_acc AND

        plmap.id_paramtable IS NULL AND

        payercycle.id_cycle_type = 1 AND -- the subscriber is Monthly

        rc.id_cycle_type IN (7, 8) -- and the EBCR cycle type is either Quarterly or Annually

    )

      RETURN 1 -- warn the user!



  RETURN 0 -- don't warn

END

				
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				

CREATE FUNCTION WarnOnEBCRStartDateChange

(

  @id_sub INT -- subscription ID

)

RETURNS INT  -- 1 if a warning should be raised, 0 otherwise

AS

BEGIN



  DECLARE @isGroup INT

  SELECT @isGroup = CASE WHEN id_group IS NULL THEN 0 ELSE 1 END

  FROM t_sub 

  WHERE id_sub = @id_sub



  IF @@ROWCOUNT = 0

    RETURN -1



    -- checks to see if the subscription is associated with an EBCR RC

    -- and that the EBCR cycle type and the subscriber's billing cycle

    -- are such that the start date would be used in derivations

  IF @isGroup = 0 AND EXISTS 

    (

      SELECT *

      FROM t_sub sub 

      INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po

      INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

      INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = sub.id_acc

      INNER JOIN t_usage_cycle payeecycle ON payeecycle.id_usage_cycle = auc.id_usage_cycle

      WHERE 

        rc.tx_cycle_mode = 'EBCR' AND

        rc.b_charge_per_participant = 'N' AND

        sub.id_sub = @id_sub AND

        plmap.id_paramtable IS NULL AND

        payeecycle.id_cycle_type = 1 AND -- the subscriber is Monthly

        rc.id_cycle_type IN (7, 8) -- and the EBCR cycle type is either Quarterly or Annually

    )

      RETURN 1 -- warn the user!

  -- checks to see if the group sub is associated with an EBCR RC

  -- and that the EBCR cycle type and the receiver's payer's billing cycle

  -- are such that the start date would be used in derivations

  ELSE IF @isGroup = 1 AND EXISTS 

    (

      SELECT NULL

      FROM t_sub sub

      INNER JOIN t_gsub_recur_map gsrm ON gsrm.id_group = sub.id_group 

      INNER JOIN t_pl_map plmap ON plmap.id_po = sub.id_po

      INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_instance

      INNER JOIN t_payment_redirection pay ON 

        pay.id_payee = gsrm.id_acc AND

        -- checks all payer's who overlap with the group sub

        pay.vt_end >= sub.vt_start AND

        pay.vt_start <= sub.vt_end

      INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = pay.id_payer

      INNER JOIN t_usage_cycle payercycle ON payercycle.id_usage_cycle = auc.id_usage_cycle

      WHERE 

        rc.tx_cycle_mode = 'EBCR' AND

        rc.b_charge_per_participant = 'N' AND

        sub.id_sub = @id_sub AND

        plmap.id_paramtable IS NULL AND

        payercycle.id_cycle_type = 1 AND -- the subscriber is Monthly

        rc.id_cycle_type IN (7, 8) -- and the EBCR cycle type is either Quarterly or Annually

    )

      RETURN 1 -- warn the user!



  RETURN 0 -- don't warn

END
				
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create function checksubscriptionconflicts (

@id_acc            INT,

@id_po             INT,

@real_begin_date   DATETIME,

@real_end_date     DATETIME,

@id_sub            INT

)

RETURNS INT

AS

begin

declare @status int

declare @cycle_type int

declare @po_cycle int



SELECT @status = COUNT (t_sub.id_sub)

FROM t_sub

WHERE t_sub.id_acc = @id_acc

 AND t_sub.id_po = @id_po

 AND t_sub.id_sub <> @id_sub

 AND dbo.overlappingdaterange (t_sub.vt_start,t_sub.vt_end,@real_begin_date,@real_end_date)= 1

IF (@status > 0)

	begin

 -- MTPCUSER_CONFLICTING_PO_SUBSCRIPTION

  RETURN (-289472485)

	END

select @status = dbo.overlappingdaterange(@real_begin_date,@real_end_date,te.dt_start,te.dt_end)

from t_po

INNER JOIN t_effectivedate te on te.id_eff_date = t_po.id_eff_date

where id_po = @id_po

if (@status <> 1)

	begin

	-- MTPCUSER_PRODUCTOFFERING_NOT_EFFECTIVE

	return (-289472472)

	end

SELECT @status = COUNT (id_pi_template)

	FROM t_pl_map

	WHERE t_pl_map.id_po = @id_po

	AND t_pl_map.id_pi_template IN

           (SELECT id_pi_template

              FROM t_pl_map

            WHERE id_po IN

                         (SELECT id_po

                            FROM t_vw_effective_subs subs

                            WHERE subs.id_sub <> @id_sub

                            AND subs.id_acc = @id_acc

                             AND dbo.overlappingdaterange (

                                    subs.dt_start,

                                    subs.dt_end,

                                    @real_begin_date,

                                    @real_end_date

                                 ) = 1))

IF (@status > 0)

	begin

	return (-289472484)

	END



-- CR 10872: make sure account and po have the same currency

if (dbo.IsAccountAndPOSameCurrency(@id_acc, @id_po) = '0')

begin

	-- MT_ACCOUNT_PO_CURRENCY_MISMATCH

	return (-486604729)

end



RETURN (1)

END

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create function mtconcat(@str1 varchar(4000),@str2 varchar(4000)) returns varchar(4000)

as

begin

return @str1 + @str2

end

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


	

-- returns the required cycle type of a BCR Constrained PO or zero if there is none

CREATE FUNCTION poConstrainedCycleType(@offeringID INTEGER)

RETURNS INTEGER

AS

BEGIN

	DECLARE @retval AS INTEGER



  SELECT 

    @retval = MAX(result.id_cycle_type)

  FROM (

    SELECT

      CASE WHEN t_recur.id_cycle_type IS NOT NULL AND

                t_recur.tx_cycle_mode = 'BCR Constrained' THEN

        t_recur.id_cycle_type 

      ELSE

        CASE WHEN t_discount.id_cycle_type IS NOT NULL THEN

      t_discount.id_cycle_type

        ELSE 

          CASE WHEN t_aggregate.id_cycle_type IS NOT NULL THEN

            t_aggregate.id_cycle_type 

          ELSE

            NULL

          END

        END

      END AS id_cycle_type

    FROM t_pl_map

      LEFT OUTER JOIN t_recur ON t_recur.id_prop = t_pl_map.id_pi_template OR

                                 t_recur.id_prop = t_pl_map.id_pi_instance

      LEFT OUTER JOIN t_discount ON t_discount.id_prop = t_pl_map.id_pi_template OR

                                    t_discount.id_prop = t_pl_map.id_pi_instance

      LEFT OUTER JOIN t_aggregate ON t_aggregate.id_prop = t_pl_map.id_pi_template OR

                                     t_aggregate.id_prop = t_pl_map.id_pi_instance

	WHERE

  t_pl_map.id_po = @offeringID

  ) result



  IF (@retval is NULL) BEGIN

   	SET @retval = 0

  END

  RETURN @retval

END

	
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

            CREATE  VIEW VW_AR_ACC_MAPPER        

            (ID_ACC, ExtAccount, ExtNamespace) 

            AS select am.id_acc, am.nm_login, am.nm_space from t_account_mapper am join t_namespace ns on am.nm_space= ns.nm_space where tx_typ_space='system_ar'

				 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					CREATE VIEW VW_HIERARCHYNAME (

						hierarchyname, id_acc )

						AS SELECT

						case when 

						tac.c_firstname is NULL or tac.c_lastname is NULL then 

						mapper.nm_login

						else

						case when tac.c_firstname is null then

						tac.c_lastname

						else

						case when tac.c_lastname is null then

						tac.c_firstname

						else

						(tac.c_firstname + (' ' + tac.c_lastname))

						end

						end

						end as hierarchyname,

						mapper.id_acc id_acc

						FROM dbo.t_account_mapper mapper

						INNER JOIN dbo.t_namespace ns on ns.nm_space = mapper.nm_space 

							--AND ns.tx_typ_space IN ('system_mps', 'system_user', 'system_auth')

						INNER JOIN dbo.t_enum_data ed on ed.nm_enum_data = 'metratech.com/accountcreation/contacttype/bill-to'

						LEFT OUTER JOIN t_av_contact tac on tac.id_acc = mapper.id_acc AND

								tac.c_contacttype = ed.id_enum_data

						WHERE ns.tx_typ_space = 'system_mps'

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create view VW_MPS_ACC_MAPPER as

        select

				mapper.nm_login,

				mapper.nm_space,

				mapper.id_acc,

				case when tac.id_acc is NULL then '' else

				  (c_firstname + (' ' + c_lastname)) end as fullname,

        case when tac.c_firstname is NULL and tac.c_lastname is NULL then 

          (mapper.nm_login + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

        else

            case when tac.c_firstname is null then

              (tac.c_lastname + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

            else

              case when tac.c_lastname is null then

                (tac.c_firstname + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))
              else

                ((tac.c_firstname + (' ' + tac.c_lastname)) + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

              end

            end

        end as displayname,

        case when tac.c_firstname is NULL and tac.c_lastname is NULL then 

          mapper.nm_login

        else

          case when tac.c_firstname is null then

            tac.c_lastname

          else

            case when tac.c_lastname is null then

              tac.c_firstname

            else

              (tac.c_firstname + (' ' + tac.c_lastname))

            end

          end

        end as hierarchydisplayname,

        ns.tx_typ_space

		FROM dbo.t_account_mapper mapper

		INNER JOIN dbo.t_namespace ns on ns.nm_space = mapper.nm_space 

			--AND ns.tx_typ_space IN ('system_mps', 'system_user', 'system_auth')

		INNER JOIN dbo.t_enum_data ed on ed.nm_enum_data = 'metratech.com/accountcreation/contacttype/bill-to'

		LEFT OUTER JOIN t_av_contact tac on tac.id_acc = mapper.id_acc AND

			tac.c_contacttype = ed.id_enum_data

		WHERE ns.tx_typ_space = 'system_mps'

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE VIEW VW_MPS_OR_SYSTEM_HIERARCHYNAME ( hierarchyname, id_acc )

						AS SELECT

						case when 

						tac.c_firstname is NULL or tac.c_lastname is NULL then 

						mapper.nm_login

						else

						case when tac.c_firstname is null then

						tac.c_lastname

						else

						case when tac.c_lastname is null then

						tac.c_firstname

						else

						(tac.c_firstname + (' ' + tac.c_lastname))

						end

						end

						end as hierarchyname,

						mapper.id_acc id_acc

						FROM dbo.t_account_mapper mapper

						INNER JOIN dbo.t_namespace ns on ns.nm_space = mapper.nm_space 

							--AND ns.tx_typ_space IN ('system_mps', 'system_user', 'system_auth')

						INNER JOIN dbo.t_enum_data ed on ed.nm_enum_data = 'metratech.com/accountcreation/contacttype/bill-to'

						LEFT OUTER JOIN t_av_contact tac on tac.id_acc = mapper.id_acc AND

								tac.c_contacttype = ed.id_enum_data

						WHERE ns.tx_typ_space IN ('system_mps', 'system_user')

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create view t_vw_base_props

as

select

  td_dispname.id_lang_code, bp.id_prop, bp.n_kind, bp.n_name, bp.n_desc,

  bp.nm_name as nm_name, bp.nm_desc as nm_desc, bp.b_approved, bp.b_archive,

  bp.n_display_name, td_dispname.tx_desc as nm_display_name

from t_base_props bp

  left join t_description td_dispname on td_dispname.id_desc = bp.n_display_name

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create view vw_mps_or_system_acc_mapper as

        select 

				mapper.nm_login,

				mapper.nm_space,

				mapper.id_acc,

				case when tac.id_acc is NULL then '' else

				  (c_firstname + (' ' + c_lastname)) end as fullname,

        case when tac.c_firstname is NULL and tac.c_lastname is NULL then 

           (mapper.nm_login + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

        else

            case when tac.c_firstname is null then

              (tac.c_lastname + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

            else

              case when tac.c_lastname is null then

                (tac.c_firstname + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

              else

                ((tac.c_firstname + (' ' + tac.c_lastname)) + (' (' + (cast(mapper.id_acc as varchar(255)) + ')')))

              end

            end

        end as displayname,

        case when tac.c_firstname is NULL and tac.c_lastname is NULL then 

          mapper.nm_login

        else

          case when tac.c_firstname is null then

            tac.c_lastname

          else

            case when tac.c_lastname is null then

              tac.c_firstname

            else

             (tac.c_firstname + (' ' + tac.c_lastname))

            end

          end

        end as hierarchydisplayname,

        ns.tx_typ_space

		FROM dbo.t_account_mapper mapper

		INNER JOIN dbo.t_namespace ns on ns.nm_space = mapper.nm_space 

			AND ns.tx_typ_space IN ('system_mps', 'system_user', 'system_auth')

		INNER JOIN dbo.t_enum_data ed on ed.nm_enum_data = 'metratech.com/accountcreation/contacttype/bill-to'

		LEFT OUTER JOIN t_av_contact tac on tac.id_acc = mapper.id_acc AND

			tac.c_contacttype = ed.id_enum_data

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW T_VW_I_ACCTRES

(ID_ACC, NM_LOGIN, NM_SPACE, ID_USAGE_CYCLE, C_PRICELIST, STATUS, STATE_START, STATE_END ) 

WITH SCHEMABINDING

AS SELECT 

	amap.id_acc, amap.nm_login, amap.nm_space, 

	auc.id_usage_cycle, avi.c_pricelist,

	ast.status, ast.vt_start, ast.vt_end

FROM dbo.t_account_mapper amap

INNER JOIN dbo.t_av_internal avi ON avi.id_acc = amap.id_acc

INNER JOIN dbo.t_acc_usage_cycle auc ON auc.id_acc = amap.id_acc

INNER JOIN dbo.t_account_state ast ON ast.id_acc = amap.id_acc

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  UNIQUE  CLUSTERED  INDEX [IDX_T_VW_I_ACCTRES_1] ON [dbo].[T_VW_I_ACCTRES]([NM_LOGIN], [NM_SPACE], [STATUS], [STATE_END]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  INDEX [IDX_T_VW_I_ACCTRES_2] ON [dbo].[T_VW_I_ACCTRES]([ID_ACC]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

create view t_vw_allrateschedules_pl

(

id_po, 

id_paramtable, 

id_pi_instance,

id_pi_template,

id_sub, 

id_sched,

dt_mod,

rs_begintype, 

rs_beginoffset, 

rs_beginbase,

rs_endtype, 

rs_endoffset, 

rs_endbase, 

id_pricelist)

with SCHEMABINDING

as

select 

null as id_po,

mapInner.id_pt as id_paramtable,

null as id_pi_instance,

templateInner.id_template as id_pi_template,

null as id_sub,

trInner.id_sched as id_sched,

trInner.dt_mod as dt_mod,

teInner.n_begintype as rs_begintype, 

teInner.n_beginoffset as rs_beginoffset,

teInner.dt_start as rs_beginbase, 

teInner.n_endtype as rs_endtype,

teInner.n_endoffset as rs_endoffset,

teInner.dt_end as rs_endbase,

trInner.id_pricelist as id_pricelist

from dbo.t_rsched trInner

INNER JOIN dbo.t_effectivedate teInner ON teInner.id_eff_date = trInner.id_eff_date

-- XXX fix this by passing in the instance ID

INNER JOIN dbo.t_pi_template templateInner on templateInner.id_template=trInner.id_pi_template

INNER JOIN dbo.t_pi_rulesetdef_map mapInner ON mapInner.id_pi = templateInner.id_pi and trInner.id_pt = mapInner.id_pt

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  UNIQUE  CLUSTERED  INDEX [idx_t_vw_allrateschedules_pl] ON [dbo].[t_vw_allrateschedules_pl]([id_sched]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  INDEX [idx_t_vw_allrateschedules_pl_param] ON [dbo].[t_vw_allrateschedules_pl]([id_pi_template], [id_paramtable], [id_po]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_pricelist] ON [dbo].[t_vw_allrateschedules_pl] ([id_pricelist]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW T_VW_ACCTRES

(ID_ACC, NM_LOGIN, NM_SPACE, ID_USAGE_CYCLE, C_PRICELIST, 

ID_PAYER, PAYER_START, PAYER_END, STATUS, STATE_START, STATE_END ) 

AS SELECT

	vwia.id_acc, vwia.nm_login, vwia.nm_space, vwia.id_usage_cycle, vwia.c_pricelist,

	redir.id_payer, 

	case when redir.vt_start is NULL then dbo.MTMinDate() else redir.vt_start end,

	case when redir.vt_end is NULL then dbo.MTMaxDate() else redir.vt_end end,

	vwia.status, vwia.state_start, vwia.state_end

FROM T_VW_I_ACCTRES vwia with (noexpand)

LEFT OUTER JOIN t_payment_redirection redir on redir.id_payee = vwia.id_acc

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

CREATE VIEW T_VW_EFFECTIVE_SUBS ( ID_SUB, 

ID_ACC, ID_PO, DT_START, DT_END, 

DT_CRT, B_GROUP ) AS  

select 

sub.id_sub, 

tgs.id_acc,

sub.id_po,

tgs.vt_start,

tgs.vt_end,

tgs.tt_start as dt_crt,

'Y' b_group

from t_sub sub

INNER JOIN t_gsubmember_historical tgs on sub.id_group = tgs.id_group 

where tgs.tt_end = dbo.MTMaxDate()

UNION ALL

select 

sub.id_sub, 

sub.id_acc,

sub.id_po,

sub.vt_start,

sub.vt_end,

sub.dt_crt,

'N' b_group

from t_sub sub 

WHERE sub.id_group IS NULL

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

create view t_vw_allrateschedules_po

(

id_po, 

id_paramtable, 

id_pi_instance,

id_pi_template,

id_sub, 

id_sched,

dt_mod,

rs_begintype, 

rs_beginoffset, 

rs_beginbase,

rs_endtype, 

rs_endoffset, 

rs_endbase, 

id_pricelist)

with SCHEMABINDING

as

select

tmInner.id_po as id_po,

tmInner.id_paramtable as id_paramtable,

tmInner.id_pi_instance as id_pi_instance,

tmInner.id_pi_template as id_pi_template,

tmInner.id_sub as id_sub,

rschedInner.id_sched as id_sched,

rschedInner.dt_mod as dt_mod,

teInner.n_begintype as rs_begintype, 

teInner.n_beginoffset as rs_beginoffset,

teInner.dt_start as rs_beginbase, 

teInner.n_endtype as rs_endtype,

teInner.n_endoffset as rs_endoffset,

teInner.dt_end as rs_endbase,

rschedInner.id_pricelist as id_pricelist

from

dbo.t_pl_map tmInner

INNER JOIN dbo.t_rsched rschedInner on 

	rschedInner.id_pricelist = tmInner.id_pricelist 

	AND rschedInner.id_pt =tmInner.id_paramtable 

	AND rschedInner.id_pi_template = tmInner.id_pi_template

INNER JOIN dbo.t_effectivedate teInner on teInner.id_eff_date = rschedInner.id_eff_date

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  UNIQUE  CLUSTERED  INDEX [idx_t_vw_allrateschedules_po] ON [dbo].[t_vw_allrateschedules_po]([id_sched], [id_pi_instance]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  INDEX [idx_t_vw_allrateschedules_po_param] ON [dbo].[t_vw_allrateschedules_po]([id_pi_template], [id_paramtable], [id_po]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_sub] ON [dbo].[t_vw_allrateschedules_po] ([id_sub]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_po] ON [dbo].[t_vw_allrateschedules_po] ([id_po]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

create view t_vw_allrateschedules_po_icb

(

id_po, 

id_paramtable, 

id_pi_instance,

id_pi_template,

id_sub, 

id_sched,

dt_mod,

rs_begintype, 

rs_beginoffset, 

rs_beginbase,

rs_endtype, 

rs_endoffset, 

rs_endbase, 

id_pricelist)

with SCHEMABINDING
as

select

tmInner.id_po as id_po,

tmInner.id_paramtable as id_paramtable,

tmInner.id_pi_instance as id_pi_instance,

tmInner.id_pi_template as id_pi_template,

tmInner.id_sub as id_sub,

rschedInner.id_sched as id_sched,

rschedInner.dt_mod as dt_mod,

teInner.n_begintype as rs_begintype, 

teInner.n_beginoffset as rs_beginoffset,

teInner.dt_start as rs_beginbase, 

teInner.n_endtype as rs_endtype,

teInner.n_endoffset as rs_endoffset,

teInner.dt_end as rs_endbase,

rschedInner.id_pricelist as id_pricelist

from

dbo.t_pl_map tmInner

INNER JOIN dbo.t_rsched rschedInner on 

 rschedInner.id_pricelist = tmInner.id_pricelist 

 AND rschedInner.id_pt =tmInner.id_paramtable 

 AND rschedInner.id_pi_template = tmInner.id_pi_template

INNER JOIN dbo.t_effectivedate teInner on teInner.id_eff_date = rschedInner.id_eff_date

where tmInner.id_sub is not null

 		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  UNIQUE  CLUSTERED  INDEX [idx_t_vw_allrateschedules_po_icb] ON [dbo].[t_vw_allrateschedules_po_icb]([id_sched], [id_pi_instance]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  INDEX [idx_t_vw_allrateschedules_po_icb_sub] ON [dbo].[t_vw_allrateschedules_po_icb]([id_pi_template], [id_sub], [id_po]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_sub] ON [dbo].[t_vw_allrateschedules_po_icb] ([id_sub]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_po] ON [dbo].[t_vw_allrateschedules_po_icb] ([id_po]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

create view t_vw_allrateschedules_po_noicb

(

id_po, 

id_paramtable, 

id_pi_instance,

id_pi_template,

id_sub, 

id_sched,

dt_mod,

rs_begintype, 

rs_beginoffset, 

rs_beginbase,

rs_endtype, 

rs_endoffset, 

rs_endbase, 

id_pricelist)

with SCHEMABINDING

as

select

tmInner.id_po as id_po,

tmInner.id_paramtable as id_paramtable,

tmInner.id_pi_instance as id_pi_instance,

tmInner.id_pi_template as id_pi_template,

NULL as id_sub,

rschedInner.id_sched as id_sched,

rschedInner.dt_mod as dt_mod,

teInner.n_begintype as rs_begintype, 

teInner.n_beginoffset as rs_beginoffset,

teInner.dt_start as rs_beginbase, 

teInner.n_endtype as rs_endtype,

teInner.n_endoffset as rs_endoffset,

teInner.dt_end as rs_endbase,

rschedInner.id_pricelist as id_pricelist

from

dbo.t_pl_map tmInner

INNER JOIN dbo.t_rsched rschedInner on 

 rschedInner.id_pricelist = tmInner.id_pricelist 

 AND rschedInner.id_pt =tmInner.id_paramtable 

 AND rschedInner.id_pi_template = tmInner.id_pi_template

INNER JOIN dbo.t_effectivedate teInner on teInner.id_eff_date = rschedInner.id_eff_date

where tmInner.id_sub is null

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  UNIQUE  CLUSTERED  INDEX [idx_t_vw_allrateschedules_po_noicb] ON [dbo].[t_vw_allrateschedules_po_noicb]([id_sched], [id_pi_instance]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

 CREATE  INDEX [idx_t_vw_allrateschedules_po_noicb_pi] ON [dbo].[t_vw_allrateschedules_po_noicb]([id_pi_template], [id_po]) ON [PRIMARY]
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_sub] ON [dbo].[t_vw_allrateschedules_po_noicb] ([id_sub]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

/****** The index created by the following statement is for internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
set ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS on 
GO

set NUMERIC_ROUNDABORT off 
GO

if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS [Statistic_id_po] ON [dbo].[t_vw_allrateschedules_po_noicb] ([id_po]) ')
GO

set NUMERIC_ROUNDABORT off set arithabort  OFF 
GO

SET QUOTED_IDENTIFIER OFF 
 
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

CREATE VIEW t_vw_expanded_sub

(

id_sub,

id_acc,

id_po,

vt_start,

vt_end,

dt_crt,

id_group,

id_group_cycle,

b_supportgroupops

)

AS 

SELECT

   sub.id_sub,

   CASE WHEN sub.id_group IS NULL THEN sub.id_acc ELSE mem.id_acc END id_acc,

   sub.id_po,

   CASE WHEN sub.id_group IS NULL THEN sub.vt_start ELSE mem.vt_start END vt_start,

   CASE WHEN sub.id_group IS NULL THEN sub.vt_end ELSE mem.vt_end END vt_end,

   sub.dt_crt,

   sub.id_group,

   gsub.id_usage_cycle,

   CASE WHEN sub.id_group IS NULL THEN 'N' ELSE gsub.b_supportgroupops END b_supportgroupops

FROM  

   t_sub sub

   LEFT OUTER JOIN t_group_sub gsub ON gsub.id_group = sub.id_group

   LEFT OUTER JOIN t_gsubmember mem ON mem.id_group = gsub.id_group


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW t_vw_rc_arrears_fixed

AS

-- Obtain the associated subscription period and recurring cycle

-- for each of the subscription recurring items 

SELECT 

	t_sub.id_po,

	t_pl_map.id_pi_instance,

	t_pl_map.id_pi_template,

	t_pl_map.id_paramtable,

	t_pl_map.id_pi_type,

	t_sub.id_acc,

	t_sub.vt_start sub_dt_start,

	t_sub.vt_end sub_dt_end,

	t_recur.id_usage_cycle recur_usage_cycle_id,

	t_recur.b_advance,

	t_recur.b_prorate_on_activate,

	t_recur.b_prorate_on_deactivate,

	t_recur.b_fixed_proration_length

FROM 

	t_pl_map,

	t_recur,

	t_sub

WHERE 

	t_pl_map.id_pi_instance = t_recur.id_prop and

	t_pl_map.id_po = t_sub.id_po


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW t_vw_rc_arrears_relative

AS

-- Obtain the associated subscription period, recurring cycle

-- and account usage cycle for each of the subscription recurring items

SELECT 

	t_sub.id_po,

	t_pl_map.id_pi_instance,

	t_pl_map.id_pi_template,

	t_pl_map.id_paramtable,

	t_pl_map.id_pi_type,

	t_sub.id_acc,

	t_sub.vt_start sub_dt_start,

	t_sub.vt_end sub_dt_end,

	t_recur.id_usage_cycle recur_usage_cycle_id,

	t_recur.b_advance,

	t_recur.b_prorate_on_activate,

	t_recur.b_prorate_on_deactivate,

	t_recur.b_fixed_proration_length,

	t_acc_usage_cycle.id_usage_cycle acc_usage_cycle_id

FROM 

	t_pl_map,

	t_recur,

	t_sub, 

	t_acc_usage_cycle

WHERE 

	t_pl_map.id_pi_instance = t_recur.id_prop AND

	t_pl_map.id_po = t_sub.id_po AND

	t_acc_usage_cycle.id_acc = t_sub.id_acc


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE view VW_ADJUSTMENT_SUMMARY as

        select

          ajtrx.id_acc_payer id_acc,

          ajtrx.id_usage_interval,

          ajtrx.am_currency,

          ajui.dt_start,

          ajui.dt_end,

        --add info about adjustments

        SUM (CASE WHEN ajtrx.n_adjustmenttype=0  THEN ajtrx.AdjustmentAmount ELSE 0 END)  AS PrebillAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=0  THEN aj_tax_federal+aj_tax_state+aj_tax_county+aj_tax_local+aj_tax_other ELSE 0 END)  AS PrebillTaxAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=1  THEN ajtrx.AdjustmentAmount ELSE 0 END)  AS PostbillAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=1  THEN aj_tax_federal+aj_tax_state+aj_tax_county+aj_tax_local+aj_tax_other ELSE 0 END)  AS PostbillTaxAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=1  THEN 1 ELSE 0 END)  AS NumPostbillAdjustments

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=0  THEN 1 ELSE 0 END)  AS NumPrebillAdjustments

        FROM t_adjustment_transaction ajtrx

        INNER JOIN t_usage_interval ajui on ajui.id_interval = ajtrx.id_usage_interval

        WHERE  ajtrx.c_status = 'A'

		and (id_sess is not null or archive_sess is not null)

        GROUP BY

          ajtrx.id_acc_payer,

          ajtrx.id_usage_interval,

          ajtrx.am_currency,

          ajtrx.c_status,

          ajui.dt_start,

          ajui.dt_end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE view VW_ADJUSTMENT_SUMMARY_DATAMART as

		select

          ajtrx.id_acc_payer id_acc,

          ajtrx.id_usage_interval,

          ajtrx.am_currency,

          ajui.dt_start,

          ajui.dt_end,

        --add info about adjustments

        SUM (CASE WHEN ajtrx.n_adjustmenttype=0  THEN ajtrx.AdjustmentAmount ELSE 0 END)  AS PrebillAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=1  THEN ajtrx.AdjustmentAmount ELSE 0 END)  AS PostbillAdjustmentAmount

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=1  THEN 1 ELSE 0 END)  AS NumPostbillAdjustments

        ,SUM (CASE WHEN ajtrx.n_adjustmenttype=0  THEN 1 ELSE 0 END)  AS NumPrebillAdjustments

        FROM t_adjustment_transaction ajtrx

        INNER JOIN t_usage_interval ajui on ajui.id_interval = ajtrx.id_usage_interval

        WHERE  ajtrx.c_status = 'A'

		and (id_sess is not null or archive_sess is not null)

        and isnull(ajtrx.id_sess,ajtrx.archive_sess) <=(select id_sess from t_dm_sess)        

        GROUP BY

          ajtrx.id_acc_payer,

          ajtrx.id_usage_interval,

          ajtrx.am_currency,

          ajtrx.c_status,

          ajui.dt_start,

          ajui.dt_end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



        create view VW_AJ_INFO

        -- Returns exactly 1 record	per	usage	record

        -- For adjusment related numeric fields	that come	back as	NULLs

        -- because adjustment	does not exist (eg id_aj_template, id_aj_instance)

        -- return	-1;	For	string fields	(AdjustmentDescription,	AdjustmentTemplateDescription) return	empty	strings

        as

        select 



        au.*,



        -- 1. Return Different Amounts: 



        -- PREBILL ADJUSTMENTS:



        -- CompoundPrebillAdjustmentAmount -- parent and children prebill adjustments for a compound transaction

        -- AtomicPrebillAdjustmentAmount -- parent prebill adjustments for a compound transaction. For an atomic transaction

        --                                 CompoundPrebillAdjustmentAmount always equals AtomicPrebillAdjustmentAmount

        -- CompoundPrebillAdjustedAmount -- Charge Amount + CompoundPrebillAdjustmentAmount

        -- AtomicPrebillAdjustedAmount -- Charge amount + parent prebill adjustments for a compound transaction. For an atomic transaction

        --                                 CompoundPrebillAdjustedAmount always equals AtomicPrebillAdjustedAmount





        -- POSTBILL ADJUSTMENTS:



        -- CompoundPostbillAdjustmentAmount -- parent and children postbill adjustments for a compound transaction

        -- AtomicPostbillAdjustmentAmount -- parent postbill adjustments for a compound transaction. For an atomic transaction

        --                                 CompoundPostbillAdjustmentAmount always equals AtomicPostbillAdjustmentAmount

        -- CompoundPostbillAdjustedAmount -- Charge Amount + CompoundPrebillAdjustmentAmount + CompoundPostbillAdjustmentAmount

        -- AtomicPostbillAdjustedAmount - Charge amount + parent prebill adjustments for a compound transaction +

        --                                parent postbill adjustments for a compound transaction. For an atomic transaction

        --                                AtomicPostbillAdjustedAmount always equals CompoundPostbillAdjustedAmount




        -- PREBILL ADJUSTMENTS:



        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.AdjustmentAmount

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundAdjustmentAmount), 0.0)} AS CompoundPrebillAdjustmentAmount,



        (au.amount + CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.AdjustmentAmount

            ELSE 0 END + {fn IFNULL((tmp.PrebillCompoundAdjustmentAmount), 0.0)}) AS CompoundPrebillAdjustedAmount,

             

        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status = 'A')	

	            THEN prebillajs.AdjustmentAmount

	            ELSE 0 END) AS AtomicPrebillAdjustmentAmount,

        	    

        (au.amount + (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

	            THEN prebillajs.AdjustmentAmount

	            ELSE 0 END) ) AS AtomicPrebillAdjustedAmount,

	            

        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status = 'P')	

	            THEN prebillajs.AdjustmentAmount

	            ELSE 0 END) AS PendingPrebillAdjustmentAmount,

	            

	      -- COMPOUND PREBILL ADJUSTMENTS TO TAXES:

	      

	      CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_federal

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundFederalTaxAdjustmentAmount), 0.0)} AS CompoundPrebillFederalTaxAdjustmentAmount,

            

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_state

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundStateTaxAdjustmentAmount), 0.0)} AS CompoundPrebillStateTaxAdjustmentAmount,

            

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_county

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundCountyTaxAdjustmentAmount), 0.0)} AS CompoundPrebillCountyTaxAdjustmentAmount,

            

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_local

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundLocalTaxAdjustmentAmount), 0.0)} AS CompoundPrebillLocalTaxAdjustmentAmount,

            

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_other

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundOtherTaxAdjustmentAmount), 0.0)} AS CompoundPrebillOtherTaxAdjustmentAmount,

            

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN (prebillajs.aj_tax_federal + prebillajs.aj_tax_state + prebillajs.aj_tax_county + prebillajs.aj_tax_local + prebillajs.aj_tax_other)

            ELSE 0 END
            + 

            {fn IFNULL((tmp.PrebillCompoundTotalTaxAdjustmentAmount), 0.0)} AS CompoundPrebillTotalTaxAdjustmentAmount,

            

				-- ATOMIC PREBILL ADJUSTMENTS TO TAXES:

	      

	      (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_federal

            ELSE 0 END) AS AtomicPrebillFederalTaxAdjustmentAmount,

            

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_state

            ELSE 0 END) AS AtomicPrebillStateTaxAdjustmentAmount,

        

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_county

            ELSE 0 END) AS AtomicPrebillCountyTaxAdjustmentAmount,

        

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_local

            ELSE 0 END) AS AtomicPrebillLocalTaxAdjustmentAmount,

            

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.aj_tax_other

            ELSE 0 END) AS AtomicPrebillOtherTaxAdjustmentAmount,

            

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN (prebillajs.aj_tax_federal + prebillajs.aj_tax_state + prebillajs.aj_tax_county + prebillajs.aj_tax_local + prebillajs.aj_tax_other)

            ELSE 0 END) AS AtomicPrebillTotalTaxAdjustmentAmount,

        

        -- POSTBILL ADJUSTMENTS:



        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.AdjustmentAmount

            ELSE 0 END + {fn IFNULL((tmp.PostbillCompoundAdjustmentAmount), 0.0)} AS CompoundPostbillAdjustmentAmount,





        -- when calculating postbill adjusted amounts, always consider prebill adjusted amounts

        (au.amount + CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.AdjustmentAmount

            ELSE 0 END  + {fn IFNULL((tmp.PostbillCompoundAdjustmentAmount), 0.0)} 

        + 

        --bring in prebill adjustments

        CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

            THEN prebillajs.AdjustmentAmount

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PrebillCompoundAdjustmentAmount), 0.0)}

        ) 

            AS CompoundPostbillAdjustedAmount,

             

        (CASE WHEN (postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status = 'A')	

	            THEN postbillajs.AdjustmentAmount

	            ELSE 0 END) AS AtomicPostbillAdjustmentAmount, 



        -- when calculating postbill adjusted amounts, always consider prebill adjusted amounts

        (au.amount + (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

	            THEN postbillajs.AdjustmentAmount

	            ELSE 0 END) 

        --bring in prebill adjustments

        +

        (CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = 'A')	

	            THEN prebillajs.AdjustmentAmount

	            ELSE 0 END)

        	    

	            ) AS AtomicPostbillAdjustedAmount,

	       

       (CASE WHEN (postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status = 'P')	

	            THEN postbillajs.AdjustmentAmount

	            ELSE 0 END) AS PendingPostbillAdjustmentAmount,

	            

	      -- COMPOUND POSTBILL ADJUSTMENTS TO TAXES:

	      

	      CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_federal

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundFederalTaxAdjustmentAmount), 0.0)} AS CompoundPostbillFederalTaxAdjustmentAmount,

            

        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_state

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundStateTaxAdjustmentAmount), 0.0)} AS CompoundPostbillStateTaxAdjustmentAmount,

            

        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_county

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundCountyTaxAdjustmentAmount), 0.0)} AS CompoundPostbillCountyTaxAdjustmentAmount,

            

        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_local

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundLocalTaxAdjustmentAmount), 0.0)} AS CompoundPostbillLocalTaxAdjustmentAmount,

            

        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_other

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundOtherTaxAdjustmentAmount), 0.0)} AS CompoundPostbillOtherTaxAdjustmentAmount,

            

        CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN (postbillajs.aj_tax_federal + postbillajs.aj_tax_state + 

									postbillajs.aj_tax_county + postbillajs.aj_tax_local + postbillajs.aj_tax_other)

            ELSE 0 END

            + 

            {fn IFNULL((tmp.PostbillCompoundTotalTaxAdjustmentAmount), 0.0)} AS CompoundPostbillTotalTaxAdjustmentAmount,

            

				-- ATOMIC POST ADJUSTMENTS TO TAXES:

	      

	      (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_federal

            ELSE 0 END) AS AtomicPostbillFederalTaxAdjustmentAmount,

            

        (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_state

            ELSE 0 END) AS AtomicPostbillStateTaxAdjustmentAmount,

        

        (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_county

            ELSE 0 END) AS AtomicPostbillCountyTaxAdjustmentAmount,

        

        (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_local

            ELSE 0 END) AS AtomicPostbillLocalTaxAdjustmentAmount,

            

        (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN postbillajs.aj_tax_other

            ELSE 0 END) AS AtomicPostbillOtherTaxAdjustmentAmount,

            

        (CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = 'A')	

            THEN (postbillajs.aj_tax_federal + postbillajs.aj_tax_state + postbillajs.aj_tax_county +

									postbillajs.aj_tax_local + postbillajs.aj_tax_other)

            ELSE 0 END) AS AtomicPostbillTotalTaxAdjustmentAmount,

        





        -- 2. Return Adjustment Transaction IDs for both prebill and postbill adjustments (or -1 if none): 



        (CASE WHEN prebillajs.id_adj_trx IS NULL THEN -1 ELSE prebillajs.id_adj_trx END) AS PrebillAdjustmentID,

        (CASE WHEN postbillajs.id_adj_trx IS NULL THEN -1 ELSE postbillajs.id_adj_trx END) AS PostbillAdjustmentID,



        -- 3. Return Adjustment Template IDs for both prebill and postbill adjustments (or -1 if none): 



        (CASE WHEN prebillajs.id_aj_template IS NULL THEN -1 ELSE prebillajs.id_aj_template END) AS PrebillAdjustmentTemplateID,

        (CASE WHEN postbillajs.id_aj_template IS NULL THEN -1 ELSE postbillajs.id_aj_template END) AS PostbillAdjustmentTemplateID,



        -- 4. Return Adjustment Instance IDs for both prebill and postbill adjustments (or -1 if none): 



        (CASE WHEN prebillajs.id_aj_instance IS NULL THEN -1 ELSE prebillajs.id_aj_instance END) AS PrebillAdjustmentInstanceID,

        (CASE WHEN postbillajs.id_aj_instance IS NULL THEN -1 ELSE postbillajs.id_aj_instance END) AS PostbillAdjustmentInstanceID,



        -- 5. Return Adjustment ReasonCode IDs for both prebill and postbill adjustments (or -1 if none): 



        (CASE WHEN prebillajs.id_reason_code IS NULL THEN -1 ELSE prebillajs.id_reason_code END) AS PrebillAdjustmentReasonCodeID,

        (CASE WHEN postbillajs.id_reason_code IS NULL THEN -1 ELSE postbillajs.id_reason_code END) AS PostbillAdjustmentReasonCodeID,





        -- 6. Return Adjustment Descriptions and default descriptions for both prebill and postbill adjustments (or empty string if none): 



        (CASE WHEN prebillajs.tx_desc IS NULL THEN '' ELSE prebillajs.tx_desc END) AS PrebillAdjustmentDescription,

        (CASE WHEN postbillajs.tx_desc IS NULL THEN '' ELSE postbillajs.tx_desc END) AS PostbillAdjustmentDescription,

        (CASE WHEN prebillajs.tx_default_desc IS NULL THEN '' ELSE prebillajs.tx_default_desc END) AS PrebillAdjustmentDefaultDescription,

        (CASE WHEN postbillajs.tx_default_desc IS NULL THEN '' ELSE postbillajs.tx_default_desc END) AS PostbillAdjustmentDefaultDescription,

        

        -- 7. Return Adjustment Status as following: If transaction interval is either open or soft closed, return prebill adjustment status or 'NA' if none;

        --    If transaction interval is hard closed, return post bill adjustment status or 'NA' if none

        (CASE WHEN (tui.tx_interval_status in ('O', 'C') AND  prebillajs.id_adj_trx IS NOT NULL) THEN prebillajs.c_status

         ELSE

        (CASE WHEN (tui.tx_interval_status = 'H' AND postbillajs.id_adj_trx IS NOT NULL) THEN postbillajs.c_status ELSE 'NA' END)

        END) AS AdjustmentStatus,





        -- 8. Return Adjustment Template and Instance Display Names for both prebill and postbill adjustments (or empty string if none): 

        --    if needed,  we can return name and descriptions from t_base_props



        -- CASE WHEN (prebillajtemplatedesc.tx_desc IS NULL) THEN '' ELSE prebillajtemplatedesc.tx_desc END  AS PrebillAdjustmentTemplateDisplayName,

        -- CASE WHEN (postbillajtemplatedesc.tx_desc IS NULL) THEN '' ELSE postbillajtemplatedesc.tx_desc END  AS PostbillAdjustmentTemplateDisplayName,



        -- CASE WHEN (prebillajinstancedesc.tx_desc IS NULL) THEN '' ELSE prebillajinstancedesc.tx_desc END  AS PrebillAdjustmentInstanceDisplayName,

        -- CASE WHEN (postbillajinstancedesc.tx_desc IS NULL) THEN '' ELSE postbillajinstancedesc.tx_desc END  AS PostbillAdjustmentInstanceDisplayName,



        -- 9. Return Reason Code Name, Description, Display Name for both prebill and post bill adjustments (or empty string if none)



        -- CASE WHEN (prebillrcdesc.tx_desc IS NULL) THEN '' ELSE prebillrcdesc.tx_desc END  AS PrebillAdjustmentReasonCodeDisplayName,

        -- CASE WHEN (postbillrcdesc.tx_desc IS NULL) THEN '' ELSE postbillrcdesc.tx_desc END  AS PostbillAdjustmentReasonCodeDisplayName,







        -- 10. Return different flags indicating status of a transaction in regard to adjustments





        -- Transactions are not considered to be adjusted if status is not 'A'

        -- CR 11785 - Now we are checking for Pending also	



        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status in ('A','P'))

			OR (postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status in ('A','P'))

            THEN 'Y' ELSE 'N' END) AS IsAdjusted,

   	    	    

        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status  in ('A','P'))	
            THEN 'Y' ELSE 'N' END) AS IsPrebillAdjusted,



        (CASE WHEN (postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status  in ('A','P'))	

            THEN 'Y' ELSE 'N' END) AS IsPostbillAdjusted,



        (CASE WHEN tui.tx_interval_status in ('N','O')	

		        THEN 'Y' 

		        ELSE 'N' END) AS IsPreBill,



        --can not adjust transactions:

        --1. in soft closed interval

        --2. If transaction is Prebill and it was already prebill adjusted

        --3. If transaction is Post bill and it was already postbill adjusted

        (CASE WHEN	

          (tui.tx_interval_status in	('C')) OR

          (tui.tx_interval_status =	'O' AND prebillajs.id_adj_trx IS NOT NULL) OR

          (tui.tx_interval_status =	'H' AND postbillajs.id_adj_trx IS NOT NULL)

	        then 'N'  else 'Y' end)	AS CanAdjust,



        -- Can not Rebill transactions:

        -- 1. If they are child transactions

        -- 2. in soft closed interval

        -- 3. If transaction is Prebill and it (or it's children) have already been adjusted (need to delete adjustments first)

        -- 4. If transaction is Postbill and it (or it's children) have already been adjusted (need to delete adjustments first)

        --    Above case will take care of possibility of someone trying to do PostBill rebill over and over again.

          (CASE WHEN	

          (au.id_parent_sess IS NOT NULL) 

	        OR

          (tui.tx_interval_status =	('C')) 

          OR

          (tui.tx_interval_status =	'O' AND (prebillajs.id_adj_trx IS NOT NULL 

          OR (tmp.NumChildrenPrebillAdjusted IS NOT NULL AND tmp.NumChildrenPrebillAdjusted > 0)) )

          OR

          (tui.tx_interval_status =	'H' AND (postbillajs.id_adj_trx IS NOT NULL 

          OR (tmp.NumChildrenPostbillAdjusted IS NOT NULL AND tmp.NumChildrenPostbillAdjusted > 0)))

          then 'N' else 'Y' end)	AS CanRebill,

        	

        -- Return 'N' if

        -- 1. Transaction hasn't been prebill adjusted yet

        -- 2. Transaction has been prebill adjusted but transaction interval is already closed

        -- Otherwise return 'Y'

        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL) THEN

        (CASE WHEN tui.tx_interval_status in ('C', 'H') then 'N'  else 'Y' end)

        ELSE 'N' END)

        AS CanManagePrebillAdjustment,

        

        -- Return 'N' if

        -- 1. If adjustment is postbill rebill

        -- 2. Transaction hasn't been postbill adjusted

        -- 3. Transaction has been postbill adjusted but payer's interval is already closed

        -- Otherwise return 'Y'

        

        (CASE WHEN (postbillajs.id_adj_trx IS NOT NULL)

        THEN

				-- CR 11775: we want to allow adjustment management

				-- if adjustment is pending but interval is hard closed

       (CASE WHEN (ajui.tx_interval_status in ('C') OR

					(ajui.tx_interval_status  = 'H' AND postbillajs.c_status = 'A') OR

        postbillajtype.n_adjustmenttype = 4) then 'N'  else 'Y' end)

        ELSE 'N' END)

        AS CanManagePostbillAdjustment,

        

        -- This calculates the logical AND of the above two flags.

        -- CR 9547 fix: Start with postbillajs. If transaction was both

        -- pre and post bill adjusted, we should be able to manage it

        -- CR 9548 fix: should not be able to manage REBILL adjustment

          

        (CASE WHEN (postbillajs.id_adj_trx IS NOT NULL) THEN

         -- CR 11775: we want to allow adjustment management

				-- if adjustment is pending but interval is hard closed

        (CASE WHEN (ajui.tx_interval_status in ('C') OR

					(ajui.tx_interval_status  = 'H' AND postbillajs.c_status = 'A') OR

        postbillajtype.n_adjustmenttype = 4) then 'N'  else 'Y' end)

        ELSE 

        (CASE WHEN (prebillajs.id_adj_trx IS NOT NULL) THEN

        (CASE WHEN tui.tx_interval_status in ('C', 'H') then 'N'  else 'Y' end)

        ELSE 'N' END)

        END)



        AS CanManageAdjustments,

        

        

        (CASE WHEN (tui.tx_interval_status =	'C' ) THEN 'Y' ELSE 'N' END) As IsIntervalSoftClosed,

        

        -- return the number of adjusted children

        -- or 0 for child transactions of a compound

        CASE WHEN tmp.NumApprovedChildrenPrebillAdjusted IS NULL 

        THEN 0 

          ELSE tmp.NumApprovedChildrenPrebillAdjusted

        END

        AS NumPrebillAdjustedChildren,

        

        CASE WHEN tmp.NumApprovedChildrenPostbillAdjusted IS NULL 

        THEN 0 

          ELSE tmp.NumApprovedChildrenPostbillAdjusted

        END

        AS NumPostbillAdjustedChildren





        from



        t_acc_usage au 

        left outer join t_adjustment_transaction prebillajs on prebillajs.id_sess=au.id_sess AND prebillajs.c_status IN ('A', 'P') AND prebillajs.n_adjustmenttype=0

        left outer join t_adjustment_transaction postbillajs on postbillajs.id_sess=au.id_sess AND postbillajs.c_status IN ('A', 'P') AND postbillajs.n_adjustmenttype=1

        -- Damn, this is going to kill us unless we index on id_parent_sess!!!!!!!!!!!!!!!!

        left outer join

        (

        select childau.id_parent_sess, 

        SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AdjustmentAmount

	          ELSE 0 END) PrebillCompoundAdjustmentAmount, 

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AdjustmentAmount

	        ELSE 0 END) PostbillCompoundAdjustmentAmount,

	      

	      --adjustments to taxes

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AJ_TAX_FEDERAL

	          ELSE 0 END) PrebillCompoundFederalTaxAdjustmentAmount, 

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AJ_TAX_FEDERAL

	        ELSE 0 END) PostbillCompoundFederalTaxAdjustmentAmount,

	      

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AJ_TAX_STATE

	          ELSE 0 END) PrebillCompoundStateTaxAdjustmentAmount, 

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AJ_TAX_STATE

	        ELSE 0 END) PostbillCompoundStateTaxAdjustmentAmount,

	      

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AJ_TAX_COUNTY

	          ELSE 0 END) PrebillCompoundCountyTaxAdjustmentAmount, 

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AJ_TAX_COUNTY

	        ELSE 0 END) PostbillCompoundCountyTaxAdjustmentAmount,

	        

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AJ_TAX_LOCAL

	          ELSE 0 END) PrebillCompoundLocalTaxAdjustmentAmount, 

        

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AJ_TAX_LOCAL

	        ELSE 0 END) PostbillCompoundLocalTaxAdjustmentAmount,

	        

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN childprebillajs.AJ_TAX_OTHER

	          ELSE 0 END) PrebillCompoundOtherTaxAdjustmentAmount, 

        

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN childpostbillajs.AJ_TAX_OTHER

	        ELSE 0 END) PostbillCompoundOtherTaxAdjustmentAmount,

	      

	      SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status = 'A')	

	          THEN (childprebillajs.AJ_TAX_FEDERAL + childprebillajs.AJ_TAX_STATE + childprebillajs.AJ_TAX_COUNTY

	          + childprebillajs.AJ_TAX_LOCAL + childprebillajs.AJ_TAX_OTHER)

	          ELSE 0 END) PrebillCompoundTotalTaxAdjustmentAmount, 

        

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status = 'A')	

	        THEN (childpostbillajs.AJ_TAX_FEDERAL + childpostbillajs.AJ_TAX_STATE + childpostbillajs.AJ_TAX_COUNTY

	          + childpostbillajs.AJ_TAX_LOCAL + childpostbillajs.AJ_TAX_OTHER)

	        ELSE 0 END) PostbillCompoundTotalTaxAdjustmentAmount,



        -- Approved or Pending adjusted kids

        SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NULL) THEN 0 ELSE 1 END) NumChildrenPrebillAdjusted,

        SUM(CASE WHEN (childpostbillajs.AdjustmentAmount IS NULL) THEN 0 ELSE 1 END) NumChildrenPostbillAdjusted,

        -- Approved adjusted kids (I didn't want to change the above flag because it's used for CanRebill flag calculation)

        SUM(CASE WHEN (childprebillajs.AdjustmentAmount IS NOT NULL AND childprebillajs.c_status ='A') THEN 1 ELSE 0 END) NumApprovedChildrenPrebillAdjusted,

        SUM(CASE WHEN  (childpostbillajs.AdjustmentAmount IS NOT NULL AND childpostbillajs.c_status ='A')  THEN 1 ELSE 0 END)AS NumApprovedChildrenPostbillAdjusted





        from

        t_acc_usage childau 

        left outer join t_adjustment_transaction childprebillajs on childprebillajs.id_sess=childau.id_sess AND childprebillajs.c_status IN ('A', 'P') AND childprebillajs.n_adjustmenttype=0

        left outer join t_adjustment_transaction childpostbillajs on childpostbillajs.id_sess=childau.id_sess AND childpostbillajs.c_status IN ('A', 'P') AND childpostbillajs.n_adjustmenttype=1

        group by childau.id_parent_sess

        ) 

        tmp on tmp.id_parent_sess=au.id_sess

        INNER JOIN t_usage_interval tui on au.id_usage_interval = tui.id_interval

        LEFT OUTER JOIN t_usage_interval ajui on postbillajs.id_usage_interval = ajui.id_interval

        

        --need to bring in adjustment type in order to set ManageAdjustments flag to false in case

        -- of REBILL adjustment type

        LEFT OUTER JOIN t_adjustment_type prebillajtype on prebillajtype.id_prop = prebillajs.id_aj_type 

        LEFT OUTER JOIN t_adjustment_type postbillajtype on postbillajtype.id_prop = postbillajs.id_aj_type 







        --resolve adjustment template or instance name

        -- This view is used in MPS. So if having those baseprops/desc joins becomes too expensive then

        -- they should be removed from this view



        -- AJ INSTANCE JOINs

        --LEFT OUTER JOIN t_base_props prebillajinstancebp ON prebillajs.id_aj_instance = prebillajinstancebp.id_prop

        --LEFT OUTER JOIN t_description  prebillajinstancedesc ON prebillajinstancebp.n_display_name = prebillajinstancedesc.id_desc



        --LEFT OUTER JOIN t_base_props postbillajinstancebp ON postbillajs.id_aj_instance = postbillajinstancebp.id_prop

        --LEFT OUTER JOIN t_description  postbillajinstancedesc ON postbillajinstancebp.n_display_name = prebillajinstancedesc.id_desc



        -- AJ TEMPLATE JOINs

        -- LEFT OUTER JOIN t_base_props prebillajtemplatebp ON prebillajs.id_aj_template = prebillajtemplatebp.id_prop

        -- LEFT OUTER JOIN t_description  prebillajtemplatedesc ON prebillajtemplatebp.n_display_name = prebillajtemplatedesc.id_desc



        -- LEFT OUTER JOIN t_base_props postbillajtemplatebp ON postbillajs.id_aj_template = postbillajtemplatebp.id_prop

        -- LEFT OUTER JOIN t_description  postbillajtemplatedesc ON postbillajtemplatebp.n_display_name = postbillajtemplatedesc.id_desc



        -- Reason Code JOINs

        -- LEFT OUTER JOIN t_base_props prebillrcbp ON prebillajs.id_reason_code = prebillrcbp.id_prop

        -- LEFT OUTER JOIN t_description  prebillrcdesc ON prebillrcbp.n_display_name = prebillrcdesc.id_desc



        -- LEFT OUTER JOIN t_base_props postbillrcbp ON postbillajs.id_aj_template = postbillrcbp.id_prop

        -- LEFT OUTER JOIN t_description  postbillrcdesc ON postbillrcbp.n_display_name = postbillrcdesc.id_desc



				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

create view t_vw_allrateschedules

  as

  select * from t_vw_allrateschedules_po with (noexpand)

  UNION ALL

  select * from t_vw_allrateschedules_pl with (noexpand)

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create view dbo.t_vw_pilookup

(

dt_start,

dt_end,

nm_name,

id_acc,

id_pi_template,

id_po,

id_pi_instance,

id_sub

)

as

select

sub.dt_start dt_start,

sub.dt_end dt_end,

base.nm_name,

sub.id_acc id_acc,

typemap.id_pi_template,

typemap.id_po,

typemap.id_pi_instance,

sub.id_sub

from

dbo.t_vw_effective_subs sub

 INNER JOIN dbo.t_pl_map typemap on typemap.id_po = sub.id_po AND

  typemap.id_po = sub.id_po and typemap.id_paramtable is null

 INNER JOIN dbo.t_base_props base on base.id_prop=typemap.id_pi_template


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE view VW_ADJUSTMENT_DETAILS as

			select distinct

				ajt.id_adj_trx,

				ajt.id_reason_code,

				ajt.id_acc_creator,

				ajt.id_acc_payer,

				ajt.c_status,

				ajt.dt_crt AS AdjustmentCreationDate,

				ajt.dt_modified,

				ajt.id_aj_type,

				ajt.id_aj_template 'id_aj_template',

				ajt.id_aj_instance 'id_aj_instance',

				ajt.id_usage_interval AS AdjustmentUsageInterval,

				ajt.tx_desc,

				ajt.tx_default_desc,

				ajt.n_adjustmenttype,

				isnull(ajtemplatedesc.tx_desc,'') as 'AdjustmentTemplateDisplayName',

				isnull(ajinstancedesc.tx_desc,'') as 'AdjustmentInstanceDisplayName',

				CASE WHEN (rcbp.nm_name IS NULL) THEN '' ELSE rcbp.nm_name END  AS ReasonCodeName,

				CASE WHEN (rcbp.nm_desc IS NULL) THEN '' ELSE rcbp.nm_desc END  AS ReasonCodeDescription,

				CASE WHEN (rcdesc.tx_desc IS NULL) THEN '' ELSE rcdesc.tx_desc END  AS ReasonCodeDisplayName,

				isnull(ajinstancedesc.id_lang_code,ajtemplatedesc.id_lang_code) as 'LanguageCode',

				ajinfo.AtomicPrebillAdjustmentAmount AS PrebillAdjustmentAmount,

				ajinfo.AtomicPostbillAdjustmentAmount AS PostbillAdjustmentAmount,

				ajinfo.*

				FROM t_adjustment_transaction ajt

				INNER JOIN VW_AJ_INFO ajinfo ON ajt.id_sess = ajinfo.id_sess

				--resolve adjustment template or instance name

				INNER JOIN t_base_props ajtemplatebp ON ajt.id_aj_template = ajtemplatebp.id_prop

				left outer JOIN t_description  ajtemplatedesc ON ajtemplatebp.n_display_name = ajtemplatedesc.id_desc

				left outer JOIN t_base_props ajinstancebp ON ajt.id_aj_instance = ajinstancebp.id_prop

				LEFT OUTER JOIN t_description  ajinstancedesc ON ajinstancebp.n_display_name = ajinstancedesc.id_desc

				left outer join t_description des2 on des2.id_lang_code = ajtemplatedesc.id_lang_code and des2.id_desc =  ajinstancebp.n_display_name

				left outer join t_description des3 on des3.id_lang_code = ajinstancedesc.id_lang_code and des3.id_desc =  ajtemplatebp.n_display_name   

				--resolve adjustment reason code name

				INNER JOIN t_base_props rcbp ON ajt.id_reason_code = rcbp.id_prop

				INNER JOIN t_description  rcdesc ON rcbp.n_display_name = rcdesc.id_desc

				WHERE ajt.c_status = 'A'

				and

				( ajtemplatedesc.id_lang_code=ajinstancedesc.id_lang_code

				or des2.id_lang_code is null

				or des3.id_lang_code is null

				)

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE view VW_NOTDELETED_ADJUSTMENT_DETAILS as

           select

          ajt.id_adj_trx,

          ajt.id_reason_code,

          ajt.id_acc_creator,

          ajt.id_acc_payer,

          ajt.c_status,

          ajt.dt_crt AS AdjustmentCreationDate,

          ajt.dt_modified,

          ajt.id_aj_type,

          ajt.id_aj_template,

          ajt.id_aj_instance,

          ajt.id_usage_interval AS AdjustmentUsageInterval,

          ajt.tx_desc,

          ajt.tx_default_desc,

          ajt.n_adjustmenttype,

          CASE WHEN (ajtemplatedesc.tx_desc IS NULL) THEN '' ELSE ajtemplatedesc.tx_desc END  AS AdjustmentTemplateDisplayName,

          CASE WHEN (ajinstancedesc.tx_desc IS NULL) THEN '' ELSE ajinstancedesc.tx_desc END  AS AdjustmentInstanceDisplayName,

          CASE WHEN (rcbp.nm_name IS NULL) THEN '' ELSE rcbp.nm_name END  AS ReasonCodeName,

          CASE WHEN (rcbp.nm_desc IS NULL) THEN '' ELSE rcbp.nm_desc END  AS ReasonCodeDescription,

          CASE WHEN (rcdesc.tx_desc IS NULL) THEN '' ELSE rcdesc.tx_desc END  AS ReasonCodeDisplayName,

          ajtemplatedesc.id_lang_code AS LanguageCode,

          ajinfo.AtomicPrebillAdjustmentAmount AS PrebillAdjustmentAmount,

          ajinfo.AtomicPostbillAdjustmentAmount AS PostbillAdjustmentAmount,

          ajinfo.*

          FROM t_adjustment_transaction ajt

          INNER JOIN VW_AJ_INFO ajinfo ON ajt.id_sess = ajinfo.id_sess

          --resolve adjustment template or instance name

          INNER JOIN t_base_props ajtemplatebp ON ajt.id_aj_template = ajtemplatebp.id_prop

          INNER JOIN t_description  ajtemplatedesc ON ajtemplatebp.n_display_name = ajtemplatedesc.id_desc

          LEFT OUTER JOIN t_base_props ajinstancebp ON ajt.id_aj_instance = ajinstancebp.id_prop

          LEFT OUTER JOIN t_description  ajinstancedesc ON ajinstancebp.n_display_name = ajinstancedesc.id_desc

          --resolve adjustment reason code name

          INNER JOIN t_base_props rcbp ON ajt.id_reason_code = rcbp.id_prop

          INNER JOIN t_description  rcdesc ON rcbp.n_display_name = rcdesc.id_desc

          

          WHERE ajt.c_status IN ('A', 'P')

          AND 

          (

          ajinstancedesc.id_lang_code IS NULL OR  ((ajinstancedesc.id_lang_code = ajtemplatedesc.id_lang_code)

          AND(ajinstancedesc.id_lang_code = rcdesc.id_lang_code))

          )

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

		Create procedure Abandon @rerun_table_name nvarchar(30),  @id_rerun int, @return_code int OUTPUT

		as

		Begin

			declare @sql nvarchar(1000)

			set @sql = N'drop table ' + @rerun_table_name

			EXEC sp_executesql @sql



      declare @source_table_name nvarchar(100)

      set @source_table_name = N't_source_rerun_session_' + cast(@id_rerun AS nvarchar(40))

      set @sql = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''' + @source_table_name + N''') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1) DROP TABLE ' + @source_table_name

      

      EXEC sp_executesql @sql

			set @return_code = 0
		End

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE AcknowledgeCheckpoint
(
  @dt_now DATETIME,
  @id_instance INT,
  @b_ignore_deps VARCHAR(1),
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @status INT OUTPUT
)
AS

BEGIN

  -- NOTE: for now, just use the calling procedure's transaction

  SELECT @status = -99

  -- enforces that the checkpoints dependencies are satisfied
  IF (@b_ignore_deps = 'N')
  BEGIN
    DECLARE @unsatisfiedDeps INT
    SELECT @unsatisfiedDeps = COUNT(*) 
    FROM GetEventExecutionDeps (@dt_now, @id_instance)
    WHERE tx_status <> 'Succeeded'

    IF (@unsatisfiedDeps > 0)
    BEGIN
      SELECT @status = -4  -- deps aren't satisfied
      RETURN
    END
  END

  -- updates the checkpoint instance's state to 'Succeeded'
  UPDATE t_recevent_inst
  SET tx_status = 'Succeeded', b_ignore_deps = @b_ignore_deps, dt_effective = NULL
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.id_instance = @id_instance AND
    -- checkpoint must presently be in the NotYetRun state
    inst.tx_status IN ('NotYetRun') AND
    -- interval, if any, must be in the closed state
    ui.tx_interval_status = 'C'

  -- if the update was made, return successfully
  IF (@@ROWCOUNT = 1)
  BEGIN

    -- records the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'Acknowledge', @b_ignore_deps, NULL, @tx_detail, @dt_now) 
    SELECT @status = 0
    RETURN
  END

  --
  -- otherwise, attempts to figure out what went wrong
  --
  DECLARE @count INT
  SELECT @count = COUNT(*) FROM t_recevent_inst WHERE id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- the instance does not exist
    SELECT @status = -1
    RETURN
  END

  SELECT @count = COUNT(*)
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.tx_status = 'NotYetRun' AND
    inst.id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- instance is not in the proper state
    SELECT @status = -2
    RETURN
  END

  SELECT @count = COUNT(*)  
  FROM t_recevent_inst inst
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    inst.id_instance = @id_instance AND
    ui.tx_interval_status = 'C'

  IF (@count = 0)
  BEGIN
    -- end-of-period instance's usage interval is not in the proper state
    SELECT @status = -5 
    RETURN
  END

  -- couldn't submit for some other unknown reason 
  SELECT @status = -99 
END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create  procedure

AddAccToHierarchy (@id_ancestor int,

@id_descendent int,

@dt_start  datetime,

@dt_end  datetime,

@p_acc_startdate datetime,

@status int OUTPUT)

as

begin

declare @realstartdate datetime

declare @realenddate datetime

declare @varMaxDateTime datetime

declare @bfolder varchar(1)

declare @descendentIDAsString varchar(50)

declare @ancestorStartDate as datetime

declare @realaccstartdate as datetime

select  @status = 0

-- begin business rules

-- check that the account is not already in the hierarchy

select @varMaxDateTime = dbo.MTMaxDate()

select @descendentIDAsString = CAST(@id_descendent as varchar(50)) 

  -- begin business rules

begin

if (@id_ancestor <> 1)

	begin

	SELECT @bfolder = c_folder 

	from

	t_av_internal where id_acc = @id_ancestor

	if @bfolder is null begin

		-- MT_PARENT_NOT_IN_HIERARCHY

		select @status = -486604771

		return

	end

-- MT_ACCOUNT_NOT_A_FOLDER (0xE2FF0001, -486604799)

-- specified parent account is not marked a folder.

	if (@bfolder = '0')

		begin 

		select @status = -486604799

		return

		end 

end 



	if @p_acc_startdate is NULL begin

		select @realaccstartdate = dt_crt from t_account where id_acc = @id_descendent

	end

	else begin

		select @realaccstartdate = @p_acc_startdate

	end



	select @ancestorStartDate = dt_crt

	from t_account where id_acc = @id_ancestor

	if  dbo.mtstartofday(@realaccstartdate) < dbo.mtstartofday(@ancestorStartDate) begin

		-- MT_CANNOT_CREATE_ACCOUNT_BEFORE_ANCESTOR_START

		select @status = -486604746

		return

	end 





select top 1 @status = id_descendent  from t_account_ancestor

where id_descendent = @id_descendent and

dbo.overlappingdaterange(vt_start,vt_end,@dt_start,@dt_end) = 1 

-- make sure we only get one row back

if (@status = @id_descendent) 

 begin

 -- MT_ACCOUNT_ALREADY_IN_HIEARCHY

 select @status = -486604785

 return

 end 

if (@status is null) 

 begin

 select @status = 0

 return

 end

end

select @realstartdate = dbo.MTStartOfDay(@dt_start)  

if (@dt_end is NULL) 

begin

 select @realenddate = dbo.MTStartOfDay(dbo.mtmaxdate())  

 end

else

 begin

 select @realenddate = dbo.mtstartofday(@dt_end)  

 end 

-- end business rules

-- error handling cases: 

-- Is the parent account a folder

-- does the ancestor exist in the effective date range

-- is the account already in the hierarchy at a given time

-- TODO: we need error handling code to detect when the ancestor does 

-- not exist at the time interval!!

-- populate t_account_ancestor (no bitemporal data)

insert into t_account_ancestor (id_ancestor,id_descendent,

num_generations,vt_start,vt_end,tx_path)

select id_ancestor,@id_descendent,num_generations + 1,dbo.MTMaxOfTwoDates(vt_start,@realstartdate),dbo.MTMinOfTwoDates(vt_end,@realenddate),

case when id_descendent = 1 then

tx_path + @descendentIDAsString

else

tx_path + '/' + @descendentIDAsString

end 

from t_account_ancestor

where

id_descendent = @id_ancestor AND id_ancestor <> id_descendent  AND

dbo.OverlappingDateRange(vt_start,vt_end,@realstartdate,@realenddate) = 1

UNION ALL

-- the new record to parent.  Note that the 

select @id_ancestor,@id_descendent,1,@realstartdate,@realenddate,

case when id_descendent = 1 then

tx_path + @descendentIDAsString

else

tx_path + '/' + @descendentIDAsString

end

from

t_account_ancestor where id_descendent = @id_ancestor AND num_generations = 0

AND dbo.OverlappingDateRange(vt_start,vt_end,@realstartdate,@realenddate) = 1

	-- self pointer

UNION ALL 

select @id_descendent,@id_descendent,0,@realstartdate,@realenddate,@descendentIDAsString

 -- update our parent entry to have children

update t_account_ancestor set b_Children = 'Y' where

id_descendent = @id_ancestor AND

dbo.OverlappingDateRange(vt_start,vt_end,@realstartdate,@realenddate) = 1

if (@@error <> 0) 

 begin

 select @status = 0

 end

select @status = 1  

end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure AddAccountToGroupSub(

	@p_id_sub int,             -- subscription ID of the group

	@p_id_group int,           -- group ID

	@p_id_po int,              -- product offering ID to which the group is subscribed

	@p_id_acc int,             -- account ID of the candidate member

	@p_startdate datetime,     -- date at which membership should begin

	@p_enddate datetime,       -- date at which membership should end

	@p_systemdate datetime,    -- current system time

	@p_enforce_same_corporation varchar,

	@p_status int OUTPUT,

	@p_datemodified varchar output)

as

begin

declare @existingID as int

declare @real_enddate as datetime

declare @real_startdate datetime

	select @p_status = 0

	-- step : if the end date is null get the max date

	-- XXX this is broken if the end date of the group subscription is not max date

	if (@p_enddate is null)

		begin

		select @real_enddate = dbo.MTMaxDate()

		end

	else

		begin

		if @p_startdate > @p_enddate begin

			-- MT_GROUPSUB_STARTDATE_AFTER_ENDDATE

			select @p_status = -486604782

			select @p_datemodified = 'N'

			return

		end



		select @real_enddate = @p_enddate

		end 

	select @real_startdate = dbo.mtmaxoftwodates(@p_startdate,t_sub.vt_start),

	@real_enddate = dbo.mtminoftwodates(@real_enddate,t_sub.vt_end) 

	from 

	t_sub where id_sub = @p_id_sub



	if (@real_startdate <> @p_startdate OR

	(@real_enddate <> @p_enddate AND @real_enddate <> dbo.mtmaxdate()))

		begin

			select @p_datemodified = 'Y'

		end

		else

		begin

			select @p_datemodified = 'N'

		end

	begin

	-- step : check that account is not already part of the group subscription

	-- in the specified date range

		select @existingID = id_acc from t_gsubmember where

	-- check againt the account

		id_acc = @p_id_acc AND id_group = @p_id_group

	-- make sure that the specified date range does not conflict with 

	-- an existing range

		AND dbo.overlappingdaterange(vt_start,vt_end,

		@real_startdate,@real_enddate) = 1

		if (@existingID = @p_id_acc)

			begin

			-- MT_ACCOUNT_ALREADY_IN_GROUP_SUBSCRIPTION 

			select @p_status = -486604790

			return

			end 

		if (@existingID is null)

			begin

			select @p_status = 0 

			end

	end

		-- step : verify that the date range is inside that of the group subscription

		begin

			select @p_status = dbo.encloseddaterange(vt_start,vt_end,@real_startdate,@real_enddate)  

			from t_sub where id_group = @p_id_group

			if (@p_status <> 1 ) 

			begin

			-- MT_GSUB_DATERANGE_NOT_IN_SUB_RANGE

			select @p_status = -486604789

			return

			end 

		if (@p_status is null) 

			begin

			-- MT_GROUP_SUBSCRIPTION_DOES_NOT_EXIST

			select @p_status = -486604788

			return 

		end

		end

		-- step : check that the account does not have any conflicting subscriptions

		-- note: checksubscriptionconflicts return 0 on success while the other

		-- functions return 1.  This should be fixed (CS 2-1-2001)

		select @p_status = dbo.checksubscriptionconflicts(@p_id_acc,@p_id_po,

		@real_startdate, @real_enddate,@p_id_sub) 

		if (@p_status <> 1 ) 

			begin

			 return

			end 

			

		-- Check that both account and PO have the same currency

		if (dbo.IsAccountAndPOSameCurrency(@p_id_acc, @p_id_po) = '0')

		begin

			-- MT_ACCOUNT_PO_CURRENCY_MISMATCH

			select @p_status = -486604729

			return

		end

		 -- make sure that the member is in the corporate account specified in 

		 -- the group subscription

		 -- only check this if Corp business rule is enforced.

		if (@p_enforce_same_corporation = '1')

		begin

			select @p_status = count(num_generations) from 

			t_account_ancestor ancestor

			INNER JOIN t_group_sub tg on tg.id_group = @p_id_group

			where ancestor.id_ancestor = tg.id_corporate_account AND

			ancestor.id_descendent = @p_id_acc AND

			@real_startdate between ancestor.vt_start AND ancestor.vt_end

			if (@p_status = 0 )

			begin

			-- MT_ACCOUNT_NOT_IN_GSUB_CORPORATE_ACCOUNT

			select @p_status = -486604769

			return

			end

		end

		

		 

		-- end business rule checks



	exec CreateGSubmemberRecord @p_id_group,@p_id_acc,@real_startdate,@real_enddate,@p_systemdate,@p_status OUTPUT



  -- post-creation business rule check (relies on rollback of work done up until this point)



  -- CR9906: check to make sure the newly added member does not violate a BCR constraint

  SELECT @p_status = dbo.CheckGroupMembershipCycleConstraint(@p_systemdate, @p_id_group)

  IF (@p_status <> 1)

    RETURN



  -- checks to make sure the member's payer's do not violate EBCR cycle constraints

  SELECT @p_status = dbo.CheckGroupMembershipEBCRConstraint(@p_systemdate, @p_id_group)

END

	
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		 create proc AddCalendarHoliday

			@id_calendar int,

			@n_code int,

			@nm_name NVARCHAR(255),

			@n_day int,

			@n_weekday int,

			@n_weekofmonth int,

			@n_month int,

			@n_year int,

			@id_day int OUTPUT

			as

			begin tran

				insert into t_calendar_day (id_calendar, n_weekday, n_code)

					values (@id_calendar, @n_weekday, @n_code)

				select @id_day = @@IDENTITY
				insert into t_calendar_holiday (id_day, nm_name, n_day, n_weekofmonth, n_month, n_year)

					values (@id_day, @nm_name, @n_day, @n_weekofmonth, @n_month, @n_year)

			commit tran

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		 create proc AddCalendarPeriod

			@id_day int,

			@n_begin int,

			@n_end int,

			@n_code int,

			@id_period int OUTPUT

			as

			begin tran

				insert into t_calendar_periods (id_day, n_begin, n_end, n_code)

					values (@id_day, @n_begin, @n_end, @n_code)

				select @id_period = @@IDENTITY

			commit tran

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		 create proc AddCalendarWeekday

			@id_calendar int,

			@n_weekday int,

			@n_code int,

			@id_day int OUTPUT

			as

				begin tran

					insert into t_calendar_day (id_calendar, n_weekday, n_code)

						values (@id_calendar, @n_weekday, @n_code)

					select @id_day = @@IDENTITY

				commit tran

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					create proc AddCounterInstance

					            @id_lang_code int,

											@n_kind int,

											@nm_name nvarchar(255),

											@nm_desc nvarchar(255),

											@counter_type_id int, 

											@id_prop int OUTPUT 

					as

					begin

						DECLARE @identity_value int

						exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, @nm_desc, null, @identity_value output

					INSERT INTO t_counter (id_prop, id_counter_type) values (@identity_value, @counter_type_id)

					SELECT 

						@id_prop = @identity_value

					end

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc AddCounterParam
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
			BEGIN TRAN
        exec InsertBaseProps @id_lang_code, 190, 'N', 'N', @nm_name, @nm_desc, @nm_display_name, @identity_value output
			INSERT INTO t_counter_params 
				(id_counter_param, id_counter, id_counter_param_meta, Value) 
			VALUES 
				(@identity_value, @id_counter, @id_counter_param_type, @nm_counter_value)
			SELECT 
				@identity = @identity_value
			COMMIT TRAN
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc AddCounterParamPredicate
									@id_counter_param int,
									@id_pv_prop int,
                  @nm_op nvarchar(2),
									@nm_value nvarchar(255),
									@ap_id_prop int OUTPUT
			AS
			BEGIN TRAN
			INSERT INTO t_counter_param_predicate
				(id_counter_param, id_pv_prop, nm_op, nm_value) 
			VALUES 
				(@id_counter_param, @id_pv_prop, @nm_op, @nm_value)
			SELECT 
				@ap_id_prop = @@identity
			COMMIT TRAN
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



						CREATE PROC AddCounterParamType			

									@id_lang_code int,

									@n_kind int,

									@nm_name nvarchar(255),

									@id_counter_type int,

									@nm_param_type varchar(255),

									@nm_param_dbtype varchar(255),

									@id_prop int OUTPUT 

			      AS

			      DECLARE @identity_value int

			      BEGIN TRAN

			      exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, NULL, NULL, @identity_value output

			      INSERT INTO t_counter_params_metadata

					              (id_prop, id_counter_meta, ParamType, DBType) 

				    VALUES 

					              (@identity_value, @id_counter_type, @nm_param_type, @nm_param_dbtype)

            select @id_prop = @identity_value

      			COMMIT TRAN

    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				create proc AddCounterType
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
			declare @t_base_props_count INT
			
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
				exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, @nm_desc, null, @identity_value OUTPUT
		    INSERT INTO t_counter_metadata (id_prop, FormulaTemplate, b_valid_for_dist) values (@identity_value, 
				    @nm_formula_template, @valid_for_dist)
				select @id_prop = @identity_value
			  end
       end
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc AddICBMapping(@id_paramtable as int,
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
					select @id_pi_type = id_pi_type,@id_pi_template = id_pi_template,
					@id_pi_instance_parent = id_pi_instance_parent
					from
					t_pl_map where id_pi_instance = @id_pi_instance AND id_paramtable is NULL

					--CR 10884 fix: get the price list currency from product catalog, not
					--corporation. This will take care of the case when gsubs are generated "globally".
					--Also, this seems to be correct for all other cases as well
					
					set @currency = (select pl.nm_currency_code from t_po po
					inner join t_pricelist pl on po.id_nonshared_pl = pl.id_pricelist
					where po.id_po = @id_po)

					insert into t_base_props (n_kind,n_name,n_display_name,n_desc) values (150,0,0,0)
					set @id_pricelist = @@identity
					insert into t_pricelist(id_pricelist,n_type,nm_currency_code) values (@id_pricelist, 0, @currency)
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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						CREATE PROCEDURE AddMemberToRole

						(@aRoleID INT,

						 @aAccountID INT,

						 @status INT OUTPUT)		

						AS

						

						Begin

						declare @accType VARCHAR(3)

						declare @polID INT

						declare @bCSRAssignableFlag VARCHAR(1)

						declare @bSubscriberAssignableFlag VARCHAR(1)

						declare @scratch INT

						select @status = 0

						-- evaluate business rules: role has to

						-- be assignable to the account type

						-- returned errors: MTAUTH_ROLE_CAN_NOT_BE_ASSIGNED_TO_SUBSCRIBER ((DWORD)0xE29F001CL) (-492896228)

						--                  MTAUTH_ROLE_CAN_NOT_BE_ASSIGNED_TO_CSR ((DWORD)0xE29F001DL) (-492896227)

						SELECT @accType = acc_type FROM T_ACCOUNT WHERE id_acc = @aAccountID

						SELECT @bCSRAssignableFlag = csr_assignable, 

						@bSubscriberAssignableFlag = subscriber_assignable  

						FROM T_ROLE WHERE id_role = @aRoleID

						IF (UPPER(@accType) = 'SUB' OR UPPER(@accType) = 'IND') 

						begin

						IF (UPPER(@bSubscriberAssignableFlag) = 'N')

							begin

      				  select @status = -492896228

							  RETURN

							END

            END

						ELSE

						  begin

							IF UPPER(@bCSRAssignableFlag) = 'N' 

								begin

								select @status = -492896227

								RETURN

								END

							END

					

						--Get policy id for this account. sp_InsertPolicy will either

						--insert a new one or get existing one

						exec Sp_Insertpolicy 'id_acc', @aAccountID,'A', @polID output

						-- make the stored proc idempotent, only insert mapping record if

						-- it's not already there

						begin

							SELECT @scratch = id_policy FROM T_POLICY_ROLE WHERE id_policy = @polID AND id_role = @aRoleID

							if @scratch is null

								begin

								INSERT INTO T_POLICY_ROLE (id_policy, id_role) VALUES (@polID, @aRoleID)

								end

						end

						select @status = 1

						END 

        
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE AddNewAccount(
@p_id_acc_ext  varchar(16),
@p_acc_state  varchar(2),
@p_acc_status_ext  int,
@p_acc_vtstart  datetime,
@p_acc_vtend  datetime,
@p_nm_login  nvarchar(255),
@p_nm_space nvarchar(40),
@p_tx_password  nvarchar(64),
@p_langcode  varchar(10),
@p_profile_timezone  int,
@p_ID_CYCLE_TYPE  int,
@p_DAY_OF_MONTH  int,
@p_DAY_OF_WEEK  int,
@p_FIRST_DAY_OF_MONTH  int,
@p_SECOND_DAY_OF_MONTH int,
@p_START_DAY int,
@p_START_MONTH int,
@p_START_YEAR int,
@p_billable varchar,
@p_id_payer int,
@p_payer_startdate datetime,
@p_payer_enddate datetime,
@p_payer_login nvarchar(255),
@p_payer_namespace nvarchar(40),
@p_id_ancestor int,
@p_hierarchy_start datetime,
@p_hierarchy_end datetime,
@p_ancestor_name nvarchar(255),
@p_ancestor_namespace nvarchar(40),
@p_acc_type varchar(3),
@p_apply_default_policy varchar,
@p_systemdate datetime,
@p_enforce_same_corporation varchar,
-- pass the currency through to CreatePaymentRecord
-- stored procedure only to validate it against the payer
-- We have to do it, because the t_av_internal record
--is not created yet
@p_account_currency nvarchar(5),
@p_profile_id int,
@accountID int OUTPUT,
@status  int OUTPUT,
@p_hierarchy_path varchar(4000) output,
@p_currency nvarchar(10) OUTPUT,
@p_id_ancestor_out int OUTPUT,
@p_corporate_account_id int OUTPUT
)
as
	declare @existing_account as int
	declare @intervalID as int
	declare @intervalstart as datetime
	declare @intervalend as datetime
	declare @usagecycleID as int
	declare @acc_startdate as datetime
	declare @acc_enddate as datetime
	declare @payer_startdate as datetime
	declare @payer_enddate as datetime
	declare @ancestor_startdate as datetime
	declare @ancestor_enddate as datetime	declare @payerID as int
	declare @ancestorID as int
	declare @siteID as int
	declare @folderName nvarchar(255)
	declare @varMaxDateTime as datetime
	declare @IsNotSubscriber int
	declare @payerbillable as varchar(1)
	declare @authancestor as int

	-- step : validate that the account does not already exist.  Note 
	-- that this check is performed by checking the t_account_mapper table.
	-- However, we don't check the account state so the new account could
	-- conflict with an account that is an archived state.  You would need
	-- to purge the archived account before the new account could be created.
	select @varMaxDateTime = dbo.MTMaxDate()
	select @existing_account = dbo.LookupAccount(@p_nm_login,@p_nm_space) 
	if (@existing_account <> -1) begin
	-- ACCOUNTMAPPER_ERR_ALREADY_EXISTS
	select @status = -501284862
	return
	end 

	-- check account creation business rules
	IF (@p_nm_login not in ('rm', 'mps_folder'))
	BEGIN
	  exec CheckAccountCreationBusinessRules 
			 @p_nm_space, 
			 @p_acc_type, 
			 @p_id_ancestor, 
			 @status output
	  IF (@status <> 1)
		BEGIN
	  	RETURN
		END		
	END	

	-- step : populate the account start dates if the values were
	-- not passed into the sproc
	select 
	@acc_startdate = case when @p_acc_vtstart is NULL then dbo.mtstartofday(@p_systemdate) 
		else dbo.mtstartofday(@p_acc_vtstart) end,
	@acc_enddate = case when @p_acc_vtend is NULL then @varMaxDateTime 
		else dbo.mtstartofday(@p_acc_vtend) end
	-- step : populate t_account
	if (@p_id_acc_ext is null) begin
		insert into t_account(id_acc_ext,dt_crt,acc_type)
		select newid(),@acc_startdate,@p_acc_type 
	end
	else begin
		insert into t_account(id_Acc_ext,dt_crt,acc_type)
		select convert(varbinary(16),@p_id_acc_ext),@acc_startdate,@p_acc_type 
	end 
	-- step : get the account ID
	select @accountID = @@identity
	-- step : initial account state
	insert into t_account_state values (@accountID,
	@p_acc_state /*,p_acc_status_ext*/,
	@acc_startdate,@acc_enddate)
	insert into t_account_state_history values (@accountID,
	@p_acc_state /*,p_acc_status_ext*/,
	@acc_startdate,@acc_enddate,@p_systemdate,@varMaxDateTime)
	-- step : login and namespace information
	insert into t_account_mapper values (@p_nm_login,lower(@p_nm_space),@accountID)
	-- step : user credentials
	insert into t_user_credentials values (@p_nm_login,lower(@p_nm_space),@p_tx_password)

	-- step : t_profile. This looks like it is only for timezone information
	insert into t_profile values (@p_profile_id,'timeZoneID',@p_profile_timezone,'System')
	-- step : site user information
	exec GetlocalizedSiteInfo @p_nm_space,@p_langcode,@siteID OUTPUT
	insert into t_site_user values (@p_nm_login,@siteID,@p_profile_id)


  --
  -- associates the account with the Usage Server
  --

	-- determines the usage cycle ID from the passed in date properties
	SELECT @usagecycleID = id_usage_cycle 
	FROM t_usage_cycle cycle 
  WHERE
	 cycle.id_cycle_type = @p_ID_CYCLE_TYPE AND
   (@p_DAY_OF_MONTH = cycle.day_of_month OR @p_DAY_OF_MONTH IS NULL) AND
   (@p_DAY_OF_WEEK = cycle.day_of_week OR @p_DAY_OF_WEEK IS NULL) AND
   (@p_FIRST_DAY_OF_MONTH = cycle.FIRST_DAY_OF_MONTH OR @p_FIRST_DAY_OF_MONTH IS NULL) AND
   (@p_SECOND_DAY_OF_MONTH = cycle.SECOND_DAY_OF_MONTH OR @p_SECOND_DAY_OF_MONTH IS NULL) AND
   (@p_START_DAY = cycle.START_DAY OR @p_START_DAY IS NULL) AND
   (@p_START_MONTH = cycle.START_MONTH OR @p_START_MONTH IS NULL) AND
   (@p_START_YEAR = cycle.START_YEAR OR @p_START_YEAR IS NULL)

  -- adds the account to usage cycle mapping
	INSERT INTO t_acc_usage_cycle VALUES (@accountID, @usagecycleID)

  -- creates only needed intervals and mappings for this account only.
  -- other accounts affected by any new intervals (same cycle) will
  -- be associated later in the day via a usm -create.
  EXEC CreateUsageIntervalsForAccount @p_systemdate, @accountID, @acc_startdate, @acc_enddate, NULL, NULL

	-- Non-billable accounts must have a payment redirection record
	if ( @p_billable = 'N' AND 
	(@p_id_payer is NULL and
	(@p_id_payer is null AND @p_payer_login is NULL AND @p_payer_namespace is NULL))) begin
	-- MT_NONBILLABLE_ACCOUNTS_REQUIRE_PAYER
		select @status = -486604768
		return
	end
	-- default the payer start date to the start of the account  
	select @payer_startdate = case when @p_payer_startdate is NULL then @acc_startdate else dbo.mtstartofday(@p_payer_startdate) end,
	 -- default the payer end date to the end of the account if NULL
	@payer_enddate = case when @p_payer_enddate is NULL then @acc_enddate else dbo.mtstartofday(@p_payer_enddate) end,
	-- step : default the hierarchy start date to the account start date 
	@ancestor_startdate = case when @p_hierarchy_start is NULL then @acc_startdate else @p_hierarchy_start end,
	-- step : default the hierarchy end date to the account end date
	@ancestor_enddate = case when @p_hierarchy_end is NULL then @acc_enddate else @p_hierarchy_end end,
	-- step : resolve the ancestor ID if necessary
	@ancestorID = case when @p_ancestor_name is not NULL and @p_ancestor_namespace is not NULL then
		dbo.LookupAccount(@p_ancestor_name,@p_ancestor_namespace)  else 
		-- if the ancestor ID iis NULL then default to the root
		case when @p_id_ancestor is NULL then 1 else @p_id_ancestor end
	end,
	-- step : resolve the payer account if necessary
	@payerID = case when 	@p_payer_login is not null and @p_payer_namespace is not null then
		 dbo.LookupAccount(@p_payer_login,@p_payer_namespace) else 
			case when @p_id_payer is NULL then @accountID else @p_id_payer end end
	if (@payerID = -1) 	begin
		-- MT_CANNOT_RESOLVE_PAYING_ACCOUNT
		select @status = -486604792
		return
	end
	if (@ancestorID = -1) 
		begin
			-- MT_CANNOT_RESOLVE_HIERARCHY_ACCOUNT
			select @status = -486604791
			return
		end 
	else
		begin
			SET @p_id_ancestor_out = @ancestorID
		end
	
	if (UPPER(@p_acc_type) <> 'SUB') begin
		select @IsNotSubscriber = 1
	end 
	-- we trust AddAccToHIerarchy to set the status to 1 in case of success
	exec AddAccToHierarchy @ancestorID,@accountID,@ancestor_startdate,
	@ancestor_enddate,@acc_startdate,@status output
	if (@status <> 1)begin 
		return
	end 
	-- pass in the current account's billable flag when creating the payment 
	-- redirection record IF the account is paying for itself
	select @payerbillable = case when @payerID = @accountID then
		@p_billable else NULL end
	exec CreatePaymentRecord @payerID,@accountID,
	@payer_startdate,@payer_enddate,@payerbillable,@p_systemdate,'N', @p_enforce_same_corporation, @p_account_currency, @status OUTPUT
	if (@status <> 1) begin
		return
	end   
	-- if "Apply Default Policy" flag is set, then
	-- figure out "ancestor" id based on account type in case the account is not
	--a subscriber
	--BP: 10/5 Make sure that t_principal_policy record is always there, otherwise ApplyRoleMembership will break
	declare @polid int
	exec Sp_Insertpolicy 'id_acc', @accountID,'A', @polID output
	if
		(UPPER(@p_apply_default_policy) = 'Y' OR
		UPPER(@p_apply_default_policy) = 'T' OR
		UPPER(@p_apply_default_policy) = '1') begin
    SET @authancestor = @ancestorID
		if (@IsNotSubscriber > 0) begin
		 	select @folderName = 
			 CASE 
				WHEN UPPER(@p_acc_type) = 'CSR' THEN 'csr_folder'
				WHEN UPPER(@p_acc_type) = 'MOM' THEN 'mom_folder'
				WHEN UPPER(@p_acc_type) = 'MCM' THEN 'mcm_folder'
				WHEN UPPER(@p_acc_type) = 'IND' THEN 'mps_folder' END
			SELECT @authancestor = NULL
      SELECT @authancestor = id_acc  FROM t_account_mapper WHERE nm_login = @folderName
			AND nm_space = 'auth'
			if (@authancestor is null) begin
	 			select @status = 1
	 		end
		end 
		--apply default security policy
		if (@authancestor > 1) begin
			exec dbo.CloneSecurityPolicy @authancestor, @accountID , 'D' , 'A'
		end
	End 
	select @p_hierarchy_path = tx_path  from t_account_ancestor
	where id_descendent = @accountID and id_ancestor = 1 AND 
	@ancestor_startdate between vt_start AND vt_end
	
	--resolve accounts' corporation
	--select ancestor whose direct ancestor is 1
	select @p_corporate_account_id = ancestor.id_ancestor from t_account_ancestor ancestor
	inner join t_account_ancestor corporation on corporation.id_descendent = ancestor.id_ancestor
	where
	-- ancestor.id_descendent = ancestor.id_ancestor and
	ancestor.id_descendent = @accountID and
	corporation.id_ancestor = 1 AND corporation.num_generations = 1
	AND @acc_startdate  BETWEEN ancestor.vt_start and ancestor.vt_end
	AND @acc_startdate  BETWEEN corporation.vt_start and corporation.vt_end
	
	if @ancestorID <> 1 
	begin
		select @p_currency = c_currency from t_av_internal where id_acc = @ancestorID
		--if cross corp business rule is enforced, verify that currencies match
		if(@p_enforce_same_corporation = '1' AND (UPPER(@p_currency) <> UPPER(@p_account_currency)) )
		begin
			-- MT_CURRENCY_MISMATCH
			select @status = -486604737
			return
		end
  end

	-- done
	select @status = 1
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure AddNewSub(

 @p_id_acc int, 

 @p_dt_start datetime,

 @p_dt_end datetime,

 @p_NextCycleAfterStartDate varchar,

 @p_NextCycleAfterEndDate varchar,

 @p_id_po int,

 @p_GUID varbinary(16),

 @p_systemdate datetime,

 @p_id_sub int,

 @p_status int output,

 @p_datemodified varchar(1) output)

as

begin

declare @real_begin_date as datetime

declare @real_end_date as datetime

declare @po_effstartdate as datetime

declare @varMaxDateTime datetime

declare @datemodified varchar(1)

select @varMaxDateTime = dbo.MTMaxDate()

	select @p_status =0

-- compute usage cycle dates if necessary

if (upper(@p_NextCycleAfterStartDate) = 'Y')

 begin

 select @real_begin_date = dbo.NextDateAfterBillingCycle(@p_id_acc,@p_dt_start)

 end

else

 begin

   select @real_begin_date = @p_dt_start

 end 

if (upper(@p_NextCycleAfterEndDate) = 'Y' AND @p_dt_end is not NULL)

 begin

 select @real_end_date = dbo.NextDateAfterBillingCycle(@p_id_acc,@p_dt_end)

   end

else

 begin

 select @real_end_date = @p_dt_end

 end

if (@p_dt_end is NULL)

 begin

 select @real_end_date = @varMaxDateTime

 end

exec AddSubscriptionBase @p_id_acc,NULL,@p_id_po,@real_begin_date,@real_end_date,@p_GUID,@p_systemdate,@p_id_sub,

@p_status output,@datemodified output

select @p_datemodified = @datemodified

end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure AddOwnedFolder(

@owner  int,

@folder int,

@p_systemdate datetime,

@p_enforce_same_corporation varchar,

@existing_owner int OUTPUT,

@status int OUTPUT)

as

begin

	declare @bFolder char

	select @status = 0 

	if (@owner = @folder) 

		begin

		--MT_FOLDER_CANNOT_OWN_ITSELF

		select @status = -486604761

		return

		end

	begin

	select @existing_owner = id_owner  from t_impersonate where	id_acc = @folder

	if (@existing_owner is null)

		begin

		select @existing_owner = 0

		end

	end

	if (@existing_owner <> 0 and @existing_owner <> @owner)

		begin

		-- the folder is already owned by another account

		-- MT_EXISTING_FOLDER_OWNER

		select @status = -486604779

		RETURN

		END 

	-- simply exit the stored procedure if the current owner is the owner

	if (@existing_owner = @owner) 

		begin

		select @status = 1

		return

		end

	-- Check first to see if its a folder

	-- return MT_ACCOUNT_NOT_A_FOLDER

	if (dbo.IsAccountFolder(@folder) = 'N')

		begin

		select @status = -486604799

		return

		end 

	if (@bFolder = 'N') 

		begin

		select @status = -486604778

		RETURN

		end 

	

		-- check that both the payer and Payee are in the same corporate account

		if @p_enforce_same_corporation = '1' AND dbo.IsInSameCorporateAccount(@owner,@folder,@p_systemdate) <> 1 

		begin

			-- MT_CANNOT_OWN_FOLDER_IN_DIFFERENT_CORPORATE_ACCOUNT

			select @status = -486604751

			return

		end

	

	

	if (@existing_owner = 0) 

		begin

		insert into t_impersonate (id_owner,id_acc) values (@owner,@folder)

		select @status = 0

		end

	select @status = 1

end 

			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





        CREATE PROCEDURE AddServiceEndpoint

          @a_id_prop int,

          @a_date_start DATETIME,

          @a_date_end DATETIME,

          @a_se_space nvarchar(40),

          @a_se_extid nvarchar(255),

          @a_corp_space nvarchar(40),

          @a_corp_extid nvarchar(255),

          @a_corp_id int,

          @a_se_id int OUTPUT,

          @a_se_corp_id int OUTPUT,

          @a_se_date_end DATETIME OUTPUT,

          @a_status int OUTPUT

        AS

        

          BEGIN

            DECLARE @a_resolved_corp_id as int

	          DECLARE @a_error as int

      	    DECLARE @a_temp as int

            DECLARE @a_transaction_started as int



      	    IF @@trancount = 0 BEGIN

              BEGIN TRAN

	            SET @a_transaction_started = 1

            END            

	          

            SET @a_status = 0

            --Check for NULL end date

            IF @a_date_end IS NULL BEGIN

              SET @a_date_end = dbo.MTMaxDate()

              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                 GOTO errHandler

              END

            END

            

            SET @a_se_date_end = @a_date_end

            

            --Check dates

            IF @a_date_start > @a_date_end BEGIN

              SET @a_status = -483458970

              GOTO errHandler

            END

            --Get an MT Value

            INSERT INTO t_mt_id default values

            SET @a_status = @@error

            SET @a_se_id = @@identity

            IF @a_status <> 0 BEGIN

              GOTO errHandler

            END

     

            --Create an entry in t_service_endpoint

            INSERT INTO t_service_endpoint (id_se, id_prop, dt_start, dt_end) VALUES (@a_se_id, @a_id_prop, @a_date_start, @a_date_end)

            SET @a_status = @@error

            IF @a_status <> 0 BEGIN

              GOTO errHandler

            END

            --If creating with namespace / name

            IF @a_corp_id IS NULL BEGIN

              --If creating globally unique

              IF @a_corp_extid IS NULL AND @a_corp_space IS NULL BEGIN

            		--Check for duplicate

              		SELECT 

            		  @a_temp = COUNT(*) 

            		FROM 

            		  t_se_mapper tsem

            		  INNER JOIN t_service_endpoint tse on tsem.id_se = tse.id_se

            		WHERE

            		  id_corp IS NULL AND 

            		  LOWER(nm_space) = LOWER(@a_se_space) AND 

            		  LOWER(nm_login) = LOWER(@a_se_extid) AND

            		  ((@a_date_start BETWEEN tse.dt_start AND tse.dt_end) OR

            		  (tse.dt_start BETWEEN @a_date_start AND @a_date_end))



                IF @a_temp > 0 BEGIN

                  SET @a_status = -483458954

                  GOTO errHandler

                END

  

                --Global SE

                SET @a_se_corp_id = NULL



                INSERT INTO t_se_mapper (id_se, id_corp, nm_space, nm_login, b_primary) VALUES (@a_se_id, NULL, @a_se_space, @a_se_extid, '1')

                SET @a_status = @@error

                IF @a_status <> 0 BEGIN

                 GOTO errHandler

                END

       	      END

       	      --Creating locally unique

              ELSE BEGIN

             		SET @a_resolved_corp_id = dbo.LookupAccount(@a_corp_extid, @a_corp_space)

                SET @a_status = @@error

                IF @a_status <> 0 BEGIN

                  GOTO errHandler

                END



          		--Check for duplicate

            		SELECT 

          		  @a_temp = COUNT(*) 

          		FROM 

          		  t_se_mapper tsem

          		  INNER JOIN t_service_endpoint tse on tsem.id_se = tse.id_se

          		WHERE

          		  id_corp = @a_resolved_corp_id AND 

          		  LOWER(nm_space) = LOWER(@a_se_space) AND 

          		  LOWER(nm_login) = LOWER(@a_se_extid) AND

          		  ((@a_date_start BETWEEN tse.dt_start AND tse.dt_end) OR

           		  (tse.dt_start BETWEEN @a_date_start AND @a_date_end))





                IF @a_temp > 0 BEGIN

                  SET @a_status = -483458954

                  GOTO errHandler

                END

                

                SET @a_se_corp_id = @a_resolved_corp_id



                INSERT INTO t_se_mapper (id_se, id_corp, nm_space, nm_login, b_primary) VALUES (@a_se_id, @a_resolved_corp_id, @a_se_space, @a_se_extid, '1')

                SET @a_status = @@error

                IF @a_status <> 0 BEGIN

                  GOTO errHandler

                END       	      

              END

            END

            --Create corporate

            ELSE BEGIN

        		--Check for duplicate

          		SELECT 

        		  @a_temp = COUNT(*) 

        		FROM 

        		  t_se_mapper tsem

        		  INNER JOIN t_service_endpoint tse on tsem.id_se = tse.id_se

        		WHERE

        		  id_corp = @a_corp_id AND 

        		  LOWER(nm_space) = LOWER(@a_se_space) AND 

        		  LOWER(nm_login) = LOWER(@a_se_extid) AND

        		  ((@a_date_start BETWEEN tse.dt_start AND tse.dt_end) OR

         		  (tse.dt_start BETWEEN @a_date_start AND @a_date_end))



              IF @a_temp > 0 BEGIN

                SET @a_status = -483458954

                GOTO errHandler

              END



              SET @a_se_corp_id = @a_corp_id

              

              INSERT INTO t_se_mapper (id_se, id_corp, nm_space, nm_login, b_primary) VALUES (@a_se_id, @a_corp_id, @a_se_space, @a_se_extid, '1')

              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                 GOTO errHandler

              END

            END

            --No errors, commit and return

            IF @a_transaction_started = 1 BEGIN

              COMMIT TRAN

              RETURN

           END

    

            --oops, an error occurred

            errHandler:

            IF @a_transaction_started = 1 BEGIN

              ROLLBACK TRAN

            END

           

            RETURN

          END



      
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



         CREATE PROCEDURE AddServiceEndpointIDMapping

    @a_id_se int,

	          @a_id_corp int,

            @a_new_id NVARCHAR(255),

            @a_new_space NVARCHAR(40),

            @b_primary VARCHAR(1),

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_temp AS INT

            DECLARE @a_transaction_started as int



      	    IF @@trancount = 0 BEGIN

              BEGIN TRAN

             SET @a_transaction_started = 1

            END               

          

            SET @a_status = 0

          

            --Make sure this mapping does not already exist

            IF @a_id_corp IS NULL BEGIN

          		SELECT

		            @a_temp = COUNT(*)

		          FROM

		            t_se_mapper tsem

	   	          INNER JOIN t_service_endpoint tse ON tsem.id_se = tse.id_se

		          WHERE

 	  	          tsem.id_corp IS NULL	

		            AND LOWER(tsem.nm_login) = LOWER(@a_new_id)

	  	          AND LOWER(tsem.nm_space) = LOWER(@a_new_space)

		            AND (tse.dt_start BETWEEN (select dt_start from t_service_endpoint where id_se = @a_id_se) AND (select dt_end from t_service_endpoint where id_se = @a_id_se) OR 

                    (select dt_start from t_service_endpoint where id_se = @a_id_se) BETWEEN tse.dt_start AND tse.dt_end)

            

            --  SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_new_id) AND LOWER(nm_space) = LOWER(@a_new_space)

            END

            ELSE BEGIN

		          SELECT

		            @a_temp = COUNT(*)

          		FROM

          		  t_se_mapper tsem

        	   	  INNER JOIN t_service_endpoint tse ON tsem.id_se = tse.id_se

          		WHERE

         	  	  tsem.id_corp = @a_id_corp

          		  AND LOWER(tsem.nm_login) = LOWER(@a_new_id)

         	  	  AND LOWER(tsem.nm_space) = LOWER(@a_new_space)

          		  AND (tse.dt_start BETWEEN (select dt_start from t_service_endpoint where id_se = @a_id_se) AND (select dt_end from t_service_endpoint where id_se = @a_id_se) OR 

                    (select dt_start from t_service_endpoint where id_se = @a_id_se) BETWEEN tse.dt_start AND tse.dt_end)



  --            SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_new_id) AND LOWER(nm_space) = LOWER(@a_new_space)

            END

            

            IF @a_temp > 0 BEGIN

              SET @a_status = -483458957

              GOTO errHandler

            END

          

            --See if any mappings exist

            SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se



           --If no other mappings exist, no need to worry about the primary (this will be it)

           IF @a_temp = 0 BEGIN

              INSERT INTO 

                t_se_mapper (id_se, id_corp, nm_login, nm_space, b_primary) 

              VALUES

                (@a_id_se, @a_id_corp, @a_new_id, @a_new_space, '1')



              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                GOTO errHandler

              END

            END

            --If this is to be a new primary, remove the old one

           ELSE BEGIN

              IF @b_primary = '1' BEGIN

                UPDATE t_se_mapper SET b_primary = '0' WHERE id_se = @a_id_se AND b_primary = '1'

                SET @a_status = @@error

                IF @a_status <> 0 BEGIN

                  GOTO errHandler

                END

              END



              --Add the new mapping

           	  INSERT INTO 

                t_se_mapper (id_se, id_corp, nm_login, nm_space, b_primary) 

              VALUES

                (@a_id_se, @a_id_corp, @a_new_id, @a_new_space, UPPER(@b_primary))



              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                GOTO errHandler

              END

            END

            

            --Commit and return

            IF @a_transaction_started = 1 BEGIN

              COMMIT TRAN

              SET @a_status = 0

              RETURN

            END

            

            errHandler:

            IF @a_transaction_started = 1 BEGIN

              ROLLBACK TRAN

            END

            

            RETURN

          END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure AdjustGsubMemberDates(

@p_id_sub integer,

@p_startdate datetime,

@p_enddate datetime,

@p_adjustedstart datetime OUTPUT,

@p_adjustedend datetime OUTPUT,

@p_datemodified char(1) OUTPUT,

@p_status INT OUTPUT

)

as

begin

	select @p_datemodified = 'N'	



	select @p_adjustedstart = dbo.mtmaxoftwodates(@p_startdate,vt_start),

	@p_adjustedend = dbo.mtminoftwodates(@p_enddate,vt_end) 

	from 

	t_sub where id_sub = @p_id_sub



	if (@p_adjustedstart <> @p_startdate OR @p_adjustedend <> @p_enddate) begin

		select @p_datemodified = 'Y'

	end

	if @p_adjustedend < @p_adjustedstart begin

		-- hmm.... looks like we are outside the effective date of the group subscription

		-- MT_GSUB_DATERANGE_NOT_IN_SUB_RANGE

		select @p_status = -486604789

		return

	end

	select @p_status = 1

	return

end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure AdjustSubDates(

@p_id_po integer,

@p_startdate datetime,

@p_enddate datetime,

@p_adjustedstart datetime OUTPUT,

@p_adjustedend datetime OUTPUT,

@p_datemodified char(1) OUTPUT,

@p_status INT OUTPUT

)

as

begin

	select @p_datemodified = 'N'	



	select @p_adjustedstart = dbo.mtmaxoftwodates(@p_startdate,po.dt_start),

	@p_adjustedend = dbo.mtminoftwodates(@p_enddate,po.dt_end) 

	from 

	(select te.dt_start,

	case when te.dt_end is NULL then dbo.mtmaxdate() else te.dt_end end as dt_end

	from t_po

	INNER JOIN t_effectivedate te on te.id_eff_date = t_po.id_eff_date

	where t_po.id_po = @p_id_po) po

	if (@p_adjustedstart <> @p_startdate OR @p_adjustedend <> @p_enddate) begin

		select @p_datemodified = 'Y'

	end

	if @p_adjustedend < @p_adjustedstart begin

		-- hmm.... looks like we are outside the effective date of the product offering

		-- MTPCUSER_PRODUCTOFFERING_NOT_EFFECTIVE

		select @p_status = -289472472

		return

	end

	select @p_status = 1

	return

end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

    CREATE  PROCEDURE Analyze (@table_name nvarchar(30))

    as

    begin

	  declare @rows_changed int

	  declare @query nvarchar(4000)

	  declare @svctablename nvarchar(255)

	  declare @id_svc nvarchar(10) 



	  -- mark the successful rows as analyzed.

	  set @query = N'update ' + @table_name +

		  N' set tx_state = ''A''

		  from ' + @table_name + N' rr

		  inner join t_acc_usage acc

		  on rr.id_sess = acc.id_sess

		  where tx_state = ''I'''



	  EXEC sp_executesql @query



	  -- set the id_parent_source_sess correctly for the children already 

	  -- identified by now (successful only)

	  set @query = N'update ' + @table_name +

		  N' set id_parent_source_sess = acc.tx_uid

		  from ' + @table_name + N' rr

		  inner join t_acc_usage acc

		  on rr.id_parent_sess = acc.id_sess

		  where acc.id_parent_sess is null

		  and rr.id_parent_source_sess is null

		  and rr.tx_state = ''A'''



	  EXEC sp_executesql @query



	  -- need to make sure id_parent_source_sess is correctly filled in at this point.

	  -- the parent child info is maintained in t_svc table 

	  -- just so the loop will run the first time

	  set @rows_changed = 1



	  while (@rows_changed > 0)

	  begin

		-- find children for successful sessions

		set @query = N'insert into ' + @table_name + N' (id_source_sess, tx_batch, id_sess, id_parent_sess, root, id_interval, id_view, tx_state, id_svc, id_parent_source_sess)

		  select

			au.tx_UID,	-- id_source_sess

			au.tx_batch,	-- tx_batch

			au.id_sess,	-- id_sess

			au.id_parent_sess,	-- id_parent

			null,			-- TODO: root

			au.id_usage_interval,	-- id_interval

			au.id_view,		-- id_view

			case ui.tx_interval_status when ''H'' then ''C'' else ''A'' end,			-- tx_state

			au.id_svc,	-- id_svc

			rr.id_source_sess -- id_parent_source_sess

			from t_acc_usage au

			inner join ' + @table_name + N' rr on au.id_parent_sess = rr.id_sess

			inner join t_usage_interval ui on au.id_usage_interval = ui.id_interval

			where not exists (select * from ' + @table_name + N' where ' + @table_name + N'.id_sess = au.id_sess)'



		EXEC sp_executesql @query



		set @rows_changed = @@ROWCOUNT



		-- find parents for successful sessions

		set @query = N'

		insert into ' + @table_name + N' (id_source_sess, tx_batch, id_sess, id_parent_sess, root, id_interval, id_view, tx_state, id_svc, id_parent_source_sess)

		  select distinct 

			auparents.tx_UID,	-- id_source_sess

			auparents.tx_batch,	-- tx_batch

			auparents.id_sess,	-- id_sess

			auparents.id_parent_sess,	-- id_parent

			null,				-- TODO: root

			auparents.id_usage_interval,	-- id_interval

			auparents.id_view,		-- id_view

			case ui.tx_interval_status when ''H'' then ''C'' else ''A'' end, -- c_state

			auparents.id_svc,		-- id_svc

			NULL -- id_parent_source_sess

		  from t_acc_usage auchild



		  inner join ' + @table_name + N' rr on auchild.id_sess = rr.id_sess

			inner join t_acc_usage auparents on auparents.id_sess = auchild.id_parent_sess

			inner join t_usage_interval ui on auparents.id_usage_interval = ui.id_interval

			where not exists (select * from ' + @table_name + N' where ' + @table_name + N'.id_sess = auparents.id_sess)'



		EXEC sp_executesql @query



		set @rows_changed = @rows_changed + @@ROWCOUNT

	 end



	 set @rows_changed = 1



	 -- complete the compound for failure cases.  In t_failed_transaction, you will have only the failed

	 -- portion of the failed transaction.	

	 while (@rows_changed > 0)

	 begin

		set @rows_changed = 0

	 		

		-- find children for failed parent sessions

		-- this query gives us the tables where the children for the parents identified may live.

		set @query =  N'DECLARE tablename_cursor CURSOR FOR

				select distinct slog.nm_table_name, cast(ed.id_enum_data as nvarchar(10))

				from ' + @table_name + N'  rr

				inner join t_failed_transaction ft

				on (rr.id_source_sess = ft.tx_failureID

				or rr.id_source_sess = ft.tx_failureCompoundID)

				inner join t_session_set ss

				on ss.id_ss = ft.id_sch_ss

				inner join t_session_set childss

				on ss.id_message = childss.id_message

				inner join t_enum_data ed

				on ed.id_enum_data = childss.id_svc

				inner join t_service_def_log slog

				on ed.nm_enum_data = slog.nm_service_def

				where id_parent_source_sess is null and tx_state = ''E'''

				

		

		EXEC sp_executesql @query

		

		OPEN tablename_cursor

		FETCH NEXT FROM tablename_cursor into @svctablename, @id_svc

		WHILE @@FETCH_STATUS = 0

		BEGIN

			PRINT @svctablename

			set @query = 'insert into ' + @table_name + N' (id_source_sess, tx_batch, id_sess, id_parent_sess, root, id_interval, id_view, tx_state, id_svc, id_parent_source_sess)

			select 

			conn.id_source_sess,	-- id_source_sess

			conn._CollectionID,	-- tx_batch

			NULL,	-- id_sess

			NULL,	-- id_parent_sess

			NULL,			-- TODO: root

			NULL,	-- id_interval

			NULL,		-- id_view

			''E'',			-- tx_state

			'+ @id_svc + N' , 	-- id_svc

			conn.id_parent_source_sess	

			from ' + @table_name + N' rr

			inner join ' + @svctablename + N' conn

			on rr.id_source_sess = conn.id_parent_source_sess

			where rr.id_parent_source_sess is null and tx_state = ''E''

			and not exists (select * from ' + @table_name + N' where ' +  @table_name + '.id_source_sess = conn.id_source_sess)'



			EXEC sp_executesql @query

			set @rows_changed = @rows_changed + @@ROWCOUNT



			FETCH NEXT FROM tablename_cursor into @svctablename, @id_svc

		END



		CLOSE tablename_cursor

		DEALLOCATE tablename_cursor



		-- find parents for failed children sessions

		-- this query gives us all the svc tables in which the parents may live



		set @query =  N'DECLARE tablename_cursor CURSOR FOR
				select distinct slog.nm_table_name, cast(ed.id_enum_data as nvarchar(10))

				from ' + @table_name + N' rr

				inner join t_failed_transaction ft

				on rr.id_source_sess = ft.tx_failureID

				inner join t_session_set ss

				on ss.id_ss = ft.id_sch_ss
				inner join t_session_set parentss

				on ss.id_message = parentss.id_message

				inner join t_enum_data ed

				on ed.id_enum_data = parentss.id_svc

				inner join t_service_def_log slog

				on ed.nm_enum_data = slog.nm_service_def

				where id_parent_source_sess is not null

				and tx_state = ''E''

				and ss.id_svc <> parentss.id_svc'



		EXEC sp_executesql @query

		OPEN tablename_cursor



		FETCH NEXT FROM tablename_cursor into @svctablename, @id_svc



		WHILE @@FETCH_STATUS = 0

		BEGIN

			PRINT @svctablename

			set @query = 'insert into ' + @table_name + N' (id_source_sess, tx_batch, id_sess, id_parent_sess, root, id_interval, id_view, tx_state, id_svc, id_parent_source_sess)

			select 

			call.id_source_sess,	-- id_source_sess

			call._CollectionID,	-- tx_batch

			NULL,	-- id_sess

			NULL,	-- id_parent_sess

			NULL,			-- TODO: root

			NULL,	-- id_interval

			NULL,		-- id_view

			''E'',			-- tx_state 

			'+ @id_svc + N' , 	-- id_svc

			call.id_parent_source_sess	

			from ' + @table_name + N' rr

			inner join ' + @svctablename + N' call

			on rr.id_parent_source_sess = call.id_source_sess

			where rr.id_parent_source_sess is not null and tx_state = ''E''

			and not exists (select * from ' + @table_name + N' where ' +  @table_name + '.id_source_sess = call.id_source_sess)'



			EXEC sp_executesql @query

			set @rows_changed = @rows_changed + @@ROWCOUNT

		

			FETCH NEXT FROM tablename_cursor into @svctablename, @id_svc



		END



		CLOSE tablename_cursor



		DEALLOCATE tablename_cursor



	 end







	-- handle suspended and pending transactions.  We know we will have identified

	-- all suspended and pending parents.  Only children need to be looked at.

	-- following query tells us which tables to look for the children



	set @query = N'DECLARE tablename_cursor CURSOR FOR

			select cast(ss2.id_svc as nvarchar(10)), slog.nm_table_name 

			from t_session_set ss2

			inner join t_enum_data ed

			on ss2.id_svc = ed.id_enum_data

			inner join t_service_def_log slog

			on ed.nm_enum_data = slog.nm_service_def

			where id_message in (

			select ss.id_message from '+ @table_name + N' rr

			inner join t_session sess

			on sess.id_source_sess = rr.id_source_sess

			inner join t_session_set ss

			on sess.id_ss = ss.id_ss

			inner join t_message msg

			on msg.id_message = ss.id_message
			where rr.tx_state = ''NC'')

			and ss2.b_root = ''0'''



		EXEC sp_executesql @query



		OPEN tablename_cursor

		FETCH NEXT FROM tablename_cursor into @id_svc, @svctablename

		WHILE @@FETCH_STATUS = 0

		BEGIN

			set @query = N'insert into ' + @table_name + N' (id_source_sess, tx_batch, id_sess, id_parent_sess, root, id_interval, id_view, tx_state, id_svc, id_parent_source_sess)

				select svc.id_source_sess, null, 

				null, null, null, null, null, ''NA'', '

				+ @id_svc + N' , rr.id_source_sess

				from ' + @table_name + N' rr

				inner join ' + @svctablename + N' svc

				on rr.id_source_sess = svc.id_parent_source_sess

				where rr.tx_state = ''NC'''



			EXEC sp_executesql @query



			FETCH NEXT FROM tablename_cursor into @id_svc, @svctablename

		END

		CLOSE tablename_cursor

		DEALLOCATE tablename_cursor



	set @query = N'update ' + @table_name + N'

			set tx_state = ''NA'' where

			tx_state = ''NC'''



	EXEC sp_executesql @query

  end



  
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      

      CREATE PROCEDURE ApprovePayments

			  @id_interval int,

				@status int output

			AS

			BEGIN

			  SET @status = -1



				-- It is not necessary to use the temp table here.

				-- However, since there is currently no index on the 

				-- t_acc_uage.id_usage_interval column, to improve the 

				-- performance, the temp table is used so that the 

				-- id_sess be looked up only once for the two deletions.

				DECLARE @id_enum int

				SELECT

				  @id_enum = id_enum_data

				FROM

				  t_enum_data

				WHERE

				  nm_enum_data = 'metratech.com/paymentserver/PaymentStatus/Pending'

				IF ((@@ERROR != 0) OR (@@ROWCOUNT = 0)) 

				BEGIN

					GOTO FatalError

				END



				UPDATE 

				  t_pv_ps_paymentscheduler 

				SET 

				  c_currentstatus = @id_enum

				WHERE

				  c_originalintervalid = @id_interval

				IF (@@ERROR != 0)

				BEGIN

					GOTO FatalError

				END



				SET @status = 0

				RETURN 0



			FatalError:

			SET @status = -1



			END

      
      
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

    Create Procedure Backout(@rerun_table_name nvarchar(30), @delete_failed_records VARCHAR(1)) as

    begin

	    declare @sql nvarchar(4000)



	    -- values we get from the cursor

	    declare @tablename varchar(255)

	    declare @id_view int



	    -- update the state in t_session_state



	    -- delete from the productviews.

	    set @sql = N'DECLARE tablename_cursor CURSOR FOR

	    select rr.id_view, pv.nm_table_name from 

		    t_prod_view pv

		    inner join ' + @rerun_table_name + N' rr on rr.id_view = pv.id_view

		    where rr.tx_state = ''A''

		    group by rr.id_view, pv.nm_table_name'



	    EXEC sp_executesql @sql



	    OPEN tablename_cursor

	    FETCH NEXT FROM tablename_cursor into @id_view, @tablename

	    WHILE @@FETCH_STATUS = 0

	    BEGIN

	      set @sql = N'DELETE from ' + @tablename

			    + N' where id_sess in (select id_sess from ' + @rerun_table_name +

			    N' where id_view = ' + CAST(@id_view AS VARCHAR)

				  + N' and tx_state = ''A'')'



	      exec (@sql)

	      FETCH NEXT FROM tablename_cursor into @id_view, @tablename

	    END

	    CLOSE tablename_cursor

	    DEALLOCATE tablename_cursor



	    -- delete from t_acc_usage

	    set @sql = N'delete from t_acc_usage where id_sess in

	      (select id_sess from ' + @rerun_table_name +

			    N' where tx_state = ''A'')'



	    EXEC sp_executesql @sql



      if (@delete_failed_records = 'Y')

      BEGIN

	      -- delete errors from t_failed_transaction and t_failed_transaction_msix

	      set @sql = N'delete t_failed_transaction_msix from t_failed_transaction_msix msix

	   		    inner join t_failed_transaction ft on 

          	ft.id_failed_transaction = msix.id_failed_transaction

     			  inner join ' + @rerun_table_name + N' rr on

          	rr.id_source_sess = ft.tx_failurecompoundid

     			  where rr.tx_state = ''E'''

    	

	      EXEC sp_executesql @sql



	      set @sql = N'delete t_failed_transaction from 

		        t_failed_transaction ft

     		    inner join ' + @rerun_table_name + N' rr

		        on ft.tx_failurecompoundid = rr.id_source_sess

     		    where rr.tx_state = ''E'''



	      EXEC sp_executesql @sql

	    END



	  -- update the rerun table so we know these have been backed out

	  set @sql = N'update ' + @rerun_table_name + N' set tx_state = ''B'' where (tx_state = ''A'' or tx_state = ''E'')'

	  EXEC sp_executesql @sql

  end

    
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create proc BulkSubscriptionChange(

@id_old_po as int,

@id_new_po as int,

@date as datetime,

@nextbillingcycle as varchar(1),

@p_systemdate datetime,

@new_sub int,

@p_status int output

)

as

DECLARE @CursorVar CURSOR	

DECLARE @count as int

declare @i as int

declare @id_acc as int

declare @end_date as datetime

declare @id_sub as int

declare @varmaxdatetime datetime

declare @subext as varbinary(16)

declare @realenddate as datetime

declare @datemodified as varchar(1)

SET @p_status = 0

-- lock everything down as tight as possible!

--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

begin 

select @varmaxdatetime = dbo.mtmaxdate ()

-- should we update the end effective date of the 

-- old product offering here?

-- create a cursor that holds a static list of all old

-- subscriptions that have end dates later than the old date

set @CursorVar = CURSOR STATIC FOR

	select id_acc,vt_end,id_sub

	from t_sub

	where t_sub.id_po = @id_old_po AND

	t_sub.vt_end >= @date

	AND id_group is NULL

OPEN @CursorVar

set @count = @@cursor_rows

set @i = 0

while @i < @count begin

	FETCH NEXT FROM @CursorVar into @id_acc,@end_date,@id_sub

	set @i = (select @i + 1)

	select @subext = CAST(newid() as varbinary(16))





	select @realenddate = case when @nextbillingcycle = 'Y' AND @date is not null then

		dbo.subtractsecond(dbo.NextDateAfterBillingCycle(@id_acc,@date))

	else

		dbo.subtractsecond(@date)

	end		



	-- update the old subscription use the specified date

	update t_sub set vt_end = @realenddate where

	id_sub = @id_sub



	-- update the old subscription tt_end

	UPDATE t_sub_history

  SET tt_end = dbo.subtractsecond (@p_systemdate)

	WHERE id_sub = @id_sub

	and tt_end = @varmaxdatetime



	-- insert the new record

	INSERT INTO t_sub_history

  SELECT id_sub, id_sub_ext, id_acc, id_po, dt_crt, id_group,

         vt_start, @realenddate, @p_systemdate, @varmaxdatetime

  FROM t_sub_history

   WHERE id_sub = @id_sub

     AND tt_end = dbo.subtractsecond (@p_systemdate)



	exec AddNewSub  

		@id_acc,

		@date,

		@end_date,

		@nextbillingcycle, -- next billing cycle after start date

		'N',

		@id_new_po,

		@subext,

		@p_systemdate,

		@new_sub,

		@p_status OUTPUT,

		@datemodified OUTPUT



	-- if @new_status is not 0 then raise an error

	-- CR 11160: set output result parameter and return error

	if @p_status <> 1 

	begin

		CLOSE @CursorVar

		DEALLOCATE @CursorVar	

		return

	end

	/* CR 12529 - increment the id */

	set @new_sub = @new_sub + 1

end 

CLOSE @CursorVar

DEALLOCATE @CursorVar

end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create proc CanBulkSubscribe(@id_old_po as int,

										 @id_new_po as int,

										 @subdate as datetime,

										 @status as int output)

			as

			declare @conflictcount as int

			set @conflictcount = 0

			set @status = 0 -- success

			declare @countvar as int

			declare @totalnum as int



			-- step 1: are there any subscriptions that are already subscribed to the new product offering

			set @conflictcount = (select count(t_sub.id_sub) --t_sub.id_acc,t_subnew.id_acc

			from t_sub where t_sub.id_po = @id_new_po AND

			t_sub.vt_start <= @subdate AND t_sub.vt_end >= @subdate

			and t_sub.id_acc in (

				select sub2.id_acc from t_sub sub2 where sub2.id_po = @id_old_po AND

				sub2.vt_start <= @subdate AND sub2.vt_end >= @subdate

				)

			)

			if(@conflictcount > 0) begin

				set @status = 1

				return

			end



			-- step 2: does the destination product offering conflict with  

			select @countvar = count(id_pi_template),@totalnum = (select count(id_pi_template) from t_pl_map where id_po = @id_new_po)

			 from t_pl_map where id_po = @id_new_po AND id_pi_template in 

			(

			select id_pi_template from t_pl_map map where id_pi_template not in 

				-- find all templates from subscribed product offerings

				(select DISTINCT(id_pi_template) from t_pl_map where t_pl_map.id_po in 

					-- match all product offerings

					(select id_po from t_sub where 

					t_sub.vt_start <= @subdate AND t_sub.vt_end >= @subdate 

					-- get all of the accounts where they are currently subscribed to the original

					-- product offering

					AND t_sub.id_acc in (

						select id_acc from t_sub where id_po = @id_old_po AND

						t_sub.vt_start <= @subdate AND t_sub.vt_end >= @subdate

						)

					)

				)

			UNION

				select DISTINCT(id_pi_template) from t_pl_map where id_po = @id_old_po

			)



			if(@countvar <> @totalnum) begin

				set @status = 2

			end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC CanExecuteEvents(@dt_now DATETIME, @id_instances VARCHAR(4000))
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
    evt.tx_display_name,
    'OK'
  FROM CSVToInt(@id_instances) args
  INNER JOIN t_recevent_inst inst ON inst.id_instance = args.value
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC CanReverseEvents(@dt_now DATETIME, @id_instances VARCHAR(4000))
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
    evt.tx_display_name,
    'OK'
  FROM CSVToInt(@id_instances) args
  INNER JOIN t_recevent_inst inst ON inst.id_instance = args.value
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE CancelSubmittedEvent

(

  @dt_now DATETIME,

  @id_instance INT,

  @id_acc INT,

  @tx_detail nvarchar(2048),

  @status INT OUTPUT

)

AS



BEGIN

  DECLARE @current_status VARCHAR(14)

  DECLARE @previous_status VARCHAR(14)



  SELECT @status = -99



  BEGIN TRAN

  -- gets the instances current status

  SELECT 

    @current_status = inst.tx_status

  FROM t_recevent_inst inst

  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

  WHERE 

    -- event is active

    evt.dt_activated <= @dt_now AND

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

    inst.id_instance = @id_instance

  

  IF @@ROWCOUNT = 0

  BEGIN

    SELECT @status = -1  -- instance was not found

    ROLLBACK

    RETURN

  END



  IF @current_status = 'ReadyToRun'

  BEGIN

    -- the only way to get to ReadyToRun is from NotYetRun

    SELECT @previous_status = 'NotYetRun'

  END

  ELSE IF @current_status = 'ReadyToReverse'

  BEGIN

    -- the only way to get to ReadyToReverse is from Succeeded or Failed

    -- determines which of these two statuses by looking at the last run's status

    SELECT TOP 1 @previous_status = run.tx_status

    FROM t_recevent_run run

    WHERE run.id_instance = @id_instance

    ORDER BY run.dt_end desc

  END

  ELSE

  BEGIN

    SELECT @status = -2  -- instance cannot be cancelled because it is not in a legal state

    ROLLBACK

    RETURN

  END

  -- reverts the instance's state to what it was previously

  UPDATE t_recevent_inst

  SET tx_status = @previous_status, b_ignore_deps = 'N', dt_effective = NULL

  WHERE id_instance = @id_instance



  -- records the action

    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)

  VALUES(@id_instance, @id_acc, 'Cancel', NULL, NULL, @tx_detail, @dt_now) 



  SELECT @status = 0  -- success



  COMMIT

END


  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				CREATE PROCEDURE CheckAccountCreationBusinessRules(
				  @p_nm_space nvarchar(40),
				  @p_acc_type varchar(3),
				  @p_id_ancestor int,
					@status int OUTPUT)
				AS
				BEGIN
				  -- 1. check account and its ancestor business rules. 
					-- if the account being created belongs to a hierarchy, then it should not
					-- have system_user or system_auth namespace
					-- 
					DECLARE @tx_typ_space AS varchar(40)
					SELECT 
				  	@tx_typ_space = tx_typ_space 
					FROM
				  	t_namespace 
					WHERE
				  	nm_space = @p_nm_space		
	
					IF (@tx_typ_space in ('system_user', 
					                      'system_auth', 
					                      'system_mcm', 
					                      'system_ops', 
					                      'system_rate', 
																'system_csr'))
					BEGIN
						-- An account in the hierarchy cannot be of system namespace
						-- type
					  IF (@p_id_ancestor IS NOT NULL)
						BEGIN
							-- MT_ACCOUNT_NAMESPACE_AND_HIERARCHY_MISMATCH ((DWORD)0xE2FF0045L)
			  			SELECT @status = -486604731
							RETURN
						END

						-- An account with this account type and namespace cannot be
						-- created
					  IF (@p_acc_type in ('IND', 'SUB'))
						BEGIN
							-- MT_ACCOUNT_TYPE_AND_NAMESPACE_MISMATCH ((DWORD)0xE2FF0046L)
			  			SELECT @status = -486604732
							RETURN
						END
					END	

					-- If an account is not a subscriber or an independent account 
					-- and its namespace is system_mps, that shouldnt be allowed
					-- either
					IF (@tx_typ_space = 'system_mps')
					BEGIN
					  IF (@p_acc_type NOT IN ('SUB','IND'))
						BEGIN
							-- MT_ACCOUNT_TYPE_AND_NAMESPACE_MISMATCH ((DWORD)0xE2FF0046L)
			  			SELECT @status = -486604732
							RETURN
						END
					END
				
					SELECT @status = 1
				END	
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE CheckAccountStateDateRules (

				  @p_id_acc integer,

					@p_old_status varchar(2),

					@p_new_status varchar(2),

					@p_ref_date datetime,

					@status integer output)

				AS

				BEGIN

					declare @dt_crt datetime

	

					-- Rule 1: There should be no updates with dates earlier than 

					-- inception date

					SELECT 

					  @dt_crt = dbo.mtstartofday(dt_crt)

					FROM 	

					  t_account 

					WHERE

					  id_acc = @p_id_acc



					IF (dbo.mtstartofday(@p_ref_date) < @dt_crt)

					BEGIN

					  -- MT_SETTING_START_DATE_BEFORE_ACCOUNT_INCEPTION_DATE_NOT_ALLOWED

					  -- (DWORD)0xE2FF002EL

					  SELECT @status = -486604754

					  return

					END



					-- Rule 2: If updating from active to active state and there is usage

					-- and there should be no updates with dates later than the existing date

					IF ((@p_old_status = 'AC') AND 

							(@p_new_status = 'AC') AND

							(dbo.mtstartofday(@p_ref_date) > @dt_crt))

					BEGIN

						IF EXISTS (

						SELECT TOP 1 

							id_acc

						FROM

							t_acc_usage

						WHERE

							id_acc = @p_id_acc)

						BEGIN

							-- ACCOUNT_CONTAINS_USAGE_ACTIVE_DATE_MOVE_IN_FUTURE_NOT_ALLOWED

							-- (DWORD)0xE406000EL

							SELECT @status = -469368818

							return

						END

					END



					select @status = 1

				 END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE CheckForNotArchivedDescendents (

					@id_acc INT,

					@ref_date DATETIME,

					@status INT output)

				AS



				BEGIN

				  select @status = 1



					BEGIN

						-- Check first to see if its a folder

						-- return MT_ACCOUNT_NOT_A_FOLDER

				 		IF (dbo.IsAccountFolder(@id_acc) = 'N')

						BEGIN

							SELECT @status = -486604799

							RETURN

				 		END 



						-- select accounts that have status as closed or archived

						SELECT 

							@status = count(*)  

						FROM 

				  		t_account_ancestor aa

							-- join between t_account_state and t_account_ancestor

							INNER JOIN t_account_state astate ON aa.id_ancestor = astate.id_acc 

						WHERE

							aa.id_ancestor = @id_acc AND

				  		astate.status <> 'AR' AND

				  		@ref_date between astate.vt_start and astate.vt_end AND

				  		@ref_date between aa.vt_start and aa.vt_end

				  		-- success is when no rows found

   					IF (@status = 0)

						BEGIN

						  SELECT @status = 1

         			RETURN

            END

					END

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE CheckForNotClosedDescendents (

					@id_acc INT,

					@ref_date DATETIME,

					@status INT output)

				AS

					BEGIN

						select @status = 1

						begin

						-- Check first to see if its a folder

						-- return MT_ACCOUNT_NOT_A_FOLDER

				 		if (dbo.IsAccountFolder(@id_acc) = 'N')

						  begin

							select @status = -486604799

							return

				 		  end 



						-- select accounts that have status less than closed

						SELECT @status =	count(*) 

						FROM 

				  		t_account_ancestor aa

							-- join between t_account_state and t_account_ancestor

							INNER JOIN t_account_state astate ON aa.id_ancestor = astate.id_acc 

						WHERE

							aa.id_ancestor = @id_acc AND

				  		astate.status <> 'CL' AND

				  		@ref_date between astate.vt_start and astate.vt_end AND

				  		@ref_date between aa.vt_start and aa.vt_end

				  		-- success is when no rows found

   						if (@status is null)

							   begin

         				  select @status = 1

         					return

					        end

					  end

					END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure CheckGroupSubBusinessRules(

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

			where 

			aa.id_ancestor=1

			and

			aa.num_generations =1 

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

			where 

			aa.id_ancestor=1

			and

			aa.num_generations =1 

			and

			aa.id_descendent=@p_CorporateAccount

			and

			aa.vt_start <= @p_enddate

			and

			aa.vt_end >= @p_enddate

		)

		or exists (

			select * 

			-- This finds a record that ends during the

			-- interval...

			from t_account_ancestor aa

			where 

			aa.id_ancestor=1

			and

			aa.num_generations =1 

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

				from 

				t_account_ancestor aa2

				where

				aa.id_descendent=aa2.id_descendent

				and

				aa2.id_ancestor=1

				and

				aa2.num_generations = 1

				and

				aa2.vt_start <= dateadd(s, 1, aa.vt_end)

				and

				aa2.vt_end > aa.vt_end	

			)

		)

		begin

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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

					  CREATE procedure CloneSecurityPolicy 

            (@parent_id_acc int,

             @child_id_acc  int ,

             @parent_pol_type varchar(1),

						 @child_pol_type varchar(1))

            as

            

            begin				

            declare @polid INT,			

										@parentPolicy INT,

										@childPolicy INT		

            exec sp_Insertpolicy N'id_acc', @parent_id_acc,@parent_pol_type, @parentPolicy output

  					exec sp_Insertpolicy N'id_acc', @child_id_acc, @child_pol_type,@childPolicy output

						DELETE FROM T_POLICY_ROLE WHERE id_policy = @childPolicy

						INSERT INTO T_POLICY_ROLE

						SELECT @childPolicy, pr.id_role FROM T_POLICY_ROLE pr

						INNER JOIN T_PRINCIPAL_POLICY pp ON pp.id_policy = pr.id_policy

						WHERE pp.id_acc = @parent_id_acc AND

						pp.policy_type = @parent_pol_type

						end

         
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE PROCEDURE ConnectServiceEndpoint

            @a_id_se int,

            @a_login nvarchar(255),

            @a_namespace nvarchar(40),

            @a_date_start DATETIME,

            @a_date_end DATETIME,

            @a_account_id int,

            @a_conn_account_id int OUTPUT,

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_resolved_acct_id as int

            DECLARE @a_temp as int

            DECLARE @a_acc_corp_id as int

            DECLARE @a_se_corp_id as int

          

            SET @a_status = 0

          

            --Check for NULL end date

            IF @a_date_end IS NULL BEGIN

              SET @a_date_end = dbo.MTMaxDate()

            END

          

            --Check dates

            IF @a_date_start > @a_date_end BEGIN

              SET @a_status = -483458969

              RETURN

            END

          

            --Check if SE exists

            SELECT @a_temp = COUNT(*) FROM t_service_endpoint WHERE @a_date_start >= dt_start AND @a_date_start <= dt_end AND @a_date_end >= dt_start AND @a_date_end <= dt_end AND id_se = @a_id_se

            IF @a_temp = 0 BEGIN

              SET @a_status = -483458968

              RETURN

            END

          

            --Check if connection exists for the SE

            SELECT @a_temp = COUNT(*) FROM t_se_parent WHERE (@a_date_start between dt_start and dt_end OR @a_date_end between dt_start and dt_end) AND id_se = @a_id_se

            IF @a_temp > 0 BEGIN

              SET @a_status = -483458967

              RETURN

            END

            

            --Get the corporate ID of the endpoint

            SELECT

              @a_se_corp_id = CASE WHEN id_corp IS NULL then -1 ELSE id_corp END

            FROM  t_se_mapper tse

            WHERE id_se = @a_id_se

          

            -- Resolve the account ID if necessary

            IF @a_account_id IS NULL BEGIN

              --Resolve the account ID

              SET @a_resolved_acct_id = dbo.LookupAccount(@a_login, @a_namespace)

              IF @@error > 0 BEGIN

                SELECT @a_status = -483458966

                RETURN

              END

          

              SET @a_conn_account_id = @a_resolved_acct_id

            END

            ELSE BEGIN

              SET @a_conn_account_id = @a_account_id

            END

            

            -- Get the corporate ID of the account -- NULL is returned if the account doesn't exist at the connection

            -- start date.  Don't worry about the end because accounts don't end.

            -- At some point, account state should probably be included.  ?



            SELECT

              @a_acc_corp_id = corp_parent.id_ancestor

            FROM

            	t_account_ancestor descendent

              INNER JOIN t_account_ancestor parent on parent.id_descendent = @a_conn_account_id AND

                                                      parent.id_ancestor   = 1   AND

                                                      @a_date_start between parent.vt_start and parent.vt_end

              INNER JOIN t_account_ancestor corp_parent on corp_parent.id_descendent = @a_conn_account_id AND

                                                           corp_parent.num_generations = parent.num_generations - 1 AND

  	                                                       @a_date_start between corp_parent.vt_start and corp_parent.vt_end

            WHERE

              descendent.id_descendent = @a_conn_account_id AND

            	descendent.id_ancestor = 1 AND

              @a_date_start between descendent.vt_start and descendent.vt_end

              

              

            --Check if account exists

            IF @a_acc_corp_id IS NULL BEGIN

              SELECT @a_status = -483458953

              RETURN

            END

            

            

            --If @a_se_corp_id = -1, then it is a global SE, and corp doesn't matter

            IF @a_se_corp_id <> -1 BEGIN

              --Check if corp accounts are the same

              IF @a_acc_corp_id <> @a_se_corp_id BEGIN

                SELECT @a_status = -483458952

                RETURN

              END

            END

            

            --Now insert the data

            INSERT INTO t_se_parent (id_se, id_acc, dt_start, dt_end) VALUES (@a_id_se, @a_conn_account_id, @a_date_start, @a_date_end)

            SET @a_status = @@error

            IF @a_status <> 0 BEGIN

              RETURN

            END

          END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create Procedure CreateAccountStateRecord (

@p_id_acc int,
@p_status varchar(2),

@startdate  datetime,

@enddate datetime,

@p_systemdate datetime,

@status int OUTPUT

)

as

declare @realstartdate datetime

declare @realenddate datetime

declare @varMaxDateTime datetime

declare @tempStartDate datetime

declare @tempEndDate datetime

declare @onesecond_systemdate datetime

declare @temp_id_acc int
declare @temp_status varchar(2)


begin



-- detect directly adjacent records with a adjacent start and end date.  If the

-- key comparison matches successfully, use the start and/or end date of the original record 

-- instead.



select @realstartdate = @startdate,@realenddate = @enddate,@varMaxDateTime = dbo.mtmaxdate(),

  @onesecond_systemdate = dbo.subtractsecond(@p_systemdate)



 -- Someone changes the start date of an existing record so that it creates gaps in time

 -- Existing Record      |---------------------|

 -- modified record       	|-----------|

 -- modified record      |-----------------|

 -- modified record         |------------------|

	begin

		

		-- find the start and end dates of the original interval

		select 

		@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_account_state_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_acc = @p_id_acc AND status = @p_status and tt_end = @varMaxDateTime 



		-- the original date range is no longer true

		update t_account_state_history

    set tt_end = @onesecond_systemdate

		where id_acc = @p_id_acc AND status = @p_status AND vt_start = @tempstartdate AND

		@tempenddate = vt_end AND tt_end = @varMaxDateTime



		-- adjust the two records end dates that are adjacent on the start and

		-- end dates; these records are no longer true

		update t_account_state_history 

		set tt_end = @onesecond_systemdate where

		id_acc = @p_id_acc AND tt_end = @varMaxDateTime AND

		(vt_end = dbo.subtractSecond(@tempstartdate) OR vt_start = dbo.addsecond(@tempenddate))
    if (@@error <> 0 )

		begin

    select @status = 0

		end



		insert into t_account_state_history 

		(id_acc,status,vt_start,vt_end,tt_start,tt_end)

		select 

			id_acc,status,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

			from t_account_state_history 

			where

			id_acc = @p_id_acc AND vt_end = dbo.subtractSecond(@tempstartdate)

		UNION ALL

		select

			id_acc,status,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

			from t_account_state_history

			where

			id_acc = @p_id_acc  AND vt_start = dbo.addsecond(@tempenddate)



	end



	-- detect directly adjacent records with a adjacent start and end date.  If the

	-- key comparison matches successfully, use the start and/or end date of the original record 

	-- instead.

	

	select @realstartdate = vt_start

	from 

	t_account_state_history  where id_acc = @p_id_acc AND status = @p_status AND

		@startdate between vt_start AND dbo.addsecond(vt_end) and tt_end = @varMaxDateTime

	if @realstartdate is NULL begin

		select @realstartdate = @startdate

	end

	--CR 10620 fix: Do not add a second to end date

	select @realenddate = vt_end

	from

	t_account_state_history  where id_acc = @p_id_acc AND status = @p_status AND

	@enddate between vt_start AND vt_end and tt_end = @varMaxDateTime

	if @realenddate is NULL begin

		select @realenddate = @enddate

	end



 -- step : delete a range that is entirely in the new date range

 -- existing record:      |----|

 -- new record:      |----------------|

 update  t_account_state_history 

 set tt_end = @onesecond_systemdate

 where dbo.EnclosedDateRange(@realstartdate,@realenddate,vt_start,vt_end) =1 AND

 id_acc = @p_id_acc  AND tt_end = @varMaxDateTime 



 -- create two new records that are on around the new interval        

 -- existing record:          |-----------------------------------|

 -- new record                        |-------|

 --

 -- adjusted old records      |-------|       |--------------------|

  begin

    select

		@temp_id_acc = id_acc,
@temp_status = status


		,@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_account_state_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_acc = @p_id_acc and tt_end = @varMaxDateTime AND  status <> @p_status

    update     t_account_state_history 

    set tt_end = @onesecond_systemdate where

    dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_acc = @p_id_acc AND tt_end = @varMaxDateTime AND  status <> @p_status

   insert into t_account_state_history 

   (id_acc,status,vt_start,vt_end,tt_start,tt_end)

   select 

    @temp_id_acc,@temp_status,@tempStartDate,dbo.subtractsecond(@realstartdate),

    @p_systemdate,@varMaxDateTime

    where @tempstartdate is not NULL AND @tempStartDate <> @realstartdate

    -- the previous statement may fail

		if @realenddate <> @tempendDate AND @realenddate <> @varMaxDateTime begin

			insert into t_account_state_history 

			(id_acc,status,vt_start,vt_end,tt_start,tt_end)

	    select

	    @temp_id_acc,@temp_status,@realenddate,@tempEndDate,

	    @p_systemdate,@varMaxDateTime

		end

    -- the previous statement may fail

  end

 -- step 5: update existing payment records that are overlapping on the start

 -- range

 -- Existing Record |--------------|

 -- New Record: |---------|

 insert into t_account_state_history

 (id_acc,status,vt_start,vt_end,tt_start,tt_end)

 select 

 id_acc,status,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

 from 

 t_account_state_history  where

 id_acc = @p_id_acc AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 

 update t_account_state_history

 set tt_end = @onesecond_systemdate

 where

 id_acc = @p_id_acc AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 -- step 4: update existing payment records that are overlapping on the end

 -- range

 -- Existing Record |--------------|

 -- New Record:             |-----------|

 insert into t_account_state_history

 (id_acc,status,vt_start,vt_end,tt_start,tt_end)

 select

 id_acc,status,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

 from t_account_state_history

 where

 id_acc = @p_id_acc AND 

 vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 update t_account_state_history

 set tt_end = @onesecond_systemdate

 where id_acc = @p_id_acc AND 

  vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 -- used to be realenddate

 -- step 7: create the new payment redirection record.  If the end date 

 -- is not max date, make sure the enddate is subtracted by one second

 insert into t_account_state_history 

 (id_acc,status,vt_start,vt_end,tt_start,tt_end)

 select 

 @p_id_acc,@p_status,@realstartdate,

  case when @realenddate = dbo.mtmaxdate() then @realenddate else 

  dbo.subtractsecond(@realenddate) end,

  @p_systemdate,@varMaxDateTime

  

delete from t_account_state where id_acc = @p_id_acc

insert into t_account_state (id_acc,status,vt_start,vt_end)

select id_acc,status,vt_start,vt_end

from t_account_state_history  where

id_acc = @p_id_acc and tt_end = @varMaxDateTime

 select @status = 1

 end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      create  procedure CreateAdjustmentTable(@p_id_pi_type INTEGER,  @p_status INTEGER OUTPUT, @p_err_msg VARCHAR(512) OUTPUT)

as

	DECLARE @CursorVar CURSOR

	declare @columncursor CURSOR

	declare @count integer

	declare @i integer

	declare @pvname varchar(256)

	declare @adjname varchar(256)

	declare @ddlstr as varchar(8000)

	declare @idpi as int

	declare @innercount as int

	declare @j as int

	declare @columnname as varchar(256)

	declare @datatype as varchar(256)

	declare @pv VARCHAR(255)

  declare @newpiname VARCHAR(255)

  declare @piname VARCHAR(255)



  set @p_status = 0

  select TOP 1 @pv = pi1.nm_productview, @piname = bp.nm_name, @newpiname = bpnew.nm_name from t_pi pi1

  inner join t_pi pi2 on pi1.nm_productview = pi2.nm_productview

  inner join t_base_props bp on bp.id_prop = pi2.id_pi

  inner join t_base_props bpnew on bpnew.id_prop = pi1.id_pi

  where pi1.id_pi = @p_id_pi_type AND pi2.id_pi <> pi1.id_pi

  if LEN(@pv) > 0

  BEGIN

    SELECT @p_status = 1

    SELECT @p_err_msg = 'Product View ''' + @pv + ''' is shared between ''' +  @newpiname + ''' and ''' + @piname + '''';

    SELECT @p_err_msg = @p_err_msg + '. If ''' + @newpiname + ''' is adjustable, make sure that charges in these priceable item types are the same.'; 

  END



	SET @CursorVar = CURSOR FORWARD_ONLY STATIC

	FOR

	select distinct(pv.nm_table_name),

	't_aj_' + substring(pv.nm_table_name,6,1000),

	t_pi.id_pi

	from 

	t_pi

	-- all of the product views references by priceable items

	INNER JOIN t_prod_view pv on pv.nm_name = t_pi.nm_productview

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

    select @ddlstr =  ('if NOT exists (select * from dbo.sysobjects where id = object_id(''' + @adjname + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) ')

    select @ddlstr = @ddlstr + 'create table ' + @adjname + ' (id_adjustment int'

		while (@j < @innercount) begin

			FETCH NEXT FROM @columncursor into @columnname,@datatype

			select @ddlstr = (@ddlstr + ', c_aj_' + right(@columnname,len(@columnname)-2) + ' ' + @datatype)

			select @j = @j+1

		end

		select @ddlstr = (@ddlstr + ')')

		exec (@ddlstr)

		CLOSE @columncursor

		DEALLOCATE @columncursor

	end

	CLOSE @CursorVar

	DEALLOCATE @CursorVar

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



						create procedure CreateAdjustmentType

						(@p_id_prop INT, 

						 @p_tx_guid VARBINARY(16), 

						 @p_id_pi_type INT, 

             @p_n_AdjustmentType INT, 

             @p_b_supportBulk VARCHAR,

             @p_tx_defaultdesc NTEXT,

             @p_id_formula INT

             )

						as

						begin

            	INSERT INTO t_adjustment_type

            	(id_prop, tx_guid,id_pi_type,n_AdjustmentType,b_supportBulk,id_formula, tx_default_desc

            	 ) VALUES (

							@p_id_prop, @p_tx_guid, @p_id_pi_type, @p_n_AdjustmentType, @p_b_supportBulk, @p_id_formula,

							@p_tx_defaultdesc)

        		END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


						create procedure CreateCalculationFormula
						(@p_tx_formula ntext,
             @p_id_engine INT,
             @op_id_prop int OUTPUT)
						as
						begin
            	INSERT INTO t_calc_formula
            	(tx_formula,id_engine) VALUES (
							@p_tx_formula, @p_id_engine)
							if (@@error <> 0) 
                  begin
                  select @op_id_prop = -99
                  end
                  else
                  begin
                  select @op_id_prop = @@identity
                  end
        		END
				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			CREATE procedure CreateCompositeAdjustmentDetails

			(@p_id_prop INT, 

			@p_id_pi_type INT, 

			@p_pi_name VARCHAR(255),

			@p_adjustment_type_name VARCHAR(255)

			)

			as

			declare @id_pi_type int

			declare @id_adjustment_type int

			begin



				set @id_pi_type = (select top 1 t_base_props.id_prop from t_adjustment_type inner join t_base_props on

				t_base_props.id_prop = t_adjustment_type.id_pi_type where nm_name like @p_pi_name)

				

				SET @id_adjustment_type = (select t_adjustment_type.id_prop from t_adjustment_type inner join t_base_props on

				t_base_props.id_prop = t_adjustment_type.id_prop where nm_name like @p_adjustment_type_name and t_adjustment_type.id_pi_type = @id_pi_type ) 





				insert into t_composite_adjustment(id_prop, id_pi_type, id_adjustment_type) values(@p_id_prop, @id_pi_type, @id_adjustment_type )



			end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			CREATE procedure CreateCompositeAdjustmentType

			(@p_id_prop INT, 

			@p_tx_guid VARBINARY(16), 

			@p_id_pi_type INT, 

			@p_n_AdjustmentType INT, 

			@p_b_supportBulk VARCHAR,

			@p_tx_defaultdesc NTEXT,

			@p_id_formula INT,

			@p_n_composite_adjustment INT

			)

			as

			begin

     				INSERT INTO t_adjustment_type

      				(id_prop, tx_guid,id_pi_type,n_AdjustmentType,b_supportBulk,id_formula, tx_default_desc,  n_composite_adjustment

					) VALUES ( @p_id_prop, @p_tx_guid, @p_id_pi_type, @p_n_AdjustmentType, @p_b_supportBulk, @p_id_formula,

					@p_tx_defaultdesc, @p_n_composite_adjustment)

			END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					CREATE PROC CreateCounterPropDef

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

					BEGIN TRAN

						exec InsertBaseProps @id_lang_code, @n_kind, 'N', 'N', @nm_name, NULL, @nm_display_name, @identity_value output

						INSERT INTO t_counterpropdef 

							(id_prop, id_pi, nm_servicedefprop, n_order, nm_preferredcountertype) 

						VALUES 

							(@identity_value, @id_pi, @nm_servicedefprop, @n_order, @nm_preferredcountertype)

						SELECT 

						@id_prop = @identity_value

					COMMIT TRAN

       
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create Procedure CreateGSubMemberRecord (

@p_id_group int,
@p_id_acc int,

@startdate  datetime,

@enddate datetime,

@p_systemdate datetime,

@status int OUTPUT

)

as

declare @realstartdate datetime

declare @realenddate datetime

declare @varMaxDateTime datetime

declare @tempStartDate datetime

declare @tempEndDate datetime

declare @onesecond_systemdate datetime

declare @temp_id_group int
declare @temp_id_acc int


begin



-- detect directly adjacent records with a adjacent start and end date.  If the

-- key comparison matches successfully, use the start and/or end date of the original record 

-- instead.



select @realstartdate = @startdate,@realenddate = @enddate,@varMaxDateTime = dbo.mtmaxdate(),

  @onesecond_systemdate = dbo.subtractsecond(@p_systemdate)



 -- Someone changes the start date of an existing record so that it creates gaps in time

 -- Existing Record      |---------------------|

 -- modified record       	|-----------|

 -- modified record      |-----------------|

 -- modified record         |------------------|

	begin

		

		-- find the start and end dates of the original interval

		select 

		@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_gsubmember_historical

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_group = @p_id_group AND id_acc = @p_id_acc and tt_end = @varMaxDateTime 



		-- the original date range is no longer true

		update t_gsubmember_historical

    set tt_end = @onesecond_systemdate

		where id_group = @p_id_group AND id_acc = @p_id_acc AND vt_start = @tempstartdate AND

		@tempenddate = vt_end AND tt_end = @varMaxDateTime



		-- adjust the two records end dates that are adjacent on the start and

		-- end dates; these records are no longer true

		update t_gsubmember_historical 

		set tt_end = @onesecond_systemdate where

		id_group = @p_id_group AND id_acc = @p_id_acc AND tt_end = @varMaxDateTime AND

		(vt_end = dbo.subtractSecond(@tempstartdate) OR vt_start = dbo.addsecond(@tempenddate))
    if (@@error <> 0 )

		begin

    select @status = 0

		end



		insert into t_gsubmember_historical 

		(id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

		select 

			id_group,id_acc,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

			from t_gsubmember_historical 

			where

			id_group = @p_id_group AND id_acc = @p_id_acc AND vt_end = dbo.subtractSecond(@tempstartdate)

		UNION ALL

		select

			id_group,id_acc,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

			from t_gsubmember_historical

			where

			id_group = @p_id_group AND id_acc = @p_id_acc  AND vt_start = dbo.addsecond(@tempenddate)



	end



	-- detect directly adjacent records with a adjacent start and end date.  If the

	-- key comparison matches successfully, use the start and/or end date of the original record 

	-- instead.

	

	select @realstartdate = vt_start

	from 

	t_gsubmember_historical  where id_group = @p_id_group AND id_acc = @p_id_acc AND

		@startdate between vt_start AND dbo.addsecond(vt_end) and tt_end = @varMaxDateTime

	if @realstartdate is NULL begin

		select @realstartdate = @startdate

	end

	--CR 10620 fix: Do not add a second to end date

	select @realenddate = vt_end

	from

	t_gsubmember_historical  where id_group = @p_id_group AND id_acc = @p_id_acc AND

	@enddate between vt_start AND vt_end and tt_end = @varMaxDateTime

	if @realenddate is NULL begin

		select @realenddate = @enddate

	end



 -- step : delete a range that is entirely in the new date range

 -- existing record:      |----|

 -- new record:      |----------------|

 update  t_gsubmember_historical 

 set tt_end = @onesecond_systemdate

 where dbo.EnclosedDateRange(@realstartdate,@realenddate,vt_start,vt_end) =1 AND

 id_group = @p_id_group AND id_acc = @p_id_acc  AND tt_end = @varMaxDateTime 



 -- create two new records that are on around the new interval        

 -- existing record:          |-----------------------------------|

 -- new record                        |-------|

 --

 -- adjusted old records      |-------|       |--------------------|

  begin

    select

		@temp_id_group = id_group,
@temp_id_acc = id_acc


		,@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_gsubmember_historical

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_group = @p_id_group AND id_acc = @p_id_acc and tt_end = @varMaxDateTime

    update     t_gsubmember_historical 

    set tt_end = @onesecond_systemdate where

    dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_group = @p_id_group AND id_acc = @p_id_acc AND tt_end = @varMaxDateTime

   insert into t_gsubmember_historical 

   (id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

   select 

    @temp_id_group,@temp_id_acc,@tempStartDate,dbo.subtractsecond(@realstartdate),

    @p_systemdate,@varMaxDateTime

    where @tempstartdate is not NULL AND @tempStartDate <> @realstartdate

    -- the previous statement may fail

		if @realenddate <> @tempendDate AND @realenddate <> @varMaxDateTime begin

			insert into t_gsubmember_historical 

			(id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

	    select

	    @temp_id_group,@temp_id_acc,@realenddate,@tempEndDate,

	    @p_systemdate,@varMaxDateTime

		end

    -- the previous statement may fail

  end

 -- step 5: update existing payment records that are overlapping on the start

 -- range

 -- Existing Record |--------------|

 -- New Record: |---------|

 insert into t_gsubmember_historical

 (id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

 select 

 id_group,id_acc,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

 from 

 t_gsubmember_historical  where

 id_group = @p_id_group AND id_acc = @p_id_acc AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 

 update t_gsubmember_historical

 set tt_end = @onesecond_systemdate

 where

 id_group = @p_id_group AND id_acc = @p_id_acc AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 -- step 4: update existing payment records that are overlapping on the end

 -- range

 -- Existing Record |--------------|

 -- New Record:             |-----------|

 insert into t_gsubmember_historical

 (id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

 select

 id_group,id_acc,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

 from t_gsubmember_historical

 where

 id_group = @p_id_group AND id_acc = @p_id_acc AND 

 vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 update t_gsubmember_historical

 set tt_end = @onesecond_systemdate

 where id_group = @p_id_group AND id_acc = @p_id_acc AND 

  vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 -- used to be realenddate

 -- step 7: create the new payment redirection record.  If the end date 

 -- is not max date, make sure the enddate is subtracted by one second

 insert into t_gsubmember_historical 

 (id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

 select 

 @p_id_group,@p_id_acc,@realstartdate,

  case when @realenddate = dbo.mtmaxdate() then @realenddate else 

  @realenddate end,

  @p_systemdate,@varMaxDateTime

  

delete from t_gsubmember where id_group = @p_id_group AND id_acc = @p_id_acc

insert into t_gsubmember (id_group,id_acc,vt_start,vt_end)

select id_group,id_acc,vt_start,vt_end

from t_gsubmember_historical  where

id_group = @p_id_group AND id_acc = @p_id_acc and tt_end = @varMaxDateTime

 select @status = 1

 end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure CreateGroupSubscription(

@p_sub_GUID varbinary(16),

@p_group_GUID varbinary(16),

@p_name  nvarchar(255),

@p_desc nvarchar(255),

@p_usage_cycle int,

@p_startdate datetime,

@p_enddate datetime,

@p_id_po int,

@p_proportional varchar,

@p_supportgroupops varchar,

@p_discountaccount int,

@p_CorporateAccount int,

@p_systemdate datetime,

@p_enforce_same_corporation varchar,

@p_id_sub int,

@p_id_group int OUTPUT,

@p_status int OUTPUT,
@p_datemodified varchar OUTPUT

)

as

begin

declare @existingPO as int

declare @realenddate as datetime

declare @varMaxDateTime as datetime

select @p_datemodified = 'N'

 -- business rule checks

select @varMaxDateTime = dbo.MTMaxDate()

select @p_status = 0

exec CheckGroupSubBusinessRules @p_name,@p_desc,@p_startdate,@p_enddate,@p_id_po,@p_proportional,

@p_discountaccount,@p_CorporateAccount,NULL,@p_usage_cycle,@p_systemdate, @p_enforce_same_corporation, @p_status OUTPUT

if (@p_status <> 1) 

	begin

	return

	end 

	-- set the end date to max date if it is not specified

if (@p_enddate is null) 

	begin

	select @realenddate = @varMaxDateTime

	end

else

	begin

	select @realenddate = @p_enddate

	end 

	insert into t_group_sub (id_group_ext,tx_name,tx_desc,b_visable,b_supportgroupops,

	id_usage_cycle,b_proportional,id_discountAccount,id_corporate_account)

	select @p_group_GUID,@p_name,@p_desc,'N',@p_supportgroupops,@p_usage_cycle,

	@p_proportional,@p_discountaccount,@p_CorporateAccount

	-- group subscription ID

	select @p_id_group =@@identity

 -- add group entry

  exec AddSubscriptionBase NULL,@p_id_group,@p_id_po,@p_startdate,@p_enddate,

	@p_group_GUID,@p_systemdate,@p_id_sub,@p_status output,@p_datemodified output

end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			 

CREATE  PROCEDURE  CreatePaymentRecord (

  @Payer  int,

  @NPA int,

  @startdate  datetime,

  @enddate datetime,

  @payerbillable varchar(1),

  @systemdate datetime,

  @p_fromUpdate char(1),

  @p_enforce_same_corporation varchar(1),

  @p_account_currency nvarchar(5),

  @status int OUTPUT)

  as

  begin



  declare @realstartdate datetime

  declare @realenddate datetime

  declare @accCreateDate datetime

  declare @billableFlag varchar(1)

  declare @payer_state varchar(10)



  select @status = 0

  select @realstartdate = dbo.mtstartofday(@startdate)    

  if (@enddate is NULL)

    begin

    select @realenddate = dbo.mtstartofday(dbo.MTMaxDate()) 

    end

  else

    begin

	if @enddate <> dbo.mtstartofday(dbo.MTMaxDate())

		select @realenddate = DATEADD(d, 1,dbo.mtstartofday(@enddate))

	else

		select @realenddate = @enddate

    end



	select @AccCreateDate = dbo.mtstartofday(dt_crt) from t_account where id_acc = @NPA

	if @realstartdate < @AccCreateDate 

	begin

		-- MT_PAYMENT_DATE_BEFORE_ACCOUNT_STARDATE

		select @status = -486604753

		return

	end

	if @realstartdate = @realenddate begin

		-- MT_PAYMENT_START_AND_END_ARE_THE_SAME

		select @status = -486604735

		return

	end

	if @realstartdate > @realenddate begin

		-- MT_PAYMENT_START_AFTER_END

		select @status = -486604734

		return

	end

	 /* 

		NPA: Non Paying Account

	  Assumptions: The system has already checked if an existing payment

	  redirection record exists.  The user is asked whether the 

	  system should truncate the existing payment redirection record.

	  business rule checks:

	  MT_ACCOUNT_CAN_NOT_PAY_FOR_ITSELF (0xE2FF0007L, -486604793)

	  ACCOUNT_IS_NOT_BILLABLE (0xE2FF0005L,-486604795)

	  MT_PAYMENT_RELATIONSHIP_EXISTS (0xE2FF0006L, -486604794)

	  step 1: Account can not pay for itself

	if (@Payer = @NPA)

		begin

		select @status = -486604793

		return

		end  

	 */

	select @billableFlag = case when @payerbillable is NULL then

		dbo.IsAccountBillable(@payer)	else @payerbillable end

	 -- step 2: The account is in a state such that new payment records can be created

	if @billableFlag = '0' begin

		-- MT_ACCOUNT_IS_NOT_BILLABLE

		select @status = -486604795

		return

	end

	-- check payee is not an independent account, return.

	-- MT_CANNOT_PAY_FOR_INDEPENDENT_ACCOUNT

	-- Note that we allow an account to pay for itself if it is billable 

	-- irregardless of the account type

	if @payer <> @NPA begin

		select 

			@status = 

			case when acc_type = 'IND' then -486604757 else 0 end

			from t_account where id_acc = @NPA

		if @status <> 0 begin

			return

		end

	end



	-- make sure that the paying account is active for the entire payment period

	select TOP 1 @payer_state = status from t_account_state

	where dbo.enclosedDateRange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

	id_acc = @payer

	if @payer_state is NULL OR @payer_state <> 'AC' begin

		-- MT_PAYER_IN_INVALID_STATE

		select @status = -486604736

		return

	end

	

	-- always check that payer and payee are on the same currency

	-- (if they are not the same, of course)

	-- if @p_account_currency parameter was passed as empty string, then 

	-- the call is coming either from MAM, and the currency is not available,

	-- or the call is coming from account update session, where currency is not being

	-- updated. In both cases it won't hurt to resolve it from t_av_internal and check

	-- that it matches payer currency

	if(@NPA <> @payer)

	begin

		if(LEN(@p_account_currency) = 0)

		begin

			SELECT @p_account_currency = c_currency from t_av_internal WHERE id_acc = @NPA

		end

	

		declare @sameCurrency int

		select @sameCurrency = 

			(SELECT COUNT(payerav.id_acc)  from t_av_internal payerav

			where payerav.id_acc = @payer AND UPPER(payerav.c_currency) = UPPER(@p_account_currency)

			)

		if @sameCurrency = 0

		begin

			-- MT_PAYER_PAYEE_CURRENCY_MISMATCH

			select @status = -486604728

			return

		end

	end





	-- check that both the payer and Payee are in the same corporate account

	--only check this if business rule is enforced

	if (@p_enforce_same_corporation = 1 AND dbo.IsInSameCorporateAccount(@payer,@NPA,@realstartdate) <> 1)

	begin

		-- MT_CANNOT_PAY_FOR_ACCOUNT_IN_OTHER_CORPORATE_ACCOUNT

		select @status = -486604758

		return

	end

	

	-- return without doing work in cases where nothing needs to be done

	select @status = count(*) 

	from t_payment_redirection where id_payer = @payer AND id_payee = @NPA

	AND (

		(dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND @p_fromupdate = 'N') 

		OR

		(vt_start <= @realstartdate AND vt_end = @realenddate AND @p_fromupdate = 'Y')

	)

	if @status > 0 begin

		-- account is already paying for the account during the interval.  Simply ignore

		-- the action

		select @status = 1

		return

	end



	exec CreatePaymentRecordBitemporal @payer,@NPA,@realstartdate,@realenddate,@systemdate, @status OUTPUT

  IF @status <> 1

    RETURN -- failure



  -- post-operation business rule checks (relies on rollback of work done up until this point)

  DECLARE @check1 INT, @check2 INT, @check3 INT

  SELECT 

  -- CR9906: checks to make sure the new payer's billing cycle matches all of the payee's 

  -- group subscriptions' BCR constraints

    @check1 = ISNULL(MIN(dbo.CheckGroupMembershipCycleConstraint(@systemdate, groups.id_group)), 1),

    -- EBCR cycle constraint checks

    @check2 = ISNULL(MIN(dbo.CheckGroupMembershipEBCRConstraint(@systemdate, groups.id_group)), 1)

  FROM 

  (

    -- gets all of the payee's group subscriptions

    SELECT DISTINCT gsm.id_group id_group

    FROM t_gsubmember gsm

    WHERE gsm.id_acc = @NPA  -- payee ID

  ) groups

  

  IF (@check1 <> 1)

  BEGIN

    SET @status = @check1

    RETURN

  END

  ELSE IF (@check2 <> 1)

  BEGIN

    SET @status = @check2

    RETURN

  END



  SELECT  

    @check3 = ISNULL(MIN(dbo.CheckGroupReceiverEBCRConstraint(@systemdate, groups.id_group)), 1)

  FROM 

  (

    -- gets all of the payee's receiverships

    SELECT DISTINCT gsrm.id_group id_group

    FROM t_gsub_recur_map gsrm

    WHERE gsrm.id_acc = @NPA  -- payee ID

  ) groups


  IF (@check3 <> 1)

    SET @status = @check3



END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create Procedure CreatePaymentRecordBitemporal (

@p_id_payer int,
@p_id_payee int,

@startdate  datetime,

@enddate datetime,

@p_systemdate datetime,

@status int OUTPUT

)

as

declare @realstartdate datetime

declare @realenddate datetime

declare @varMaxDateTime datetime

declare @tempStartDate datetime

declare @tempEndDate datetime

declare @onesecond_systemdate datetime

declare @temp_id_payer int
declare @temp_id_payee int


begin



-- detect directly adjacent records with a adjacent start and end date.  If the

-- key comparison matches successfully, use the start and/or end date of the original record 

-- instead.



select @realstartdate = @startdate,@realenddate = @enddate,@varMaxDateTime = dbo.mtmaxdate(),

  @onesecond_systemdate = dbo.subtractsecond(@p_systemdate)



 -- Someone changes the start date of an existing record so that it creates gaps in time

 -- Existing Record      |---------------------|

 -- modified record       	|-----------|

 -- modified record      |-----------------|

 -- modified record         |------------------|

	begin

		

		-- find the start and end dates of the original interval

		select 

		@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_payment_redir_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_payer = @p_id_payer AND id_payee = @p_id_payee and tt_end = @varMaxDateTime 



		-- the original date range is no longer true

		update t_payment_redir_history

    set tt_end = @onesecond_systemdate

		where id_payer = @p_id_payer AND id_payee = @p_id_payee AND vt_start = @tempstartdate AND

		@tempenddate = vt_end AND tt_end = @varMaxDateTime



		-- adjust the two records end dates that are adjacent on the start and

		-- end dates; these records are no longer true

		update t_payment_redir_history 

		set tt_end = @onesecond_systemdate where

		id_payee = @p_id_payee AND tt_end = @varMaxDateTime AND

		(vt_end = dbo.subtractSecond(@tempstartdate) OR vt_start = dbo.addsecond(@tempenddate))
    if (@@error <> 0 )

		begin

    select @status = 0

		end



		insert into t_payment_redir_history 

		(id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

		select 

			id_payer,id_payee,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

			from t_payment_redir_history 

			where

			id_payee = @p_id_payee AND vt_end = dbo.subtractSecond(@tempstartdate)

		UNION ALL

		select

			id_payer,id_payee,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

			from t_payment_redir_history

			where

			id_payee = @p_id_payee  AND vt_start = dbo.addsecond(@tempenddate)



	end



	-- detect directly adjacent records with a adjacent start and end date.  If the

	-- key comparison matches successfully, use the start and/or end date of the original record 

	-- instead.

	

	select @realstartdate = vt_start

	from 

	t_payment_redir_history  where id_payer = @p_id_payer AND id_payee = @p_id_payee AND

		@startdate between vt_start AND dbo.addsecond(vt_end) and tt_end = @varMaxDateTime

	if @realstartdate is NULL begin

		select @realstartdate = @startdate

	end

	--CR 10620 fix: Do not add a second to end date

	select @realenddate = vt_end

	from

	t_payment_redir_history  where id_payer = @p_id_payer AND id_payee = @p_id_payee AND

	@enddate between vt_start AND vt_end and tt_end = @varMaxDateTime

	if @realenddate is NULL begin

		select @realenddate = @enddate

	end



 -- step : delete a range that is entirely in the new date range

 -- existing record:      |----|

 -- new record:      |----------------|

 update  t_payment_redir_history 

 set tt_end = @onesecond_systemdate

 where dbo.EnclosedDateRange(@realstartdate,@realenddate,vt_start,vt_end) =1 AND

 id_payee = @p_id_payee  AND tt_end = @varMaxDateTime 



 -- create two new records that are on around the new interval        

 -- existing record:          |-----------------------------------|

 -- new record                        |-------|

 --

 -- adjusted old records      |-------|       |--------------------|

  begin

    select

		@temp_id_payer = id_payer,
@temp_id_payee = id_payee


		,@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_payment_redir_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_payee = @p_id_payee and tt_end = @varMaxDateTime AND  id_payer <> @p_id_payer

    update     t_payment_redir_history 

    set tt_end = @onesecond_systemdate where

    dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_payee = @p_id_payee AND tt_end = @varMaxDateTime AND  id_payer <> @p_id_payer

   insert into t_payment_redir_history 

   (id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

   select 

    @temp_id_payer,@temp_id_payee,@tempStartDate,dbo.subtractsecond(@realstartdate),

    @p_systemdate,@varMaxDateTime

    where @tempstartdate is not NULL AND @tempStartDate <> @realstartdate

    -- the previous statement may fail

		if @realenddate <> @tempendDate AND @realenddate <> @varMaxDateTime begin

			insert into t_payment_redir_history 

			(id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

	    select

	    @temp_id_payer,@temp_id_payee,@realenddate,@tempEndDate,

	    @p_systemdate,@varMaxDateTime

		end

    -- the previous statement may fail

  end

 -- step 5: update existing payment records that are overlapping on the start

 -- range

 -- Existing Record |--------------|

 -- New Record: |---------|

 insert into t_payment_redir_history

 (id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

 select 

 id_payer,id_payee,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

 from 

 t_payment_redir_history  where

 id_payee = @p_id_payee AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 

 update t_payment_redir_history

 set tt_end = @onesecond_systemdate

 where

 id_payee = @p_id_payee AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 -- step 4: update existing payment records that are overlapping on the end

 -- range

 -- Existing Record |--------------|

 -- New Record:             |-----------|

 insert into t_payment_redir_history

 (id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

 select

 id_payer,id_payee,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

 from t_payment_redir_history

 where

 id_payee = @p_id_payee AND 

 vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 update t_payment_redir_history

 set tt_end = @onesecond_systemdate

 where id_payee = @p_id_payee AND 

  vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 -- used to be realenddate

 -- step 7: create the new payment redirection record.  If the end date 

 -- is not max date, make sure the enddate is subtracted by one second

 insert into t_payment_redir_history 

 (id_payer,id_payee,vt_start,vt_end,tt_start,tt_end)

 select 

 @p_id_payer,@p_id_payee,@realstartdate,

  case when @realenddate = dbo.mtmaxdate() then @realenddate else 

  dbo.subtractsecond(@realenddate) end,

  @p_systemdate,@varMaxDateTime

  

delete from t_payment_redirection where id_payee = @p_id_payee

insert into t_payment_redirection (id_payer,id_payee,vt_start,vt_end)

select id_payer,id_payee,vt_start,vt_end

from t_payment_redir_history  where

id_payee = @p_id_payee and tt_end = @varMaxDateTime

 select @status = 1

 end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

	   create procedure CreateReportingDB (

                    @strDBName nvarchar(100),

                    @strDataLogFilePath nvarchar(255),

                    @dbSize integer,

		    @return_code integer output

                   )

as

  set @return_code = 0

  declare @strDataFileName    nvarchar(255);

  declare @strLogFileName     nvarchar(255);

  declare @strDBCreateQuery   nvarchar(2000);

  declare @strProcess         nvarchar(100)

  declare @nSQLRetCode        int



  declare @bDebug tinyint

  set @bDebug = 1



  declare @strsize nvarchar(5);

  set @strsize = CAST(@dbSize AS nvarchar(5))

  set  @strDataFileName = @strDataLogFilePath + '\' + @strDBName + '_Data';

  set  @strLogFileName =  @strDataLogFilePath + '\' + @strDBName + '_Log';





  set @strDBCreateQuery = 'CREATE DATABASE [' + @strDBName + ']  ON 

                           ( 

                                    NAME = N''' + @strDBName + '_Data' + ''', 

                                FILENAME = N''' + @strDataFileName + '.MDF' + ''' , 

                                    SIZE = ' + @strsize + ', 

                              FILEGROWTH = 20%

                            ) 

                            LOG ON 

                            (

                                    NAME = N''' + @strDBName + '_Log' + ''', 

                                FILENAME = N''' + @strLogFileName + '.LDF' + ''' , 

                                    SIZE = ' + @strsize + ', 

                              FILEGROWTH = 10%

                            )'

  if ( @bDebug = 1 )

      print 'About to execute create DB Query : ' + @strDBCreateQuery;  



  exec sp_executesql @strDBCreateQuery

  select @nSQLRetCode = @@ERROR

  if ( @nSQLRetCode <> 0 )

  begin

    set @strProcess = object_name(@@procid)

    print 'An error occured while creating the database. Procedure (' + @strProcess + ')';

    set @return_code = -1

    return -1        

  end

  -- set the simple log option for database.

  SET @strDBCreateQuery = 'Alter Database ' + @strDBName + ' SET RECOVERY SIMPLE';

  exec sp_executesql @strDBCreateQuery

  select @nSQLRetCode = @@ERROR

  if ( @nSQLRetCode <> 0 )

  begin

    set @strProcess = object_name(@@procid)

    print 'An error occured while setting the recovery option to Bulk-Logged to the created database. Procedure (' + @strProcess + ')';

    set @return_code = -1

    return -1        

  end

  return 0

			
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create Procedure CreateSubscriptionRecord (

@p_id_sub int,
@p_id_sub_ext varbinary(16),
@p_id_acc int,
@p_id_group int,
@p_id_po int,
@p_dt_crt datetime,

@startdate  datetime,

@enddate datetime,

@p_systemdate datetime,

@status int OUTPUT

)

as

declare @realstartdate datetime

declare @realenddate datetime

declare @varMaxDateTime datetime

declare @tempStartDate datetime

declare @tempEndDate datetime

declare @onesecond_systemdate datetime

declare @temp_id_sub int
declare @temp_id_sub_ext varbinary(16)
declare @temp_id_acc int
declare @temp_id_group int
declare @temp_id_po int
declare @temp_dt_crt datetime


begin



-- detect directly adjacent records with a adjacent start and end date.  If the

-- key comparison matches successfully, use the start and/or end date of the original record 

-- instead.



select @realstartdate = @startdate,@realenddate = @enddate,@varMaxDateTime = dbo.mtmaxdate(),

  @onesecond_systemdate = dbo.subtractsecond(@p_systemdate)



 -- Someone changes the start date of an existing record so that it creates gaps in time

 -- Existing Record      |---------------------|

 -- modified record       	|-----------|

 -- modified record      |-----------------|

 -- modified record         |------------------|

	begin

		

		-- find the start and end dates of the original interval

		select 

		@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_sub_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_sub = @p_id_sub and tt_end = @varMaxDateTime 



		-- the original date range is no longer true

		update t_sub_history

    set tt_end = @onesecond_systemdate

		where id_sub = @p_id_sub AND vt_start = @tempstartdate AND

		@tempenddate = vt_end AND tt_end = @varMaxDateTime



		-- adjust the two records end dates that are adjacent on the start and

		-- end dates; these records are no longer true

		update t_sub_history 

		set tt_end = @onesecond_systemdate where

		id_sub = @p_id_sub AND tt_end = @varMaxDateTime AND

		(vt_end = dbo.subtractSecond(@tempstartdate) OR vt_start = dbo.addsecond(@tempenddate))
    if (@@error <> 0 )

		begin

    select @status = 0

		end



		insert into t_sub_history 

		(id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

		select 

			id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

			from t_sub_history 

			where

			id_sub = @p_id_sub AND vt_end = dbo.subtractSecond(@tempstartdate)

		UNION ALL

		select

			id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

			from t_sub_history

			where

			id_sub = @p_id_sub  AND vt_start = dbo.addsecond(@tempenddate)



	end



	-- detect directly adjacent records with a adjacent start and end date.  If the

	-- key comparison matches successfully, use the start and/or end date of the original record 

	-- instead.

	

	select @realstartdate = vt_start

	from 

	t_sub_history  where id_sub = @p_id_sub AND

		@startdate between vt_start AND dbo.addsecond(vt_end) and tt_end = @varMaxDateTime

	if @realstartdate is NULL begin

		select @realstartdate = @startdate

	end

	--CR 10620 fix: Do not add a second to end date

	select @realenddate = vt_end

	from

	t_sub_history  where id_sub = @p_id_sub AND

	@enddate between vt_start AND vt_end and tt_end = @varMaxDateTime

	if @realenddate is NULL begin

		select @realenddate = @enddate

	end



 -- step : delete a range that is entirely in the new date range

 -- existing record:      |----|

 -- new record:      |----------------|

 update  t_sub_history 

 set tt_end = @onesecond_systemdate

 where dbo.EnclosedDateRange(@realstartdate,@realenddate,vt_start,vt_end) =1 AND

 id_sub = @p_id_sub  AND tt_end = @varMaxDateTime 



 -- create two new records that are on around the new interval        

 -- existing record:          |-----------------------------------|

 -- new record                        |-------|

 --

 -- adjusted old records      |-------|       |--------------------|

  begin

    select

		@temp_id_sub = id_sub,
@temp_id_sub_ext = id_sub_ext,
@temp_id_acc = id_acc,
@temp_id_group = id_group,
@temp_id_po = id_po,
@temp_dt_crt = dt_crt


		,@tempstartdate = vt_start,

		@tempenddate = vt_end

    from

    t_sub_history

    where dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_sub = @p_id_sub and tt_end = @varMaxDateTime

    update     t_sub_history 

    set tt_end = @onesecond_systemdate where

    dbo.encloseddaterange(vt_start,vt_end,@realstartdate,@realenddate) = 1 AND

    id_sub = @p_id_sub AND tt_end = @varMaxDateTime

   insert into t_sub_history 

   (id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

   select 

    @temp_id_sub,@temp_id_sub_ext,@temp_id_acc,@temp_id_group,@temp_id_po,@temp_dt_crt,@tempStartDate,dbo.subtractsecond(@realstartdate),

    @p_systemdate,@varMaxDateTime

    where @tempstartdate is not NULL AND @tempStartDate <> @realstartdate

    -- the previous statement may fail

		if @realenddate <> @tempendDate AND @realenddate <> @varMaxDateTime begin

			insert into t_sub_history 

			(id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

	    select

	    @temp_id_sub,@temp_id_sub_ext,@temp_id_acc,@temp_id_group,@temp_id_po,@temp_dt_crt,@realenddate,@tempEndDate,

	    @p_systemdate,@varMaxDateTime

		end

    -- the previous statement may fail

  end

 -- step 5: update existing payment records that are overlapping on the start

 -- range

 -- Existing Record |--------------|

 -- New Record: |---------|

 insert into t_sub_history

 (id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

 select 

 id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,@realenddate,vt_end,@p_systemdate,@varMaxDateTime

 from 

 t_sub_history  where

 id_sub = @p_id_sub AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 

 update t_sub_history

 set tt_end = @onesecond_systemdate

 where

 id_sub = @p_id_sub AND 

 vt_start > @realstartdate and vt_start < @realenddate 

 and tt_end = @varMaxDateTime

 -- step 4: update existing payment records that are overlapping on the end

 -- range

 -- Existing Record |--------------|

 -- New Record:             |-----------|

 insert into t_sub_history

 (id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

 select

 id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,dbo.subtractsecond(@realstartdate),@p_systemdate,@varMaxDateTime

 from t_sub_history

 where

 id_sub = @p_id_sub AND 

 vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 update t_sub_history

 set tt_end = @onesecond_systemdate

 where id_sub = @p_id_sub AND 

  vt_end > @realstartdate AND vt_end < @realenddate

 AND tt_end = @varMaxDateTime

 -- used to be realenddate

 -- step 7: create the new payment redirection record.  If the end date 

 -- is not max date, make sure the enddate is subtracted by one second

 insert into t_sub_history 

 (id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end,tt_start,tt_end)

 select 

 @p_id_sub,@p_id_sub_ext,@p_id_acc,@p_id_group,@p_id_po,@p_dt_crt,@realstartdate,

  case when @realenddate = dbo.mtmaxdate() then @realenddate else 

  @realenddate end,

  @p_systemdate,@varMaxDateTime

  

delete from t_sub where id_sub = @p_id_sub

insert into t_sub (id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end)

select id_sub,id_sub_ext,id_acc,id_group,id_po,dt_crt,vt_start,vt_end

from t_sub_history  where

id_sub = @p_id_sub and tt_end = @varMaxDateTime

 select @status = 1

 end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CreateTestRecurringEventInstance 

  (

    @id_event INT,

    @id_arg_interval INT,

    @dt_arg_start DATETIME,

    @dt_arg_end DATETIME,

    @id_instance INT OUTPUT

  )

AS



BEGIN

  BEGIN TRAN



  INSERT INTO t_recevent_inst

    (id_event, id_arg_interval, dt_arg_start, dt_arg_end,

     b_ignore_deps, dt_effective, tx_status)

  VALUES 

    (@id_event, @id_arg_interval, @dt_arg_start,

     @dt_arg_end, 'Y', NULL, 'NotYetRun')



  SELECT @id_instance = @@IDENTITY



  COMMIT

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROC CreateUsageIntervals

(

  @dt_now   DATETIME,  -- the MetraTech system's date

  @pretend  INT,       -- if true doesn't create new intervals but returns what would have been created

  @n_count  INT OUTPUT -- the count of intervals created (or that would have been created)

)

AS



  BEGIN TRAN



/*  

  -- debug mode --

  declare @dt_now datetime 

  select @dt_now = CAST('2/9/2003' AS DATETIME) --GetUTCDate()

  declare @pretend int

  select @pretend = null

  declare @n_count int

*/  



  --

  -- PRECONDITIONS:

  --   Intervals and mappings will be created and backfilled as long as there

  --   is an entry for the account in t_acc_usage_cycle. Missing mappings will

  --   be detected and added.

  --   

  --   To update a billing cycle: t_acc_usage_cycle must be updated. Also the

  --   new interval the account is updating to must be created and the initial

  --   special update mapping must be made in t_acc_usage_interval - dt_effective

  --   must be set to the end date of the previous (old) interval. 

  --



  -- ensures that there is only one instance of this sproc executing right now

  DECLARE @result INT

  EXEC @result = sp_getapplock @Resource = 'CreateUsageIntervals', @LockMode = 'Exclusive'

  IF @result < 0

  BEGIN

      ROLLBACK

      RETURN

  END



  -- represents the end date that an interval must

  -- fall into to be considered 

  DECLARE @dt_end DATETIME

  SELECT @dt_end = (@dt_now + n_adv_interval_creation) FROM t_usage_server



  DECLARE @new_mappings TABLE

  (

    id_acc INT NOT NULL,

    id_usage_interval INT NOT NULL,

    tx_status VARCHAR(1)  

  )



  -- associate accounts with intervals based on their cycle mapping

  -- this will detect missing mappings and add them

  INSERT INTO @new_mappings

  SELECT 

    auc.id_acc,

    ref.id_interval,

    'O'  -- TODO: this column is no longer used and should eventually be removed

  FROM t_acc_usage_cycle auc

  INNER JOIN 

  (

    -- gets the minimal start date for each account

    SELECT 

      accstate.id_acc,

      -- if the usage cycle was updated, consider the time of update as the start date

      -- this prevents backfilling mappings for the previous cycle

      MIN(ISNULL(maxaui.dt_effective, accstate.vt_start)) dt_start

    FROM t_account_state accstate

    LEFT OUTER JOIN 

    (

      SELECT 

        id_acc,

        MAX(CASE WHEN dt_effective IS NULL THEN NULL ELSE dbo.AddSecond(dt_effective) END) dt_effective

      FROM t_acc_usage_interval

      GROUP BY id_acc

    ) maxaui ON maxaui.id_acc = accstate.id_acc

    WHERE 

      -- excludes archived accounts

      accstate.status <> 'AR' AND 

      -- the account has already started or is about to start

      accstate.vt_start < @dt_end AND

      -- the account has not yet ended

      accstate.vt_end >= @dt_now

    GROUP BY accstate.id_acc

  ) minstart ON minstart.id_acc = auc.id_acc

  INNER JOIN

  (

    -- gets the maximal end date for each account

    SELECT 

      id_acc,

      MAX(CASE WHEN vt_end > @dt_end THEN @dt_end ELSE vt_end END) dt_end

    FROM t_account_state

    WHERE

      -- excludes archived accounts

      status <> 'AR' AND 

      -- the account has already started or is about to start

      vt_start < @dt_end AND

      -- the account has not yet ended

      vt_end >= @dt_now

    GROUP BY id_acc

  ) maxend ON maxend.id_acc = minstart.id_acc

  INNER JOIN t_pc_interval ref ON

    ref.id_cycle = auc.id_usage_cycle AND

    -- reference interval must at least partially overlap the [minstart, maxend] period

    (ref.dt_end >= minstart.dt_start AND ref.dt_start <= maxend.dt_end)

  LEFT OUTER JOIN t_acc_usage_interval aui ON

    aui.id_usage_interval = ref.id_interval AND

    aui.id_acc = auc.id_acc  

  WHERE

    -- only add mappings that don't exist already

    aui.id_usage_interval IS NULL        



--  SELECT * FROM @new_mappings





  DECLARE @new_intervals TABLE

  (

    id_interval INT NOT NULL,

    id_usage_cycle INT NOT NULL,

    dt_start DATETIME NOT NULL,

    dt_end DATETIME NOT NULL,

    tx_interval_status VARCHAR(1) NOT NULL,

    id_cycle_type INT NOT NULL

  )



  -- determines what usage intervals need to be added

  -- based on the new account-to-interval mappings  

  INSERT INTO @new_intervals

  SELECT 

    ref.id_interval,

    ref.id_cycle,

    ref.dt_start,

    ref.dt_end,

    'O',  -- Open

    uct.id_cycle_type

  FROM t_pc_interval ref

  INNER JOIN 

  (

    SELECT DISTINCT id_usage_interval FROM @new_mappings

  ) mappings ON mappings.id_usage_interval = ref.id_interval

  INNER JOIN t_usage_cycle uc ON uc.id_usage_cycle = ref.id_cycle

  INNER JOIN t_usage_cycle_type uct ON uct.id_cycle_type = uc.id_cycle_type

  WHERE 

    -- don't add any intervals already in t_usage_interval

    ref.id_interval NOT IN (SELECT id_interval FROM t_usage_interval)



  -- records how many intervals would be added

  SET @n_count = @@ROWCOUNT



  -- only adds the new intervals and mappings if pretend is false

  IF ISNULL(@pretend, 0) = 0

  BEGIN

    

    -- adds the new intervals

    INSERT INTO t_usage_interval(id_interval,id_usage_cycle,dt_start,dt_end,tx_interval_status)

    SELECT id_interval, id_usage_cycle, dt_start, dt_end, tx_interval_status

    FROM @new_intervals



    -- adds the new mappings

    INSERT INTO t_acc_usage_interval(id_acc,id_usage_interval,tx_status,dt_effective)

    SELECT id_acc, id_usage_interval, tx_status, NULL

    FROM @new_mappings



    -- updates the last interval creation time, useful for debugging

    UPDATE t_usage_server SET dt_last_interval_creation = @dt_now

  END



  -- returns the added intervals

  SELECT * FROM @new_intervals

  COMMIT

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROC CreateUsageIntervalsForAccount

(

  @dt_now   DATETIME,  -- the MetraTech system's date

  @id_acc   INT,       -- account ID to create intervals/mappings for 

  @dt_start DATETIME,  -- account start date

  @dt_end   DATETIME,  -- account end date

  @pretend  INT,       -- if true doesn't create new intervals but returns what would have been created

  @n_count  INT OUTPUT -- the count of intervals created (or that would have been created)

)

AS

BEGIN

  BEGIN TRAN



  -- NOTE: this procedure is closely realted to CreateUsageIntervals

  -- except that it only does work for one account (@id_acc). This sproc

  -- is used to decrease total duration of an account creation. Other

  -- accounts affected by new intervals being created are addressed later

  -- in the day when a required usm -create triggers a full CreateUsageIntervals

  -- execution.



  --

  -- PRECONDITIONS:

  --   Intervals and mappings will be created and backfilled as long as there

  --   is an entry for the account in t_acc_usage_cycle. Missing mappings will

  --   be detected and added.



  -- ensures that there is only one instance of this sproc or the CreateUsageIntervals sproc

  -- being executing right now

  DECLARE @result INT

  EXEC @result = sp_getapplock @Resource = 'CreateUsageIntervals', @LockMode = 'Exclusive'

  IF @result < 0

  BEGIN

      ROLLBACK

      RETURN

  END



  -- represents the end date that an interval must

  -- fall into to be considered 

  DECLARE @dt_probe DATETIME

  SELECT @dt_probe = (@dt_now + n_adv_interval_creation) FROM t_usage_server



  -- if the account hasn't started nor is about to start or

  -- the account has already ended (is this possible?)

  -- then don't do anything

  IF (@dt_start >= @dt_probe AND @dt_end < @dt_now)

  BEGIN

    SET @n_count = @@ROWCOUNT

    COMMIT

    RETURN

  END



  -- adjusts the account end date to be no later than the probe date

  -- no intervals are created in the future after the probe date

  DECLARE @dt_adj_end DATETIME

  SELECT @dt_adj_end = CASE WHEN @dt_end > @dt_probe THEN @dt_probe ELSE @dt_end END



  DECLARE @new_mappings TABLE

  (

    id_acc INT NOT NULL,

    id_usage_interval INT NOT NULL,

    tx_status VARCHAR(1)  

  )



  -- associate the account with intervals based on its cycle mapping

  -- this will detect missing mappings and add them

  INSERT INTO @new_mappings

  SELECT 

    auc.id_acc,

    ref.id_interval,

    'O'  -- TODO: this column is no longer used and should eventually be removed

  FROM t_acc_usage_cycle auc

  INNER JOIN t_pc_interval ref ON

    ref.id_cycle = auc.id_usage_cycle AND

    -- reference interval must at least partially overlap the [minstart, maxend] period

    (ref.dt_end >= @dt_start AND ref.dt_start <= @dt_adj_end)

  LEFT OUTER JOIN t_acc_usage_interval aui ON

    aui.id_usage_interval = ref.id_interval AND

    aui.id_acc = auc.id_acc  

  WHERE

    auc.id_acc = @id_acc AND

    -- only add mappings that don't exist already

    aui.id_usage_interval IS NULL        





  DECLARE @new_intervals TABLE

  (

    id_interval INT NOT NULL,

    id_usage_cycle INT NOT NULL,

    dt_start DATETIME NOT NULL,

    dt_end DATETIME NOT NULL,

    tx_interval_status VARCHAR(1) NOT NULL,

    id_cycle_type INT NOT NULL

  )



  -- determines what usage intervals need to be added

  -- based on the new account-to-interval mappings  

  INSERT INTO @new_intervals

  SELECT 

    ref.id_interval,

    ref.id_cycle,

    ref.dt_start,

    ref.dt_end,

    'O',  -- Open

    uct.id_cycle_type

  FROM t_pc_interval ref

  INNER JOIN @new_mappings mappings ON mappings.id_usage_interval = ref.id_interval

  INNER JOIN t_usage_cycle uc ON uc.id_usage_cycle = ref.id_cycle

  INNER JOIN t_usage_cycle_type uct ON uct.id_cycle_type = uc.id_cycle_type

  WHERE 

    -- don't add any intervals already in t_usage_interval

    ref.id_interval NOT IN (SELECT id_interval FROM t_usage_interval)



  -- records how many intervals would be added

  SET @n_count = @@ROWCOUNT



  -- only adds the new intervals and mappings if we aren't pretending

  IF ISNULL(@pretend, 0) = 0

  BEGIN

    

    -- adds the new intervals

    INSERT INTO t_usage_interval(id_interval,id_usage_cycle,dt_start,dt_end,tx_interval_status)

    SELECT id_interval, id_usage_cycle, dt_start, dt_end, tx_interval_status

    FROM @new_intervals



    -- adds the new mappings

    INSERT INTO t_acc_usage_interval(id_acc,id_usage_interval,tx_status,dt_effective)

    SELECT id_acc, id_usage_interval, tx_status, NULL

    FROM @new_mappings



  END



  -- returns the added intervals

  SELECT * FROM @new_intervals

  COMMIT

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

    create procedure Dearchive_account

			(

			@interval int,

			@accountIDList nvarchar(4000),

			@path nvarchar(1000),

			@constraint nchar(1) = 'Y',

			@datafiletype nchar(1) = 'n',

			@result nvarchar(4000) output

			)

		as

		set nocount on

		declare @sql1 nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @tab2 nvarchar(1000)

		declare @var1 nvarchar(100)

		declare @str1 nvarchar(1000)

		declare @str2 nvarchar(2000)

		declare @vartime datetime

		declare @maxtime datetime

		declare @bucket int

		declare	@dbname nvarchar(100)



		select @vartime = getdate()
		select @maxtime = dbo.mtmaxdate()

		select @dbname = db_name()

		--how to run this procedure

		--declare @result varchar(4000)

		--exec dearchive intervalid,'accountid','archive directory','Y',@result output

		--print @result



		--Checking following Business rules :

		--Interval should be archived

		--Account is in archived state

		--Verify the database name 

		if (@datafiletype <> 'c' and @datafiletype <> 'n')

		begin

			set @result = '5000001a-dearchive operation failed-->@datafiletype should be either c or n'

			return

		end

		select @tab2 = table_name from information_schema.tables where table_name='T_ACC_USAGE' and table_catalog = @dbname

		if (@tab2 is null)

		begin 

			set @result = '5000001-dearchive operation failed-->check the database name'

			return

		end

		if not exists (select top 1 * from t_archive where id_interval=@interval and status ='A' and tt_end = @maxtime)

		begin

			set @result = '5000002-dearchive operation failed-->Interval is not archived'

			return

		end

--TO GET LIST OF ACCOUNT
		CREATE TABLE #AccountIDsTable (ID int NOT NULL,bucket int)

		if (@accountIDList is not null)

		begin

			WHILE CHARINDEX(',', @accountIDList) > 0

				BEGIN

					INSERT INTO #AccountIDsTable (ID)

					SELECT SUBSTRING(@accountIDList,1,(CHARINDEX(',', @accountIDList)-1))

					SET @accountIDList = SUBSTRING (@accountIDList, (CHARINDEX(',', @accountIDList)+1),

										(LEN(@accountIDList) - (CHARINDEX(',', @accountIDList))))

					if (@@error <> 0) 

					begin

						set @result = '5000003-dearchive operation failed-->error in insert into #AccountIDsTable'

						return

					end

				END

			INSERT INTO #AccountIDsTable (ID) SELECT @accountIDList

			if (@@error <> 0) 

			begin

				set @result = '5000004-dearchive operation failed-->error in insert into #AccountIDsTable'

				return

			end

	

			update #AccountIDsTable set bucket = act.bucket

			from #AccountIDsTable inner join t_acc_bucket_map act

			on #AccountIDsTable.id = act.id_acc

			where act.id_usage_interval=@interval

			if (@@error <> 0) 

			begin

				set @result = '5000005-dearchive operation failed-->error in update #AccountIDsTable'

				return

			end

		end

		else

		begin

			set @sql1 = 'insert into #AccountIDsTable(id,bucket) select id_acc,bucket from

			t_acc_bucket_map where status =''A'' and tt_end = dbo.mtmaxdate() and id_acc not in (select distinct id_acc from t_acc_usage where 

			id_usage_interval = ' + cast(@interval as varchar(20)) + ') and id_usage_interval = ' + cast(@interval as varchar(20))

			exec (@sql1)

			if (@@error <> 0) 

			begin

				set @result = '5000006-dearchive operation failed-->error in insert into #AccountIDsTable'

				return

			end

		end



		if exists (select 1 from t_acc_bucket_map where id_usage_interval=@interval and status ='D' and tt_end = @maxtime

				and id_acc in (select id from #AccountIDsTable))

		begin

			set @result = '5000007-dearchive operation failed-->one of the account is already dearchived'

			return

		end

		if EXISTS(SELECT 1 FROM #AccountIDsTable WHERE bucket is null)

		begin

			set @result = '5000008-dearchive operation failed-->one of the account does not have bucket mapping...check the accountid'

			return

		end	



		declare  c1 cursor fast_forward for select distinct id_view from t_archive where id_interval = @interval

		and tt_end = @maxtime and id_view is not null

		declare c2 cursor fast_forward for select distinct bucket from #AccountIDsTable

		open c2

		fetch next from c2 into @bucket

		while (@@fetch_status = 0)

		begin

		--Checking the existence of import files for each table

			declare	@FileName nvarchar(128)

			select  @FileName = 't_acc_usage' + '_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'

			declare @i int

			declare	@File nvarchar(2000)

			select @File = @Path + '\' + @FileName

			exec master..xp_fileexist @File, @i out

			if @i <> 1

			begin

				set @result = '5000009-dearchive operation failed-->bcp usage file does not exist'

				close c2

				deallocate c2

				deallocate c1

				return

			end

	

			open c1

			fetch next from c1 into @var1

			while @@fetch_status = 0

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1

				select @filename = @tab1 + '_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'

				select @File = @Path + '\' + @FileName

				exec master..xp_fileexist @File, @i out

				if @i <> 1

				begin

					set @result = '5000010-dearchive operation failed-->bcp ' + cast(@FileName as nvarchar(128)) + ' file does not exist'

					close c1

					deallocate c1

					close c2

					deallocate c2

					return

				end

				fetch next from c1 into @var1

			end

			close c1

		fetch next from c2 into @bucket

		end

		close c2

		deallocate c1



		if not exists (select top 1 id_adj_trx from t_adjustment_transaction where id_usage_interval = @interval)

		begin 

			select  @FileName = 't_adjustment_transaction' + '_' + cast(@interval as varchar(10)) + '.txt'

			select @File = @Path + '\' + @FileName

			exec master..xp_fileexist @File, @i out

			if @i <> 1

			begin

				set @result = '5000011-dearchive operation failed-->bcp t_adjustment_transaction file does not exist'

				deallocate c2

				return

			end

		

			declare  c1 cursor fast_forward for select distinct adj_name from t_archive where id_interval = @interval and tt_end = @maxtime

			and adj_name is not null and status='A'
			open c1

			fetch next from c1 into @var1

			while @@fetch_status = 0

			begin

				select @filename = @var1 + '_' + cast(@interval as varchar(10)) + '.txt'

				select @File = @Path + '\' + @FileName

				exec master..xp_fileexist @File, @i out

				if @i <> 1

				begin

					set @result = '5000012-dearchive operation failed-->bcp ' + cast(@FileName as nvarchar(128)) + ' file does not exist'

					close c1

					deallocate c1

					deallocate c2

					return

				end

				fetch next from c1 into @var1

			end

			close c1

			deallocate c1

		end



		begin tran

		--Insert data into t_acc_usage

		open c2

		fetch next from c2 into @bucket

		while (@@fetch_status = 0)

		begin

			if object_id('tempdb..#tmp_t_acc_usage') is not null

			drop table #tmp_t_acc_usage

			if (@@error <> 0) 

			begin

				set @result = '5000012a--dearchive operation failed-->error in dropping #tmp_t_acc_usage'

				rollback tran

				close c2

				deallocate c2

				return			

			end

			select * into #tmp_t_acc_usage from t_acc_usage where 0=1

			if (@@error <> 0) 

			begin

				set @result = '5000012b-dearchive operation failed-->error in creating #tmp_t_acc_usage'

				rollback tran

				close c2

				deallocate c2

				return

			end

			if (@datafiletype = 'n')

			begin

			select @sql1 = 'bulk insert #tmp_t_acc_usage from ''' + @path + '\t_acc_usage' + '_' + 

					cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'' 

					WITH 

	      				(	

					DATAFILETYPE = ''native'',

	       				CHECK_CONSTRAINTS

	      				)'

			end

			if (@datafiletype = 'c')

			begin

			select @sql1 = 'bulk insert #tmp_t_acc_usage from ''' + @path + '\t_acc_usage' + '_' + 

					cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'' 

					WITH 

	      				(	

					FIELDTERMINATOR = ''\t'',

	       				ROWTERMINATOR = ''\n'',

	       				CHECK_CONSTRAINTS

	      				)'

			end

			exec (@sql1)

			if (@@error <> 0) 

			begin

				set @result = '5000013-dearchive operation failed-->error in usage bulk insert operation'

				rollback tran

				close c2

				deallocate c2

				return

			end

			create unique clustered index idx_tmp_t_acc_usage on #tmp_t_acc_usage(id_sess)

			create index idx1_tmp_t_acc_usage on #tmp_t_acc_usage(id_acc)

			if (@constraint = 'Y')

			begin

				if exists (select 1 from #tmp_t_acc_usage where id_pi_template not in ( select id_template from t_pi_template))

				begin

					set @result = '5000014-dearchive operation failed-->id_pi_template key violation'

					rollback tran

					close c2

					deallocate c2

					return

				end	 

				if exists (select 1 from #tmp_t_acc_usage where id_pi_instance not in ( select id_pi_instance from t_pl_map))

				begin

					set @result = '5000015-dearchive operation failed-->id_pi_instance key violation'

					rollback tran

					close c2

					deallocate c2

					return

				end

				if exists (select 1 from #tmp_t_acc_usage where id_view not in ( select id_view from t_prod_view))

				begin

					set @result = '5000016-dearchive operation failed-->id_view key violation'

					rollback tran

					close c2

					deallocate c2

					return

				end	 	 

			end

			insert into t_acc_usage select * from #tmp_t_acc_usage where id_acc in

			(select id from #AccountIDsTable)

			

			--Insert data into product view tables

			declare  c1 cursor fast_forward for select distinct id_view from #tmp_t_acc_usage where id_acc in

			(select id from #AccountIDsTable)

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1

				if exists (select 1 from t_query_log pv inner join t_archive arc on

				pv.c_id_view = arc.id_view 

				and pv.c_id_view = @var1

				and pv.c_timestamp > arc.tt_start

				and arc.id_interval = @interval

				and arc.status ='E'

				and not exists (select 1 from t_archive arc1 

				where arc.id_interval = arc1.id_interval

				and arc.id_view = arc1.id_view

				and arc1.status ='E'

				and arc1.tt_start > arc.tt_start))

				begin

					select @sql1 = N'IF object_id(''tempdb..tmp_' + @tab1 + ''') is not null drop table tempdb..tmp_' + @tab1

					EXEC (@sql1)

					select top 1 @sql1 = c_old_schema from t_query_log pv inner join t_archive arc on

					pv.c_id_view = arc.id_view 

					and pv.c_id_view = @var1

					and pv.c_timestamp > arc.tt_start

					and arc.id_interval = @interval
					and arc.status ='E'

					and pv.c_old_schema is not null

					order by pv.c_timestamp,c_id

					select @sql1 = replace(@sql1,@tab1,'tempdb..tmp_' + @tab1)

					exec (@sql1)

					if (@@error <> 0) 

					begin

						set @result = '5000017-dearchive operation failed-->error in creating temp pv table' + cast(@tab1 as nvarchar(1000)) 

						rollback tran

						close c1

						deallocate c1

						close c2

						deallocate c2

						return

					end

					declare @change nvarchar(4000)

					declare @c_id int

					declare c3 cursor for select distinct c_query,c_id from t_query_log pv inner join t_archive 

					arc on pv.c_id_view = arc.id_view 

					and pv.c_id_view = @var1

					and pv.c_timestamp > arc.tt_start

					and arc.id_interval = @interval

					and arc.status ='E'

					and pv.c_query is not null

					order by c_id

				end

				else

				begin

					select @sql1 = N'IF object_id(''tempdb..tmp_' + @tab1 + ''') is not null drop table tempdb..tmp_' + @tab1

					EXEC (@sql1)

					select @sql1 = 'select * into  tempdb..tmp_' + @tab1 + ' from ' + @dbname + '..' + @tab1 + ' where 0=1'

					exec (@sql1)

					if (@@error <> 0) 

					begin

						set @result = '5000018-dearchive operation failed-->error in creating temp pv table from origional ' + cast(@tab1 as nvarchar(1000)) 

						rollback tran

						close c1

						deallocate c1

						close c2

						deallocate c2

						return

					end

				end

				if (@datafiletype = 'n')

				begin

				select @sql1 = 'bulk insert tempdb..tmp_' + @tab1 + ' from ''' + @path + '\' + @tab1 + 

						'_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'' WITH 

	      					(

							DATAFILETYPE = ''native''

	      					)'

				end

				if (@datafiletype = 'c')

				begin

				select @sql1 = 'bulk insert tempdb..tmp_' + @tab1 + ' from ''' + @path + '\' + @tab1 + 

						'_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'' WITH 

	      					(

						FIELDTERMINATOR = ''\t'',

	       					ROWTERMINATOR = ''\n''

	      					)'

				end

				exec (@sql1)	

				if (@@error <> 0) 

				begin

					set @result = '5000019-dearchive operation failed-->error in bulk insert operation for table ' + cast(@tab1 as nvarchar(1000)) 

					rollback tran

					close c1

					deallocate c1

					close c2

					deallocate c2
					return

				end

				if exists (select 1 from t_query_log pv inner join t_archive arc on

				pv.c_id_view = arc.id_view 

				and pv.c_id_view = @var1

				and pv.c_timestamp > arc.tt_start

				and arc.id_interval = @interval

				and arc.status ='E')

				begin

					open c3

					fetch c3 into @change,@c_id

					WHILE (@@FETCH_STATUS = 0)

					BEGIN

						select @change = stuff(@change,charindex(@tab1,@change),len(@tab1),'tempdb..tmp_' + @tab1)

						exec (@change)					

   						FETCH NEXT FROM c3 into @change,@c_id

					END

					CLOSE c3

					DEALLOCATE c3

				end

 				select @sql1 = 'insert into ' + @dbname + '..' + @tab1 + ' select * from tempdb..tmp_' + @tab1 +' where id_sess

 						in (select id_sess from #tmp_t_acc_usage where id_acc in (select id from #AccountIDsTable))'

				exec (@sql1)

				if (@@error <> 0) 

				begin

					set @result = '5000020-dearchive operation failed-->error in insert into pv table from temp table ' + cast(@tab1 as nvarchar(1000)) 

					rollback tran

					close c1

					deallocate c1

					close c2

					deallocate c2

					return

				end

				select @sql1 = N'IF object_id(''tempdb..tmp_' + @tab1 + ''') is not null drop table tempdb..tmp_' + @tab1

				EXEC (@sql1)

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1

		fetch next from c2 into @bucket

		end

		close c2

		deallocate c2

		if not exists (select top 1 id_adj_trx from t_adjustment_transaction where id_usage_interval = @interval)

		begin 

		--Insert data into t_adjustment_transaction

			if object_id('tempdb..#tmp_t_adjustment_transaction') is not null

			drop table #tmp_t_adjustment_transaction

			select * into #tmp_t_adjustment_transaction from t_adjustment_transaction where 0=1

			if (@datafiletype = 'n')

			begin

			select @sql1 = 'bulk insert #tmp_t_adjustment_transaction from ''' + @path + '\t_adjustment_transaction' + '_' + cast (@interval as varchar(10)) + '.txt'' WITH 

	      				(	

					DATAFILETYPE = ''native'',

		       			CHECK_CONSTRAINTS

	      				)'

			end

			if (@datafiletype = 'c')

			begin

			select @sql1 = 'bulk insert #tmp_t_adjustment_transaction from ''' + @path + '\t_adjustment_transaction' + '_' + cast (@interval as varchar(10)) + '.txt'' WITH 

	      					(

						FIELDTERMINATOR = ''\t'',

	       					ROWTERMINATOR = ''\n'',

			       			CHECK_CONSTRAINTS

	      					)'

			end

			exec (@sql1)

			if (@@error <> 0) 

			begin

				set @result = '5000021-dearchive operation failed-->error in adjustment bulk insert operation'

				rollback tran

				close c1

				deallocate c1

				return

			end

	

			--update t_adjustment_transaction to copy data from archive_sess to id_sess if usage is already in t_acc_usage

			update trans 

				set id_sess=archive_sess,archive_sess=null

				from #tmp_t_adjustment_transaction trans inner join t_acc_usage au 

				on trans.archive_sess=au.id_sess

				where trans.id_sess is null

			if (@@error <> 0) 

			begin

				set @result = '5000022-dearchive operation failed-->error in update adjustment transaction'

				rollback tran

				close c1

				deallocate c1

				return

			end

			--This update is to cover the scenario if post bill adjustments are archived before usage and now dearchive before usage interval

			update trans 

				set archive_sess=id_sess,id_sess=null

				from #tmp_t_adjustment_transaction trans where not exists 

				(select 1 from t_acc_usage au where au.id_sess=trans.id_sess)

				and trans.archive_sess is null

--				and n_adjustmenttype = 1

				and id_usage_interval=@interval

			if (@@error <> 0) 

			begin

				set @result = '5000023-dearchive operation failed-->error in update adjustment transaction'

				rollback tran

				close c1

				deallocate c1

				return

			end

			insert into t_adjustment_transaction select * from #tmp_t_adjustment_transaction

			if object_id('tempdb..#tmp_t_adjustment_transaction') is not null
			drop table #tmp_t_adjustment_transaction

			--Insert data into t_aj tables

			declare  c1 cursor fast_forward for select distinct adj_name from t_archive 

			where id_interval = @interval and tt_end = @maxtime and adj_name is not null and status='A'

			open c1

			fetch next from c1 into @var1

			while @@fetch_status = 0

			begin

				if (@datafiletype = 'n')

				begin

				select @sql1 = 'bulk insert ' + @dbname + '..' + @var1 + ' from ''' + @path + '\' + @var1 + '_' + cast (@interval as varchar(10)) + '.txt'' WITH 

	      					(

						DATAFILETYPE = ''native'',

		       				CHECK_CONSTRAINTS

	      					)'

				end

				if (@datafiletype = 'c')

				begin

				select @sql1 = 'bulk insert ' + @dbname + '..' + @var1 + ' from ''' + @path + '\' + @var1 + '_' + cast (@interval as varchar(10)) + '.txt'' WITH 

	      					(

						FIELDTERMINATOR = ''\t'',

	       					ROWTERMINATOR = ''\n'',

		       				CHECK_CONSTRAINTS

						)'

				end

				exec (@sql1)

				if (@@error <> 0) 

				begin

					set @result = '5000024-dearchive operation failed-->error in bulk insert operation for table ' + cast(@var1 as nvarchar(1000))

					rollback tran

					close c1

					deallocate c1

					return

				end

				fetch next from c1 into @var1

			end

			close c1

			deallocate c1

		end



		update act set tt_end = dateadd(s,-1,@vartime)

		from t_acc_bucket_map act inner join #AccountIDsTable tmp on act.id_acc = tmp.id

		where act.id_usage_interval=@interval

		and act.status = 'A'

		and act.tt_end=@maxtime

		if (@@error <> 0) 

		begin

			set @result = '5000025-dearchive operation failed-->error in update t_acc_bucket_map'

			rollback tran

			return

		end

		insert into t_acc_bucket_map(id_usage_interval,id_acc,bucket,status,tt_start,tt_end)

		select @interval,id,bucket,'D',@vartime,@maxtime from #AccountIDsTable 

		if (@@error <> 0) 

		begin

			set @result = '5000026-dearchive operation failed-->error in insert into t_acc_bucket_map'

			rollback tran

			return

		end



		if not exists (select 1 from t_acc_bucket_map map left outer join t_acc_usage au on

				map.id_acc = au.id_acc

				and map.id_usage_interval = au.id_usage_interval

				where map.status ='A'

				and map.id_usage_interval = @interval

				and tt_end = @maxtime)

		begin

			--Update t_archive table to record the fact that interval is no longer archived

			update t_archive set tt_end=dateadd(s,-1,@vartime)

			where id_interval=@interval 

			and status='A' 

			and tt_end=@maxtime

			if (@@error <> 0) 

			begin

				set @result = '5000027-dearchive operation failed-->error in update t_archive'

				rollback tran

				return

			end

			insert into t_archive 

			select @interval,id_view,null,'D',@vartime,@maxtime

			from t_archive where id_interval=@interval 

			and status='A' 

			and tt_end=dateadd(s,-1,@vartime)

			and id_view is not null

			union all

			select @interval,null,adj_name,'D',@vartime,@maxtime

			from t_archive where id_interval=@interval 

			and status='A' 

			and tt_end=dateadd(s,-1,@vartime)

			and adj_name is not null

			if (@@error <> 0) 

			begin

				set @result = '5000028-dearchive operation failed-->error in insert t_archive'

				rollback tran

				return

			end

		end

--Following update will be required for post bill adjustments that are already in system when current usage is dearchived

			update trans 

				set id_sess=archive_sess,archive_sess=null

				from t_adjustment_transaction trans inner join t_acc_usage au 

				on trans.archive_sess=au.id_sess

				where trans.id_sess is null

			if (@@error <> 0) 

			begin

				set @result = '5000029-dearchive operation failed-->error in update adjustment transaction'

				rollback tran

				return

			end

		set @result = '0-dearchive operation successful'

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROC DelPVRecordsForAcct

										@nm_productview varchar(255),

										@id_pi_template int,

										@id_interval int,

										@id_view int,

										@id_acc int

				AS

				DECLARE @pv_delete_stmt varchar(1000)

 				DECLARE @usage_delete_stmt varchar(1000)

 				DECLARE @strInterval varchar(255)

 				DECLARE @strPITemplate varchar(255)

 				DECLARE @strView varchar(255)

 				DECLARE @strAccount varchar(255)

 				DECLARE @WhereClause varchar(255)



				--convert int to strings

				SELECT @strInterval = CONVERT(varchar(255), @id_interval)

				SELECT @strPITemplate = CONVERT(varchar(255), @id_pi_template)

				SELECT @strView = CONVERT(varchar(255), @id_view)

				SELECT @strAccount = CONVERT(varchar(255), @id_acc)

				SELECT @WhereClause = ' WHERE id_usage_interval=' + @strInterval + ' AND id_pi_template=' + @strPITemplate + ' AND id_view=' + @strView + ' AND id_acc=' + @strAccount



				SELECT 

					@pv_delete_stmt = 'DELETE FROM ' + @nm_productview + ' WHERE id_sess IN (select id_sess from t_acc_usage ' +

					+ @WhereClause + ')'

				SELECT 

					@usage_delete_stmt = 'DELETE FROM t_acc_usage ' + @WhereClause

				BEGIN TRAN

					EXECUTE(@pv_delete_stmt)

					EXECUTE(@usage_delete_stmt)

				COMMIT TRAN

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      

			CREATE PROC DeleteAccounts

				@accountIDList nvarchar(255), --accounts to be deleted

				@linkedservername nvarchar(255), --linked server name for payment server 
				@PaymentServerdbname nvarchar(255) --payment server database name

			AS

			set nocount on

			set xact_abort on

			declare @sql nvarchar(4000)



				-- Break down into simple account IDs

				-- This block of SQL can be used as an example to get 

				-- the account IDs from the list of account IDs that are

				-- passed in

				CREATE TABLE #AccountIDsTable (

				  ID int NOT NULL,

					status int NULL,

					message varchar(255) NULL)



				PRINT '------------------------------------------------'

				PRINT '-- Start of Account Deletion Stored Procedure --'

				PRINT '------------------------------------------------'



				PRINT '-- Parsing Account IDs passed in and inserting in tmp table --'

				WHILE CHARINDEX(',', @accountIDList) > 0

				BEGIN

					INSERT INTO #AccountIDsTable (ID, status, message)

 					SELECT SUBSTRING(@accountIDList,1,(CHARINDEX(',', @accountIDList)-1)), 1, 'Okay to delete'

 					SET @accountIDList = 

 						SUBSTRING (@accountIDList, (CHARINDEX(',', @accountIDList)+1),

  										(LEN(@accountIDList) - (CHARINDEX(',', @accountIDList))))

				END

 						INSERT INTO #AccountIDsTable (ID, status, message) 

						SELECT @accountIDList, 1, 'Okay to delete'

				-- SELECT ID as one FROM #AccountIDsTable



				-- Transitive Closure (check for folder/corporation)

				PRINT '-- Inserting children (if any) into the tmp table --'

				INSERT INTO #AccountIDsTable (ID, status, message)

				SELECT DISTINCT 

				  aa.id_descendent,

					1,

					NULL

				FROM 

				  t_account_ancestor aa INNER JOIN #AccountIDsTable tmp ON 

					tmp.ID = aa.id_ancestor AND

					aa.num_generations > 0 AND

				NOT EXISTS (

				  SELECT 

					  ID 

					FROM 

					  #AccountIDsTable tmp1 

					WHERE 

					  tmp1.ID = aa.id_descendent)



				--fix bug 11599

				INSERT INTO #AccountIDsTable (ID, status, message)

				SELECT DISTINCT 

				  aa.id_descendent,

					1,

					'Okay to delete'

				FROM 

				  t_account_ancestor aa where id_ancestor in (select id from  #AccountIDsTable)

					AND

					aa.num_generations > 0 AND

				NOT EXISTS (

				  SELECT 

					  ID 

					FROM 

					  #AccountIDsTable tmp1 

					WHERE 

					  tmp1.ID = aa.id_descendent)



				-- SELECT * from #AccountIDsTable			

					

				/*

				-- print out the accounts with their login names

				SELECT 

					ID as two, 

					nm_login as two 

				FROM 

					#AccountIDsTable a,

					t_account_mapper b

				WHERE

					a.ID = b.id_acc

				*/



				/*

				 * Check for all the business rules.  We want to make sure 

				 * that we are checking the more restrictive rules first

				 * 1. Check for usage in hard closed interval

				 * 2. Check for invoices in hard closed interval

				 * 3. Check if the account is a payer ever

				 * 4. Check if the account is a receiver of per subscription Recurring

				 *    Charge

				 * 5. Check for usage in soft/open closed interval

				 * 6. Check for invoices in soft/open closed interval

				 * 7. Check if the account contributes to group discount

				 */

				PRINT '-- Account does not exists check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account does not exists!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					not EXISTS (

						SELECT 

							1

						FROM 

							t_account acc 

						WHERE

							acc.id_acc = tmp.ID )

											

				-- 1. Check for 'hard close' usage in any of these accounts

				PRINT '-- Usage in Hard closed interval check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account contains usage in hard interval!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							au.id_acc

						FROM 

							t_acc_usage au INNER JOIN t_usage_interval ui

						ON	

							ui.id_interval = au.id_usage_interval AND

							ui.tx_interval_status in ('H')

						WHERE

							au.id_acc = tmp.ID )



				-- 2. Check for invoices in hard closed interval usage in any of these 

				-- accounts

				PRINT '-- Invoices in Hard closed interval check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account contains invoices for hard closed interval!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							i.id_acc

						FROM 

							t_invoice i INNER JOIN t_usage_interval ui

						ON	

							ui.id_interval = i.id_interval AND

							ui.tx_interval_status in ('H')

						WHERE

							i.id_acc = tmp.ID )



				-- 3. Check if this account has ever been a payer

				PRINT '-- Payer check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account is a payer!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							p.id_payer

						FROM 

							t_payment_redir_history p

						WHERE

							p.id_payer = tmp.ID AND

							p.id_payee not in (select id from #AccountIDsTable))



				-- 4. Check if this account is receiver of per subscription RC

				PRINT '-- Receiver of per subscription Recurring Charge check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account is receiver of per subscription RC!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							gsrm.id_acc

						FROM 

							t_gsub_recur_map gsrm

						WHERE

							gsrm.id_acc = tmp.ID )



				-- 5. Check for invoices in soft closed or open usage in any of these 

				-- accounts

				PRINT '-- Invoice in Soft closed/Open interval check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account contains invoices for soft closed interval.  Please backout invoice adapter first!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							i.id_acc

						FROM 

							t_invoice i INNER JOIN t_usage_interval ui

						ON	

							ui.id_interval = i.id_interval AND

							ui.tx_interval_status in ('C', 'O')

						WHERE

							i.id_acc = tmp.ID )



				-- 6. Check for 'soft close/open' usage in any of these accounts

				PRINT '-- Usage in Soft closed/Open interval check --'

				UPDATE 

					tmp

				SET					status = 0, -- failure

					message = 'Account contains usage in soft closed or open interval.  Please backout first!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							au.id_acc

						FROM 

							t_acc_usage au INNER JOIN t_usage_interval ui

						ON	

							ui.id_interval = au.id_usage_interval AND

							ui.tx_interval_status in ('C', 'O')

						WHERE

							au.id_acc = tmp.ID )



				-- 7. Check if this account contributes to group discount 

				PRINT '-- Contribution to Discount Distribution check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account is contributing to a discount!'

				FROM

					#AccountIDsTable tmp

				WHERE

					status <> 0 AND

					EXISTS (

						SELECT 

							gs.id_discountAccount

						FROM 

							t_group_sub gs

						WHERE

							gs.id_discountAccount = tmp.ID )



				IF EXISTS (

					SELECT 

						*

					FROM

						#AccountIDsTable

					WHERE

						status = 0)

				BEGIN					PRINT 'Deletion of accounts cannot proceed. Fix the errors!'

					PRINT '-- Exiting --!'

					SELECT 

						*

					FROM

						#AccountIDsTable



					RETURN

				END

						

				-- Start the deletes here

				PRINT '-- Beginning the transaction here --'

				BEGIN TRANSACTION



				-- Script to find ICB rates and delete from t_pt, t_rsched, 

				-- t_pricelist tables

				PRINT '-- Finding ICB rate and deleting for PC tables --'

				create table #id_sub (id_sub int)

				INSERT into #id_sub select id_sub from t_sub where id_acc

				IN (SELECT ID FROM #AccountIDsTable) 

				DECLARE @id_pt table (id_pt int,id_pricelist int)

				INSERT 

					@id_pt 

				SELECT 

					id_paramtable,

					id_pricelist 

				FROM 

					t_pl_map 

				WHERE 

					id_sub IN (SELECT * FROM #id_sub)

				DECLARE c1 cursor forward_only for select id_pt,id_pricelist from @id_pt

				DECLARE @name varchar(200)

				DECLARE @pt_name varchar(200)

				DECLARE @pl_name varchar(200)

				DECLARE @str varchar(4000)

				OPEN c1

				FETCH c1 INTO @pt_name,@pl_name

				SELECT 

					@name =

				REVERSE(substring(REVERSE(nm_name),1,charindex('/',REVERSE(nm_name))-1))

				FROM 

					t_base_props 

				WHERE 

					id_prop = @pt_name

				SELECT 

					@str = 'DELETE t_pt_' + @name + ' from t_pt_' + @name + ' INNER JOIN t_rsched rsc on t_pt_' 

						+ @name + '.id_sched = rsc.id_sched 

						INNER JOIN t_pl_map map ON 

						map.id_paramtable = rsc.id_pt AND 

						map.id_pi_template = rsc.id_pi_template AND 

						map.id_pricelist = rsc.id_pricelist 

						WHERE map.id_sub IN (SELECT id_sub FROM #id_sub)'

				EXECUTE (@str)

				SELECT @str = 'DELETE FROM t_rsched WHERE id_pricelist =' + @pl_name

				EXECUTE (@str)

				SELECT @str = 'DELETE FROM t_pl_map WHERE id_pricelist =' + @pl_name

				EXECUTE (@str)

				SELECT @str = 'DELETE FROM t_pricelist WHERE id_pricelist =' + @pl_name

				EXECUTE (@str)

				

				CLOSE c1

				DEALLOCATE c1

				

				-- t_av_* tables

				DECLARE @table_name nvarchar(1000)

				DECLARE c2 CURSOR FOR SELECT table_name FROM information_schema.tables 

				WHERE table_name LIKE 't_av_%' AND table_type = 'BASE TABLE'

				-- Delete from t_av_* tables

				OPEN c2

				FETCH NEXT FROM c2 into @table_name

				WHILE (@@FETCH_STATUS = 0)

				BEGIN

					PRINT '-- Deleting from ' + @table_name + ' --'					

					EXEC ('DELETE FROM ' + @table_name + ' WHERE id_acc IN (SELECT ID FROM #AccountIDsTable)')

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from ' + @table_name + ' table'

  						CLOSE c2

   						DEALLOCATE c2

						GOTO SetError

					END

   					FETCH NEXT FROM c2 INTO @table_name

				END

  				CLOSE c2

   				DEALLOCATE c2

 		

				-- t_account_state_history

				PRINT '-- Deleting from t_account_state_history --'

				DELETE FROM t_account_state_history

				WHERE id_acc IN (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_account_state_history table'

					GOTO SetError

				END



				-- t_account_state

				PRINT '-- Deleting from t_account_state --'

				DELETE FROM t_account_state

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_account_state table'

					GOTO SetError

				END



				-- t_acc_usage_interval 

				PRINT '-- Deleting from t_acc_usage_interval --'

				DELETE FROM t_acc_usage_interval

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_acc_usage_interval table'

					GOTO SetError

				END



				-- t_acc_usage_cycle

				PRINT '-- Deleting from t_acc_usage_cycle --'

				DELETE FROM t_acc_usage_cycle

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_acc_usage_cycle table'

					GOTO SetError

				END



				-- t_acc_template_props

				PRINT '-- Deleting from t_acc_template_props --'
				DELETE FROM t_acc_template_props

				WHERE id_acc_template IN 

				(SELECT id_acc_template 

				FROM t_acc_template

				WHERE id_folder in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_acc_template_props table'

					GOTO SetError

				END



				-- t_acc_template_subs

				PRINT '-- Deleting from t_acc_template_subs --'

				DELETE FROM t_acc_template_subs

				WHERE id_acc_template IN 

				(SELECT id_acc_template 

				FROM t_acc_template

				WHERE id_folder in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_acc_template_subs table'

					GOTO SetError

				END



				-- t_acc_template

				PRINT '-- Deleting from t_acc_template --'

				DELETE FROM t_acc_template

				WHERE id_folder in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_acc_template table'

					GOTO SetError

				END

				

				-- t_user_credentials

				PRINT '-- Deleting from t_user_credentials --'

				DELETE FROM t_user_credentials

				WHERE nm_login IN 

				(SELECT nm_login

				FROM t_account_mapper

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_user_credentials table'

					GOTO SetError

				END



				-- t_profile

				PRINT '-- Deleting from t_profile --'

				DELETE FROM t_profile

				WHERE id_profile IN

				(SELECT id_profile

				FROM t_site_user

				WHERE nm_login IN

				(SELECT nm_login

				FROM t_account_mapper

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_profile table'

					GOTO SetError

				END



				-- t_site_user

				PRINT '-- Deleting from t_site_user --'

				DELETE FROM t_site_user

				WHERE nm_login IN 

				(SELECT nm_login

				FROM t_account_mapper

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_site_user table'

					GOTO SetError

				END

				

				-- t_payment_redirection

				PRINT '-- Deleting from t_payment_redirection --'

				DELETE FROM t_payment_redirection

				WHERE id_payee IN (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_payment_redirection table'

					GOTO SetError

				END

				

				-- t_payment_redir_history

				PRINT '-- Deleting from t_payment_redir_history --'

				DELETE FROM t_payment_redir_history

				WHERE id_payee IN (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_payment_redir_history table'

					GOTO SetError

				END

				

				-- t_sub

				PRINT '-- Deleting from t_sub --'

				DELETE FROM t_sub

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_sub table'

					GOTO SetError

				END

				

				-- t_sub_history

				PRINT '-- Deleting from t_sub_history --'

				DELETE FROM t_sub_history

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_sub_history table'

					GOTO SetError

				END

				

				-- t_group_sub

				PRINT '-- Deleting from t_group_sub --'

				DELETE FROM t_group_sub

				WHERE id_discountAccount in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_group_sub table'

					GOTO SetError

				END



				-- t_gsubmember

				PRINT '-- Deleting from t_gsubmember --'

				DELETE FROM t_gsubmember

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_gsubmember table'

					GOTO SetError

				END

				

				-- t_gsubmember_historical

				PRINT '-- Deleting from t_gsubmember_historical --'

				DELETE FROM t_gsubmember_historical

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_gsubmember_historical table'

					GOTO SetError

				END



				-- t_gsub_recur_map

				PRINT '-- Deleting from t_gsub_recur_map --'

				DELETE FROM t_gsub_recur_map 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)                                             

				BEGIN

				  PRINT 'Cannot delete from t_gsub_recur_map table'

					GOTO SetError

				END

				

				-- t_pl_map

				PRINT '-- Deleting from t_pl_map --'

				DELETE FROM t_pl_map

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_pl_map table'

					GOTO SetError

				END

				

				-- t_se_mapper
				PRINT '-- Deleting from t_se_mapper --'

				select id_se into #se FROM t_se_mapper

				WHERE id_corp in (SELECT ID FROM #AccountIDsTable)

				DELETE FROM t_se_mapper

				WHERE id_corp in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_se_mapper table'

					GOTO SetError

				END



				-- t_se_parent

				PRINT '-- Deleting from t_se_parent --'

				DELETE FROM t_se_parent

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_se_parent table'

					GOTO SetError

				END



				-- t_service_endpoint

				DELETE FROM t_service_endpoint

				WHERE id_se IN (SELECT id_se FROM #se)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_service_endpoint table'

					GOTO SetError

				END



				-- t_path_capability

				PRINT '-- Deleting from t_path_capability --'

				DELETE FROM t_path_capability

				WHERE id_cap_instance IN (

				SELECT id_cap_instance FROM t_capability_instance ci

				WHERE ci.id_policy IN (

				SELECT id_policy FROM t_principal_policy 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_path_capability table'

					GOTO SetError

				END



				-- t_enum_capability

				PRINT '-- Deleting from t_enum_capability --'

				DELETE FROM t_enum_capability

				WHERE id_cap_instance IN (

				SELECT id_cap_instance FROM t_capability_instance ci

				WHERE ci.id_policy IN (

				SELECT id_policy FROM t_principal_policy 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_enum_capability table'

					GOTO SetError

				END



				-- t_decimal_capability

				PRINT '-- Deleting from t_decimal_capability --'

				DELETE FROM t_decimal_capability

				WHERE id_cap_instance IN (

				SELECT id_cap_instance FROM t_capability_instance ci

				WHERE ci.id_policy IN (

				SELECT id_policy FROM t_principal_policy 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_decimal_capability table'

					GOTO SetError

				END



				-- t_capability_instance

				PRINT '-- Deleting from t_capability_instance --'

				DELETE FROM t_capability_instance

				WHERE id_policy IN (

				SELECT id_policy FROM t_principal_policy 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_capability_instance table'

					GOTO SetError

				END

				

				-- t_policy_role

				PRINT '-- Deleting from t_policy_role --'

				DELETE FROM t_policy_role

				WHERE id_policy IN (

				SELECT id_policy FROM t_principal_policy 

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_policy_role table'

					GOTO SetError

				END

				

				-- t_principal_policy

				PRINT '-- Deleting from t_principal_policy --'

				DELETE FROM t_principal_policy

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_principal_policy table'

					GOTO SetError

				END

				

				-- t_impersonate

				PRINT '-- Deleting from t_impersonate --'

				DELETE FROM t_impersonate

				WHERE (id_acc in (SELECT ID FROM #AccountIDsTable)

				or id_owner in (SELECT ID FROM #AccountIDsTable))

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_impersonate table'

					GOTO SetError

				END

				

				-- t_account_mapper

				PRINT '-- Deleting from t_account_mapper --'
				DELETE FROM t_account_mapper

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable) 

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_account_mapper table'

					GOTO SetError

				END



				DECLARE @hierarchyrule nvarchar(10)

				SELECT @hierarchyrule = value 

				FROM t_db_values 

				WHERE parameter = 'Hierarchy_RestrictedOperations'

				IF (@hierarchyrule = 'True')

				BEGIN

				  DELETE FROM t_group_sub 

					WHERE id_corporate_account IN (SELECT ID FROM #AccountIDsTable)

					IF (@@Error <> 0)                                             

					BEGIN

					  PRINT 'Cannot delete from t_group_sub table'

						GOTO SetError

					END

				END

								

				-- t_account_ancestor

				PRINT '-- Deleting from t_account_ancestor --'

				DELETE FROM t_account_ancestor

				WHERE id_descendent in (SELECT ID FROM #AccountIDsTable) 

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_account_ancestor table'

					GOTO SetError

				END



				UPDATE	

					t_account_ancestor 

				SET 

					b_Children = 'N' 

				FROM 

					t_account_ancestor aa1

				WHERE

					id_descendent IN (SELECT ID FROM #AccountIDsTable) and

					NOT EXISTS (SELECT 1 FROM t_account_ancestor aa2

											WHERE aa2.id_ancestor = aa1.id_descendent

											AND num_generations <> 0)



				-- t_account

				PRINT '-- Deleting from t_account --'

				DELETE FROM t_account

				WHERE id_acc in (SELECT ID FROM #AccountIDsTable)

				IF (@@Error <> 0)				

				BEGIN

					PRINT 'Cannot delete from t_account table'

					GOTO SetError

				END

				

				-- IF (@linkedservername <> NULL)

				-- BEGIN

				  -- Do payment server stuff here

				-- END



				-- If we are here, then all accounts should have been deleted	

				

				if (@linkedservername is not NULL and @PaymentServerdbname is not null)

				begin

					select @sql = 'delete from ' + @linkedservername + '.' + @PaymentServerdbname + '.dbo.t_ps_creditcard WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					print (@sql)

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_creditcard table'

						GOTO SetError

					end

					select @sql = 'delete from ' + @linkedservername + '.' + @PaymentServerdbname + '.dbo.t_ps_ach WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_ach table'

						GOTO SetError

					END

					select @sql = 'delete from ' + @linkedservername + '.' + @PaymentServerdbname + '.dbo.t_ps_account WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_account table'

						GOTO SetError

					END

				end

				if (@linkedservername is NULL and @PaymentServerdbname is not null)

				begin

					select @sql = 'delete from ' + @PaymentServerdbname + '.dbo.t_ps_creditcard WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_creditcard table'

						GOTO SetError

					end

					select @sql = 'delete from ' + @PaymentServerdbname + '.dbo.t_ps_ach WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_ach table'

						GOTO SetError

					END

					select @sql = 'delete from ' + @PaymentServerdbname + '.dbo.t_ps_account WHERE id_acc in

							(SELECT ID FROM #AccountIDsTable)'

					execute (@sql)

					IF (@@Error <> 0)				

					BEGIN

						PRINT 'Cannot delete from t_ps_account table'

						GOTO SetError

					END

				end



				if (@linkedservername is not NULL and @PaymentServerdbname is null)

					BEGIN

						PRINT 'Please specify the database name of payment server'

						GOTO SetError

					END				



				UPDATE

				  #AccountIDsTable

				SET

				  message = 'This account no longer exists!'	



				SELECT 

					*

				FROM

					#AccountIDsTable

				--WHERE

				--	status <> 0



				COMMIT TRANSACTION

				RETURN 0



				SetError:

					ROLLBACK TRANSACTION

					RETURN -1

			
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      create procedure DeleteBaseProps(

				@a_id_prop int) 

      as

			begin

        declare @id_desc_display_name int

        declare @id_desc_name int

        declare @id_desc_desc int

     		SELECT @id_desc_name = n_name, @id_desc_desc = n_desc, 

				@id_desc_display_name = n_display_name

		 		from t_base_props where id_prop = @a_id_prop

				exec DeleteDescription @id_desc_display_name

				exec DeleteDescription @id_desc_name

				exec DeleteDescription @id_desc_desc

				DELETE FROM t_base_props WHERE id_prop = @a_id_prop

			end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



						create proc DeleteCounterParamInstances

											(@id_counter	int)

						AS

						BEGIN

               -- delete mappings for shared parameters

               DELETE FROM t_counter_param_map WHERE id_counter =  @id_counter

               DELETE FROM T_BASE_PROPS WHERE id_prop IN

              (SELECT id_counter_param FROM t_counter_params WHERE id_counter = @id_counter)

              DELETE FROM T_COUNTER_PARAM_PREDICATE WHERE id_counter_param IN

              (SELECT id_counter_param FROM t_counter_params WHERE id_counter = @id_counter)

						  DELETE FROM T_COUNTER_PARAMS WHERE id_counter = @id_counter

            END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



						CREATE PROC DeleteCounterParamTypes			

									@id_counter_type int

			AS

			BEGIN TRAN

				SELECT id_prop INTO #TempCounterType FROM t_counter_params_metadata WHERE id_counter_meta = @id_counter_type

				DELETE FROM t_counter_params_metadata WHERE id_prop IN (SELECT id_prop FROM #TempCounterType)

				DELETE FROM t_base_props WHERE id_prop IN (SELECT id_prop FROM #TempCounterType)

			COMMIT TRAN

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      create procedure DeleteDescription(

				@a_id_desc int)

			as

			BEGIN

				IF (@a_id_desc <> 0)

					begin

					delete from t_description where id_desc=@a_id_desc

					delete from t_mt_id where id_mt=@a_id_desc

	     		end 

			END

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROC DeleteProductViewRecords

										@nm_productview varchar(255),

										@id_pi_template int,

										@id_interval int,

										@id_view int

				AS

				DECLARE @pv_delete_stmt varchar(1000)

 				DECLARE @usage_delete_stmt varchar(1000)

 				DECLARE @strInterval varchar(255)

 				DECLARE @strPITemplate varchar(255)

				DECLARE @strView varchar(255)

 				DECLARE @WhereClause varchar(255)



				--convert int to strings

				SELECT @strInterval = CONVERT(varchar(255), @id_interval)

				SELECT @strPITemplate = CONVERT(varchar(255), @id_pi_template)

				SELECT @strView = CONVERT(varchar(255), @id_view)

				SELECT @WhereClause = ' WHERE id_usage_interval=' + @strInterval + ' AND id_pi_template=' + @strPITemplate + ' AND id_view=' + @strView



				SELECT 

					@pv_delete_stmt = 'DELETE FROM ' + @nm_productview +  ' WHERE id_sess IN (select id_sess from t_acc_usage ' +

					 + @WhereClause + ')'

				SELECT 

					@usage_delete_stmt = 'DELETE FROM t_acc_usage'  + @WhereClause

				BEGIN TRAN

					EXECUTE(@pv_delete_stmt)

					EXECUTE(@usage_delete_stmt)

				COMMIT TRAN

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

    Create   Procedure DeleteSourceData(@rerun_table_name nvarchar(30), @metradate nvarchar(30)) as

    begin

    declare @sql nvarchar(4000)



	  -- values we get from the cursor

	  declare @tablename varchar(255)

	  declare @id_svc int



	  -- delete from the service tables.

	  set @sql = N'DECLARE tablename_cursor CURSOR FOR

	    select rr.id_svc, svc.nm_table_name from 

		  t_enum_data ed

		  inner join ' + @rerun_table_name + N' rr 

		  on rr.id_svc = ed.id_enum_data

		  inner join t_service_def_log svc

		  on svc.nm_service_def = ed.nm_enum_data

		  where (rr.tx_state = ''B'' OR

			rr.tx_state = ''NA'')

		  group by rr.id_svc, svc.nm_table_name'





	  EXEC sp_executesql @sql



	  OPEN tablename_cursor

	  FETCH NEXT FROM tablename_cursor into @id_svc, @tablename

	  WHILE @@FETCH_STATUS = 0

	  BEGIN

	   set @sql = N'DELETE from ' + @tablename

			+ N' where id_source_sess in (select id_source_sess from ' + @rerun_table_name +

			N' where id_svc = ' + CAST(@id_svc AS VARCHAR)

			+ N' and (tx_state = ''B'' or tx_state = ''NA''))'



	   exec (@sql)

	   FETCH NEXT FROM tablename_cursor into @id_svc, @tablename

	  END

	  CLOSE tablename_cursor

	  DEALLOCATE tablename_cursor



	  -- update t_session_state

	  set @sql = N'update t_session_state

		  set dt_end =  ''' + @metradate + N'''

		  from ' + @rerun_table_name + N' rr

		  inner join t_session_state ss

		  on rr.id_source_sess = ss.id_sess

		  where ss.dt_end = dbo.MTMaxDate()

		  and rr.tx_state = ''B'' '



	  EXEC sp_executesql @sql



	  set @sql = N'INSERT INTO t_session_state (id_sess, dt_start, dt_end, tx_state) 

		    SELECT rr.id_source_sess, ''' + @metradate + N''', dbo.MTMaxDate(), ''D''

		    from ' + @rerun_table_name + N' rr

		    where rr.tx_state = ''B'' '



	  EXEC sp_executesql @sql



	-- update t_message for pending and suspended transactions

	-- for pending, the dt_assigned and dt_completed are

	-- set to MTMAXDate, for suspended, the dt_completed 

	-- to MTMaxDate



	set @sql = N'update t_message

			set dt_assigned = dbo.MTMaxDate() 

			where id_message in (

			select ss.id_message from ' + @rerun_table_name + N' rr

			inner join t_session sess

			on sess.id_source_sess = rr.id_source_sess

			inner join t_session_set ss

			on sess.id_ss = ss.id_ss

			inner join t_message msg

			on msg.id_message = ss.id_message

			where rr.tx_state = ''NA'')

			and dt_assigned is null'



	EXEC sp_executesql @sql

	set @sql = N'update t_message

			set dt_completed = dbo.MTMaxDate()

			where id_message in (

			select ss.id_message from ' + @rerun_table_name + N' rr

			inner join t_session sess

			on sess.id_source_sess = rr.id_source_sess

			inner join t_session_set ss

			on sess.id_ss = ss.id_ss

			inner join t_message msg

			on msg.id_message = ss.id_message

			where rr.tx_state = ''NA'')

			and dt_completed is null'



	EXEC sp_executesql @sql



 end





    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			CREATE procedure DeleteTemplate(

				@p_id_template int, 

				@p_status int output)

 			as

	 		begin

				select @p_status = 1 --success



				-- delete the subscriptions in this template

		 		delete from t_acc_template_subs 

					where id_acc_template = @p_id_template

				-- delete properties for this template

		 		delete from t_acc_template_props

					where id_acc_template = @p_id_template

				-- delete the template itself

		 		delete from t_acc_template

					where id_acc_template = @p_id_template

		 		if (@@rowcount <> 1)

		   		begin

					select @p_status = -486604725 -- create an error MT_NO_TEMPLATE_FOUND

		   		end

			 end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE DetermineExecutableEvents (@dt_now DATETIME, @id_instances VARCHAR(4000))
AS

BEGIN
  BEGIN TRAN

  DECLARE @deps TABLE
  (
    id_orig_event INT NOT NULL,
    id_orig_instance INT NOT NULL,
    tx_orig_name VARCHAR(255) NOT NULL, -- useful for debugging
    tx_name nvarchar(255) NOT NULL,      -- useful for debugging
    id_event INT NOT NULL,
    id_instance INT,
    id_arg_interval INT,
    dt_arg_start DATETIME,
    dt_arg_end DATETIME,
    tx_status VARCHAR(14)
  )
  INSERT INTO @deps  
  SELECT * from GetEventExecutionDeps(@dt_now, @id_instances)

  --
  -- returns the final rowset of all events that are 'ReadyToRun' and
  -- have satisfied dependencies. the rows are sorted in the order
  -- that they should be executed. 
  --
  SELECT 
    evt.tx_name EventName,
    evt.tx_class_name ClassName,
    evt.tx_config_file ConfigFile,
    evt.tx_extension_name Extension,
    evt.tx_type EventType,
    inst.id_instance InstanceID,
    inst.id_arg_interval ArgInterval,
    inst.dt_arg_start ArgStartDate,
    inst.dt_arg_end ArgEndDate,
    dependedon.total DependentScore
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  INNER JOIN 
  (
    -- counts the total amount of dependencies per runnable instance
    SELECT 
      deps.id_orig_instance,
      COUNT(*) total
    FROM @deps deps
    GROUP BY
      deps.id_orig_instance 
  ) total_deps ON total_deps.id_orig_instance = inst.id_instance
  INNER JOIN 
  (
    -- counts the amount of satisfied dependencies per runnable instance
    SELECT 
      deps.id_orig_instance,
      COUNT(*) total
    FROM @deps deps
    WHERE deps.tx_status = 'Succeeded'
    GROUP BY
      deps.id_orig_instance 
  ) sat_deps ON sat_deps.id_orig_instance = inst.id_instance
  INNER JOIN 
  (
    -- determines how 'depended on' each runnable instance is
    -- the most 'depended on' instance should be run first in order
    -- to unblock the largest amount of other adapters in the shortest amount of time
    SELECT 
      inst.id_orig_instance,
      COUNT(*) total
    FROM @deps inst
    INNER JOIN t_recevent_dep dep ON dep.id_dependent_on_event = inst.id_orig_event
    GROUP BY
      inst.id_orig_instance
  ) dependedon ON dependedon.id_orig_instance = inst.id_instance
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE
    (total_deps.total = sat_deps.total OR inst.b_ignore_deps = 'Y') AND
    -- instance's effective date has passed or is NULL ('Execute Later')
    (inst.dt_effective IS NULL OR inst.dt_effective <= @dt_now) AND
    -- interval, if any, must be in the closed state
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')
  ORDER BY dependedon.total DESC, inst.id_instance ASC

  COMMIT
END
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE DetermineReversibleEvents (@dt_now DATETIME, @id_instances VARCHAR(4000))
AS

BEGIN
  BEGIN TRAN

  DECLARE @deps TABLE
  (
    id_orig_event INT NOT NULL,
    id_orig_instance INT NOT NULL,
    tx_orig_name VARCHAR(255) NOT NULL, -- useful for debugging
    tx_name nvarchar(255) NOT NULL,      -- useful for debugging
    id_event INT NOT NULL,
    id_instance INT,
    id_arg_interval INT,
    dt_arg_start DATETIME,
    dt_arg_end DATETIME,
    tx_status nvarchar(14)
  )
  INSERT INTO @deps  
  SELECT * from GetEventReversalDeps(@dt_now, @id_instances)

  --
  -- returns the final rowset of all events that are 'ReadyToRun' and
  -- have satisfied dependencies. the rows are sorted in the order
  -- that they should be executed. 
  --
  SELECT 
    evt.tx_name EventName,
    evt.tx_class_name ClassName,
    evt.tx_config_file ConfigFile,
    evt.tx_extension_name Extension,
    evt.tx_reverse_mode ReverseMode,
    evt.tx_type EventType,
    run.id_run RunIDToReverse,
    inst.id_instance InstanceID,
    inst.id_arg_interval ArgInterval,
    inst.dt_arg_start ArgStartDate,
    inst.dt_arg_end ArgEndDate,
    dependedon.total DependentScore
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  INNER JOIN
  (
    -- finds the the run to reverse (the last execution's run ID)
    SELECT 
      id_instance,
      MAX(dt_start) dt_start
    FROM t_recevent_run run
    WHERE tx_type = 'Execute'
    GROUP BY
      id_instance
  ) maxrun ON maxrun.id_instance = inst.id_instance
  INNER JOIN t_recevent_run run ON run.dt_start = maxrun.dt_start
  INNER JOIN 
  (
    -- counts the total amount of dependencies per reversible instance
    SELECT 
      deps.id_orig_instance,
      COUNT(*) total
    FROM @deps deps
    GROUP BY
      deps.id_orig_instance 
  ) total_deps ON total_deps.id_orig_instance = inst.id_instance
  INNER JOIN 
  (
    -- counts the amount of satisfied dependencies per reversible instance
    SELECT 
      deps.id_orig_instance,
      COUNT(*) total
    FROM @deps deps
    WHERE deps.tx_status = 'NotYetRun'
    GROUP BY
      deps.id_orig_instance 
  ) sat_deps ON sat_deps.id_orig_instance = inst.id_instance
  INNER JOIN 
  (
    -- determines how 'depended on' (from an forward perspective) each instance is
    -- the least 'depended on' instance should be run first in order
    -- to unblock the largest amount of other adapters in the shortest amount of time
    SELECT 
      inst.id_orig_instance,
      COUNT(*) total
    FROM @deps inst
    INNER JOIN t_recevent_dep dep ON dep.id_dependent_on_event = inst.id_orig_event
    GROUP BY
      inst.id_orig_instance
  ) dependedon ON dependedon.id_orig_instance = inst.id_instance
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE
    (total_deps.total = sat_deps.total OR inst.b_ignore_deps = 'Y') AND
    -- instance's effective date has passed or is NULL ('Execute Later')
    (inst.dt_effective IS NULL OR inst.dt_effective <= @dt_now) AND
    -- interval, if any, must be in the closed state
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')
  ORDER BY dependedon.total ASC, inst.id_instance ASC

  COMMIT
END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      create proc DropAdjustmentTables

      as

	      DECLARE @CursorVar CURSOR

	      declare @columncursor CURSOR

	      declare @count integer

	      declare @i integer

	      declare @pvname varchar(256)

	      declare @adjname varchar(256)

	      declare @ddlstr as varchar(8000)

	      declare @idpi as int

	      declare @innercount as int

	      declare @j as int

	      declare @columnname as varchar(256)

	      declare @datatype as varchar(256)

	      SET @CursorVar = CURSOR FORWARD_ONLY STATIC

	      FOR

	      select distinct(pv.nm_table_name),

	      't_aj_' + substring(pv.nm_table_name,6,1000),

	      t_pi.id_pi

	      from 

	      t_pi

	      -- all of the product views references by priceable items

	      INNER JOIN t_prod_view pv on pv.nm_name = t_pi.nm_productview

	      INNER JOIN t_charge on t_charge.id_pi = t_pi.id_pi

	      select @i = 0

	      OPEN @CursorVar

	      Set @count = @@cursor_rows

	      while(@i < @count) begin

		      select @i = @i + 1

		      FETCH NEXT FROM @CursorVar into @pvname,@adjname,@idpi

		      -- drop the table if it exists

		      select @ddlstr =  ('if exists (select * from dbo.sysobjects where id = object_id(''' + @adjname + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) drop table ' + @adjname)

		      exec (@ddlstr)

	      end

	      CLOSE @CursorVar

	      DEALLOCATE @CursorVar

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      create  procedure DropAndCreateAdjustmentTable(@p_id_pi_type INTEGER,  @p_status INTEGER OUTPUT, @p_err_msg VARCHAR(512) OUTPUT)

  as

	DECLARE @CursorVar CURSOR

	declare @columncursor CURSOR

	declare @count integer

	declare @i integer

	declare @pvname varchar(256)

	declare @adjname varchar(256)

	declare @ddlstr as varchar(8000)

	declare @idpi as int

	declare @innercount as int

	declare @j as int

  declare @columnname as varchar(256)

	declare @datatype as varchar(256)

	

	declare @pv VARCHAR(255)

  declare @newpiname VARCHAR(255)

  declare @piname VARCHAR(255)



  set @p_status = 0

  select TOP 1 @pv = pi1.nm_productview, @piname = bp.nm_name, @newpiname = bpnew.nm_name from t_pi pi1

  inner join t_pi pi2 on pi1.nm_productview = pi2.nm_productview

  inner join t_base_props bp on bp.id_prop = pi2.id_pi

  inner join t_base_props bpnew on bpnew.id_prop = pi1.id_pi

  where pi1.id_pi = @p_id_pi_type AND pi2.id_pi <> pi1.id_pi

  if LEN(@pv) > 0
  BEGIN

    SELECT @p_status = 1

    SELECT @p_err_msg = 'Product View ''' + @pv + ''' is shared between ''' +  @newpiname + ''' and ''' + @piname + '''';

    SELECT @p_err_msg = @p_err_msg + '. If ''' + @newpiname + ''' is adjustable, adjustment table will not be re-created.'; 

    return;

  END

	SET @CursorVar = CURSOR FORWARD_ONLY STATIC

	FOR

	select distinct(pv.nm_table_name),

	't_aj_' + substring(pv.nm_table_name,6,1000),

	t_pi.id_pi

	from 

	t_pi

	-- all of the product views references by priceable items

	INNER JOIN t_prod_view pv on pv.nm_name = t_pi.nm_productview

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

		-- drop the table if it exists

		select @ddlstr =  ('if exists (select * from dbo.sysobjects where id = object_id(''' + @adjname + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) drop table ' + @adjname)

		exec (@ddlstr)

		-- create the table

		set @columncursor = CURSOR FORWARD_ONLY STATIC

		for

		select prop.nm_column_name,prop.nm_data_type from t_charge 

		INNER JOIN t_prod_view_prop prop on prop.id_prod_view_prop = t_charge.id_amt_prop

			where id_pi = @idpi

		OPEN @columncursor

		set @innercount = @@cursor_rows

		select @j = 0,@ddlstr = 'create table ' + @adjname + ' (id_adjustment int'

		while (@j < @innercount) begin

			FETCH NEXT FROM @columncursor into @columnname,@datatype

			select @ddlstr = (@ddlstr + ', c_aj_' + right(@columnname,len(@columnname)-2) + ' ' + @datatype)

			select @j = @j+1

		end

		select @ddlstr = (@ddlstr + ')')

		exec (@ddlstr)

		CLOSE @columncursor

		DEALLOCATE @columncursor

	end

	CLOSE @CursorVar

	DEALLOCATE @CursorVar

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc ExecSpProcOnKind @kind as int,@id as int
				as
				declare @sprocname varchar(256)
				select @sprocname = nm_sprocname from t_principals where id_principal = @kind
				exec (@sprocname + ' ' + @id)
	 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


					create proc ExtendedUpsert(@table_name as varchar(100),
												 @update_list as varchar(8000),
												 @insert_list as varchar(8000),
												 @clist as varchar(8000),
												 @id_prop as int)
					as
					exec('update ' + @table_name + ' set ' + 
					@update_list + ' where ' + @table_name + '.id_prop = ' + @id_prop)
					if @@rowcount = 0 begin
						exec('insert into ' + @table_name + ' (id_prop,' + @clist + ') values( ' + @id_prop + ',' + @insert_list + ')')
					end
	 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE FailZombieRecurringEvents

(

  @dt_now DATETIME,          -- system's time

  @tx_machine VARCHAR(128),  -- macine to check for zombies on

  @count INT OUTPUT          -- number of zombies found and failed

)

AS



BEGIN



  BEGIN TRAN



  SELECT @count = 0



  DECLARE @zombies TABLE

  (

    id_instance INT NOT NULL,

    id_run INT NOT NULL

  )



  -- finds any zombie recurring events for the given machine

  INSERT INTO @zombies

  SELECT 

    inst.id_instance,

    run.id_run

  FROM t_recevent_inst inst

  LEFT OUTER JOIN

  (

    -- finds the last run's ID

    SELECT 

      id_instance,

    MAX(dt_start) dt_start

    FROM t_recevent_run run

    GROUP BY

      id_instance

  ) lastrun ON lastrun.id_instance = inst.id_instance

  LEFT OUTER JOIN t_recevent_run run ON run.dt_start = lastrun.dt_start

  WHERE 

    (inst.tx_status IN ('Running', 'Reversing') OR run.tx_status = 'InProgress') AND

    -- only look at runs which are being processed by the given machine

    -- in a multi-machine case, we don't want to fail valid runs

    -- being processed on a different machine

    run.tx_machine = @tx_machine



  SELECT @count = @@ROWCOUNT  



  -- fails the zombie instances

  UPDATE t_recevent_inst

  SET tx_status = 'Failed'

  FROM t_recevent_inst inst

  INNER JOIN @zombies zombies ON zombies.id_instance = inst.id_instance



  -- fails the zombie runs 

  UPDATE t_recevent_run

  SET tx_status = 'Failed', dt_end = @dt_now, tx_detail = 'Run was identified as a zombie'

  FROM t_recevent_run run

  INNER JOIN @zombies zombies ON zombies.id_run = run.id_run



  SELECT 

    id_instance InstanceID,

    id_run RunID

  FROM @zombies

  COMMIT

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure GenerateAdjustmentTables

as

	DECLARE @CursorVar CURSOR

	declare @columncursor CURSOR

	declare @count integer

	declare @i integer

	declare @pvname varchar(256)

	declare @adjname varchar(256)

	declare @ddlstr as varchar(8000)

	declare @idpi as int

	declare @innercount as int

	declare @j as int

	declare @columnname as varchar(256)

	declare @datatype as varchar(256)

	SET @CursorVar = CURSOR FORWARD_ONLY STATIC

	FOR

	select distinct(pv.nm_table_name),

	't_aj_' + substring(pv.nm_table_name,6,1000),

	t_pi.id_pi

	from 

	t_pi

	-- all of the product views references by priceable items

	INNER JOIN t_prod_view pv on pv.nm_name = t_pi.nm_productview

	-- BP changed next join to 'left outer' from 'inner'

	-- in order to support Amount adjustments for PIs that don't

	-- have any charges

	

	LEFT OUTER JOIN t_charge on t_charge.id_pi = t_pi.id_pi

	select @i = 0

	OPEN @CursorVar

	Set @count = @@cursor_rows

	while(@i < @count) begin

		select @i = @i + 1

		FETCH NEXT FROM @CursorVar into @pvname,@adjname,@idpi

		-- drop the table if it exists

		select @ddlstr =  ('if exists (select * from dbo.sysobjects where id = object_id(''' + @adjname + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) drop table ' + @adjname)

		exec (@ddlstr)

		-- create the table

		set @columncursor = CURSOR FORWARD_ONLY STATIC

		for

		select prop.nm_column_name,prop.nm_data_type from t_charge 

			INNER JOIN t_prod_view_prop prop on prop.id_prod_view_prop = t_charge.id_amt_prop

			where id_pi = @idpi

		OPEN @columncursor

		set @innercount = @@cursor_rows

		select @j = 0,@ddlstr = 'create table ' + @adjname + ' (id_adjustment int'

		while (@j < @innercount) begin

			FETCH NEXT FROM @columncursor into @columnname,@datatype

			select @ddlstr = (@ddlstr + ', c_aj_' + right(@columnname,len(@columnname)-2) + ' ' + @datatype)

			select @j = @j+1

		end

		select @ddlstr = (@ddlstr + ')')

		exec (@ddlstr)

		CLOSE @columncursor

		DEALLOCATE @columncursor

	end

	CLOSE @CursorVar

	DEALLOCATE @CursorVar

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



---------------------------------------------------------

-- returns all balances for account as of end of interval

-- return codes:

-- O = OK

-- 1 = currency mismatch

---------------------------------------------------------

CREATE PROCEDURE GetBalances( 

@id_acc int,

@id_interval int,

@previous_balance numeric(18, 6) OUTPUT,

@balance_forward numeric(18, 6) OUTPUT,

@current_balance numeric(18, 6) OUTPUT,

@currency nvarchar(3) OUTPUT,

@estimation_code int OUTPUT, -- 0 = NONE: no estimate, all balances taken from t_invoice

                             -- 1 = CURRENT_BALANCE: balance_forward and current_balance estimated, @previous_balance taken from t_invoice

                             -- 2 = PREVIOUS_BALANCE: all balances estimated 

@return_code int OUTPUT

)

AS

BEGIN

DECLARE

  @balance_date datetime,

  @unbilled_prior_charges numeric(18, 6), -- unbilled charges from interval after invoice and before this one

  @previous_charges numeric(18, 6),       -- payments, adjsutments for this interval

  @current_charges numeric(18, 6),        -- current charges for this interval

  @interval_start datetime,

  @tmp_amount numeric(18, 6),

  @tmp_currency nvarchar(3)



  SET @return_code = 0



  -- step1: check for existing t_invoice, and use that one if exists

  SELECT @current_balance = current_balance,

    @balance_forward = current_balance - invoice_amount - tax_ttl_amt,

    @previous_balance = @balance_forward - payment_ttl_amt - postbill_adj_ttl_amt - ar_adj_ttl_amt,

    @currency = invoice_currency

  FROM t_invoice

  WHERE id_acc = @id_acc

  AND id_interval = @id_interval

  

  IF NOT @current_balance IS NULL

    BEGIN

    SET @estimation_code = 0 

    RETURN --done

    END



  -- step2: get balance (as of @interval_start) from previous invoice

  --set @interval_start = (select dt_start from t_usage_interval where id_interval = @id_interval)



  -- AR: Bug fix for 10238, when billing cycle is changed.



  select @interval_start =

	CASE WHEN aui.dt_effective IS NULL THEN

		ui.dt_start

	     ELSE dateadd(s, 1, aui.dt_effective)

	END

  from t_acc_usage_interval aui

	inner join t_usage_interval ui on aui.id_usage_interval = ui.id_interval

	where aui.id_acc = @id_acc

	AND ui.id_interval = @id_interval



  exec GetLastBalance @id_acc, @interval_start, @previous_balance output, @balance_date output, @currency output



  -- step3: calc @unbilled_prior_charges

  set @unbilled_prior_charges = 0



  -- add unbilled payments, and ar adjustments

  SELECT @tmp_amount = SUM(au.Amount),

    @tmp_currency = au.am_currency

  FROM t_acc_usage au

   INNER JOIN t_prod_view pv on au.id_view = pv.id_view

   INNER JOIN t_acc_usage_interval aui on au.id_acc = aui.id_acc and au.id_usage_interval = aui.id_usage_interval

   INNER JOIN t_usage_interval ui on aui.id_usage_interval = ui.id_interval

  WHERE pv.nm_table_name in ('t_pv_Payment', 't_pv_ARAdjustment')

    AND au.id_acc = @id_acc

    AND ui.dt_end > @balance_date

    AND ui.dt_start < @interval_start

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END

  

  SET @tmp_amount = isnull(@tmp_amount, 0)

  SET @unbilled_prior_charges = @unbilled_prior_charges + @tmp_amount



  SET @tmp_amount = 0.0

  

  -- add unbilled current charges

  SELECT @tmp_amount = SUM(isnull(au.Amount, 0.0)) + SUM(isnull(au.Tax_Federal,0.0)) + SUM(isnull(au.Tax_State,0.0)) + SUM(isnull(au.Tax_County,0.0)) + SUM(isnull(au.Tax_Local,0.0)) + SUM(isnull(au.Tax_Other,0.0)),
    @tmp_currency = au.am_currency

  FROM t_acc_usage au

    inner join t_view_hierarchy vh on au.id_view = vh.id_view

    left outer join t_pi_template piTemplated2 on piTemplated2.id_template=au.id_pi_template

    left outer join t_base_props pi_type_props on pi_type_props.id_prop=piTemplated2.id_pi

    inner join t_enum_data enumd2 on au.id_view=enumd2.id_enum_data

    INNER JOIN t_acc_usage_interval aui on au.id_acc = aui.id_acc and au.id_usage_interval = aui.id_usage_interval

    INNER JOIN t_usage_interval ui on aui.id_usage_interval = ui.id_interval

  WHERE

    vh.id_view = vh.id_view_parent

    AND au.id_acc = @id_acc

    AND ((au.id_pi_template is null and au.id_parent_sess is null) or (au.id_pi_template is not null and piTemplated2.id_template_parent is null))

    AND (pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or upper(enumd2.nm_enum_data) NOT LIKE '%_TEMP')

    AND ui.dt_end > @balance_date

    AND ui.dt_start < @interval_start

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  SET @tmp_amount = isnull(@tmp_amount, 0)

  SET @unbilled_prior_charges = @unbilled_prior_charges + @tmp_amount



  -- add unbilled pre-bill and post-bill adjustments

  SET @unbilled_prior_charges = @unbilled_prior_charges + isnull(

    (SELECT SUM(PrebillAdjustmentAmount + PostbillAdjustmentAmount)

     FROM vw_adjustment_summary

     WHERE id_acc = @id_acc

     AND dt_end > @balance_date

     AND dt_start < @interval_start), 0)





  -- step4: add @unbilled_prior_charges to @previous_balance if any found

  IF @unbilled_prior_charges <> 0

    BEGIN

    SET @estimation_code = 2

    SET @previous_balance = @previous_balance + @unbilled_prior_charges

    END

  ELSE

    SET @estimation_code = 1



  -- step5: get previous charges

  SELECT

    @previous_charges = SUM(au.Amount),

    @tmp_currency = au.am_currency

  FROM t_acc_usage au

   INNER JOIN t_prod_view pv on au.id_view = pv.id_view

  WHERE pv.nm_table_name in ('t_pv_Payment', 't_pv_ARAdjustment')

  AND au.id_acc = @id_acc

  AND au.id_usage_interval = @id_interval

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  IF @previous_charges IS NULL

    SET @previous_charges = 0



  -- add post-bill adjustments

  SET @previous_charges = @previous_charges + isnull(

    (SELECT SUM(PostbillAdjustmentAmount) FROM vw_adjustment_summary

     WHERE id_acc = @id_acc AND id_usage_interval = @id_interval), 0)





  -- step6: get current charges

  SELECT

   @current_charges = SUM(isnull(au.Amount, 0.0)) + SUM(isnull(au.Tax_Federal,0.0)) + SUM(isnull(au.Tax_State,0.0)) + SUM(isnull(au.Tax_County,0.0)) + SUM(isnull(au.Tax_Local,0.0)) + SUM(isnull(au.Tax_Other,0.0)),

   @tmp_currency = au.am_currency

  FROM t_acc_usage au

    inner join t_view_hierarchy vh on au.id_view = vh.id_view

    left outer join t_pi_template piTemplated2 on piTemplated2.id_template=au.id_pi_template

    left outer join t_base_props pi_type_props on pi_type_props.id_prop=piTemplated2.id_pi

    inner join t_enum_data enumd2 on au.id_view=enumd2.id_enum_data

  WHERE

    vh.id_view = vh.id_view_parent

  AND au.id_acc = @id_acc

  AND ((au.id_pi_template is null and au.id_parent_sess is null) or (au.id_pi_template is not null and piTemplated2.id_template_parent is null))

  AND (pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or upper(enumd2.nm_enum_data) NOT LIKE '%_TEMP')

  AND au.id_usage_interval = @id_interval

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  IF @current_charges IS NULL

    SET @current_charges = 0



  -- add pre-bill adjustments

  SET @current_charges = @current_charges + isnull(

    (SELECT SUM(PrebillAdjustmentAmount) FROM vw_adjustment_summary

     WHERE id_acc = @id_acc AND id_usage_interval = @id_interval), 0)



  SET @balance_forward = @previous_balance + @previous_charges

  SET @current_balance = @balance_forward + @current_charges

END

     
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



---------------------------------------------------------

-- returns all balances for account as of end of interval

-- return codes:

-- O = OK

-- 1 = currency mismatch

---------------------------------------------------------

CREATE PROCEDURE GetBalances_Datamart( 

@id_acc int,

@id_interval int,

@previous_balance numeric(18, 6) OUTPUT,

@balance_forward numeric(18, 6) OUTPUT,

@current_balance numeric(18, 6) OUTPUT,

@currency nvarchar(3) OUTPUT,

@estimation_code int OUTPUT, -- 0 = NONE: no estimate, all balances taken from t_invoice

                             -- 1 = CURRENT_BALANCE: balance_forward and current_balance estimated, @previous_balance taken from t_invoice

                             -- 2 = PREVIOUS_BALANCE: all balances estimated 

@return_code int OUTPUT

)

AS

BEGIN

DECLARE

  @balance_date datetime,

  @unbilled_prior_charges numeric(18, 6), -- unbilled charges from interval after invoice and before this one

  @previous_charges numeric(18, 6),       -- payments, adjsutments for this interval

  @current_charges numeric(18, 6),        -- current charges for this interval

  @interval_start datetime,

  @tmp_amount numeric(18, 6),

  @tmp_currency nvarchar(3)



  SET @return_code = 0

  -- step1: check for existing t_invoice, and use that one if exists



  SELECT @current_balance = current_balance,

    @balance_forward = current_balance - invoice_amount - tax_ttl_amt,

    @previous_balance = @balance_forward - payment_ttl_amt - postbill_adj_ttl_amt - ar_adj_ttl_amt,

    @currency = invoice_currency

  FROM t_invoice

  WHERE id_acc = @id_acc

  AND id_interval = @id_interval



  IF NOT @current_balance IS NULL

    BEGIN

    SET @estimation_code = 0 

    RETURN --done

    END



  -- step2: get balance (as of @interval_start) from previous invoice

  --set @interval_start = (select dt_start from t_usage_interval where id_interval = @id_interval)

  -- AR: Bug fix for 10238, when billing cycle is changed.



  select @interval_start =

	CASE WHEN aui.dt_effective IS NULL THEN

		ui.dt_start

	     ELSE dateadd(s, 1, aui.dt_effective)

	END  from t_acc_usage_interval aui

	inner join t_usage_interval ui on aui.id_usage_interval = ui.id_interval

	where aui.id_acc = @id_acc

	AND ui.id_interval = @id_interval

  exec GetLastBalance @id_acc, @interval_start, @previous_balance output, @balance_date output, @currency output

  -- step3: calc @unbilled_prior_charges



  set @unbilled_prior_charges = 0

  -- add unbilled payments, and ar adjustments

  SELECT @tmp_amount = SUM(au.TotalAmount),

    @tmp_currency = au.am_currency

  FROM t_dm_payer_interval au

   INNER JOIN t_prod_view pv on au.id_view = pv.id_view

   INNER JOIN t_acc_usage_interval aui on au.id_acc = aui.id_acc and au.id_usage_interval = aui.id_usage_interval

   INNER JOIN t_usage_interval ui on aui.id_usage_interval = ui.id_interval

  WHERE pv.nm_table_name in ('t_pv_Payment', 't_pv_ARAdjustment')

    AND au.id_acc = @id_acc

    AND ui.dt_end > @balance_date

    AND ui.dt_start < @interval_start

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END

  

  SET @tmp_amount = isnull(@tmp_amount, 0)

  SET @unbilled_prior_charges = @unbilled_prior_charges + @tmp_amount

  SET @tmp_amount = 0.0

  -- add unbilled current charges

  SELECT @tmp_amount = SUM(isnull(au.TotalAmount, 0.0)) + SUM(isnull(au.TotalTax,0.0)),

    @tmp_currency = au.am_currency

  FROM t_dm_payer_interval au

    inner join t_view_hierarchy vh on au.id_view = vh.id_view

    left outer join t_pi_template piTemplated2 on piTemplated2.id_template=au.id_pi_template

    left outer join t_base_props pi_type_props on pi_type_props.id_prop=piTemplated2.id_pi

    inner join t_enum_data enumd2 on au.id_view=enumd2.id_enum_data

    INNER JOIN t_acc_usage_interval aui on au.id_acc = aui.id_acc and au.id_usage_interval = aui.id_usage_interval

    INNER JOIN t_usage_interval ui on aui.id_usage_interval = ui.id_interval

  WHERE

    vh.id_view = vh.id_view_parent

    AND au.id_acc = @id_acc

--    AND ((au.id_pi_template is null and au.id_parent_sess is null) or (au.id_pi_template is not null and piTemplated2.id_template_parent is null))

    AND (pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or upper(enumd2.nm_enum_data) NOT LIKE '%_TEMP')

    AND ui.dt_end > @balance_date

    AND ui.dt_start < @interval_start

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  SET @tmp_amount = isnull(@tmp_amount, 0)

  SET @unbilled_prior_charges = @unbilled_prior_charges + @tmp_amount



  -- add unbilled pre-bill and post-bill adjustments

  SET @unbilled_prior_charges = @unbilled_prior_charges + isnull(

    (SELECT SUM(PrebillAdjustmentAmount + PostbillAdjustmentAmount)

     FROM vw_adjustment_summary_datamart

     WHERE id_acc = @id_acc

     AND dt_end > @balance_date

     AND dt_start < @interval_start), 0)





  -- step4: add @unbilled_prior_charges to @previous_balance if any found
  IF @unbilled_prior_charges <> 0

    BEGIN

    SET @estimation_code = 2

    SET @previous_balance = @previous_balance + @unbilled_prior_charges

    END

  ELSE

    SET @estimation_code = 1



  -- step5: get previous charges

  SELECT

    @previous_charges = SUM(au.TotalAmount),

    @tmp_currency = au.am_currency

  FROM t_dm_payer_interval au

   INNER JOIN t_prod_view pv on au.id_view = pv.id_view

  WHERE pv.nm_table_name in ('t_pv_Payment', 't_pv_ARAdjustment')

  AND au.id_acc = @id_acc

  AND au.id_usage_interval = @id_interval

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  IF @previous_charges IS NULL

    SET @previous_charges = 0



  -- add post-bill adjustments

  SET @previous_charges = @previous_charges + isnull(

    (SELECT SUM(PostbillAdjustmentAmount) FROM vw_adjustment_summary_datamart

     WHERE id_acc = @id_acc AND id_usage_interval = @id_interval), 0)





  -- step6: get current charges

  SELECT

   @current_charges = SUM(isnull(au.TotalAmount, 0.0)) + SUM(isnull(au.TotalTax,0.0)),

   @tmp_currency = au.am_currency

  FROM t_dm_payer_interval au

    inner join t_view_hierarchy vh on au.id_view = vh.id_view

    left outer join t_pi_template piTemplated2 on piTemplated2.id_template=au.id_pi_template

    left outer join t_base_props pi_type_props on pi_type_props.id_prop=piTemplated2.id_pi

    inner join t_enum_data enumd2 on au.id_view=enumd2.id_enum_data

  WHERE

    vh.id_view = vh.id_view_parent

  AND au.id_acc = @id_acc

--  AND ((au.id_pi_template is null and au.id_parent_sess is null) or (au.id_pi_template is not null and piTemplated2.id_template_parent is null))

  AND (pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or upper(enumd2.nm_enum_data) NOT LIKE '%_TEMP')

  AND au.id_usage_interval = @id_interval

  GROUP BY au.am_currency



  IF @@ROWCOUNT > 1 OR (@@ROWCOUNT = 1 AND @tmp_currency <> @currency)

  BEGIN

    SET @return_code = 1 -- currency mismatch

    RETURN 1

  END



  IF @current_charges IS NULL

    SET @current_charges = 0



  -- add pre-bill adjustments

  SET @current_charges = @current_charges + isnull(

    (SELECT SUM(PrebillAdjustmentAmount) FROM vw_adjustment_summary_datamart

     WHERE id_acc = @id_acc AND id_usage_interval = @id_interval), 0)



  SET @balance_forward = @previous_balance + @previous_charges

  SET @current_balance = @balance_forward + @current_charges

END

    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			 	CREATE PROC GetCurrentID @nm_current nvarchar(20), @id_current int OUTPUT
        as 
        begin tran 
        select @id_current = id_current from t_current_id 
          where nm_current = @nm_current 
        update t_current_id set id_current = id_current + 1 
          where nm_current = @nm_current 
				if ((@@error != 0) OR (@@rowCount != 1)) 
        begin 
          select @id_current = -99
				  rollback transaction 
        end 
        else 
        begin 
				  commit transaction 
        end 
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			

CREATE  PROCEDURE GetDatabaseVersionInfo

(

  @DatabaseVersionInfo VARCHAR(4096) OUTPUT

)

AS

BEGIN

  -- This stored procedure returns a text string that represents version and other information about the database server.

  -- It is only displayed to the user and so the text string can be modified or added to as necessary

  DECLARE @temp_info VARCHAR(2048)

  DECLARE @inferred_info VARCHAR(2048)



  -- gets the version of the database

  SELECT @temp_info =@@VERSION



  SELECT @inferred_info=

    CASE

      WHEN CHARINDEX('8.00.194', @temp_info) <> 0 THEN '*8.00.194 indicates no SQL Server 2000 Service Pack has been applied'

      WHEN CHARINDEX('8.00.384', @temp_info) <> 0 THEN '*8.00.384 indicates SQL Server 2000 Service Pack 1 applied'

      WHEN CHARINDEX('8.00.534', @temp_info) <> 0 THEN '*8.00.534 indicates SQL Server 2000 Service Pack 2 applied'

      WHEN CHARINDEX('8.00.760', @temp_info) <> 0 THEN '*8.00.760 indicates SQL Server 2000 Service Pack 3 applied'

      WHEN CHARINDEX('8.00.818', @temp_info) <> 0 THEN '*8.00.818 indicates SQL Server 2000 Service Pack 3a and Hotfix Q815495 applied'

      ELSE '*Unable to determine from version number what SQL Server 2000 Service Packs have been applied'

    END



  SELECT @DatabaseVersionInfo = @temp_info + @inferred_info

END

			
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

		Create Procedure GetIdBlock @block_size int, @sequence_name nvarchar(20), @block_start int OUTPUT 

    as

    begin

      SELECT @block_start = id_current FROM t_current_id WITH(UPDLOCK) WHERE nm_current = @sequence_name 

      UPDATE t_current_id SET id_current=id_current+@block_size where nm_current=@sequence_name

    end

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



---------------------------------------------------------

-- gets last calculated balance for an account

-- or latest calculated balance based on a cut-off date

---------------------------------------------------------

CREATE PROCEDURE GetLastBalance( 

@id_acc int,                    -- account

@before_date datetime,          -- last balance before this date, can be NULL

@balance numeric(18, 6) OUTPUT, -- the balance

@balance_date datetime OUTPUT,  -- the date the balance was computed

@currency nvarchar(3) OUTPUT     -- currency for account

)

AS

BEGIN



  SELECT TOP 1 @balance = inv.current_balance,

    @balance_date = ui.dt_end,

    @currency = inv.invoice_currency

  FROM t_invoice inv

  JOIN t_usage_interval ui ON ui.id_interval = inv.id_interval

  WHERE id_acc = @id_acc

    AND (@before_date IS NULL OR ui.dt_end < @before_date)

  ORDER BY ui.dt_end DESC



  IF @balance IS NULL

    BEGIN

    SET @balance = 0

    SET @currency = (select c_currency from t_av_internal where id_acc = @id_acc)

    SET @balance_date = '1900-01-01'

    END

END

     
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


          CREATE PROC GetLocalizedSiteInfo @nm_space nvarchar(40), 
            @tx_lang_code varchar(10), @id_site int OUTPUT
          as
          if not exists (select * from t_localized_site where 
            nm_space = @nm_space and tx_lang_code = @tx_lang_code) 
          begin 
            insert into t_localized_site (nm_space, tx_lang_code) 
              values (@nm_space, @tx_lang_code)
            if ((@@error != 0) OR (@@rowcount != 1)) 
            begin
              select @id_site = -99
            end 
            else 
            begin 
              select @id_site = @@identity 
            end 
          end 
          else 
          begin 
            select @id_site = id_site from t_localized_site 
              where nm_space = @nm_space and tx_lang_code = @tx_lang_code 
          end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			CREATE PROCEDURE GetMetaDataForProps
			@tableName varchar(200),
			@columnName varchar(200) = null
			AS

			declare @sql varchar(1000)


			SET @sql = 'SELECT so.name name, systypes.name type, so.prec length,  (case so.isnullable WHEN 0 THEN ''TRUE''  WHEN 1 THEN ''FALSE''  END ) AS required,  '
			SET @sql = @sql + '(SELECT count(si.name) from syscolumns si inner join sysobjects on si.id = sysobjects.id where si.name like (so.name+''' +'_op' +''') AND sysobjects.name = ' +'''' +@tableName  +''') As isRowType'
			SET @sql = @sql + '  from syscolumns so inner join sysobjects on so.id = sysobjects.id inner join systypes on systypes.xtype = so.xtype and systypes.xusertype = so.xusertype where '
			SET @sql = @sql + ' sysobjects.name = ' +'''' +@tableName +''''

			IF (@columnName is not null)
			BEGIN
				SET @sql = @sql + ' AND so.name = ' +'''' +@columnName +''''
			END

			exec (@sql)
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create proc GetPCViewHierarchy(@id_acc as int,

					@id_interval as int,

					@id_lang_code as int)

				as

				select 

				tb_po.n_display_name id_po,-- use the display name as the product offering ID

				--au.id_prod id_po,

				pi_template.id_template_parent id_template_parent,

				--po_nm_name = case when t_description.tx_desc is NULL then template_desc.tx_desc else t_description.tx_desc end,

				po_nm_name = case when t_description.tx_desc is NULL then template_desc.tx_desc else t_description.tx_desc end,

				ed.nm_enum_data pv_child,

				ed.id_enum_data pv_childID,

				pv_parentID = case when parent_kind.nm_productview is NULL then tb_po.n_display_name else tenum_parent.id_enum_data end,

				AggRate = case when pi_props.n_kind = 15 then 'Y' else 'N' end,

				viewID = case when au.id_pi_instance is NULL then id_view else 

					(select viewID = case when pi_props.n_kind = 15 AND child_kind.nm_productview = ed.nm_enum_data then

					-(au.id_pi_instance + 0x40000000)

					else

					-au.id_pi_instance 

					end)

				end,

				id_view realPVID,

				--ViewName = case when tb_instance.nm_display_name is NULL then tb_template.nm_display_name else tb_instance.nm_display_name end,

				ViewName = case when tb_instance.nm_display_name is NULL then tb_template.nm_display_name else tb_instance.nm_display_name end,

				'Product' ViewType,

				--id_view DescriptionID,

				DescriptionID = case when t_description.tx_desc is NULL then template_props.n_display_name else id_view end,

				sum(au.amount) 'Amount',

				count(au.id_sess) 'Count',

				au.am_currency 'Currency', sum((isnull((au.tax_federal), 

				0.0) + isnull((au.tax_state), 0.0) + isnull((au.tax_county), 0.0) + 

				isnull((au.tax_local), 0.0) + isnull((au.tax_other), 0.0))) TaxAmount, 

				sum(au.amount + (isnull((au.tax_federal), 0.0) + isnull((au.tax_state), 0.0) + 

				isnull((au.tax_county), 0.0) + isnull((au.tax_local), 0.0) + 

				isnull((au.tax_other), 0.0))) AmountWithTax

				from t_usage_interval

				JOIN t_acc_usage au on au.id_acc = @id_acc AND au.id_usage_interval = @id_interval AND au.id_pi_template is not NULL

				JOIN t_base_props tb_template on tb_template.id_prop = au.id_pi_template

				JOIN t_pi_template pi_template on pi_template.id_template = au.id_pi_template

				JOIN t_pi child_kind on child_kind.id_pi = pi_template.id_pi

				JOIN t_base_props pi_props on pi_props.id_prop = child_kind.id_pi

				JOIN t_enum_data ed on ed.id_enum_data = au.id_view

				JOIN t_base_props template_props on pi_template.id_template = template_props.id_prop

				JOIN t_description template_desc on template_props.n_display_name = template_desc.id_desc AND template_desc.id_lang_code = @id_lang_code

				LEFT OUTER JOIN t_pi_template parent_template on parent_template.id_template = pi_template.id_template_parent

				LEFT OUTER JOIN t_pi parent_kind on parent_kind.id_pi = parent_template.id_pi

				LEFT OUTER JOIN t_enum_data tenum_parent on tenum_parent.nm_enum_data = parent_kind.nm_productview

				LEFT OUTER JOIN t_base_props tb_po on tb_po.id_prop = au.id_prod

				LEFT OUTER JOIN t_base_props tb_instance on tb_instance.id_prop = au.id_pi_instance 

				LEFT OUTER JOIN t_description on t_description.id_desc = tb_po.n_display_name AND t_description.id_lang_code = @id_lang_code

				where

				t_usage_interval.id_interval = @id_interval

				GROUP BY 

				--t_pl_map.id_po,t_pl_map.id_pi_instance_parent,

				tb_po.n_display_name,tb_instance.n_display_name,

				t_description.tx_desc,template_desc.tx_desc,

				tb_instance.nm_display_name,tb_template.nm_display_name,

				tb_instance.nm_display_name, -- this shouldn't need to be here!!

				child_kind.nm_productview,

				parent_kind.nm_productview,tenum_parent.id_enum_data,

				pi_props.n_kind,

				id_view,ed.nm_enum_data,ed.id_enum_data,

				au.am_currency,

				tb_template.nm_name,

				pi_template.id_template_parent,

				au.id_pi_instance,

				template_props.n_display_name

				ORDER BY tb_po.n_display_name ASC, pi_template.id_template_parent ASC

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					create proc GetRateSchedules @id_acc as int,

					@acc_cycle_id as int,

					@default_pl as int,

					@RecordDate as datetime,

					@id_pi_template as int

					as



						-- real stored procedure code starts here



						-- only count rows on the final select.

						SET NOCOUNT ON



						declare @winner_type as int

						declare @winner_row as int

						declare @winner_begin as datetime

						-- Don't actually need the @winner end since it is not used

						-- to test overlapping effective dates



						declare @CursorVar CURSOR

						declare @count as int

						declare @i as int

						set @i = 0



						declare @tempID as int

						declare @tempStartType as int

						declare @temp_begin as datetime

						declare @temp_b_offset as int

						declare @tempEndType as int

						declare @temp_end as datetime

						declare @temp_e_offset as int



						declare @sub_begin as datetime

						declare @sub_end as datetime



						-- unused stuff until temporary table insertion

						declare @id_sched as int

						declare @dt_mod as datetime

						declare @id_po as int

						declare @id_paramtable as int

						declare @id_pricelist as int

						declare @id_sub as int

						declare @id_pi_instance as int



						declare @currentptable as int

						declare @currentpo as int

						declare @currentsub as int



						-- winner variables

						declare @win_id_sched as int

						declare @win_dt_mod as datetime

						declare @win_id_paramtable as int

						declare @win_id_pricelist as int

						declare @win_id_sub as int

						declare @win_id_po as int

						declare @win_id_pi_instance as int



						declare @TempEff table (id_sched int not null,

							dt_modified datetime not null,

							id_paramtable int not null,

							id_pricelist int not null,

							id_sub int null,

							id_po int null,

							id_pi_instance int null)





						-- declare our cursor. Is there anything special here for performance around STATIC vs. DYNAMIC?

						set @CursorVar = CURSOR STATIC

							 FOR 

								-- this query is pretty tricky.  It is the union of all of the possible rate schedules

								-- on the resolved product offering AND the intersection of the 

								-- default account pricelist and parameter tables for the priceable item type.

								select

								t_rsched.id_sched,t_rsched.dt_mod,

								tm.id_po,tm.id_pi_instance,tm.id_paramtable, tm.id_pricelist,tm.id_sub

								,te.n_begintype,te.dt_start, te.n_beginoffset,te.n_endtype,te.dt_end,te.n_endoffset

								,t_sub.vt_start dt_start,t_sub.vt_end dt_end

								from t_pl_map tm

								INNER JOIN t_sub on t_sub.id_acc= @id_acc

								INNER JOIN t_rsched on t_rsched.id_pricelist = tm.id_pricelist AND t_rsched.id_pt =tm.id_paramtable AND

								t_rsched.id_pi_template = @id_pi_template

								INNER JOIN t_effectivedate te on te.id_eff_date = t_rsched.id_eff_date

								where tm.id_po = t_sub.id_po and tm.id_pi_template = @id_pi_template 

								and (tm.id_acc = @id_acc or tm.id_sub is null)

								-- make sure that subscription is currently in effect

								AND (t_sub.vt_start <= @RecordDate AND @RecordDate <= t_sub.vt_end)

								UNION ALL

								select tr.id_sched,tr.dt_mod,

								NULL,NULL,map.id_pt,@default_pl,NULL,

								te.n_begintype,te.dt_start,te.n_beginoffset,te.n_endtype,te.dt_end,te.n_endoffset

								,NULL,NULL

								from t_rsched tr

								INNER JOIN t_effectivedate te ON te.id_eff_date = tr.id_eff_date

								-- throw out any default account pricelist rate schedules that use subscription relative effective dates

								AND te.n_begintype <> 2

								-- XXX fix this by passing in the instance ID

								INNER JOIN t_pi_template on id_template = @id_pi_template

								INNER JOIN t_pi_rulesetdef_map map ON map.id_pi = t_pi_template.id_pi

								where tr.id_pt = map.id_pt AND tr.id_pricelist = @default_pl AND tr.id_pi_template = @id_pi_template

								-- the ordering is very important.  The following algorithm depends on the fact

								-- that ICB rates will show up first (rows that don't have a NULL subscription value),

								-- normal product offering rates next, and thirdly the default account pricelist rate schedules

								order by tm.id_paramtable,tm.id_sub desc,tm.id_po desc



						OPEN @CursorVar

						select @count = @@cursor_rows



						while @i < @count begin

							FETCH NEXT FROM @CursorVar into 

								-- rate schedule stuff

								@id_sched,@dt_mod

								-- plmap

								,@id_po,@id_pi_instance,@id_paramtable,@id_pricelist,@id_sub

								-- effectivedate rate schedule

								,@tempStartType,@temp_begin,@temp_b_offset,@tempEndType,@temp_end,@temp_e_offset

								-- effective date from subscription

								,@sub_begin,@sub_end



							set @i = (select @i + 1)



							if(@currentptable IS NULL) begin

								set @currentptable = @id_paramtable

								set @currentpo = @id_po

								set @currentsub = @id_sub

							end

							else if(@currentpTable != @id_paramtable

									 OR -- completely new parameter table

									@currentsub != IsNull(@id_sub,-1) OR -- ICB rates

									@currentpo != IsNull(@id_po,-1) -- default account PL

								) begin



								if @winner_row IS NOT NULL begin

									

									-- insert winner record into table variable

									insert into @TempEff values (@win_id_sched,@win_dt_mod,@win_id_paramtable,

									@win_id_pricelist,@win_id_sub,@win_id_po,@win_id_pi_instance)

								end

								-- clear out winner values

								set @winner_type = NULL

								set @winner_row = NULL

								set @winner_begin = NULL

							end

							-- set our current parametertable

							set @currentpTable = @id_paramtable

							set @currentpo = @id_po

							set @currentsub = @id_sub



							-- step : convert non absolute dates into absolute dates.  Only have to 

							-- deal with subscription relative and usage cycle relative



							-- subscription relative.  Add the offset of the rate schedule effective date to the

							-- start date of the subscription.  This code assumes that subscription effective dates

							-- are absolute or have already been normalized

							

							if(@tempStartType = 2) begin

								set @temp_begin = @sub_begin + @temp_b_offset

							end

							if(@tempEndType = 2) begin

								set @temp_end = dbo.MTEndOfDay(@temp_e_offset + @sub_begin)

							end





							-- usage cycle relative

							-- The following query will only return a result if both the beginning 

							-- and the end start dates are somewhere in the past.  We find the date by

							-- finding the interval where our date lies and adding 1 second the end of that 

							-- interval to give us the start of the next.  If the startdate query returns NULL,

							-- we can simply reject the result since the effective date is in the future.  It is 

							-- OK for the enddate to be NULL.  Note: We expect that we will always be able to find

							-- an old interval in t_usage_interval and DO NOT handle purged records

							

							if(@tempStartType = 3) begin

								set @temp_begin = dbo.NextDateAfterBillingCycle(@id_acc,@temp_begin)

								if(@temp_begin IS NULL) begin

									-- restart to the beginning of the while loop

									continue

								end

							end

							if(@tempEndType = 3) begin

								set @temp_end = dbo.NextDateAfterBillingCycle(@id_acc,@temp_end)

							end



							-- step : perform date range check

							if( @RecordDate >= IsNull(@temp_begin,@RecordDate) AND @RecordDate <= IsNull(@temp_end,@RecordDate)) begin

								-- step : check if there is an existing winner



								-- if no winner always populate

								if( (@winner_row IS NULL) OR

									-- start into the complicated winner logic used when there are multiple

									-- effective dates that apply.  The winner is the effective date with the latest

									-- start date



									-- Anything overrides a NULL start date

									(@tempStartType != 4 AND @winner_type = 4) OR

									-- subscription relative overrides anything else

									(@winner_type != 2 AND @tempStartType = 2) OR

									-- check for duplicate subscription relative, pick one with latest start date

									(@winner_type = 2 AND @tempStartType = 2 AND @winner_begin < @temp_begin) OR

									-- check if usage cycle or absolute, treat as equal

									((@winner_type = 1 OR @winner_type = 3) AND (@tempStartType = 1 OR @tempStartType = 3) 

									AND @winner_begin < @temp_begin)

									) -- end if

								begin

									set @winner_type = @tempStartType

									set @winner_row = @i

									set @winner_begin = @temp_begin



									set @win_id_sched = @id_sched

									set @win_dt_mod = @dt_mod

									set @win_id_paramtable = @id_paramtable

									set @win_id_pricelist =@id_pricelist

									set @win_id_sub =@id_sub

									set @win_id_po = @id_po

									set @win_id_pi_instance = @id_pi_instance

								end

							end

						end



						-- step : Dump the last remaining winner into the temporary table

						if @winner_row IS NOT NULL begin

							insert into @TempEff values (@win_id_sched,@win_dt_mod,@win_id_paramtable,

							@win_id_pricelist,@win_id_sub,@win_id_po,@win_id_pi_instance)

						end



						CLOSE @CursorVar

						DEALLOCATE @CursorVar



						-- step : if we have any results, get the results from the temp table

						SET NOCOUNT OFF

						select * from @TempEff

	 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						CREATE PROCEDURE GrantAllCapabilityToAccount

						(@aLoginName NVARCHAR(255), @aNameSpace NVARCHAR(255)) 

						as

						

						declare @polID INT

						declare @dummy int

            declare @aAccountID INT

        			begin

              SELECT @aAccountID = id_acc FROM t_account_mapper WHERE nm_login = @aLoginName AND nm_space = @aNameSpace

              IF @aAccountID IS NULL

              BEGIN

                RAISERROR('No Records found in t_account_mapper for Login Name %s and NameSpace %s', 16, 2, @aLoginName,  @aNameSpace)

              END

							SELECT @polID  = id_policy FROM T_PRINCIPAL_POLICY WHERE id_acc = @aAccountID AND policy_type = 'A'

							if (@polID is null)

								begin

								exec sp_Insertpolicy 'id_acc', @aAccountID, 'A', @polID output

								end

							end

							begin

							SELECT @dummy = id_policy FROM T_CAPABILITY_INSTANCE WHERE id_policy = @polID

							if (@dummy is null)

								begin		         

								INSERT INTO T_CAPABILITY_INSTANCE(tx_guid,id_parent_cap_instance,id_policy,id_cap_type) 

								SELECT cast('ABCD' as varbinary(16)), NULL,@polID,id_cap_type FROM T_COMPOSITE_CAPABILITY_TYPE WHERE 

								tx_name = 'Unlimited Capability'

								end

							end

				 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



      CREATE PROCEDURE HardCloseUsageIntervals

        (

          @dt_now nvarchar(30),     -- Metratime with millisecond granularity

          @id_interval INT,     -- specific usage interval to close or null for automatic detection based on grace periods

          @n_count INT OUTPUT   -- the number of usage intervals hard closed 

         )

      AS

      --not using metratime now, need to use metratime in all session state queries.

      Begin

      set @n_count = 0

      BEGIN TRAN

          UPDATE t_usage_interval SET tx_interval_status = 'H'

				  FROM t_usage_interval ui 

          WHERE 

            ui.id_interval = @id_interval AND

            ui.tx_interval_status <> 'H'

            set @n_count = @@rowcount

          

          IF @n_count = 1

          BEGIN

            SELECT  tx_uid INTO #UID_LIST 

            from t_acc_usage

            WHERE id_usage_interval = @id_interval

            

            UPDATE t_session_state

            SET dt_end = cast(@dt_now as datetime)

            FROM t_session_state ss

              INNER JOIN #UID_LIST list

              ON ss.id_sess = list.tx_uid

              WHERE ss.dt_end = dbo.MTMaxDate()

              AND ss.tx_state = 'S'



            INSERT INTO t_session_state (id_sess, dt_start, dt_end, tx_state)

            SELECT list.tx_uid, cast(@dt_now as datetime), dbo.MTMaxDate(), 'H'

            FROM #UID_LIST list

                        

            drop table #UID_LIST

          END    

    COMMIT

    return @n_count

    End

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				 CREATE PROC InsertAcctToIntervalMapping @id_acc int, @id_interval int
         as 
				 SET NOCOUNT ON
				 if not exists (select * from t_acc_usage_interval where id_acc = @id_acc 
          and id_usage_interval = @id_interval) 
				 begin 
          insert into t_acc_usage_interval (id_acc, id_usage_interval, tx_status) 
            values (@id_acc, @id_interval, 'O') 
         end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		  create proc InsertAcctUsageWithUID @tx_UID varbinary(16), 
			@id_acc int, @id_view int, @id_usage_interval int, @uid_parent_sess varbinary(16), 
			@id_svc int, @dt_session datetime, @amount numeric(18,6), @am_currency nvarchar(3), 
			@tax_federal numeric(18,6), @tax_state numeric(18,6), @tax_county numeric(18,6), 
			@tax_local numeric(18,6), @tax_other numeric(18,6), @tx_batch varbinary(16), 
		@id_prod int, @id_pi_instance int, @id_pi_template int,
		@id_sess int OUTPUT as
		  declare @id_parent_sess int
  
		  select @id_parent_sess = -1
			select @id_parent_sess = id_sess from t_acc_usage 
			where tx_UID = @uid_parent_sess
		  if (@id_parent_sess = -1)	begin	select @id_sess = -99	end
		  else
		  begin 
		  select @id_sess = id_current from t_current_id where nm_current='id_sess' 
		  update t_current_id set id_current = id_current + 1 where nm_current='id_sess'
		  insert into t_acc_usage (id_sess, tx_UID, id_acc, id_view, id_usage_interval, 
			id_parent_sess, id_svc, dt_session, amount, am_currency, tax_federal, tax_state, 
			tax_county, tax_local, tax_other, tx_batch, id_prod, id_pi_instance, id_pi_template) 
		  values 
			(@id_sess, @tx_UID, @id_acc, @id_view, @id_usage_interval, @id_parent_sess, @id_svc, @dt_session, 
			@amount, @am_currency, @tax_federal, @tax_state, @tax_county, @tax_local, @tax_other, @tx_batch,
		@id_prod, @id_pi_instance, @id_pi_template)
		  if ((@@error != 0) OR (@@rowcount <> 1))
		  begin 
			select @id_sess = -99 
		  end 
		  end
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


 	create proc InsertAuditEvent @id_userid int, @id_event int, @id_entity_type int, @id_entity int, @dt_timestamp datetime, @id_audit int, @tx_details nvarchar(4000) as
 	begin
 		insert into t_audit values(@id_audit, @id_event, @id_userid, @id_entity_type, @id_entity, @dt_timestamp)
  		if (@tx_details is not null) and (@tx_details != '')
  		begin
  			insert into t_audit_details values(@id_audit,@tx_details)
  		end
 	end
   
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		create proc InsertBaseProps 
			@id_lang_code int,
			@a_kind int,
			@a_approved char(1),
			@a_archive char(1),
			@a_nm_name NVARCHAR(255),
			@a_nm_desc NVARCHAR(255),
			@a_nm_display_name NVARCHAR(255),
			@a_id_prop int OUTPUT 
		AS
		begin
		  declare @id_desc_display_name int
      declare @id_desc_name int
      declare @id_desc_desc int
			exec UpsertDescription @id_lang_code, @a_nm_display_name, NULL, @id_desc_display_name output
			exec UpsertDescription @id_lang_code, @a_nm_name, NULL, @id_desc_name output
			exec UpsertDescription @id_lang_code, @a_nm_desc, NULL, @id_desc_desc output
			insert into t_base_props (n_kind, n_name, n_desc,nm_name,nm_desc,b_approved,b_archive,
			n_display_name, nm_display_name) values
			(@a_kind, @id_desc_name, @id_desc_desc, @a_nm_name,@a_nm_desc,@a_approved,@a_archive,
			 @id_desc_display_name,@a_nm_display_name)
			select @a_id_prop =@@identity
	   end
   
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create proc InsertChargeProperty

			@a_id_charge int,

			@a_id_prod_view_prop int,

			@a_id_charge_prop int OUTPUT

			as

			insert into t_charge_prop

      (

			id_charge,

			id_prod_view_prop

      )

      values

      (

			@a_id_charge,

			@a_id_prod_view_prop

      )

			select @a_id_charge_prop =@@identity

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


       create proc InsertDefaultTariff
       as 
       declare @id int
       select @id = id_enum_data from t_enum_data where 
          nm_enum_data = 'metratech.com/tariffs/TariffID/Default'
       insert into t_tariff (id_enum_tariff, tx_currency) values (@id, N'USD')
			 select @id = id_enum_data from t_enum_data where
					nm_enum_data = 'metratech.com/tariffs/TariffID/ConferenceExpress'
				insert into t_tariff(id_enum_tariff,tx_currency) values (@id, N'USD')
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				CREATE PROC InsertEnumData	@nm_enum_data nvarchar(255), 
											@id_enum_data int OUTPUT 
				as
				begin tran 

				if not exists (select * from t_enum_data where nm_enum_data = @nm_enum_data ) 
				begin 
					insert into t_mt_id default values
					select @id_enum_data = @@identity

					insert into t_enum_data (nm_enum_data, id_enum_data) values ( @nm_enum_data, @id_enum_data )
					if ((@@error != 0) OR (@@rowCount != 1)) 
					begin
						rollback transaction 
						select @id_enum_data = -99  
					end 
				end 
				else 
				begin 
					select @id_enum_data = id_enum_data from t_enum_data 
					where nm_enum_data = @nm_enum_data
				end 
				commit transaction
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			CREATE PROCEDURE InsertIntoQueryLog 
			@groupid varchar(50),
			@viewid int,
			@old_schema nvarchar(4000),
			@query nvarchar(4000)
			AS

			INSERT INTO t_query_log (c_groupid, c_id_view, c_old_schema, c_query) values(@groupid, @viewid, @old_schema, @query)
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			CREATE proc InsertMeteredBatch (
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
	
					select @id_batch = @@identity
				END	
				ELSE
				BEGIN
				  -- MTBATCH_BATCH_ALREADY_EXISTS ((DWORD)0xE4020001L)
				  SELECT @id_batch = -469630975
				END	
			END
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create proc InsertProductView

			@a_id_view int,

			@a_nm_name nvarchar(255),

			@a_dt_modified datetime,

			@a_nm_table_name nvarchar(255),

			@a_id_prod_view int OUTPUT

			as

      insert into t_prod_view

      (

			id_view,

			dt_modified,

			nm_name,

			nm_table_name

      )

      values

      (

			@a_id_view,

			@a_dt_modified,

			@a_nm_name,

			@a_nm_table_name

      )

			select @a_id_prod_view =@@identity

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc InsertProductViewProperty 
			@a_id_prod_view int,
			@a_nm_name nvarchar(255),
			@a_nm_data_type nvarchar(255),
			@a_nm_column_name nvarchar(255),
			@a_b_required char(1),
			@a_b_composite_idx char(1),
			@a_b_single_idx char(1),
      @a_b_part_of_key char(1),
      @a_b_exportable char(1),
      @a_b_filterable char(1),
      @a_b_user_visible char(1),
			@a_nm_default_value nvarchar(255),
			@a_n_prop_type int,
			@a_nm_space nvarchar(255),
			@a_nm_enum nvarchar(255),
      @a_b_core char(1),
			@a_id_prod_view_prop int OUTPUT
			as
      insert into t_prod_view_prop 
      (
			id_prod_view,
			nm_name,
			nm_data_type,
			nm_column_name,
			b_required,
			b_composite_idx,
			b_single_idx,
      b_part_of_key,
      b_exportable,
      b_filterable,
      b_user_visible,
			nm_default_value,
			n_prop_type,
			nm_space,
			nm_enum,
      b_core
      )
      values
      (
			@a_id_prod_view,
			@a_nm_name,
			@a_nm_data_type,
			@a_nm_column_name,
			@a_b_required,
			@a_b_composite_idx,
			@a_b_single_idx,
      @a_b_part_of_key,
      @a_b_exportable,
      @a_b_filterable,
      @a_b_user_visible,
			@a_nm_default_value,
			@a_n_prop_type,
			@a_nm_space,
			@a_nm_enum,
      @a_b_core
      )
			select @a_id_prod_view_prop =@@identity
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				create proc InsertUsageCycleInfo @id_cycle_type int, @dom int, 
          @period_type char(1), @id_usage_cycle int OUTPUT
				as 
        insert into t_usage_cycle (id_cycle_type, day_of_month, tx_period_type) 
          values (@id_cycle_type, @dom, @period_type) 
        if ((@@error != 0) OR (@@rowcount != 1)) 
        begin
          select @id_usage_cycle = -99 
        end 
        else 
        begin 
          select @id_usage_cycle = @@identity 
        end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			 create proc InsertUsageIntervalInfo @dt_start datetime, @dt_end datetime,@id_usage_cycle int, @id_usage_interval int OUTPUT
			 as 
			 select @id_usage_interval = id_interval from t_pc_interval where id_cycle = @id_usage_cycle
			 and dt_start=@dt_start and dt_end=@dt_end

			 insert into t_usage_interval (id_interval, dt_start, dt_end, 
			 id_usage_cycle, tx_interval_status) 
			   values (@id_usage_interval, @dt_start, @dt_end,@id_usage_cycle, 'O') 
			 if ((@@error != 0) OR (@@rowcount != 1)) 
			 begin 
			   select @id_usage_interval = -99 
			 end 
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE InstantiateScheduledEvent 

  (

    @dt_now DATETIME,

    @id_event INT,

    @dt_end DATETIME,

    @id_instance INT OUTPUT,

    @status INT OUTPUT

  )

AS



BEGIN



  BEGIN TRAN



  SELECT @status      = -99

  SELECT @id_instance = -99



  --

  -- attempts to update an pre-existing NotYetRun instance of this event

  --

  SELECT @id_instance = inst.id_instance

  FROM t_recevent_inst inst

  INNER JOIN 

  (

    -- finds the last instance

    SELECT MAX(inst.dt_arg_end) dt_arg_end

    FROM t_recevent evt

    INNER JOIN t_recevent_inst inst ON inst.id_event = evt.id_event

    WHERE

      -- event is active

      evt.dt_activated <= @dt_now AND

      (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

      evt.id_event = @id_event AND

      -- event is of type scheduled

      evt.tx_type = 'Scheduled'

  ) maxinst ON maxinst.dt_arg_end = inst.dt_arg_end

  WHERE

    inst.id_event = @id_event AND

    -- run has not yet been run

    inst.tx_status = 'NotYetRun' AND

    -- existing end date of the latest instance must be 

    -- before the newly requested end date

    inst.dt_arg_end < @dt_end



  IF (@@ROWCOUNT = 1)

  BEGIN

    UPDATE t_recevent_inst SET dt_arg_end = @dt_end WHERE id_instance = @id_instance



    COMMIT

    SELECT @status = 0 -- success (update)

    RETURN

  END





  --

  -- otherwise, an existing instance did not exist so create a new one

  --

  INSERT INTO t_recevent_inst(id_event,id_arg_interval,dt_arg_start,dt_arg_end,b_ignore_deps,dt_effective,tx_status)

  SELECT

    evt.id_event,

    NULL,             -- id_arg_interval

    MAX(dbo.AddSecond(ISNULL(inst.dt_arg_end, dbo.SubtractSecond(evt.dt_activated)))),

    @dt_end,          -- dt_arg_end

    'N',              -- b_ignore_deps

    NULL,             -- dt_effective

    'NotYetRun'       -- tx_status

  FROM t_recevent evt

  LEFT OUTER JOIN t_recevent_inst inst ON inst.id_event = evt.id_event

  WHERE

    -- event is active

    evt.dt_activated <= @dt_now AND

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

    evt.id_event = @id_event AND

    -- event is of type scheduled

    evt.tx_type = 'Scheduled'

  GROUP BY

    evt.id_event

  HAVING 

    -- start date must come before the requested end date

    MAX(dbo.AddSecond(ISNULL(inst.dt_arg_end, evt.dt_activated))) < @dt_end



  -- success!

  IF (@@ROWCOUNT = 1)

  BEGIN

    SELECT @status = 0    -- success (insert)

    SELECT @id_instance = @@IDENTITY

    COMMIT

    RETURN

  END





  -- 

  -- no instance was updated or created - figure out exactly what went wrong

  --



  -- does the event exist?

  SELECT 

    evt.id_event

  FROM t_recevent evt

  WHERE

    evt.dt_activated <= @dt_now AND

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

    evt.id_event = @id_event



  IF (@@ROWCOUNT = 0)

  BEGIN

    SELECT @status = -1 -- event not found

    ROLLBACK

    RETURN

  END



  -- is the event of type scheduled?

  SELECT 

    evt.id_event

  FROM t_recevent evt

  WHERE

    evt.tx_type = 'Scheduled' AND

    evt.id_event = @id_event



  IF (@@ROWCOUNT = 0)

  BEGIN

    SELECT @status = -2 -- event is not active

    ROLLBACK

    RETURN

  END



  -- is the last instances end date greater than the proposed start date?

  SELECT

    evt.id_event,

    MAX(dbo.AddSecond(ISNULL(inst.dt_arg_end, dbo.SubtractSecond(evt.dt_activated))))

  FROM t_recevent evt

  LEFT OUTER JOIN t_recevent_inst inst ON inst.id_event = evt.id_event

  WHERE 

    evt.id_event = @id_event 

  GROUP BY

    evt.id_event

  HAVING 

    -- start date must come before the requested end date

    MAX(dbo.AddSecond(ISNULL(inst.dt_arg_end, evt.dt_activated))) < @dt_end



  IF (@@ROWCOUNT = 0)

  BEGIN

    SELECT @status = -3 -- last end date is greater than the proposed start date

    ROLLBACK

    RETURN

  END


  -- unknown failure

  ROLLBACK

  SELECT @status = -99  

END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					create procedure IsAccBillableNPayingForOthers(

						@id_acc int,

						@ref_date datetime,

						@status int output) 

					as

					begin

				 		-- step 1: Check if this account is billable first

						-- MT_ACCOUNT_IS_NOT_BILLABLE ((DWORD)0xE2FF0005L)

				 		if (dbo.IsAccountBillable(@id_acc) = 'N')

						  begin

							select @status = -486604795

							return

				 		  end 

				 		-- step 2: Now that this account is billable, check if this 

				 		-- account has any non paying subscribers (payees)

						-- MT_ACCOUNT_PAYING_FOR_OTHERS ((DWORD)0xE2FF0030L)

				 		if (dbo.IsAccountPayingForOthers(@id_acc,@ref_date) = 'Y')

						  begin

							select @status = -486604752

							return

				 		  end 

				 		-- success

						

						select @status = 1

						return

					end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE MTSP_INSERTINVOICE

@id_interval int,

@invoicenumber_storedproc nvarchar(256), --this is the name of the stored procedure used to generate invoice numbers

@is_sample varchar(1),

@dt_now DATETIME,  -- the MetraTech system's date

@id_run int,

@num_invoices int OUTPUT,

@return_code int OUTPUT

AS

SET NOCOUNT ON

BEGIN

DECLARE 

@invoice_date datetime, 

@cnt int,

@curr_max_id int,

@id_interval_exist int,

@debug_flag bit,

@SQLError int,

@ErrMsg varchar(200)

-- Initialization

SET @num_invoices = 0

SET @invoice_date = CAST(SUBSTRING(CAST(@dt_now AS CHAR),1,11) AS DATETIME) --datepart

SET @debug_flag = 1 -- yes

--SET @debug_flag = 0 -- no

-- Validate input parameter values

IF @id_interval IS NULL 

BEGIN

  SET @ErrMsg = 'InsertInvoice: Completed abnormally, id_interval is null'

  GOTO FatalError

END

if @invoicenumber_storedproc IS NULL OR RTRIM(@invoicenumber_storedproc) = ''

BEGIN

  SET @ErrMsg = 'InsertInvoice: Completed abnormally, invoicenumber_storedproc is null'

  GOTO FatalError

END

IF @debug_flag = 1 

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

    VALUES (@id_run, 'Debug', 'InsertInvoice: Started', getutcdate()) 

-- If already exists, do not process again

SELECT TOP 1 @id_interval_exist = id_interval

FROM t_invoice_range

WHERE id_interval = @id_interval and id_run is NULL

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @id_interval_exist IS NOT NULL

BEGIN

  SET @ErrMsg = 'InsertInvoice: Invoice number already exists in the t_invoice_range table, '

    + 'process skipped, process completed successfully at ' 

    + CONVERT(char, getutcdate(), 109)

  GOTO SkipReturn

END

SELECT TOP 1 @id_interval_exist = id_interval

FROM t_invoice

WHERE id_interval = @id_interval and sample_flag = 'N'

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @id_interval_exist IS NOT NULL

BEGIN

  SET @ErrMsg = 'InsertInvoice: Invoice number already exists in the t_invoice table, '

    + 'process skipped, process completed successfully at ' 

    + CONVERT(char, getdate(), 109)

  GOTO SkipReturn

END



-- call MTSP_INSERTINVOICE_BALANCES to populate #tmp_acc_amounts, #tmp_prev_balance, #tmp_adjustments



CREATE TABLE #tmp_acc_amounts

  (tmp_seq int IDENTITY,

  namespace nvarchar(40),

  id_interval int,

  id_acc int,

  invoice_currency nvarchar(10),

  payment_ttl_amt numeric(18, 6),

  postbill_adj_ttl_amt numeric(18, 6),

  ar_adj_ttl_amt numeric(18, 6),

  previous_balance numeric(18, 6),

  tax_ttl_amt numeric(18, 6),

  current_charges numeric(18, 6),

  id_payer int,

  id_payer_interval int

  )



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



CREATE TABLE #tmp_prev_balance

 ( id_acc int,

   previous_balance numeric(18, 6)

 )



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



CREATE TABLE #tmp_adjustments

 ( id_acc int,

   PrebillAdjustmentAmount numeric(18, 6),

   PrebillTaxAdjustmentAmount numeric(18, 6),

   PostbillAdjustmentAmount numeric(18, 6),

   PostbillTaxAdjustmentAmount numeric(18, 6)

 )



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



EXEC MTSP_INSERTINVOICE_BALANCES @id_interval, 0, @id_run, @return_code OUTPUT



if @return_code <> 0 GOTO FatalError



-- Obtain the configured invoice strings and store them in a temp table

CREATE TABLE #tmp_invoicenumber

(id_acc int NOT NULL,

 namespace nvarchar(40) NOT NULL,

 invoice_string nvarchar(50) NOT NULL,

 invoice_due_date datetime NOT NULL,

 id_invoice_num int NOT NULL)



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



INSERT INTO #tmp_invoicenumber EXEC @invoicenumber_storedproc @invoice_date

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

-- End of 11/20/2002 add



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



IF @debug_flag = 1 

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@id_run, 'Debug', 'InsertInvoice: Begin Insert into t_invoice', getutcdate()) 



-- Save all the invoice data to the t_invoice table

INSERT INTO t_invoice

  (namespace,

  invoice_string, 

  id_interval,

  id_acc, 

  invoice_amount, 

  invoice_date, 

  invoice_due_date, 

  id_invoice_num,

  invoice_currency,

  payment_ttl_amt,

  postbill_adj_ttl_amt,

  ar_adj_ttl_amt,

  tax_ttl_amt,

  current_balance,

  id_payer,

  id_payer_interval,

  sample_flag,

  balance_forward_date)

SELECT

  #tmp_acc_amounts.namespace,

  tmpin.invoice_string, -- from the stored proc as below

  @id_interval,

  #tmp_acc_amounts.id_acc,

  current_charges

    + ISNULL(#tmp_adjustments.PrebillAdjustmentAmount,0)

    + tax_ttl_amt

    + ISNULL(#tmp_adjustments.PrebillTaxAdjustmentAmount,0.0),  -- invoice_amount = current_charges + prebill adjustments + taxes + prebill tax adjustments, 

  @invoice_date invoice_date, 

  tmpin.invoice_due_date, -- from the stored proc as @invoice_date+@invoice_due_date_offset   invoice_due_date,

  tmpin.id_invoice_num, -- from the stored proc as tmp_seq + @invoice_number - 1,

  invoice_currency,

  payment_ttl_amt, -- payment_ttl_amt

 ISNULL(#tmp_adjustments.PostbillAdjustmentAmount, 0.0) + ISNULL(#tmp_adjustments.PostbillTaxAdjustmentAmount, 0.0), -- postbill_adj_ttl_amt

  ar_adj_ttl_amt, -- ar_adj_ttl_amt

  tax_ttl_amt + ISNULL(#tmp_adjustments.PrebillTaxAdjustmentAmount,0.0), -- tax_ttl_amt 

  current_charges + tax_ttl_amt + ar_adj_ttl_amt 

	  + ISNULL(#tmp_adjustments.PostbillAdjustmentAmount, 0.0)

    + ISNULL(#tmp_adjustments.PostbillTaxAdjustmentAmount,0.0)

    + payment_ttl_amt

	  + ISNULL(#tmp_prev_balance.previous_balance, 0.0)

    + ISNULL(#tmp_adjustments.PrebillAdjustmentAmount, 0.0) 

    + ISNULL(#tmp_adjustments.PrebillTaxAdjustmentAmount,0.0), -- current_balance 

  id_payer, -- id_payer

  CASE WHEN #tmp_acc_amounts.id_payer_interval IS NULL THEN @id_interval ELSE #tmp_acc_amounts.id_payer_interval END, -- id_payer_interval

  @is_sample sample_flag,

  ui.dt_end -- balance_forward_date

FROM #tmp_acc_amounts

INNER JOIN #tmp_invoicenumber tmpin ON tmpin.id_acc = #tmp_acc_amounts.id_acc

LEFT OUTER JOIN #tmp_prev_balance ON #tmp_prev_balance.id_acc = #tmp_acc_amounts.id_acc

LEFT OUTER JOIN #tmp_adjustments ON #tmp_adjustments.id_acc = #tmp_acc_amounts.id_acc

INNER JOIN t_usage_interval ui ON ui.id_interval = @id_interval

INNER JOIN t_av_internal avi ON avi.id_acc = #tmp_acc_amounts.id_acc



SET @num_invoices = @@ROWCOUNT



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



-- Store the invoice range data to the t_invoice_range table

SELECT @cnt = MAX(tmp_seq)

FROM #tmp_acc_amounts

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



IF @cnt IS NOT NULL

BEGIN

  --insert info about the current run into the t_invoice_range table

  INSERT INTO t_invoice_range (id_interval, namespace, id_invoice_num_first, id_invoice_num_last)

  SELECT id_interval, namespace, ISNULL(min(id_invoice_num),0), ISNULL(max(id_invoice_num),0)

  FROM t_invoice

  WHERE id_interval = @id_interval

  GROUP BY id_interval, namespace

  --update the id_invoice_num_last in the t_invoice_namespace table

  UPDATE t_invoice_namespace

  SET t_invoice_namespace.id_invoice_num_last = 

	(SELECT ISNULL(max(t_invoice.id_invoice_num),0)

	FROM t_invoice

  	WHERE t_invoice_namespace.namespace = t_invoice.namespace AND

	t_invoice.id_interval = @id_interval)

  SELECT @SQLError = @@ERROR

  IF @SQLError <> 0 GOTO FatalError

END

ELSE  SET @cnt = 0



DROP TABLE #tmp_acc_amounts

DROP TABLE #tmp_prev_balance

DROP TABLE #tmp_invoicenumber

DROP TABLE #tmp_adjustments



IF @debug_flag = 1 

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

   VALUES (@id_run, 'Debug', 'InsertInvoice: Completed successfully', getutcdate())

   

SET @return_code = 0

RETURN 0



SkipReturn:

  IF @ErrMsg IS NULL 

    SET @ErrMsg = 'InsertInvoice: Process skipped'

  IF @debug_flag = 1 

    INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

      VALUES (@id_run, 'Debug', @ErrMsg, getutcdate()) 

  SET @return_code = 0

  RETURN 0



FatalError:

  IF @ErrMsg IS NULL 

    SET @ErrMsg = 'InsertInvoice: Adapter stored procedure failed'

  IF @debug_flag = 1 

    INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

      VALUES (@id_run, 'Debug', @ErrMsg, getutcdate()) 

  SET @return_code = -1

  RETURN -1



END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

 

-- populates #tmp_acc_amounts, #tmp_prev_balance, #tmp_adjustments for a given @id_interval

-- used by MTSP_INSERTINVOICE and __GET_NON_BILLABLE_ACCOUNTS_WITH_BALANCE__

CREATE   PROCEDURE MTSP_INSERTINVOICE_BALANCES

@id_interval int,

@exclude_billable char, -- '1' to only return non-billable accounts, '0' to return all accounts

@id_run int,

@return_code int OUTPUT

AS

BEGIN

DECLARE 

@debug_flag bit,

@SQLError int,

@ErrMsg varchar(200)

SET NOCOUNT ON

SET @debug_flag = 1 -- yes

--SET @debug_flag = 0 -- no



-- Create the driver table with all id_accs

CREATE TABLE #tmp_all_accounts

(id_acc int NOT NULL)



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



-- populate the driver table with account ids 

INSERT INTO #tmp_all_accounts

   (id_acc)

SELECT DISTINCT

   id_acc

	FROM t_acc_usage 

	WHERE id_usage_interval = @id_interval



UNION



SELECT DISTINCT

   id_acc

	FROM vw_adjustment_summary

	WHERE vw_adjustment_summary.id_usage_interval = @id_interval



UNION



--The convoluted logic below is to find the latest current balance for the account.  This may

--not be the previous interval, as the invoice adapter may not have been run

--for certain intervals.  Won't happen in production, but I encountered this

--a lot while testing.

SELECT DISTINCT

  id_acc

FROM

	(SELECT inv.id_acc, 

	ISNULL(MAX(CONVERT(CHAR(8),ui.dt_end,112)+

	REPLICATE('0',20-LEN(inv.current_balance)) + 

	CONVERT(CHAR,inv.current_balance)),'00000000000') comp

	FROM t_invoice inv

	INNER JOIN t_usage_interval ui 

	ON ui.id_interval = inv.id_interval

	GROUP BY inv.id_acc) latestinv

WHERE 

CONVERT(DECIMAL(18,6), SUBSTRING(comp,CASE WHEN PATINDEX('%-%',comp) = 0 THEN 10 ELSE PATINDEX('%-%',comp) END,28)) <> 0



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



-- populate #tmp_acc_amounts with accounts and their invoice amounts

IF (@debug_flag = 1 and @id_run IS NOT NULL)

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

    VALUES (@id_run, 'Debug', 'Invoice-Bal: Begin inserting to the #tmp_acc_amounts table', getutcdate()) 





INSERT INTO #tmp_acc_amounts

  (namespace,

  id_interval,

  id_acc,

  invoice_currency,

  payment_ttl_amt,

  postbill_adj_ttl_amt,

  ar_adj_ttl_amt,

  previous_balance,

  tax_ttl_amt,

  current_charges,

  id_payer,

  id_payer_interval

)

SELECT

  RTRIM(ammps.nm_space) namespace,

  au.id_usage_interval id_interval, 

  ammps.id_acc, 

  avi.c_currency invoice_currency, 

  SUM(CASE WHEN pvpay.id_sess IS NULL THEN 0 ELSE ISNULL(au.amount,0) END) payment_ttl_amt,

  0, --postbill_adj_ttl_amt

  SUM(CASE WHEN pvar.id_sess IS NULL THEN 0 ELSE ISNULL(au.amount,0) END) ar_adj_ttl_amt,

  0, --previous_balance

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL) THEN 

	(ISNULL(au.Tax_Federal,0.0)) ELSE 0 END) + 

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL) THEN

	(ISNULL(au.Tax_State,0.0))ELSE 0 END) +

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL) THEN 

	(ISNULL(au.Tax_County,0.0))ELSE 0 END) +

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL) THEN 

	(ISNULL(au.Tax_Local,0.0))ELSE 0 END) +

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL) THEN

	(ISNULL(au.Tax_Other,0.0))ELSE 0 END) tax_ttl_amt,

  SUM(CASE WHEN (pvpay.id_sess IS NULL AND pvar.id_sess IS NULL AND NOT vh.id_view IS NULL) THEN (ISNULL(au.Amount, 0.0)) ELSE 0 END) current_charges, 

  CASE WHEN avi.c_billable = '0' THEN pr.id_payer ELSE ammps.id_acc END id_payer,

  CASE WHEN avi.c_billable = '0' THEN auipay.id_usage_interval ELSE au.id_usage_interval END id_payer_interval

FROM  #tmp_all_accounts tmpall

INNER JOIN t_av_internal avi ON avi.id_acc = tmpall.id_acc

INNER JOIN t_account_mapper ammps ON ammps.id_acc = tmpall.id_acc

INNER JOIN t_namespace ns ON ns.nm_space = ammps.nm_space

	AND ns.tx_typ_space = 'system_mps'

INNER join t_acc_usage_interval aui ON aui.id_acc = tmpall.id_acc

INNER join t_usage_interval ui ON aui.id_usage_interval = ui.id_interval

	AND ui.id_interval = @id_interval

INNER join t_payment_redirection pr ON tmpall.id_acc = pr.id_payee

	AND ui.dt_end BETWEEN pr.vt_start AND pr.vt_end

INNER join t_acc_usage_interval auipay ON auipay.id_acc = pr.id_payer

INNER join t_usage_interval uipay ON auipay.id_usage_interval = uipay.id_interval

        AND ui.dt_end BETWEEN CASE WHEN auipay.dt_effective IS NULL THEN uipay.dt_start ELSE dateadd(s, 1, auipay.dt_effective) END AND uipay.dt_end



LEFT OUTER JOIN 

(SELECT au1.id_usage_interval, au1.amount, au1.Tax_Federal, au1.Tax_State, au1.Tax_County, au1.Tax_Local, au1.Tax_Other, au1.id_sess, au1.id_acc, au1.id_view

FROM t_acc_usage au1

LEFT OUTER JOIN t_pi_template piTemplated2 

ON piTemplated2.id_template=au1.id_pi_template

LEFT OUTER JOIN t_base_props pi_type_props ON pi_type_props.id_prop=piTemplated2.id_pi

LEFT OUTER JOIN t_enum_data enumd2 ON au1.id_view=enumd2.id_enum_data

AND (pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or upper(enumd2.nm_enum_data) NOT LIKE '%_TEMP')



WHERE au1.id_parent_sess is NULL

AND au1.id_usage_interval = @id_interval

AND ((au1.id_pi_template is null and au1.id_parent_sess is null) or (au1.id_pi_template is not null and piTemplated2.id_template_parent is null))

) au ON



	au.id_acc = tmpall.id_acc

-- join with the tables used for calculating the sums

LEFT OUTER JOIN t_view_hierarchy vh 

	ON au.id_view = vh.id_view

	AND vh.id_view = vh.id_view_parent

LEFT OUTER JOIN t_pv_aradjustment pvar ON pvar.id_sess = au.id_sess

LEFT OUTER JOIN t_pv_payment pvpay ON pvpay.id_sess = au.id_sess

-- non-join conditions

WHERE 

(@exclude_billable = '0' OR avi.c_billable = '0')

GROUP BY ammps.nm_space, ammps.id_acc, au.id_usage_interval, avi.c_currency, pr.id_payer, auipay.id_usage_interval, avi.c_billable





SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

---------------------------------------------------------------





-- populate #tmp_prev_balance with the previous balance

INSERT INTO #tmp_prev_balance

  (id_acc,

  previous_balance)

SELECT id_acc, CONVERT(DECIMAL(18,6), SUBSTRING(comp,CASE WHEN PATINDEX('%-%',comp) = 0 THEN 10 ELSE PATINDEX('%-%',comp) END,28)) previous_balance

FROM 	(SELECT inv.id_acc, 

ISNULL(MAX(CONVERT(CHAR(8),ui.dt_end,112)+

			REPLICATE('0',20-LEN(inv.current_balance)) + 

			CONVERT(CHAR,inv.current_balance)),'00000000000') comp

	FROM t_invoice inv

	INNER JOIN t_usage_interval ui ON ui.id_interval = inv.id_interval

	INNER JOIN #tmp_all_accounts ON inv.id_acc = #tmp_all_accounts.id_acc

	GROUP BY inv.id_acc) maxdtend



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



-- populate #tmp_adjustments with postbill and prebill adjustments

INSERT INTO #tmp_adjustments

 ( id_acc,

   PrebillAdjustmentAmount,

   PrebillTaxAdjustmentAmount,

   PostbillAdjustmentAmount,

   PostbillTaxAdjustmentAmount

 )

select ISNULL(adjtrx.id_acc, #tmp_all_accounts.id_acc) id_acc,

       ISNULL(PrebillAdjustmentAmount, 0) PrebillAdjustmentAmount,

       ISNULL(PrebillTaxAdjustmentAmount, 0) PrebillTaxAdjustmentAmount,

       ISNULL(PostbillAdjustmentAmount, 0) PostbillAdjustmentAmount, 

       ISNULL(PostbillTaxAdjustmentAmount, 0) PostbillTaxAdjustmentAmount

  from vw_adjustment_summary adjtrx FULL OUTER JOIN #tmp_all_accounts ON adjtrx.id_acc = #tmp_all_accounts.id_acc

  where adjtrx.id_usage_interval = @id_interval



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



drop table #tmp_all_accounts



IF (@debug_flag = 1  and @id_run IS NOT NULL)

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

    VALUES (@id_run, 'Debug', 'Invoice-Bal: Completed successfully', getutcdate()) 



SET @return_code = 0



RETURN 0



FatalError:

  IF @ErrMsg IS NULL 

    SET @ErrMsg = 'Invoice-Bal: Stored procedure failed'

  IF (@debug_flag = 1  and @id_run IS NOT NULL)

    INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

      VALUES (@id_run, 'Debug', @ErrMsg, getutcdate()) 



  SET @return_code = -1



  RETURN -1



END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	

CREATE PROCEDURE MTSP_INSERTINVOICE_DEFLTINVNUM

@invoice_date DATETIME

AS

BEGIN

SELECT 

	tmp.id_acc,

	tmp.namespace,

	tins.invoice_prefix

	 + ISNULL(REPLICATE('0', tins.invoice_num_digits - LEN(RTRIM(CONVERT(nvarchar,tmp.tmp_seq + tins.id_invoice_num_last + 1 - 1)))),'')

	 + RTRIM(CONVERT(nvarchar,tmp_seq + tins.id_invoice_num_last + 1 - 1))

	 + tins.invoice_suffix,

	@invoice_date+tins.invoice_due_date_offset,

	tmp.tmp_seq + tins.id_invoice_num_last

FROM #tmp_acc_amounts tmp

INNER JOIN t_invoice_namespace tins ON tins.namespace = tmp.namespace

END

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE MTSP_RATE_AGGREGATE_CHARGE

@input_RUN_ID int,

@input_USAGE_INTERVAL int,

@input_TEMPLATE_ID int,

@input_FIRST_PASS_PV_VIEWID int,

@input_FIRST_PASS_PV_TABLE varchar(50),

@input_COUNTABLE_VIEWIDS varchar(2000),

@input_COUNTABLE_OJOINS varchar(2000),

@input_FIRST_PASS_PV_PROPERTIES_ALIASED varchar(4000),  --field names with alias

@input_COUNTABLE_PROPERTIES varchar(2000),                    --field names only

@input_COUNTER_FORMULAS varchar(2000),                  --counters

@input_ACCOUNT_FILTER varchar(2000),

@input_COMPOUND_ORDERING varchar(2000),

@input_COUNTER_FORMULAS_ALIASES varchar(2000),

@output_SQLStmt_SELECT varchar(4000) OUTPUT,

@output_SQLStmt_DROPTMPTBL1 varchar(200) OUTPUT,

@output_SQLStmt_DROPTMPTBL2 varchar(200) OUTPUT,

@return_code int OUTPUT

AS

BEGIN

/********************************************************************

** Procedure Name: MTSP_RATE_AGGREGATE_CHARGE

** 

** Procedure Description: 

**

** Parameters: 

**

** Returns: 0 if successful

**          -1 if fatal error occurred

**

** Created By: Ning Zhuang

** Created On: 1/8/2002

** 

** Last Modified On: 02/19/2003

** Last Modified On: 01/21/2003

** Last Modified On: 01/08/2003** Last Modified On: 01/02/2003

** Last Modified On: 12/10/2002

** Last Modified On: 11/18/2002

** Last Modified On: 11/14/2002

** Last Modified On: 10/31/2002

** Last Modified On: 6/12/2002

** Last Modified On: 6/10/2002

**

**********************************************************************/

DECLARE

@bcr nvarchar(4000),

@au_id_usage_interval int,

@au_id_usage_cycle int,

@au_bc_dt_start datetime,

@au_bc_dt_end datetime,

@ag_dt_start datetime,

@SQLStmt nvarchar(4000),

@tmp_tbl_name_base varchar(50),



@tmp_tbl_name1 varchar(50),

@tmp_tbl_name12 varchar(50),

@tmp_tbl_name2 varchar(50),

@tmp_tbl_name3 varchar(50),

@debug_flag bit,

@SQLError int,



-- the following are added on 11/11/2002
-- I tried a number of ways to implement the performance change. Based on the testing 

-- results of 3 versions of the implementations, both feature flexibility and script flexibility 

-- (like using table variables) have processing cost associated with them. Since the purpose of 

-- the coding change is to improve the performance, I thus decide to use the version 

-- SPAggRate_OK_listed20.sql which provides the best performance improvement among the three new 

-- versions. This stored procedure contains this version.

@max_loop_cnt int,

-- used to accumulate the counter values (SUM)

@countable_0 numeric(18,6),

@countable_1 numeric(18,6),

@countable_2 numeric(18,6),

@countable_3 numeric(18,6),

@countable_4 numeric(18,6),

@countable_5 numeric(18,6),

@countable_6 numeric(18,6),

@countable_7 numeric(18,6),

@countable_8 numeric(18,6),

@countable_9 numeric(18,6),

@countable_10 numeric(18,6),

@countable_11 numeric(18,6),

@countable_12 numeric(18,6),

@countable_13 numeric(18,6),

@countable_14 numeric(18,6),

@countable_15 numeric(18,6),

@countable_16 numeric(18,6),

@countable_17 numeric(18,6),

@countable_18 numeric(18,6),

@countable_19 numeric(18,6),

-- use to count the number of records (COUNT)

@rec_count_0 int,

@rec_count_1 int,

@rec_count_2 int,

@rec_count_3 int,

@rec_count_4 int,

@rec_count_5 int,@rec_count_6 int,

@rec_count_7 int,

@rec_count_8 int,

@rec_count_9 int,

@rec_count_10 int,

@rec_count_11 int,

@rec_count_12 int,

@rec_count_13 int,

@rec_count_14 int,

@rec_count_15 int,

@rec_count_16 int,

@rec_count_17 int,

@rec_count_18 int,

@rec_count_19 int,



@work_counter_formulas varchar(500),

@work_counter varchar(500),

@loop_index int,

@as_index int,

@comma_index int,

-- store the parsed counter formula

@countable_formula_0 varchar(500),

@countable_formula_1 varchar(500),

@countable_formula_2 varchar(500),

@countable_formula_3 varchar(500),

@countable_formula_4 varchar(500),

@countable_formula_5 varchar(500),

@countable_formula_6 varchar(500),

@countable_formula_7 varchar(500),

@countable_formula_8 varchar(500),

@countable_formula_9 varchar(500),

@countable_formula_10 varchar(500),

@countable_formula_11 varchar(500),

@countable_formula_12 varchar(500),

@countable_formula_13 varchar(500),

@countable_formula_14 varchar(500),

@countable_formula_15 varchar(500),

@countable_formula_16 varchar(500),

@countable_formula_17 varchar(500),

@countable_formula_18 varchar(500),

@countable_formula_19 varchar(500),

-- store the actual value of the calculated formula

@countable_formula_value_0 numeric(18,6),

@countable_formula_value_1 numeric(18,6),

@countable_formula_value_2 numeric(18,6),

@countable_formula_value_3 numeric(18,6),

@countable_formula_value_4 numeric(18,6),

@countable_formula_value_5 numeric(18,6),

@countable_formula_value_6 numeric(18,6),

@countable_formula_value_7 numeric(18,6),

@countable_formula_value_8 numeric(18,6),

@countable_formula_value_9 numeric(18,6),

@countable_formula_value_10 numeric(18,6),

@countable_formula_value_11 numeric(18,6),

@countable_formula_value_12 numeric(18,6),

@countable_formula_value_13 numeric(18,6),

@countable_formula_value_14 numeric(18,6),

@countable_formula_value_15 numeric(18,6),

@countable_formula_value_16 numeric(18,6),

@countable_formula_value_17 numeric(18,6),

@countable_formula_value_18 numeric(18,6),

@countable_formula_value_19 numeric(18,6),

-- store the parsed field names which will be used to create the "temp" table

@counter_resultfieldname_0 varchar(500),

@counter_resultfieldname_1 varchar(500),

@counter_resultfieldname_2 varchar(500),

@counter_resultfieldname_3 varchar(500),

@counter_resultfieldname_4 varchar(500),

@counter_resultfieldname_5 varchar(500),

@counter_resultfieldname_6 varchar(500),

@counter_resultfieldname_7 varchar(500),

@counter_resultfieldname_8 varchar(500),

@counter_resultfieldname_9 varchar(500),

@counter_resultfieldname_10 varchar(500),

@counter_resultfieldname_11 varchar(500),

@counter_resultfieldname_12 varchar(500),

@counter_resultfieldname_13 varchar(500),

@counter_resultfieldname_14 varchar(500),

@counter_resultfieldname_15 varchar(500),

@counter_resultfieldname_16 varchar(500),

@counter_resultfieldname_17 varchar(500),

@counter_resultfieldname_18 varchar(500),

@counter_resultfieldname_19 varchar(500),



@countable_count int,

@formula_count int, -- added on 12/10/2002

@insert_count int



-- added on 12/31/2002

DECLARE

@cur_id_pass int,

@cur_id_sess int,

@cur_id_acc int,

@cur_group_acc_flag tinyint,

@cur_group_acc_id int,

@cur_pci_id_interval int,

@cur_dt_session datetime,

@cur_ui_dt_start datetime,

@cur_ui_dt_end datetime,

@cur_pci_dt_start datetime,

@cur_pci_dt_end datetime,

@cur_countable_0 numeric(18,6),

@cur_countable_1 numeric(18,6),

@cur_countable_2 numeric(18,6),

@cur_countable_3 numeric(18,6),

@cur_countable_4 numeric(18,6),

@cur_countable_5 numeric(18,6),

@cur_countable_6 numeric(18,6),

@cur_countable_7 numeric(18,6),

@cur_countable_8 numeric(18,6),

@cur_countable_9 numeric(18,6),

@cur_countable_10 numeric(18,6),

@cur_countable_11 numeric(18,6),

@cur_countable_12 numeric(18,6),

@cur_countable_13 numeric(18,6),

@cur_countable_14 numeric(18,6),

@cur_countable_15 numeric(18,6),

@cur_countable_16 numeric(18,6),

@cur_countable_17 numeric(18,6),

@cur_countable_18 numeric(18,6),

@cur_countable_19 numeric(18,6),

@pre_group_acc_flag tinyint,

@pre_group_acc_id int,

@pre_pci_id_interval int,

@FetchStatusCalc int


SET NOCOUNT ON

SET @debug_flag = 1



------------------------------------------

-- Reguide transactions to subscriptions

-- that may have changed retroactively

------------------------------------------

UPDATE t_acc_usage

SET 

t_acc_usage.id_pi_instance = ISNULL(plm1.id_pi_instance, plm2.id_pi_instance),

t_acc_usage.id_prod = ISNULL(s1.id_po, s2.id_po)

FROM

t_acc_usage 

LEFT OUTER JOIN 

	t_gsubmember gsm 

	INNER JOIN t_sub s1 ON s1.id_group=gsm.id_group

	INNER JOIN t_pl_map plm1 ON plm1.id_po=s1.id_po AND plm1.id_paramtable IS NULL

ON gsm.id_acc=t_acc_usage.id_payee AND gsm.vt_start <= t_acc_usage.dt_session AND gsm.vt_end >= t_acc_usage.dt_session AND plm1.id_pi_template=t_acc_usage.id_pi_template 

LEFT OUTER JOIN 

	t_sub s2 

	INNER JOIN t_pl_map plm2 ON plm2.id_po=s2.id_po AND plm2.id_paramtable IS NULL

ON s2.id_acc=t_acc_usage.id_payee AND s2.vt_start <= t_acc_usage.dt_session AND s2.vt_end >= t_acc_usage.dt_session AND s2.id_group IS NULL AND plm2.id_pi_template=t_acc_usage.id_pi_template 

WHERE

t_acc_usage.id_usage_interval=@input_USAGE_INTERVAL AND

t_acc_usage.id_pi_template=@input_TEMPLATE_ID AND

t_acc_usage.id_view=@input_FIRST_PASS_PV_VIEWID

AND

(

	ISNULL(plm1.id_pi_instance, plm2.id_pi_instance) <> t_acc_usage.id_pi_instance

	OR

	ISNULL(s1.id_po, s2.id_po) <> t_acc_usage.id_prod

	OR

	(t_acc_usage.id_pi_instance IS NULL AND ISNULL(plm1.id_pi_instance, plm2.id_pi_instance) IS NOT NULL)

  OR

	(t_acc_usage.id_prod IS NULL AND ISNULL(plm1.id_po, plm2.id_po) IS NOT NULL)

)



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



------------------------------------------

-- Construct the temp. table names

------------------------------------------

SET @tmp_tbl_name_base = REPLACE(REPLACE(REPLACE(REPLACE

	(RTRIM(CAST(@@SPID AS CHAR) + '_' + CONVERT(CHAR, getdate(), 121)),

	 ' ', ''), ':', ''), '.', ''), '-','')

SET @tmp_tbl_name1 = 't' + @tmp_tbl_name_base + '_1'

SET @tmp_tbl_name12 = 't' + @tmp_tbl_name_base + '_12'

SET @tmp_tbl_name2 = 't' + @tmp_tbl_name_base + '_2'

SET @tmp_tbl_name3 = 't' + @tmp_tbl_name_base + '_3'

------------------------------------------

-- Obtain the billing start and end dates:

-- One billing interval has only one pair of start and end dates

-- Retrieve and then store them in local variables

-----------------------------------------------

SELECT

	@au_id_usage_interval=ui.id_interval,

	@au_id_usage_cycle=ui.id_usage_cycle,

	@au_bc_dt_start=ui.dt_start,

	@au_bc_dt_end=ui.dt_end

FROM 

	t_usage_interval ui

WHERE

	ui.id_interval = @input_USAGE_INTERVAL

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @debug_flag = 1 AND @input_RUN_ID IS NOT NULL

BEGIN

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@input_RUN_ID, 'Debug', 'Finished selecting from the t_usage_interval table', getutcdate())  

	SELECT @SQLError = @@ERROR

	IF @SQLError <> 0 GOTO FatalError

END

--PRINT @au_id_usage_interval

--PRINT @au_id_usage_cycle

--PRINT @au_bc_dt_start

--PRINT @au_bc_dt_end

--PRINT ' '

--PRINT 'started: to obtain the earliest aggragate starting date'

--PRINT CONVERT(char, getdate(), 109)

-----------------------------------------------

-- Obtain the earliest aggragate starting date:

-- Modified on 5/31/02 to take the group sub into consideration

-----------------------------------------------

SELECT au.dt_session, 

ag.id_usage_cycle id_pc_cycle,

ISNULL(gs.id_usage_cycle,auc.id_usage_cycle) id_usage_cycle

INTO #tmp1

FROM 

	t_acc_usage au

	INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = au.id_payee

	LEFT OUTER JOIN t_gsubmember gsm 

	  INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group

	  INNER JOIN t_sub s on gs.id_group = s.id_group 

  ON gsm.id_acc = au.id_payee AND s.id_po = au.id_prod AND au.dt_session BETWEEN gsm.vt_start AND gsm.vt_end,

	t_usage_interval ui,

	t_aggregate ag

WHERE

	au.id_view = @input_FIRST_PASS_PV_VIEWID AND

	au.id_usage_interval = @input_USAGE_INTERVAL AND

	au.id_pi_template = @input_TEMPLATE_ID AND

	ui.id_interval = au.id_usage_interval AND

	ui.id_interval = @input_USAGE_INTERVAL AND

	ag.id_prop = ISNULL(au.id_pi_instance, au.id_pi_template)

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



SELECT @ag_dt_start = MIN(pci.dt_start)

FROM #tmp1 tmp1

	LEFT OUTER JOIN t_pc_interval pci ON pci.id_cycle = ISNULL(tmp1.id_pc_cycle,tmp1.id_usage_cycle)

		AND tmp1.dt_session BETWEEN pci.dt_start AND pci.dt_end 

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



DROP TABLE #tmp1

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @debug_flag = 1 AND @input_RUN_ID IS NOT NULL

BEGIN

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@input_RUN_ID, 'Debug', 'Finished selecting the minimum pci.dt_start', getutcdate())  

	SELECT @SQLError = @@ERROR

	IF @SQLError <> 0 GOTO FatalError

END

--PRINT @ag_dt_start

--PRINT 'completed: to obtain the earliest aggragate starting date'

--PRINT CONVERT(char, getdate(), 109)

-----------------------------------------------

-- If no aggregate cycle then use billing cycle

IF @ag_dt_start IS NULL SET @ag_dt_start = @au_bc_dt_start

--PRINT @ag_dt_start

----------------------------------------------------------------

-- Firstpass records

----------------------------------------------------------------

if (select id_usage_cycle from t_aggregate where id_prop = @input_TEMPLATE_ID) is not null

begin

	set @bcr = ' AND au.dt_session BETWEEN ''' + convert(varchar(19),@ag_dt_start,121) + ''' AND ''' + convert(varchar(19),@au_bc_dt_end,121) + ''' '

end

else

begin

	set @bcr = ''

end

	

SET @SQLStmt = ''

SET @SQLStmt =

N'SELECT

	au.id_sess,

	au.id_acc,

	au.id_payee,

	au.dt_session,

	ui.dt_start ui_dt_start,

	ui.dt_end ui_dt_end,

	-- Changed on 5/3, 5/6/2002 to take the group subscription dates into consideration

	CASE WHEN 

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN 1 ELSE 0 

	END group_acc_flag,

	CASE WHEN

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN gsm.id_group ELSE au.id_payee 

	END group_acc_id,

	ag.id_usage_cycle pci_id_cycle,

	ISNULL(gs.id_usage_cycle,auc.id_usage_cycle) ui_id_cycle

INTO ' + CAST(@tmp_tbl_name12 AS nvarchar(50)) + N' 

FROM

	t_acc_usage au

	INNER JOIN t_acc_usage_cycle auc ON auc.id_acc = au.id_payee

	-- Changed on 5/3 to take the group subscription dates into consideration

	LEFT OUTER JOIN t_gsubmember gsm 

	  INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group

	  INNER JOIN t_sub s on s.id_group = gs.id_group

  ON gsm.id_acc = au.id_payee AND s.id_po = au.id_prod AND au.dt_session BETWEEN gsm.vt_start AND gsm.vt_end,

	t_usage_interval ui,

	t_aggregate ag

WHERE

	au.id_view = @dinput_FIRST_PASS_PV_VIEWID AND

	au.id_usage_interval = @dinput_id_usage_interval AND

	au.id_pi_template = @dinput_TEMPLATE_ID AND

	ui.id_interval = au.id_usage_interval AND

	ag.id_prop = ISNULL(au.id_pi_instance, au.id_pi_template) '

	+ cast(@bcr as nvarchar(4000)) 

	+ CAST(@input_ACCOUNT_FILTER AS nvarchar(2000)) 

--	au.dt_session BETWEEN @dag_dt_start AND @dau_bc_dt_end '



EXEC sp_executesql @SQLStmt,

N'@dinput_FIRST_PASS_PV_VIEWID int, @dinput_id_usage_interval int,@dinput_TEMPLATE_ID int',

@input_FIRST_PASS_PV_VIEWID, @input_USAGE_INTERVAL, @input_TEMPLATE_ID

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



SET @SQLStmt = ''

SET @SQLStmt =

N'SELECT

	tmp.id_sess,

	tmp.id_acc,

	tmp.id_payee,

	tmp.dt_session,

	tmp.ui_dt_start,

	tmp.ui_dt_end,

	pci.dt_start pci_dt_start,

	pci.dt_end pci_dt_end,

	pci.id_interval pci_id_interval,

	tmp.group_acc_flag,

	tmp.group_acc_id

INTO ' + CAST(@tmp_tbl_name1 AS nvarchar(50)) + N' 

FROM ' + CAST(@tmp_tbl_name12 AS nvarchar(50)) + N' tmp 

	LEFT OUTER JOIN t_pc_interval pci ON pci.id_cycle = ISNULL(tmp.pci_id_cycle,tmp.ui_id_cycle)

		AND tmp.dt_session BETWEEN pci.dt_start AND pci.dt_end '

--PRINT @SQLStmt

EXEC sp_executesql @SQLStmt

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



IF @debug_flag = 1 AND @input_RUN_ID IS NOT NULL

BEGIN

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@input_RUN_ID, 'Debug', 'Finished inserting into the temp1 table', getutcdate())

	SELECT @SQLError = @@ERROR

	IF @SQLError <> 0 GOTO FatalError

END

--PRINT 'completed: to obtain the firstpass records'

--PRINT CONVERT(char, getdate(), 109)



SET @SQLStmt = 'DROP TABLE ' + @tmp_tbl_name12

EXEC sp_executesql @SQLStmt

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



----------------------------------------------------------------

-- Counter records

----------------------------------------------------------------

SET @SQLStmt = ''

IF RTRIM(@input_COUNTABLE_VIEWIDS) = '' OR @input_COUNTABLE_VIEWIDS IS NULL

BEGIN

SET @SQLStmt =

N'SELECT

	au.id_sess,

	au.id_acc,

	au.id_payee,

	au.dt_session,

	au.id_pi_template,

	ui.dt_start ui_dt_start,

	ui.dt_end ui_dt_end,

	pci.id_interval pci_id_interval,

	--Changed on 5/3 to take the group subscription dates into consideration

	CASE WHEN 

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN 1 ELSE 0 

	END group_acc_flag,

	CASE WHEN

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN gsm.id_group ELSE au.id_payee 

	END group_acc_id '

	+ CAST(@input_COUNTABLE_PROPERTIES AS nvarchar(2000)) 

	+ N' 

INTO ' + CAST(@tmp_tbl_name2 AS nvarchar(50)) + N' 

FROM

	t_acc_usage au 

	--Changed on 5/3 to take the group subscription dates into consideration

	LEFT OUTER JOIN t_gsubmember gsm

	  INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group 

    INNER JOIN t_sub s ON gs.id_group = s.id_group 

  ON gsm.id_acc = au.id_payee AND s.id_po = au.id_prod AND au.dt_session BETWEEN gsm.vt_start AND gsm.vt_end ' 

  + CAST(@input_COUNTABLE_OJOINS AS nvarchar(2000)) + N',

	t_usage_interval ui,

	(SELECT DISTINCT pci_id_interval FROM ' + CAST(@tmp_tbl_name1 AS nvarchar(50)) 

	+ N' ) agi,

	t_pc_interval pci

WHERE

	au.id_view IS NULL AND

	ui.id_interval = au.id_usage_interval AND

	pci.id_interval = agi.pci_id_interval AND 

	au.dt_session BETWEEN pci.dt_start AND pci.dt_end '

	+ cast(@bcr as nvarchar(1000)) 

	+ CAST(@input_ACCOUNT_FILTER AS nvarchar(2000)) 

END

	--au.dt_session BETWEEN @dag_dt_start AND @dau_bc_dt_end AND

ELSE

BEGIN

SET @SQLStmt =

N'SELECT

	au.id_sess,

	au.id_acc,

	au.id_payee,

	au.dt_session,

	au.id_pi_template,

	ui.dt_start ui_dt_start,

	ui.dt_end ui_dt_end,

	pci.id_interval pci_id_interval,

	--Changed on 5/3 to take the group subscription dates into consideration

	CASE WHEN 

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN 1 ELSE 0 

	END group_acc_flag,

	CASE WHEN

		gsm.id_group IS NOT NULL AND gs.b_supportgroupops = ''Y''

		THEN gsm.id_group ELSE au.id_payee 

	END group_acc_id '

	+ CAST(@input_COUNTABLE_PROPERTIES AS nvarchar(2000)) 

	+ N' 

INTO ' + CAST(@tmp_tbl_name2 AS nvarchar(50)) + N' 

FROM

	t_acc_usage au 

	--Changed on 5/3 to take the group subscription dates into consideration

	LEFT OUTER JOIN t_gsubmember gsm 

	  INNER JOIN t_group_sub gs ON gs.id_group = gsm.id_group 

    INNER JOIN t_sub s ON s.id_group=gs.id_group 

  ON gsm.id_acc = au.id_payee AND s.id_po = au.id_prod AND au.dt_session BETWEEN gsm.vt_start AND gsm.vt_end ' 

  + CAST(@input_COUNTABLE_OJOINS AS nvarchar(2000)) + N',

	t_usage_interval ui,

	(SELECT DISTINCT pci_id_interval FROM ' + CAST(@tmp_tbl_name1 AS nvarchar(50)) 

	+ N' ) agi,

	t_pc_interval pci

WHERE

	(au.id_view IS NULL OR au.id_view in (' + CAST(@input_COUNTABLE_VIEWIDS AS nvarchar(2000)) + N')) AND

	ui.id_interval = au.id_usage_interval AND

	pci.id_interval = agi.pci_id_interval AND 

	au.dt_session BETWEEN pci.dt_start AND pci.dt_end '

	+ cast(@bcr as nvarchar(1000))

	+ CAST(@input_ACCOUNT_FILTER AS nvarchar(2000)) 

END

--PRINT @SQLStmt

--	au.dt_session BETWEEN @dag_dt_start AND @dau_bc_dt_end AND

EXEC sp_executesql @SQLStmt



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @debug_flag = 1 AND @input_RUN_ID IS NOT NULL

BEGIN

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@input_RUN_ID, 'Debug', 'Finished inserting into the temp2 table', getutcdate())

	SELECT @SQLError = @@ERROR

	IF @SQLError <> 0 GOTO FatalError

END

--PRINT 'completed: to obtain the counter records'

--PRINT CONVERT(char, getdate(), 109)



----------------------------------------------------------------

-- Calculate the counters

----------------------------------------------------------------

-- 11/11/2002

-- Check to see which method to use to calculate the counters

SET @max_loop_cnt = 0

SET @SQLStmt =

N'SELECT @max_loop_cnt = MAX(cnt) FROM '

+ N'(SELECT COUNT(*) cnt FROM ' + CAST(@tmp_tbl_name2 AS nvarchar(50))

+ N' GROUP BY group_acc_flag, group_acc_id) tmptbl'

--PRINT @SQLStmt

EXEC sp_executesql @SQLStmt,

	N'@max_loop_cnt int OUTPUT',

	@max_loop_cnt = @max_loop_cnt OUTPUT



SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



IF @input_COUNTER_FORMULAS IS NULL 

   OR @input_COUNTER_FORMULAS = ''

   OR @max_loop_cnt IS NULL 

-- 1/2/2003 Always use the linear approach.

-- Uncomment the following line if want to use either the selfjoin or the linear approach 

-- depending on the data volume.

--   OR @max_loop_cnt <= 1000

-- Use the selfjoin approach

BEGIN

SET @SQLStmt = ''

SET @SQLStmt = 

N'SELECT tp1.id_sess ' + @input_COUNTER_FORMULAS + N' 

INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) 

+ N' FROM ' + CAST(@tmp_tbl_name1 AS nvarchar(50)) 

+ N' tp1 LEFT OUTER JOIN ' + CAST(@tmp_tbl_name2 AS nvarchar(50)) 

+ N' tp2 ON tp2.group_acc_flag = tp1.group_acc_flag AND tp2.group_acc_id = tp1.group_acc_id

	AND tp2.dt_session BETWEEN tp1.pci_dt_start AND tp1.pci_dt_end

	AND (tp2.ui_dt_end < tp1.ui_dt_end 

		OR (tp2.ui_dt_end = tp1.ui_dt_end 

		AND tp2.dt_session < tp1.dt_session)

		OR (tp2.ui_dt_end = tp1.ui_dt_end 

		AND tp2.dt_session = tp1.dt_session 

		AND tp2.id_sess < tp1.id_sess))

GROUP BY tp1.id_sess'



EXEC sp_executesql @SQLStmt

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

IF @debug_flag = 1 AND @input_RUN_ID IS NOT NULL

BEGIN

  INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

  VALUES (@input_RUN_ID, 'Debug', 'Finished inserting into the temp3 table', getutcdate())

	SELECT @SQLError = @@ERROR

	IF @SQLError <> 0 GOTO FatalError

END

END -- End of the selfjoin approach

ELSE

-- Use the linear approach

BEGIN

SET @countable_0 = 0

SET @countable_1 = 0

SET @countable_2 = 0

SET @countable_3 = 0

SET @countable_4 = 0

SET @countable_5 = 0

SET @countable_6 = 0

SET @countable_7 = 0

SET @countable_8 = 0

SET @countable_9 = 0

SET @countable_10 = 0

SET @countable_11 = 0

SET @countable_12 = 0

SET @countable_13 = 0

SET @countable_14 = 0

SET @countable_15 = 0

SET @countable_16 = 0

SET @countable_17 = 0

SET @countable_18 = 0

SET @countable_19 = 0



SET @rec_count_0 = 0

SET @rec_count_1 = 0

SET @rec_count_2 = 0

SET @rec_count_3 = 0

SET @rec_count_4 = 0

SET @rec_count_5 = 0

SET @rec_count_6 = 0

SET @rec_count_7 = 0

SET @rec_count_8 = 0

SET @rec_count_9 = 0

SET @rec_count_10 = 0

SET @rec_count_11 = 0

SET @rec_count_12 = 0

SET @rec_count_13 = 0

SET @rec_count_14 = 0

SET @rec_count_15 = 0

SET @rec_count_16 = 0

SET @rec_count_17 = 0

SET @rec_count_18 = 0

SET @rec_count_19 = 0



SET @countable_count = LEN(RTRIM(@input_COUNTABLE_PROPERTIES)) - LEN(RTRIM(REPLACE(@input_COUNTABLE_PROPERTIES, ',' , '')))

--PRINT @countable_count

SET @formula_count = LEN(RTRIM(@input_COUNTER_FORMULAS_ALIASES)) - LEN(RTRIM(REPLACE(@input_COUNTER_FORMULAS_ALIASES, ',' , '')))

--PRINT @formula_count



-- Parse the @input_COUNTER_FORMULAS string to obtain the "temp" table column names

SET @work_counter_formulas = @input_COUNTER_FORMULAS

-- remove the leading comma and add the trailing comma

SET @work_counter_formulas = SUBSTRING(@work_counter_formulas,3,LEN(@work_counter_formulas)) + ', '

-- remove the ISNULL

SET @work_counter_formulas = REPLACE(REPLACE(@work_counter_formulas, 'ISNULL(', ''), ', 0)', '')



SET @loop_index = -1

WHILE LEN(@work_counter_formulas) > 0

BEGIN

	SET @loop_index = @loop_index + 1

	SET @as_index = PATINDEX('% AS %', @work_counter_formulas)

	SET @comma_index = PATINDEX('%, %', @work_counter_formulas)

	IF @loop_index = 0

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_0 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_0 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_0 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_0 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_0 = REPLACE(@countable_formula_0, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_0, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 1
	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_1 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_1 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_1 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_1 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_1 = REPLACE(@countable_formula_1, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_1, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 2

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_2 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_2 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_2 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_2 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_2 = REPLACE(@countable_formula_2, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_2, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 3

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_3 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_3 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_3 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_3 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_3 = REPLACE(@countable_formula_3, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_3, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 4

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_4 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_4 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_4 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_4 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_4 = REPLACE(@countable_formula_4, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_4, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 5

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_5 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_5 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_5 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_5 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_5 = REPLACE(@countable_formula_5, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_5, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 6

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_6 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_6 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_6 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_6 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_6 = REPLACE(@countable_formula_6, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_6, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 7

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_7 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_7 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_7 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_7 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_7 = REPLACE(@countable_formula_7, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_7, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 8

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_8 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_8 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_8 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_8 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_8 = REPLACE(@countable_formula_8, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_8, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 9

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_9 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_9 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_9 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_9 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_9 = REPLACE(@countable_formula_9, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_9, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 10

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_10 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_10 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_10 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_10 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_10 = REPLACE(@countable_formula_10, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_10, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 11

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_11 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_11 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_11 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_11 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_11 = REPLACE(@countable_formula_11, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_11, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 12

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_12 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_12 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_12 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_12 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_12 = REPLACE(@countable_formula_12, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_12, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 13

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_13 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_13 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_13 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_13 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_13 = REPLACE(@countable_formula_13, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_13, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 14

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_14 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_14 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_14 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_14 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_14 = REPLACE(@countable_formula_14, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_14, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 15

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_15 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_15 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_15 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_15 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_15 = REPLACE(@countable_formula_15, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_15, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 16

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_16 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_16 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_16 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_16 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_16 = REPLACE(@countable_formula_16, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_16, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 17

	BEGIN
		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_17 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_17 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_17 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_17 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_17 = REPLACE(@countable_formula_17, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_17, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 18

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_18 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_18 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_18 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_18 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_18 = REPLACE(@countable_formula_18, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_18, 'countable_', '@rec_count_')

		END

	END

	ELSE IF @loop_index = 19

	BEGIN

		SET @work_counter = SUBSTRING(@work_counter_formulas, 1, @as_index-1)

		SET @counter_resultfieldname_19 = SUBSTRING(@work_counter_formulas, @as_index+4, @comma_index-@as_index-4)



		IF PATINDEX('%(SUM(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_19 = REPLACE(REPLACE(@work_counter, 'SUM', ''), 'tp2.', '@')

		END

		ELSE IF PATINDEX('%(COUNT(%',@work_counter) > 0

		BEGIN			SET @countable_formula_19 = REPLACE(REPLACE(@work_counter, '(COUNT(', '(('), 'tp2.countable_', '@rec_count_')

		END

		ELSE IF PATINDEX('%(AVG(%',@work_counter) > 0

		BEGIN

			SET @countable_formula_19 = REPLACE(REPLACE(@work_counter, 'AVG', ''), 'tp2.', '')

			SET @countable_formula_19 = REPLACE(@countable_formula_19, 'countable_', '@countable_')

				+ '/' + REPLACE(@countable_formula_19, 'countable_', '@rec_count_')

		END

	END



	SET @work_counter_formulas = SUBSTRING(@work_counter_formulas, @comma_index+2, LEN(@work_counter_formulas))

	--PRINT @work_counter_formulas

END

-- end of the string parsing to extract counter formulas



-- Create the @tmp_tbl_name3 table

IF @formula_count = 1

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 2

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 3

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 4

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 5

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 6

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 7

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 8

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 9

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 10

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 11

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 12

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 13

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 14

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 15

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 16

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_15 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 17

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_15 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_16 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 18

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_15 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_16 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_17 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 19

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_15 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_16 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_17 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_18 + N' NUMERIC (38,6) ) '

ELSE IF @formula_count = 20

	SET @SQLStmt = N'CREATE TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' ( id_sess int, '

		+ @counter_resultfieldname_0 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_1 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_2 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_3 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_4 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_5 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_6 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_7 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_8 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_9 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_10 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_11 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_12 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_13 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_14 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_15 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_16 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_17 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_18 + N' NUMERIC (38,6), '

		+ @counter_resultfieldname_19 + N' NUMERIC (38,6) ) '

--PRINT @SQLStmt

EXEC sp_executesql @SQLStmt

-- End of creating the table



-- Linear processing, 12/31/2002

IF @countable_count = 1 

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 2

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 3

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 4

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 5

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 6

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 7

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 8

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 9

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 10

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 11

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 12

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 13

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 14

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 15

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 16

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '
	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14,'

	+ N' countable_15'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 17

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14,'

	+ N' countable_15,'

	+ N' countable_16'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 18

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14,'

	+ N' countable_15,'

	+ N' countable_16,'

	+ N' countable_17'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 19

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14,'

	+ N' countable_15,'

	+ N' countable_16,'

	+ N' countable_17,'

	+ N' countable_18'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

ELSE IF @countable_count = 20

BEGIN

	SET @SQLStmt = 

	N'DECLARE calc_cursor CURSOR GLOBAL FOR '

	+ N' SELECT 1 id_pass, '

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' pci_dt_start,pci_dt_end,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 FROM ' 

	+ CAST(@tmp_tbl_name1 AS nvarchar(50))

	+ N' UNION ALL '

	+ N' SELECT 2 id_pass,'

	+ N' id_sess,id_acc,group_acc_flag,group_acc_id,pci_id_interval,dt_session,ui_dt_start,ui_dt_end,'

	+ N' NULL,NULL,'

	+ N' countable_0,'

	+ N' countable_1,'

	+ N' countable_2,'

	+ N' countable_3,'

	+ N' countable_4,'

	+ N' countable_5,'

	+ N' countable_6,'

	+ N' countable_7,'

	+ N' countable_8,'

	+ N' countable_9,'

	+ N' countable_10,'

	+ N' countable_11,'

	+ N' countable_12,'

	+ N' countable_13,'

	+ N' countable_14,'

	+ N' countable_15,'

	+ N' countable_16,'

	+ N' countable_17,'

	+ N' countable_18,'

	+ N' countable_19'

	+ N' FROM '

	+ CAST(@tmp_tbl_name2 AS nvarchar(50))

	+ N' ORDER BY group_acc_flag,group_acc_id,pci_id_interval,ui_dt_end,dt_session,id_sess, id_pass'

END

-- PRINT @SQLStmt



EXEC sp_executesql @SQLStmt

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



OPEN calc_cursor 

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError



IF @countable_count = 1

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0

END

ELSE IF @countable_count = 2

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1

END

ELSE IF @countable_count = 3

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2

END

ELSE IF @countable_count = 4

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3

END

ELSE IF @countable_count = 5

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4

END

ELSE IF @countable_count = 6

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,
	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5

END

ELSE IF @countable_count = 7

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6

END

ELSE IF @countable_count = 8

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7

END

ELSE IF @countable_count = 9

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8

END

ELSE IF @countable_count = 10

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9

END

ELSE IF @countable_count = 11

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,
	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10

END

ELSE IF @countable_count = 12

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11

END

ELSE IF @countable_count = 13

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12

END

ELSE IF @countable_count = 14

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13

END

ELSE IF @countable_count = 15

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14

END

ELSE IF @countable_count = 16

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15

END

ELSE IF @countable_count = 17

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16

END

ELSE IF @countable_count = 18

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17

END

ELSE IF @countable_count = 19

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17,

	@cur_countable_18

END

ELSE IF @countable_count = 20

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17,

	@cur_countable_18,@cur_countable_19

END



SET @FetchStatusCalc = @@FETCH_STATUS

SET @pre_group_acc_flag = 0

SET @pre_group_acc_id = 0

SET @pre_pci_id_interval = 0



WHILE @FetchStatusCalc <> -1

BEGIN

	-- Reset the counters when necessary

	IF @FetchStatusCalc = 0

		AND (@cur_group_acc_flag <> @pre_group_acc_flag 

		     OR @cur_group_acc_id <> @pre_group_acc_id

		     OR @cur_pci_id_interval <> @pre_pci_id_interval

		    )

	BEGIN

		SET @pre_pci_id_interval = @cur_pci_id_interval

		SET @pre_group_acc_flag = @cur_group_acc_flag

		SET @pre_group_acc_id = @cur_group_acc_id



		IF @countable_count = 1

		BEGIN

			SET @countable_0 = 0



			SET @rec_count_0 = 0

		END

		ELSE IF @countable_count = 2

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

		END

		ELSE IF @countable_count = 3

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

		END

		ELSE IF @countable_count = 4

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

		END

		ELSE IF @countable_count = 5

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

		END

		ELSE IF @countable_count = 6

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

		END

		ELSE IF @countable_count = 7

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

		END

		ELSE IF @countable_count = 8

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

		END

		ELSE IF @countable_count = 9

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

		END

		ELSE IF @countable_count = 10

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

		END

		ELSE IF @countable_count = 11

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

		END

		ELSE IF @countable_count = 12

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

		END

		ELSE IF @countable_count = 13

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0
			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

		END

		ELSE IF @countable_count = 14

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

		END

		ELSE IF @countable_count = 15

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

		END

		ELSE IF @countable_count = 16

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0

			SET @countable_15 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

			SET @rec_count_15 = 0

		END

		ELSE IF @countable_count = 17

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0

			SET @countable_15 = 0

			SET @countable_16 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

			SET @rec_count_15 = 0

			SET @rec_count_16 = 0

		END

		ELSE IF @countable_count = 18

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0

			SET @countable_15 = 0

			SET @countable_16 = 0

			SET @countable_17 = 0

			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

			SET @rec_count_15 = 0

			SET @rec_count_16 = 0

			SET @rec_count_17 = 0

		END

		ELSE IF @countable_count = 19

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0

			SET @countable_15 = 0

			SET @countable_16 = 0			SET @countable_17 = 0

			SET @countable_18 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0
			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

			SET @rec_count_15 = 0

			SET @rec_count_16 = 0

			SET @rec_count_17 = 0

			SET @rec_count_18 = 0

		END

		ELSE IF @countable_count = 20

		BEGIN

			SET @countable_0 = 0

			SET @countable_1 = 0

			SET @countable_2 = 0

			SET @countable_3 = 0

			SET @countable_4 = 0

			SET @countable_5 = 0

			SET @countable_6 = 0

			SET @countable_7 = 0

			SET @countable_8 = 0

			SET @countable_9 = 0

			SET @countable_10 = 0

			SET @countable_11 = 0

			SET @countable_12 = 0

			SET @countable_13 = 0

			SET @countable_14 = 0

			SET @countable_15 = 0

			SET @countable_16 = 0

			SET @countable_17 = 0

			SET @countable_18 = 0

			SET @countable_19 = 0



			SET @rec_count_0 = 0

			SET @rec_count_1 = 0

			SET @rec_count_2 = 0

			SET @rec_count_3 = 0

			SET @rec_count_4 = 0

			SET @rec_count_5 = 0

			SET @rec_count_6 = 0

			SET @rec_count_7 = 0

			SET @rec_count_8 = 0

			SET @rec_count_9 = 0

			SET @rec_count_10 = 0

			SET @rec_count_11 = 0

			SET @rec_count_12 = 0

			SET @rec_count_13 = 0

			SET @rec_count_14 = 0

			SET @rec_count_15 = 0

			SET @rec_count_16 = 0

			SET @rec_count_17 = 0

			SET @rec_count_18 = 0

			SET @rec_count_19 = 0

		END

	END -- reset the counters



	-- Processing the record

	IF @FetchStatusCalc = 0

	BEGIN

		IF @cur_id_pass = 1

		BEGIN

			-- Insert into the temp table



			-- obtain the actual value before the insertion

			SET @SQLStmt = N'DECLARE get_value_cursor CURSOR GLOBAL FOR SELECT '

			+ ISNULL(@countable_formula_0,0) + N',' + ISNULL(@countable_formula_1 ,0) + N',' + ISNULL(@countable_formula_2 ,0) + N','

			+ ISNULL(@countable_formula_3 ,0) + N',' + ISNULL(@countable_formula_4 ,0) + N',' + ISNULL(@countable_formula_5 ,0) + N','

			+ ISNULL(@countable_formula_6 ,0) + N',' + ISNULL(@countable_formula_7 ,0) + N',' + ISNULL(@countable_formula_8 ,0) + N','

			+ ISNULL(@countable_formula_9 ,0) + N',' + ISNULL(@countable_formula_10 ,0) + N',' + ISNULL(@countable_formula_11 ,0) + N','

			+ ISNULL(@countable_formula_12 ,0) + N',' + ISNULL(@countable_formula_13 ,0) + N',' + ISNULL(@countable_formula_14 ,0) + N','

			+ ISNULL(@countable_formula_15 ,0) + N',' + ISNULL(@countable_formula_16 ,0) + N',' + ISNULL(@countable_formula_17 ,0) + N','

			+ ISNULL(@countable_formula_18 ,0) + N',' + ISNULL(@countable_formula_19 ,0) 

			--PRINT @SQLStmt



			EXEC sp_executesql @SQLStmt,

			N'@countable_0 numeric(18,6), @countable_1 numeric(18,6), @countable_2 numeric(18,6),

			@countable_3 numeric(18,6), @countable_4 numeric(18,6), @countable_5 numeric(18,6),

			@countable_6 numeric(18,6), @countable_7 numeric(18,6), @countable_8 numeric(18,6),

			@countable_9 numeric(18,6), @countable_10 numeric(18,6), @countable_11 numeric(18,6),

			@countable_12 numeric(18,6), @countable_13 numeric(18,6), @countable_14 numeric(18,6),

			@countable_15 numeric(18,6), @countable_16 numeric(18,6), @countable_17 numeric(18,6),

			@countable_18 numeric(18,6), @countable_19 numeric(18,6),

			@rec_count_0 int, @rec_count_1 int, @rec_count_2 int, 

			@rec_count_3 int, @rec_count_4 int, @rec_count_5 int, 

			@rec_count_6 int, @rec_count_7 int, @rec_count_8 int, 

			@rec_count_9 int, @rec_count_10 int, @rec_count_11 int, 

			@rec_count_12 int, @rec_count_13 int, @rec_count_14 int, 

			@rec_count_15 int, @rec_count_16 int, @rec_count_17 int, 

			@rec_count_18 int, @rec_count_19 int',

			@countable_0, @countable_1, @countable_2,

			@countable_3, @countable_4, @countable_5,

			@countable_6, @countable_7, @countable_8,

			@countable_9, @countable_10, @countable_11,

			@countable_12, @countable_13, @countable_14,

			@countable_15, @countable_16, @countable_17,

			@countable_18, @countable_19,

			@rec_count_0, @rec_count_1, @rec_count_2, 

			@rec_count_3, @rec_count_4, @rec_count_5, 

			@rec_count_6, @rec_count_7, @rec_count_8, 

			@rec_count_9, @rec_count_10, @rec_count_11, 

			@rec_count_12, @rec_count_13, @rec_count_14, 

			@rec_count_15, @rec_count_16, @rec_count_17, 

			@rec_count_18, @rec_count_19



			SELECT @SQLError = @@ERROR

			IF @SQLError <> 0 GOTO FatalErrorCursor_Calc



			OPEN get_value_cursor

			SELECT @SQLError = @@ERROR

			IF @SQLError <> 0 GOTO FatalErrorCursor_Calc



			FETCH NEXT FROM get_value_cursor INTO 

			@countable_formula_value_0, @countable_formula_value_1, @countable_formula_value_2,

			@countable_formula_value_3, @countable_formula_value_4, @countable_formula_value_5,

			@countable_formula_value_6, @countable_formula_value_7, @countable_formula_value_8,

			@countable_formula_value_9, @countable_formula_value_10, @countable_formula_value_11,

			@countable_formula_value_12, @countable_formula_value_13, @countable_formula_value_14,

			@countable_formula_value_15, @countable_formula_value_16, @countable_formula_value_17,

			@countable_formula_value_18, @countable_formula_value_19



			CLOSE get_value_cursor

			DEALLOCATE get_value_cursor



			-- start insertions

			IF @formula_count = 1

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) + N')'

			ELSE IF @formula_count = 2

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 3

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 4

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 5

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 6

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 7

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 8

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 9
				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 10

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 11

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 
				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 12

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 13

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 14

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 15

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 16

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 
				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_15 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 17

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_15 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_16 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 18

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_15 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_16 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_17 AS nvarchar(50)) 

				+ N')'
			ELSE IF @formula_count = 19

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_15 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_16 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_17 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_18 AS nvarchar(50)) 

				+ N')'

			ELSE IF @formula_count = 20

				SET @SQLStmt = N'INSERT INTO ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

				+ N' VALUES (' + CAST(@cur_id_sess AS nvarchar(50)) + N',' 

				+ CAST(@countable_formula_value_0 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_1 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_2 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_3 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_4 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_5 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_6 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_7 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_8 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_9 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_10 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_11 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_12 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_13 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_14 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_15 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_16 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_17 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_18 AS nvarchar(50)) 

				+ N',' + CAST(@countable_formula_value_19 AS nvarchar(50)) 

				+ N')'



			EXEC sp_executesql @SQLStmt

			SELECT @SQLError = @@ERROR

			IF @SQLError <> 0 GOTO FatalErrorCursor_Calc

		END

		ELSE

		BEGIN

			-- Counter records to accumulate the counters

			IF @countable_count = 1

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 2

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 3

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 4

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 5

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)


				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 6

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 7

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 8

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 9

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 10

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 11

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 12

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 13

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 14

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)
				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 15

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)

				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 16

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)

				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)

				SET @countable_15 = @countable_15 + ISNULL(@cur_countable_15,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_15 = @rec_count_15 + CASE WHEN @cur_countable_15 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 17

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)

				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)

				SET @countable_15 = @countable_15 + ISNULL(@cur_countable_15,0)

				SET @countable_16 = @countable_16 + ISNULL(@cur_countable_16,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_15 = @rec_count_15 + CASE WHEN @cur_countable_15 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_16 = @rec_count_16 + CASE WHEN @cur_countable_16 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 18

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)

				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)

				SET @countable_15 = @countable_15 + ISNULL(@cur_countable_15,0)

				SET @countable_16 = @countable_16 + ISNULL(@cur_countable_16,0)

				SET @countable_17 = @countable_17 + ISNULL(@cur_countable_17,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_15 = @rec_count_15 + CASE WHEN @cur_countable_15 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_16 = @rec_count_16 + CASE WHEN @cur_countable_16 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_17 = @rec_count_17 + CASE WHEN @cur_countable_17 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 19

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)
				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)

				SET @countable_15 = @countable_15 + ISNULL(@cur_countable_15,0)

				SET @countable_16 = @countable_16 + ISNULL(@cur_countable_16,0)

				SET @countable_17 = @countable_17 + ISNULL(@cur_countable_17,0)

				SET @countable_18 = @countable_18 + ISNULL(@cur_countable_18,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_15 = @rec_count_15 + CASE WHEN @cur_countable_15 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_16 = @rec_count_16 + CASE WHEN @cur_countable_16 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_17 = @rec_count_17 + CASE WHEN @cur_countable_17 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_18 = @rec_count_18 + CASE WHEN @cur_countable_18 IS NULL THEN 0 ELSE 1 END

			END

			ELSE IF @countable_count = 20

			BEGIN

				SET @countable_0 = @countable_0 + ISNULL(@cur_countable_0,0)

				SET @countable_1 = @countable_1 + ISNULL(@cur_countable_1,0)

				SET @countable_2 = @countable_2 + ISNULL(@cur_countable_2,0)

				SET @countable_3 = @countable_3 + ISNULL(@cur_countable_3,0)

				SET @countable_4 = @countable_4 + ISNULL(@cur_countable_4,0)

				SET @countable_5 = @countable_5 + ISNULL(@cur_countable_5,0)

				SET @countable_6 = @countable_6 + ISNULL(@cur_countable_6,0)

				SET @countable_7 = @countable_7 + ISNULL(@cur_countable_7,0)

				SET @countable_8 = @countable_8 + ISNULL(@cur_countable_8,0)

				SET @countable_9 = @countable_9 + ISNULL(@cur_countable_9,0)

				SET @countable_10 = @countable_10 + ISNULL(@cur_countable_10,0)

				SET @countable_11 = @countable_11 + ISNULL(@cur_countable_11,0)

				SET @countable_12 = @countable_12 + ISNULL(@cur_countable_12,0)

				SET @countable_13 = @countable_13 + ISNULL(@cur_countable_13,0)

				SET @countable_14 = @countable_14 + ISNULL(@cur_countable_14,0)

				SET @countable_15 = @countable_15 + ISNULL(@cur_countable_15,0)

				SET @countable_16 = @countable_16 + ISNULL(@cur_countable_16,0)

				SET @countable_17 = @countable_17 + ISNULL(@cur_countable_17,0)

				SET @countable_18 = @countable_18 + ISNULL(@cur_countable_18,0)

				SET @countable_19 = @countable_19 + ISNULL(@cur_countable_19,0)



				SET @rec_count_0 = @rec_count_0 + CASE WHEN @cur_countable_0 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_1 = @rec_count_1 + CASE WHEN @cur_countable_1 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_2 = @rec_count_2 + CASE WHEN @cur_countable_2 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_3 = @rec_count_3 + CASE WHEN @cur_countable_3 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_4 = @rec_count_4 + CASE WHEN @cur_countable_4 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_5 = @rec_count_5 + CASE WHEN @cur_countable_5 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_6 = @rec_count_6 + CASE WHEN @cur_countable_6 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_7 = @rec_count_7 + CASE WHEN @cur_countable_7 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_8 = @rec_count_8 + CASE WHEN @cur_countable_8 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_9 = @rec_count_9 + CASE WHEN @cur_countable_9 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_10 = @rec_count_10 + CASE WHEN @cur_countable_10 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_11 = @rec_count_11 + CASE WHEN @cur_countable_11 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_12 = @rec_count_12 + CASE WHEN @cur_countable_12 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_13 = @rec_count_13 + CASE WHEN @cur_countable_13 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_14 = @rec_count_14 + CASE WHEN @cur_countable_14 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_15 = @rec_count_15 + CASE WHEN @cur_countable_15 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_16 = @rec_count_16 + CASE WHEN @cur_countable_16 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_17 = @rec_count_17 + CASE WHEN @cur_countable_17 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_18 = @rec_count_18 + CASE WHEN @cur_countable_18 IS NULL THEN 0 ELSE 1 END

				SET @rec_count_19 = @rec_count_19 + CASE WHEN @cur_countable_19 IS NULL THEN 0 ELSE 1 END

			END -- up to 20 countables

		END -- pass 1 (count for) or 2 (contributing to the counters)

	END -- @FetchStatusCalc = 0



-- Process the next record

IF @countable_count = 1

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0

END

ELSE IF @countable_count = 2

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1

END

ELSE IF @countable_count = 3

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2

END

ELSE IF @countable_count = 4

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3

END

ELSE IF @countable_count = 5

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4

END

ELSE IF @countable_count = 6

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5

END

ELSE IF @countable_count = 7

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6

END

ELSE IF @countable_count = 8

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7

END

ELSE IF @countable_count = 9

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8

END

ELSE IF @countable_count = 10

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9

END

ELSE IF @countable_count = 11

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10

END

ELSE IF @countable_count = 12

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11

END

ELSE IF @countable_count = 13

BEGIN

	FETCH NEXT FROM calc_cursor INTO 
	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12

END

ELSE IF @countable_count = 14

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13

END

ELSE IF @countable_count = 15

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14

END

ELSE IF @countable_count = 16

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15

END

ELSE IF @countable_count = 17

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16

END

ELSE IF @countable_count = 18

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17

END

ELSE IF @countable_count = 19

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17,

	@cur_countable_18

END

ELSE IF @countable_count = 20

BEGIN

	FETCH NEXT FROM calc_cursor INTO 

	@cur_id_pass,@cur_id_sess,@cur_id_acc,@cur_group_acc_flag,@cur_group_acc_id,@cur_pci_id_interval,@cur_dt_session,

	@cur_ui_dt_start,@cur_ui_dt_end,@cur_pci_dt_start,@cur_pci_dt_end,

	@cur_countable_0,@cur_countable_1,@cur_countable_2,@cur_countable_3,@cur_countable_4,@cur_countable_5,

	@cur_countable_6,@cur_countable_7,@cur_countable_8,@cur_countable_9,@cur_countable_10,@cur_countable_11,

	@cur_countable_12,@cur_countable_13,@cur_countable_14,@cur_countable_15,@cur_countable_16,@cur_countable_17,

	@cur_countable_18,@cur_countable_19

END -- fetch next



SET @FetchStatusCalc = @@FETCH_STATUS

END -- loop



CLOSE calc_cursor

DEALLOCATE calc_cursor



END -- of the linear approach 12/31/2002



----------------------------------------------------------------

-- Retrieve the result set

----------------------------------------------------------------

SET @SQLStmt = ''SET @SQLStmt = 

N'SELECT tp1.id_sess, au.id_parent_sess, 

   au.id_view AS c_ViewId, 

   tp1.id_acc AS c__PayingAccount,

   tp1.id_payee AS c__AccountID, 

   au.dt_crt AS c_CreationDate, 

   tp1.dt_session AS c_SessionDate '

	+ CAST(@input_FIRST_PASS_PV_PROPERTIES_ALIASED AS nvarchar(4000)) 

	+ CAST(@input_COUNTER_FORMULAS_ALIASES AS nvarchar(2000)) + N',

   au.id_pi_template AS c__PriceableItemTemplateID, 

   au.id_pi_instance AS c__PriceableItemInstanceID, 

   au.id_prod AS c__ProductOfferingID, 

   tp1.ui_dt_start AS c_BillingIntervalStart, 

   tp1.ui_dt_end AS c_BillingIntervalEnd, 

   tp1.pci_dt_start AS c_AggregateIntervalStart, 

   tp1.pci_dt_end AS c_AggregateIntervalEnd

FROM ' + CAST(@tmp_tbl_name1 AS nvarchar(50)) + N' tp1, ' 

	+ CAST(@tmp_tbl_name3 AS nvarchar(50)) + N' tp2, t_acc_usage au INNER JOIN ' 

	+ CAST(@input_FIRST_PASS_PV_TABLE AS nvarchar(2000))

	+ N' firstpasspv on firstpasspv.id_sess = au.id_sess

WHERE tp2.id_sess = tp1.id_sess

AND au.id_sess = tp1.id_sess

ORDER BY ' + CAST(@input_COMPOUND_ORDERING AS nvarchar(2000)) + N' tp1.id_acc, tp1.dt_session'

SET @output_SQLStmt_SELECT = @SQLStmt

SET @SQLStmt = 'DROP TABLE ' + @tmp_tbl_name2

EXEC sp_executesql @SQLStmt

SELECT @SQLError = @@ERROR

IF @SQLError <> 0 GOTO FatalError

SET @output_SQLStmt_DROPTMPTBL1 = 'DROP TABLE ' + @tmp_tbl_name1

SET @output_SQLStmt_DROPTMPTBL2 = 'DROP TABLE ' + @tmp_tbl_name3



--PRINT 'completed: all'

--PRINT CONVERT(char, getdate(), 109)



SET @return_code = 0

RETURN 0



FatalErrorCursor_calc:

	CLOSE calc_cursor

	DEALLOCATE calc_cursor



FatalError:

	SET @return_code = -1



	-- Added on 2/19/2003

	SET @SQLStmt = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'''

			+ CAST(@tmp_tbl_name1 AS nvarchar(50)) 

			+ N''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'

			+ N' DROP TABLE ' + CAST(@tmp_tbl_name1 AS nvarchar(50))

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQLStmt



	SET @SQLStmt = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'''			+ CAST(@tmp_tbl_name12 AS nvarchar(50)) 

			+ N''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'

			+ N' DROP TABLE ' + CAST(@tmp_tbl_name12 AS nvarchar(50))

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQLStmt



	SET @SQLStmt = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'''

			+ CAST(@tmp_tbl_name2 AS nvarchar(50)) 

			+ N''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'

			+ N' DROP TABLE ' + CAST(@tmp_tbl_name2 AS nvarchar(50))

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQLStmt



	SET @SQLStmt = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'''

			+ CAST(@tmp_tbl_name3 AS nvarchar(50)) 

			+ N''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'

			+ N' DROP TABLE ' + CAST(@tmp_tbl_name3 AS nvarchar(50))

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQLStmt



	RETURN -1

END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE MT_SYS_ANALYZE_ALL_TABLES (@varStatPercent int)

AS

BEGIN

/********************************************************************

** Procedure Name: MT_SYS_ANALYZE_ALL_TABLES

** 

** Procedure Description: Analyze all the user defined tables in the current schema.

**

** Parameters: varStatPercent int

**

** Returns: 0 if successful

**          1 if fatal error occurred

**

** Created By : Ning Zhuang

** Created On : 9/20/2001

** Modified By: Harvinder Singh

** Modified on: 8/11/2003

** Comment    : Modifed to update statistics on indexed view and all statistics

*********************************************************************************/

DECLARE @varTblName varchar(128), @SQLStmt varchar(1000), @SQLError int,

	@PrintStmt varchar(1000), @varStatPercentChar varchar(255)



SET NOCOUNT ON



IF @varStatPercent < 5 

   SET @varStatPercentChar = ' WITH SAMPLE 5 PERCENT ' 

ELSE IF @varStatPercent >= 100 

   SET @varStatPercentChar = ' WITH FULLSCAN ' 

ELSE SET @varStatPercentChar = ' WITH SAMPLE ' 

   + CAST(@varStatPercent AS varchar(20)) 

   + ' PERCENT ' 



DECLARE curUserObjs CURSOR FOR 

select distinct obj.name from sysindexkeys keys inner join sysobjects obj 

on keys.id=obj.id 

where XTYPE='v' 

SELECT @SQLError = @@ERROR

IF @SQLError <> 0

	RETURN 1





OPEN curUserObjs 

FETCH curUserObjs INTO @varTblName 

WHILE @@FETCH_STATUS <> -1 

BEGIN 

   IF @@FETCH_STATUS <> -2 

   BEGIN 

      SET @SQLStmt = 'UPDATE STATISTICS ' + @varTblName + @varStatPercentChar 

      PRINT @SQLStmt 

      EXECUTE (@SQLStmt) 

   END 

   FETCH curUserObjs INTO @varTblName 

END 

CLOSE curUserObjs 

DEALLOCATE curUserObjs 



PRINT 'Statistics have been updated for all Indexed Views.' 



DECLARE curUserObjs CURSOR FOR 

SELECT table_name FROM information_schema.tables 

WHERE table_type = 'BASE TABLE'

AND table_schema = 'dbo' 

ORDER BY table_name 

SELECT @SQLError = @@ERROR

IF @SQLError <> 0

	RETURN 1





OPEN curUserObjs 

FETCH curUserObjs INTO @varTblName 

WHILE @@FETCH_STATUS <> -1 

BEGIN 

   IF @@FETCH_STATUS <> -2 

   BEGIN 

      SET @SQLStmt = 'UPDATE STATISTICS ' + @varTblName + @varStatPercentChar 

      PRINT @SQLStmt 

      EXECUTE (@SQLStmt) 

   END 

   FETCH curUserObjs INTO @varTblName 

END 



CLOSE curUserObjs 

DEALLOCATE curUserObjs 



PRINT 'Statistics have been updated for all tables.' 



RETURN 0 

END 

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE MarkEventAsFailed
(
  @dt_now DATETIME,
  @id_instance INT,
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @tx_machine VARCHAR(128),
  @status INT OUTPUT
)
AS

BEGIN
  BEGIN TRAN
  SELECT @status = -99

  UPDATE t_recevent_inst 
  SET tx_status = 'Failed'
  WHERE 
    id_instance = @id_instance AND
    tx_status = 'Succeeded'
  
  IF @@ROWCOUNT = 1  -- successfully updated
  BEGIN
    -- inserts a run to record the fact that the status was changed
    -- this is important for 'cancel' to work correctly in reverse situations
    DECLARE @id_run INT
    EXEC GetCurrentID 'receventrun', @id_run OUTPUT
    INSERT INTO t_recevent_run
    (
      id_run,
      id_instance,
      tx_type,
      id_reversed_run,
      tx_machine,
      dt_start,
      dt_end,
      tx_status,
      tx_detail
    )
    VALUES 
    (
      @id_run,
      @id_instance,
      'Execute',
      NULL,
      @tx_machine,
      @dt_now,
      @dt_now,
      'Failed',
      'Manually changed status to Failed'
    )

    -- audits the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'MarkAsFailed', NULL, NULL, @tx_detail, @dt_now) 

    SELECT @status = 0  -- success
    COMMIT
    RETURN
  END

  --
  -- update did not occur, so lets figure out why
  --

  -- does the instance exist?
  SELECT 1
  FROM t_recevent_inst 
  WHERE 
    id_instance = @id_instance

  IF @@ROWCOUNT = 0
  BEGIN
    SELECT @status = -1  -- instance does not exist
    ROLLBACK
    RETURN -1
  END

  SELECT @status = -2  -- instance was not in a valid state
  ROLLBACK
  RETURN -2

END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE MarkEventAsNotYetRun
(
  @dt_now DATETIME,
  @id_instance INT,
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @tx_machine VARCHAR(128),
  @status INT OUTPUT
)
AS

BEGIN
  BEGIN TRAN
  SELECT @status = -99

  UPDATE t_recevent_inst 
  SET tx_status = 'NotYetRun'
  WHERE 
    id_instance = @id_instance AND
    tx_status = 'Failed'
  
  IF @@ROWCOUNT = 1  -- successfully updated
  BEGIN
    -- inserts a run to record the fact that the status was changed
    -- this is important for 'cancel' to work correctly in reverse situations
    DECLARE @id_run INT
    EXEC GetCurrentID 'receventrun', @id_run OUTPUT
    INSERT INTO t_recevent_run
    (
      id_run,
      id_instance,
      tx_type,
      id_reversed_run,
      tx_machine,
      dt_start,
      dt_end,
      tx_status,
      tx_detail
    )
    VALUES 
    (
      @id_run,
      @id_instance,
      'Reverse',
      NULL,
      @tx_machine,
      @dt_now,
      @dt_now,
      'Succeeded',
      'Manually changed status to NotYetRun'
    )

    -- audits the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'MarkAsNotYetRun', NULL, NULL, @tx_detail, @dt_now) 

    SELECT @status = 0  -- success
    COMMIT
    RETURN
  END

  --
  -- update did not occur, so lets figure out why
  --

  -- does the instance exist?
  SELECT 1
  FROM t_recevent_inst 
  WHERE 
    id_instance = @id_instance

  IF @@ROWCOUNT = 0
  BEGIN
    SELECT @status = -1  -- instance does not exist
    ROLLBACK
    RETURN -1
  END

  SELECT @status = -2  -- instance was not in a valid state
  ROLLBACK
  RETURN -2

END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE MarkEventAsSucceeded
(
  @dt_now DATETIME,
  @id_instance INT,
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @tx_machine VARCHAR(128),
  @status INT OUTPUT
)
AS

BEGIN
  BEGIN TRAN

  SELECT @status = -99

  UPDATE t_recevent_inst 
  SET tx_status = 'Succeeded'
  WHERE 
    id_instance = @id_instance AND
    tx_status = 'Failed'
  
  IF @@ROWCOUNT = 1  -- successfully updated
  BEGIN
    -- inserts a run to record the fact that the status was changed
    -- this is important for 'cancel' to work correctly in reverse situations
    DECLARE @id_run INT
    EXEC GetCurrentID 'receventrun', @id_run OUTPUT
    INSERT INTO t_recevent_run
    (
      id_run,
      id_instance,
      tx_type,
      id_reversed_run,
      tx_machine,
      dt_start,
      dt_end,
      tx_status,
      tx_detail
    )
    VALUES 
    (
      @id_run,
      @id_instance,
      'Execute',
      NULL,
      @tx_machine,
      @dt_now,
      @dt_now,
      'Succeeded',
      'Manually changed status to Succeeded'
    )

    -- audits the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'MarkAsSucceeded', NULL, NULL, @tx_detail, @dt_now) 

    SELECT @status = 0  -- success
    COMMIT
    RETURN
  END

  --
  -- update did not occur, so lets figure out why
  --

  -- does the instance exist?
  SELECT 1
  FROM t_recevent_inst 
  WHERE 
    id_instance = @id_instance

  IF @@ROWCOUNT = 0
  BEGIN
    SELECT @status = -1  -- instance does not exist
    ROLLBACK
    RETURN -1
  END

  SELECT @status = -2  -- instance was not in a valid state
  ROLLBACK
  RETURN -2

END 
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			CREATE PROC ModifyBatchStatus

			  @tx_batch varchar(255),

				@dt_change datetime,

				@tx_new_status char(1),

				@id_batch int output,

				@tx_current_status char(1) output,

				@status int output

			AS

			BEGIN

				SELECT

				  @id_batch = id_batch,

				  @tx_current_status = tx_status

				FROM

				  t_batch

				WHERE

				  tx_batch_encoded = @tx_batch

				-- Batch does not exist	

				IF (@@rowcount = 0)

				BEGIN

				  -- MTBATCH_BATCH_DOES_NOT_EXIST ((DWORD)0xE4020007L)

				  SELECT @status = -469630969

					RETURN

				END



				-- State transition business rules 

				IF (

				    ((@tx_new_status = 'F') AND 

				     ((@tx_current_status = 'D') OR (@tx_current_status = 'B')))

						OR

						((@tx_new_status = 'D') AND 

						 ((@tx_current_status = 'A') OR (@tx_current_status = 'C') OR 

						  (@tx_current_status = 'F')))

						OR

						((@tx_new_status = 'C') AND 

						 ((@tx_current_status = 'D') OR (@tx_current_status = 'B')))

						OR

						((@tx_new_status = 'A') AND 

						 ((@tx_current_status = 'D') OR (@tx_current_status = 'C') OR 

						  (@tx_current_status = 'F')))

						OR

						((@tx_new_status = 'B') AND 

						 ((@tx_current_status = 'A') OR (@tx_current_status = 'D') OR

						  (@tx_current_status = 'C')))

						)

				BEGIN

				 	-- MTBATCH_STATE_CHANGE_NOT_PERMITTED ((DWORD)0xE4020007L)

				 	SELECT @status = -469630968

					RETURN

				END

	

				UPDATE 

			  	t_batch 

				SET 

			  	tx_status = @tx_new_status

				WHERE

			  	tx_batch_encoded = @tx_batch



	    	SELECT @status = 1 

				RETURN

			END

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create  procedure MoveAccount 

	(@new_parent int,

	 @account_being_moved int,

   @vt_move_start datetime,

   @p_enforce_same_corporation varchar,

   @status int output,

   @p_id_ancestor_out int output)

as

begin

declare @vt_move_end datetime

set @vt_move_end = dbo.MTMaxDate()



-- plug business rules back in

declare @varMaxDateTime as datetime

declare @AccCreateDate as datetime

declare @AccMaxCreateDate as datetime

declare @p_dt_start datetime

declare @realstartdate as datetime

declare @p_id_ancestor as int

declare @p_id_descendent as int

declare @ancestor_acc_type as varchar(5)

declare @descendent_acc_type as varchar(5)

declare @b_is_ancestor_folder as varchar(1)



set @p_dt_start = @vt_move_start

set @p_id_ancestor = @new_parent

set @p_id_descendent = @account_being_moved



select @realstartdate = dbo.mtstartofday(@p_dt_start) 

select @varMaxDateTime = dbo.MTMaxDate()



select @AccCreateDate = 

dbo.mtminoftwodates(dbo.mtstartofday(ancestor.dt_crt),dbo.mtstartofday(descendent.dt_crt)),

@ancestor_acc_type = ancestor.acc_type,

@descendent_acc_type = descendent.acc_type,

@b_is_ancestor_folder = ancestoravi.c_folder



from t_account ancestor

inner join t_account descendent ON 

ancestor.id_acc = @p_id_ancestor and

descendent.id_acc = @p_id_descendent

inner join t_av_internal ancestoravi on ancestoravi.id_acc = ancestor.id_acc



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

		if dbo.IsInSameCorporateAccount(@p_id_ancestor,@p_id_descendent,@realstartdate) <> 1 begin

			-- MT_CANNOT_MOVE_BETWEEN_CORPORATE_HIERARCHIES

			select @status = -486604759

			return

		end

	end



--check that both ancestor and descendent are subscriber accounts

--if(UPPER(@descendent_acc_type) <> 'SUB' OR UPPER(@ancestor_acc_type) <> 'SUB')

--BEGIN

-- MT_CANNOT_MOVE_OTHER_THAN_SUBSCRIBERS

--select @status = -486604727

--return

--END



if(@b_is_ancestor_folder <> '1')

BEGIN

-- MT_CANNOT_MOVE_TO_NON_FOLDER_ACCOUNT

select @status = -486604726

return

END



-- end business rules



select 

aa2.id_ancestor,

aa2.id_descendent,

aa2.num_generations,

aa2.b_children,

dbo.MTMaxOfTwoDates(@vt_move_start, dbo.MTMaxOfTwoDates(dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start), aa3.vt_start)) as vt_start,

dbo.MTMinOfTwoDates(@vt_move_end, dbo.MTMinOfTwoDates(dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end), aa3.vt_end)) as vt_end,

aa2.tx_path

into #deletethese

from

t_account_ancestor aa1

inner join t_account_ancestor aa2 on aa1.id_ancestor=aa2.id_ancestor and aa1.vt_start <= aa2.vt_end and aa2.vt_start <= aa1.vt_end and aa2.vt_start <= @vt_move_end and @vt_move_start <= aa2.vt_end

inner join t_account_ancestor aa3 on aa2.id_descendent=aa3.id_descendent and aa3.vt_start <= aa2.vt_end and aa2.vt_start <= aa3.vt_end and aa3.vt_start <= @vt_move_end and @vt_move_start <= aa3.vt_end

where

aa1.id_descendent=@account_being_moved

and

aa1.num_generations > 0

and 

aa1.vt_start <= @vt_move_end 

and 

@vt_move_start <= aa1.vt_end

and

aa3.id_ancestor=@account_being_moved



-- select old direct ancestor id

select @p_id_ancestor_out = id_ancestor from #deletethese

where num_generations = 1 and @vt_move_start between vt_start and vt_end





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

dbo.MTMaxOfTwoDates(@vt_move_start, dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start)) as vt_start,

dbo.MTMinOfTwoDates(@vt_move_end, dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end)) as vt_end,

case when aa2.id_descendent = 1 then

    aa1.tx_path + aa2.tx_path

    else

    aa1.tx_path + '/' + aa2.tx_path

    end

from

t_account_ancestor aa1

inner join t_account_ancestor aa2 on aa1.vt_start < aa2.vt_end and aa2.vt_start < aa1.vt_end and aa2.vt_start < @vt_move_end and @vt_move_start < aa2.vt_end

where 

aa1.id_descendent = @new_parent 

and 

aa1.vt_start < @vt_move_end 

and 

@vt_move_start < aa1.vt_end

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

	from t_account_ancestor aa2

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



	update new set b_Children = 'Y' from t_account_ancestor new where

	id_descendent = @new_parent

	and b_children='N'	



	update old set b_Children = 'N' from t_account_ancestor old where

	id_descendent = @p_id_ancestor_out and

	not exists (select 1 from t_account_ancestor new where new.id_ancestor=old.id_descendent

	and num_generations <>0 )



select @status=1

END

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE OpenUsageInterval

(

  @dt_now DATETIME,     -- MetraTech system date

  @id_interval INT,     -- specific usage interval to reopen, the interval must be soft-closed

  @ignoreDeps INT,      -- whether to ignore the reverse dependencies for re-opening the interval

  @pretend INT,         -- if pretend is true, the interval is not actually reopened

  @status INT OUTPUT    -- return code: 0 is successful

)

AS



BEGIN

  BEGIN TRAN



  SELECT @status = -999



  -- checks that the interval is soft closed

  DECLARE @count INT

  SELECT @count = COUNT(*)

  FROM t_usage_interval

  WHERE 

    id_interval = @id_interval AND

    tx_interval_status = 'C'

 

  IF @count = 0

  BEGIN

    SELECT @count = COUNT(*)

    FROM t_usage_interval

    WHERE id_interval = @id_interval



    IF @count = 0

      -- interval not found

      SELECT @status = -1

    ELSE

      -- interval not soft closed

      SELECT @status = -2

  

    ROLLBACK

    RETURN

  END



  --

  -- retrieves the instance ID of the start root event for the given interval

  --

  DECLARE @id_instance INT

  SELECT @id_instance = inst.id_instance

  FROM t_recevent_inst inst

  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

  WHERE

    -- event must be active

    evt.dt_activated <= @dt_now and

    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

    -- instance must match the given interval

    inst.id_arg_interval = @id_interval AND
    evt.tx_name = '_StartRoot' AND

    evt.tx_type = 'Root'



  IF @id_instance IS NULL

  BEGIN

    -- start root instance was not found!

    SELECT @status = -3

    ROLLBACK

    RETURN

  END

  

  

  --

  -- checks start root's reversal dependencies

  --

  IF @ignoreDeps = 0

  BEGIN

    SELECT @count = COUNT(*)

    FROM GetEventReversalDeps(@dt_now, @id_instance) deps

    WHERE deps.tx_status <> 'NotYetRun'



    IF @count > 0

    BEGIN

      -- not all instances in the interval have been reversed successfuly

      SELECT @status = -4

      ROLLBACK

      RETURN

    END   

  END



  -- just pretending, so don't do the update

  IF @pretend != 0

  BEGIN

    SELECT @status = 0 -- success

    COMMIT

    RETURN

  END  



  UPDATE t_usage_interval SET tx_interval_status = 'O'

  WHERE 

    id_interval = @id_interval AND

    tx_interval_status = 'C'



  IF @@ROWCOUNT = 1

  BEGIN

    SELECT @status = 0 -- success

    COMMIT

  END

  ELSE

  BEGIN

    -- couldn't update the interval

    SELECT @status = -5

    ROLLBACK

  END
END

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		      create proc PIResolutionByID(

		      @dt_session DATETIME, @id_pi_template INTEGER, @id_acc INTEGER)



		      as

					select 

		      typemap.id_po,

		      typemap.id_pi_instance,

		      sub.id_sub

		      from

		      -- select out the instances from the pl map (either need to follow 

		      -- up with a group by or assume one param table or add a unique entry

		      -- with a null param table/price list; I am assuming the null entry exists)

		      t_pl_map typemap 

		      -- Now that we have the correct list of instances we match them up with the

		      -- accounts on the billing interval being processed.  For each account grab the

		      -- information about the billing interval dates so that we can select the 

		      -- correct intervals to process.

		      -- Go get all subscriptions product offerings containing the proper discount

		      -- instances

		      , t_sub sub 

		      -- Go get the effective date of the subscription to the discount

		      where

		      -- Join criteria for t_sub

		      typemap.id_po = sub.id_po

		      -- join criteria for t_sub to t_effective_date

		      -- Find the subscription which contains the dt_session; there should be

		      -- at most one of these.

		      and (sub.vt_start <= @dt_session)

		      and (sub.vt_end >= @dt_session)

		      -- Select the unique instance record that includes an instance in a template

		      and typemap.id_paramtable is null

		      and typemap.id_pi_template = @id_pi_template

		      and sub.id_acc = @id_acc

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		      create proc PIResolutionByName(
		      @dt_session DATETIME, @nm_name nvarchar(255), @id_acc INTEGER)

		      as
					select 
		      typemap.id_po,
		      typemap.id_pi_instance,
		      sub.id_sub
		      from
		      -- select out the instances from the pl map (either need to follow 
		      -- up with a group by or assume one param table or add a unique entry
		      -- with a null param table/price list; I am assuming the null entry exists)
		      t_pl_map typemap 
		      -- Now that we have the correct list of instances we match them up with the
		      -- accounts on the billing interval being processed.  For each account grab the
		      -- information about the billing interval dates so that we can select the 
		      -- correct intervals to process.
		      -- Go get all subscriptions product offerings containing the proper discount
		      -- instances
		      , t_sub sub 
		      -- Go get the effective date of the subscription to the discount
		      , t_base_props base
		      where
		      -- Join criteria for t_sub
		      typemap.id_po = sub.id_po
		      -- join criteria for t_sub to t_effective_date
		      -- Find the subscription which contains the dt_session; there should be
		      -- at most one of these.
		      and (sub.vt_start <= @dt_session)
		      and (sub.vt_end >= @dt_session)
		      -- Join template to base props
		      and base.id_prop=typemap.id_pi_template
		      -- Select the unique instance record that includes an instance in a template
		      and typemap.id_paramtable is null
		      and base.nm_name = @nm_name
		      and sub.id_acc = @id_acc
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create  procedure PopFirstMessage

  @pipelineID int,

  @systemTime datetime,

  @messageID int OUTPUT

as

begin



set nocount on

begin transaction



select top 1 @messageID = id_message from

t_message m with(readpast, updlock)

where

m.dt_assigned is null

and 

not exists (

	select * from t_session_set ss

	where

	ss.id_message=m.id_message

	and

	ss.id_svc not in (select ps.id_svc from t_pipeline_service ps 

                    inner join t_pipeline p on ps.id_pipeline=p.id_pipeline

                    where 

                    p.id_pipeline=@pipelineID 

                    and p.b_paused = '0'

                    and tt_end=dbo.MTMaxDate())

)

order by id_message asc



if @messageID is not null

begin

	update t_message with(ROWLOCK) set dt_assigned = @systemTime, id_pipeline = @pipelineID where id_message = @messageID



        set nocount off

	 select ss.id_message, ss.id_svc,

	 ss.session_count, m.id_feedback

   from t_session_set ss

	 inner join t_message m on ss.id_message=m.id_message

	 where ss.id_message = @messageID



end

else

begin

-- next line is a hack for now: don't know how to

-- handle conditional rowsets

select -1 as id_message	

end

commit transaction

set nocount off

end

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create proc PropagateProperties(@table_name as varchar(100),

																			@update_list as varchar(8000),

																			@insert_list as varchar(8000),

																			@clist as varchar(8000),

																			@id_pi_template as int)

			as

			declare @CursorVar CURSOR

			declare @count as int

			declare @i as int

			declare @idInst as int

			set @i = 0

			set @CursorVar = CURSOR STATIC

				FOR select id_pi_instance from t_pl_map

						where id_pi_template = @id_pi_template and id_paramtable is null

			OPEN @CursorVar

			select @count = @@cursor_rows

			while @i < @count begin

				FETCH NEXT FROM @CursorVar into @idInst

				set @i = (select @i + 1)

				exec ExtendedUpsert @table_name, @update_list, @insert_list, @clist, @idInst

			end

			CLOSE @CursorVar

			DEALLOCATE @CursorVar

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		    CREATE PROCEDURE PurgeAuditTable @dt_start varchar(255), 

		                                     @ret_code int OUTPUT

		    AS

		    BEGIN

			    DELETE FROM t_audit 

			    WHERE dt_crt <= @dt_start 

			    IF (@@error != 0)

			    BEGIN

				    SELECT @ret_code = -99

			    END

			    ELSE

			    BEGIN

				    SELECT @ret_code = 0

			    END

			END

            
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure ReRunAbandon(@id_rerun int) as

	BEGIN TRAN



	delete from t_rerun_sessions where id_rerun = @id_rerun

	--delete from t_rerun_history where id_rerun = @id_rerun

	delete from t_rerun where id_rerun = @id_rerun



	COMMIT TRAN

            
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure ReRunAnalyze(@id_rerun int) as

	BEGIN TRAN



	update t_rerun_sessions

	  set   id_sess = au.id_sess,

		id_parent = au.id_parent_sess,

		-- TODO: id_root

		id_interval = au.id_usage_interval,

		id_view = au.id_view,

    tx_state = 'A'

		from t_acc_usage au

		inner join t_usage_interval ui on au.id_usage_interval = ui.id_interval

		where au.tx_UID = t_rerun_sessions.tx_UID

		and tx_state = 'I'

		and id_rerun = @id_rerun



	update t_rerun_sessions

	  set   tx_state = 'E', id_interval = 0

		from t_rerun_sessions

		

    inner join t_failed_transaction on t_rerun_sessions.tx_UID = t_failed_transaction.tx_FailureCompoundID

    where t_rerun_sessions.id_rerun = @id_rerun and t_failed_transaction.State = 'N'



-- TODO: do we need this?

--	update t_rerun_sessions

--	  set   tx_state = 'N'

--		where id_sess is null and tx_state = 'I' and id_rerun = @id_rerun



	exec ReRunIdentifyCompounds @id_rerun



	COMMIT TRAN

            
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      create procedure ReRunCreate(@tx_filter nvarchar(255),
			  @id_acc int,
			  @tx_comment nvarchar(255),
			  @dt_system_date datetime,
			  @id_rerun int output)
      as
      insert into t_rerun (tx_filter, tx_tag) values(@tx_filter, null)
      set @id_rerun = @@identity

      insert into t_rerun_history (id_rerun, dt_action, tx_action,
		    id_acc, tx_comment)
	      values (@id_rerun, @dt_system_date, 'CREATE', @id_acc,
		    @tx_comment)

    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure ReRunIdentifyCompounds(@id_rerun int)

as



	BEGIN TRAN



	declare @rows_changed int



	-- just so the loop will run the first time

	set @rows_changed = 1



	while @rows_changed > 0

	begin

	

		-- find children

		insert into t_rerun_sessions(id_rerun,tx_UID,id_sess,id_parent,id_root,id_interval,id_view,tx_state)

		  select @id_rerun,		-- id_rerun

			au.tx_UID,

			au.id_sess,		-- id_sess

			au.id_parent_sess,	-- id_parent

			null,			-- TODO: root

			au.id_usage_interval,	-- id_interval
			au.id_view,		-- id_view

			case ui.tx_interval_status when 'H' then 'C' else 'A' end -- c_state

			from t_acc_usage au

			inner join t_rerun_sessions rr on au.id_parent_sess = rr.id_sess

			inner join t_usage_interval ui on au.id_usage_interval = ui.id_interval

			where rr.id_rerun = @id_rerun

      and not exists (select * from t_rerun_sessions where t_rerun_sessions.id_sess = au.id_sess and t_rerun_sessions.id_rerun = @id_rerun)

	

		set @rows_changed = @@ROWCOUNT

	

		-- find parents

		insert into t_rerun_sessions(id_rerun,tx_UID,id_sess,id_parent,id_root,id_interval,id_view,tx_state)

		  select distinct @id_rerun,			-- id_rerun

			auparents.tx_UID,

			auparents.id_sess,		-- id_sess

			auparents.id_parent_sess,	-- id_parent

			null,				-- TODO: root

			auparents.id_usage_interval,	-- id_interval

			auparents.id_view,		-- id_view

			case ui.tx_interval_status when 'H' then 'C' else 'A' end -- c_state

			from t_acc_usage auchild

			inner join t_rerun_sessions rr on auchild.id_sess = rr.id_sess

			inner join t_acc_usage auparents on auparents.id_sess = auchild.id_parent_sess

			inner join t_usage_interval ui on auparents.id_usage_interval = ui.id_interval

			where rr.id_rerun = @id_rerun

      and not exists (select * from t_rerun_sessions where t_rerun_sessions.id_sess = auparents.id_sess and t_rerun_sessions.id_rerun = @id_rerun)

	

		set @rows_changed = @rows_changed + @@ROWCOUNT

	end



	-- now identify the root sessions.

	-- root sessions have no parents

	update t_rerun_sessions set id_root = id_sess

		where id_parent IS NULL

			and id_root IS NULL

			and id_rerun = @id_rerun



	-- just so the loop will run the first time

	set @rows_changed = 1



	-- find children that have a parent whose root is known.

	-- copy the parent root to the child root

	while @rows_changed > 0

	begin

		update rrchildren

			set id_root = rrparents.id_root

			from t_rerun_sessions rrchildren 

			inner join t_rerun_sessions rrparents on rrchildren.id_parent = rrparents.id_sess

			where rrchildren.id_root is null and rrparents.id_root is not null

			and rrchildren.id_rerun = @id_rerun and rrparents.id_rerun = @id_rerun



		set @rows_changed = @@ROWCOUNT

	end



	commit

            
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure ReRunRollback(@id_rerun int) as

	BEGIN TRAN



	-- values we get from the cursor

	declare @tablename varchar(255)

	declare @id_view int

	

	DECLARE tablename_cursor CURSOR FOR

	select rr.id_view, pv.nm_table_name from 

		t_prod_view pv

		inner join t_rerun_sessions rr on rr.id_view = pv.id_view

		where rr.id_rerun = @id_rerun and rr.tx_state = 'A'

		group by rr.id_view, pv.nm_table_name

	OPEN tablename_cursor

	FETCH NEXT FROM tablename_cursor into @id_view, @tablename

	WHILE @@FETCH_STATUS = 0

	BEGIN

	   declare @sql varchar(255)

	   set @sql = 'DELETE from ' + @tablename

			+ ' where id_sess in (select id_sess from t_rerun_sessions '

			+ ' where id_rerun = ' + CAST(@id_rerun AS VARCHAR)

				+ ' and id_view = ' + CAST(@id_view AS VARCHAR)

				+ ' and tx_state = ''A'''

			+ ')'

	   exec (@sql)

	   FETCH NEXT FROM tablename_cursor into @id_view, @tablename

	END

	CLOSE tablename_cursor

	DEALLOCATE tablename_cursor

	

	-- now the easier task of deleting the rows from t_acc_usage

	delete from t_acc_usage where id_sess in

	   (select id_sess from t_rerun_sessions

			where id_rerun = @id_rerun

			and tx_state = 'A')



	-- delete the errors

	delete t_failed_transaction_msix from t_failed_transaction_msix

	   inner join t_failed_transaction on 

          t_failed_transaction.id_failed_transaction = t_failed_transaction_msix.id_failed_transaction

     inner join t_rerun_sessions on

          t_rerun_sessions.tx_uid = t_failed_transaction.tx_failurecompoundid

     where t_rerun_sessions.id_rerun = @id_rerun and t_rerun_sessions.tx_state = 'E'



	delete t_failed_transaction from t_failed_transaction

     inner join t_rerun_sessions on t_failed_transaction.tx_failurecompoundid = t_rerun_sessions.tx_uid

     where t_rerun_sessions.id_rerun = @id_rerun and tx_state = 'E'



	-- update the rerun table so we know these have been backed out

	update t_rerun_sessions set tx_state = 'B' where (tx_state = 'A' or tx_state = 'E') and id_rerun = @id_rerun



	COMMIT

            
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			    create proc RemoveAdjustmentTypeProps

          @p_id_prop int

          AS

          BEGIN
            DECLARE @propid INT

            DECLARE CursorVar CURSOR STATIC

            FOR SELECT id_prop FROM T_ADJUSTMENT_TYPE_PROP WHERE id_adjustment_type =@p_id_prop

            OPEN CursorVar

            DELETE FROM T_ADJUSTMENT_TYPE_PROP WHERE id_adjustment_type =@p_id_prop

            FETCH NEXT FROM CursorVar into  @propid

            WHILE @@FETCH_STATUS = 0

            BEGIN

              exec DeleteBaseProps @propid

              FETCH NEXT FROM CursorVar into  @propid

            END

          CLOSE CursorVar

          DEALLOCATE CursorVar

          END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create proc RemoveCompositeAdjustmentDetails

			(@p_id_prop int

			)

            AS

			BEGIN

				DELETE FROM T_COMPOSITE_ADJUSTMENT WHERE id_prop =@p_id_prop

			END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					create proc RemoveCounterInstance

											@id_prop int

					AS

					BEGIN TRAN

            DELETE FROM T_COUNTER_PARAM_PREDICATE WHERE id_counter_param IN 

              (SELECT id_counter_param FROM t_counter_params WHERE id_counter = @id_prop)

						DELETE FROM T_COUNTER_PARAMS WHERE id_counter = @id_prop

						DELETE FROM T_COUNTER WHERE id_prop = @id_prop

						DELETE FROM T_BASE_PROPS WHERE id_prop = @id_prop

 					COMMIT TRAN

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					CREATE PROC RemoveCounterPropDef

											@id_prop int

					AS

					DECLARE @id_locale int

					BEGIN TRAN

						exec DeleteBaseProps @id_prop

						DELETE FROM t_counter_map 

							WHERE id_cpd = @id_prop 

						DELETE FROM t_counterpropdef WHERE id_prop = @id_prop

					COMMIT TRAN

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				create procedure RemoveGroupSubMember(

				@id_acc int,

				@p_substartdate datetime,

				@id_group int,

				@b_overrideDateCheck varchar,

        @p_systemdate datetime,

				@status int OUTPUT

				)

				as

				begin

				declare @startdate datetime

				declare @varMaxDateTime datetime

				select @varMaxDateTime = dbo.MTMaxDate()

				select @status = 0



				if (@b_overrideDateCheck = 'N')



					begin



					-- find the start date of the group subscription membership

					-- that exists at some point in the future.



						select @startdate  = vt_start from t_gsubmember

						where id_acc = @id_acc 

									AND id_group = @id_group 

									AND vt_start > @p_systemdate



						if (@startdate is null)

							begin

								select @status = -486604776

								return

							end

					end



				-- The logic here is the following:

				-- We have a parameter called p_substartdate. We need it to identify the proper record to delete,

				-- in case we have multiple participations for the same account on a group sub.

				-- But this parameter is optional to the object - so if it is not passed in, we will delete

				-- all participations of this account. Otherwise, we delete just the participation with the provided

				-- start date.

 				if (@p_substartdate = dbo.MTMaxDate())

					begin

					  delete from t_gsubmember where id_acc = @id_acc and id_group = @id_group
						update t_gsubmember_historical set tt_end = dbo.subtractsecond(@p_systemdate)

							where id_acc = @id_acc 

										and id_group = @id_group

										and tt_end = @varMaxDateTime

					end

				else

					begin

					  delete from t_gsubmember where id_acc = @id_acc and id_group = @id_group and @p_substartdate = vt_start

						update t_gsubmember_historical set tt_end = dbo.subtractsecond(@p_systemdate)

						where id_acc = @id_acc 

							and id_group = @id_group

							and tt_end = @varMaxDateTime

							and @p_substartdate = vt_start

					end

					

				-- If-else structure above is not very elegant, both options very similar, but I will not get fancy right now

				-- done



				select @status = 1



				end		 

		 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure RemoveGroupSubscription(

  @p_id_sub int,

  @p_systemdate datetime,

  @p_status int OUTPUT)



  as

  begin

    

    declare @groupID int

    declare @maxdate datetime   

    declare @nmembers int

    declare @icbID int



    set @p_status = 0



    select @groupID = id_group,@maxdate = dbo.mtmaxdate()

    from t_sub where id_sub = @p_id_sub



    select distinct @icbID = id_pricelist from t_pl_map where id_sub=@p_id_sub



    select @nmembers = count(*) from t_gsubmember_historical where id_group = @groupID

    if @nmembers > 0

      begin

        -- We don't support deleting group subs if this group sub ever had a member

        select @p_status = 1

        return

      end   

    

    delete from t_gsub_recur_map where id_group = @groupID

    delete from t_recur_value where id_sub = @p_id_sub



    -- id_po is overloaded.  If b_group == Y then id_po is

    -- the group id otherwise id_po is the product offering id.

    delete from t_acc_template_subs where id_po = @groupID and b_group = 'Y'



    -- Eventually we would need to make sure that the rules for each icb rate schedule are removed from the proper parameter tables

    delete from t_pl_map where id_sub = @p_id_sub



    update t_recur_value set tt_end = @p_systemdate 

      where id_sub = @p_id_sub and tt_end = @maxdate

    update t_sub_history set tt_end = @p_systemdate

      where tt_end = @maxdate and id_sub = @p_id_sub



    delete from t_sub where id_sub = @p_id_sub

    

      if (@icbID is not NULL)

      begin

        exec sp_DeletePricelist @icbID, @p_status output

        if @p_status <> 0 return

      end

  

    update t_group_sub set tx_name = CAST('[DELETED ' + CAST(GetDate() as nvarchar) + ']' + tx_name as nvarchar(255)) where id_group = @groupID



  end

    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						CREATE PROCEDURE RemoveMemberFromRole

						(

            @aRoleID INT,

            @aAccountID INT,

            @status  INT OUTPUT

						)

						AS

						

						Begin

						declare @accType VARCHAR(3)

						declare @polID INT

						declare @bCSRAssignableFlag VARCHAR(1)

						declare @bSubscriberAssignableFlag VARCHAR(1)

						declare @scratch INT

						select @status = 1

						SELECT @polID = id_policy FROM T_PRINCIPAL_POLICY WHERE id_acc = @aAccountID AND policy_type = 'A'

	          -- make the stored proc idempotent, only remove mapping record if

	          -- it's there

							BEGIN

	            SELECT @scratch = id_policy FROM T_POLICY_ROLE WHERE id_policy = @polID 

							AND id_role = @aRoleID 

	            if (@scratch is null)

								begin

								  RETURN

								end

							END

						DELETE FROM T_POLICY_ROLE WHERE id_policy = @polID AND id_role = @aRoleID

						END 

         
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE PROCEDURE RemoveServiceEndpointIDMapping

            @a_id_se int,

	          @a_id_corp int,

            @a_id NVARCHAR(255),

            @a_space NVARCHAR(40),

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_temp AS INT

            DECLARE @b_primary AS VARCHAR(1)

            DECLARE @a_transaction_started as int



      	    IF @@trancount = 0 BEGIN

              BEGIN TRAN

             SET @a_transaction_started = 1

            END               

            

            SET @a_status = 0

          

            --See if the mapping exists

            IF @a_id_corp IS NULL BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

            END

            ELSE BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)
            END



           IF @a_temp = 0 BEGIN

             SET @a_status = -483458955

              GOTO errHandler

            END



            --See if this is the primary mapping, if so, the new primary must be set

            IF @a_id_corp IS NULL BEGIN

              SELECT @b_primary = b_primary FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

            END

            ELSE BEGIN

              SELECT @b_primary = b_primary FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

            END

            

            --Don't allow the primary mapping to be removed

            IF @b_primary = '1' BEGIN

              SET @a_status = -483458949

              GOTO errHandler

            END



            --Remove the entry

            IF @a_id_corp IS NULL BEGIN

              DELETE FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                GOTO errHandler

              END              

            END

            ELSE BEGIN

              DELETE FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

              SET @a_status = @@error

              IF @a_status <> 0 BEGIN

                GOTO errHandler

              END

            END

            

            --If primary, select a new primary

           --IF @b_primary = '1' BEGIN

            --See if this is the only entry for this se

            --  SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se



            --If there are other mappings, make the first the 

      	     -- IF @a_temp <> 0 BEGIN

             --   UPDATE

             --     t_se_mapper

             --   SET

             --     b_primary = '1'

             --   WHERE

             --     id_se IN (SELECT TOP 1 id_se FROM t_se_mapper WHERE id_se = @a_id_se)



             --   SET @a_status = @@error

             --   IF @a_status <> 0 BEGIN

             --     GOTO errHandler

             --   END   

             -- END

            -- END



            --Commit and return

            IF @a_transaction_started = 1 BEGIN

              COMMIT TRAN

              SET @a_status = 0

              RETURN

            END

            

            errHandler:

            IF @a_transaction_started = 1 BEGIN

              ROLLBACK TRAN

            END

            RETURN

          END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure RemoveSubscription(

	@p_id_sub int,

	@p_systemdate datetime)

	as

	begin

 	declare @groupID int

	declare @maxdate datetime

  declare @icbID int

	declare @status int

	select @groupID = id_group,@maxdate = dbo.mtmaxdate()

	from t_sub where id_sub = @p_id_sub



  -- Look for an ICB pricelist and delete it if it exists

	select distinct @icbID = id_pricelist from t_pl_map where id_sub=@p_id_sub



  if (@groupID is not NULL)

		begin

		update t_gsubmember_historical set tt_end = @p_systemdate 

		where tt_end = @maxdate AND id_group = @groupID

		delete from t_gsubmember where id_group = @groupID

    delete from t_gsub_recur_map where id_group = @groupID

		-- note that we do not delete from t_group_sub

		end   

	delete from t_pl_map where id_sub = @p_id_sub

	delete from t_sub where id_sub = @p_id_sub

	update t_recur_value set tt_end = @p_systemdate 

	where id_sub = @p_id_sub and tt_end = @maxdate

	update t_sub_history set tt_end = @p_systemdate

	where tt_end = @maxdate AND id_sub = @p_id_sub



	if (@icbID is not NULL)

  begin

    exec sp_DeletePricelist @icbID, @status output

    if @status <> 0 return

  end



	end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			CREATE PROCEDURE RetrieveEnumCode
			@enum_string varchar(200)
			AS

			SELECT id_enum_data FROM t_enum_data  WHERE nm_enum_data = @enum_string
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      

			CREATE PROCEDURE ReversePayments

			  @id_interval int,

			  @id_enum int,

				@status int OUTPUT

			AS

			BEGIN

			  /*************************************************

				** Procedure Name: MTSP_REVERSE_PAYMENT_BILLING

				** 

				** Procedure Description: 

				**

				** Parameters: 

				**

				** Returns: 0 if successful

				**          -1 if fatal error occurred

				**

				** Created By: Ning Zhuang

				** Created On: 12/10/2002

				** Last Modified On: 

				**************************************************/

				SET @status = -1

	

				-- It is not necessary to use the temp table here.

				-- However, since there is currently no index on the 

				-- t_acc_uage.id_usage_interval column, to improve the 

				-- performance, the temp table is used so that the 

				-- id_sess be looked up only once for the two deletions.



				-- Delete only those records that are still in pending approval

				-- status

				SELECT pv.id_sess

				INTO #tmp

				FROM t_pv_ps_paymentscheduler pv

				INNER JOIN t_acc_usage au

				ON au.id_sess = pv.id_sess

				AND pv.c_originalintervalid = @id_interval

				AND pv.c_currentstatus = @id_enum

				IF @@ERROR <> 0 GOTO FatalError

					

				DELETE FROM t_acc_usage

				WHERE id_sess IN (SELECT id_sess FROM #tmp)

				IF @@ERROR <> 0 GOTO FatalError

				

				DELETE FROM t_pv_ps_paymentscheduler
				WHERE id_sess IN (SELECT id_sess FROM #tmp)

				IF @@ERROR <> 0 GOTO FatalError

				

				DROP TABLE #tmp

				IF @@ERROR <> 0 GOTO FatalError

				

				SET @status = 0

				RETURN 0

				

				FatalError:

			  	SET @status = -1

					RETURN -1

				END

      	
      
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE Reverse_UpdStateFromClosedToArchived (

					@system_date datetime, -- no longer used, 2-21-2003

					@dt_start datetime,

					@dt_end datetime,

					@age int,

					@status INT output)

				AS

				Begin

					declare @varMaxDateTime datetime

					-- declare @varSystemGMTDateTimeSOD datetime



					SELECT @status = -1



					-- Use the true current GMT time for the tt_ dates

					-- SELECT @varSystemGMTDateTimeSOD = dbo.mtstartofday(@system_date)



					-- Set the maxdatetime into a variable

					SELECT @varMaxDateTime = dbo.MTMaxDate()



					-- ======================================================================

					-- Identify the id_accs whose state need to be reversed to 'CL' from 'AR'



					-- Save the id_acc

					CREATE TABLE #updatestate_00 (id_acc int)

					INSERT INTO  #updatestate_00 (id_acc)

					SELECT DISTINCT ast.id_acc 

					FROM t_account_state ast

					WHERE ast.status = 'CL' 

					AND ast.vt_start BETWEEN (dbo.mtstartofday(@dt_start) - @age) AND 

					                         (DATEADD(s, -1, dbo.mtstartofday(@dt_end) + 1) - @age)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Currently have 'AR' state

					CREATE TABLE #updatestate_0 (id_acc int, vt_start datetime, tt_start datetime)

					INSERT INTO  #updatestate_0 (id_acc, vt_start, tt_start)

					SELECT tmp.id_acc, ash.vt_start, ash.tt_start

					FROM #updatestate_00 tmp

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = tmp.id_acc

						AND ash.status = 'AR'

						AND ash.tt_end = @varMaxDateTime 

						AND ash.vt_end = @varMaxDateTime 

						--AND ash.tt_start >= @system_date

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Make sure these 'AR' id_accs were immediately from the 'CL' status

					-- And save these id_accs whose state WILL be updated to a temp 

					CREATE TABLE #updatestate_1(id_acc int, tt_end datetime)

					INSERT INTO #updatestate_1 (id_acc, tt_end)

					SELECT tmp.id_acc, ash.tt_end

					FROM #updatestate_0 tmp

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = tmp.id_acc

						AND ash.status = 'CL'

						AND ash.vt_start < tmp.vt_start

						AND ash.vt_end = @varMaxDateTime 

						AND ash.tt_end = DATEADD(ms, -10, tmp.tt_start)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Reverse actions for the identified id_accs

					EXEC Reverse_UpdateStateRecordSet @status OUTPUT



					DROP TABLE #updatestate_0

					DROP TABLE #updatestate_00

					DROP TABLE #updatestate_1

					

					--select @status=1

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE Reverse_UpdateStateFromClosedToPFB (

					@system_date datetime,

					@dt_start datetime,

					@dt_end datetime,

					@status INT output)

				AS

				Begin

					declare @varMaxDateTime datetime

					declare @varSystemGMTDateTime datetime 

					declare @varSystemGMTBDateTime datetime  

					declare @varSystemGMTEDateTime datetime 



					select @status = -1



					-- Use the true current GMT time for the tt_ dates

					SELECT @varSystemGMTDateTime = @system_date



					-- Set the maxdatetime into a variable

					select @varMaxDateTime = dbo.MTMaxDate()



					select @varSystemGMTBDateTime = dbo.mtstartofday(@dt_start - 1)

					select @varSystemGMTEDateTime = DATEADD(s, -1, dbo.mtstartofday(@dt_end) + 1)



					-- ======================================================================

					-- Identify the id_accs whose state need to be reversed to 'CL' from 'PF'



					-- Save those id_acc whose state MAY be updated to a temp table

					-- (had usage between @dt_start and @dt_end)

					CREATE TABLE #updatestate_00 (id_acc int)

					INSERT INTO  #updatestate_00 (id_acc)

					SELECT DISTINCT id_acc 

					FROM (SELECT id_acc FROM t_acc_usage au

					      WHERE au.dt_crt between @varSystemGMTBDateTime and @varSystemGMTEDateTime) ttt

					-- consider adjustments as well as usage

					UNION 

					  SELECT DISTINCT id_acc_payer AS id_acc

  					FROM (SELECT id_acc_payer FROM t_adjustment_transaction ajt

					WHERE  ajt.c_status = 'A' AND 

						ajt.dt_modified between @varSystemGMTBDateTime and @varSystemGMTEDateTime) ttt

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Currently have 'PF' state

					CREATE TABLE #updatestate_0 (id_acc int, vt_start datetime, tt_start datetime)

					INSERT INTO  #updatestate_0 (id_acc, vt_start, tt_start)

					SELECT tmp.id_acc, ash.vt_start, ash.tt_start

					FROM #updatestate_00 tmp

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = tmp.id_acc

						AND ash.status = 'PF'

						AND ash.tt_end = @varMaxDateTime 

						AND ash.tt_start >= @system_date

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Make sure these 'PF' id_accs were immediately from the 'CL' status

					-- And save these id_accs whose state WILL be updated to a temp 

					CREATE TABLE #updatestate_1(id_acc int, tt_end datetime)

					INSERT INTO #updatestate_1 (id_acc, tt_end)

					SELECT tmp.id_acc, ash.tt_end

					FROM #updatestate_0 tmp

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = tmp.id_acc

						AND ash.status = 'CL'

						AND ash.vt_start < tmp.vt_start

						AND ash.vt_end = @varMaxDateTime 

						AND ash.tt_end = DATEADD(ms, -10, tmp.tt_start)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Reverse actions for the identified id_accs

					EXEC Reverse_UpdateStateRecordSet @status OUTPUT



					DROP TABLE #updatestate_0

					DROP TABLE #updatestate_00

					DROP TABLE #updatestate_1

					

					--select @status=1

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE Reverse_UpdateStateFromPFBToClosed (

					@id_interval INT,

					@ref_date DATETIME,

					@system_date datetime,

					@status INT OUTPUT)

				AS

 				BEGIN

					DECLARE @ref_date_mod DATETIME, 

						@varMaxDateTime DATETIME,

						@CurrentSystemGMTDateTime DATETIME,

						@ref_date_modSOD DATETIME



					SELECT @status = -1

					-- Set the maxdatetime into a variable

					SELECT @varMaxDateTime = dbo.MTMaxDate()

					SELECT @CurrentSystemGMTDateTime = getutcdate()



					IF (@ref_date IS NULL)

					BEGIN

						SELECT @ref_date_mod = @system_date

					END

					ELSE

					BEGIN

						SELECT @ref_date_mod = @ref_date

					END



					SELECT @ref_date_modSOD = dbo.mtstartofday(@ref_date_mod)



					-- Save those id_acc whose state MAY be reversed to a temp table 

					CREATE TABLE #updatestate_0 (id_acc int, vt_start datetime, tt_start datetime)



					INSERT INTO #updatestate_0 (id_acc, vt_start, tt_start)

					SELECT aui.id_acc, ash.vt_start, ash.tt_start

					FROM t_acc_usage_interval aui

					INNER JOIN t_usage_interval ui 

						ON ui.id_interval = aui.id_usage_interval

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = aui.id_acc

						AND ash.status = 'CL'

						AND ash.tt_end = @varMaxDateTime 

						AND ash.tt_start > ui.dt_end

					WHERE aui.id_usage_interval = @id_interval

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Make sure these 'CL' id_accs were immediately from the 'PF' status

					-- And save those id_acc whose state WILL be updated to a temp 

					CREATE TABLE #updatestate_1(id_acc int, tt_end datetime)



					INSERT INTO #updatestate_1 (id_acc, tt_end)

					SELECT tmp.id_acc, ash.tt_end

					FROM #updatestate_0 tmp

					INNER JOIN t_account_state_history ash

						ON ash.id_acc = tmp.id_acc

						AND ash.status = 'PF'

						AND ash.vt_start < tmp.vt_start

						AND ash.vt_end = @varMaxDateTime 

						AND ash.tt_end = DATEADD(ms, -10, tmp.tt_start)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- follow same pattern for t_gsubmember_historical and t_gsubmember.

					declare @varSystemGMTDateTime datetime

					SELECT @varSystemGMTDateTime = @system_date

					declare @rowcnt int

					SELECT @rowcnt = count(*)

					FROM #updatestate_1

 					if (@@error <>0)

					begin

	  					RETURN

					end



					IF @rowcnt > 0

					BEGIN

					-- ------------------------------------------------------------

					-- ------------------- reverse t_sub & t_sub_history ------------------

					-- ------------------------------------------------------------



						-- Find those records that were updated by the PFBToCL 
						-- and have not yet been updated again

						-- and thus can be reversed

						SELECT sh2.id_sub, sh2.vt_end, sh2.tt_end

						INTO #updatesub_1

						FROM (SELECT sh.id_sub, sh.tt_start

							FROM t_sub_history sh

							INNER JOIN #updatestate_1 tmp

								ON tmp.id_acc = sh.id_acc

								AND sh.vt_end = DATEADD(s, -1, @ref_date_modSOD)

								AND sh.tt_end = @varMaxDateTime

							) rev

						INNER JOIN t_sub_history sh2

							ON sh2.id_sub = rev.id_sub

							AND sh2.tt_end = DATEADD(ms, -10, rev.tt_start)

 						if (@@error <>0)

						begin

	  						RETURN

						end



						UPDATE t_sub_history

						SET tt_end = DATEADD(ms, -10, @CurrentSystemGMTDateTime)

						FROM t_sub_history sh

						INNER JOIN #updatesub_1 tmp

							ON tmp.id_sub = sh.id_sub

							AND sh.tt_end = @varMaxDateTime

 						if (@@error <>0)

						begin

	  						RETURN

						end



						INSERT INTO t_sub_history

						(id_sub,id_sub_ext,id_acc,id_po,dt_crt,id_group,vt_start,vt_end,tt_start,tt_end )

						SELECT sh.id_sub,sh.id_sub_ext,sh.id_acc,sh.id_po,

							sh.dt_crt,sh.id_group,sh.vt_start,sh.vt_end,

							@CurrentSystemGMTDateTime,@varMaxDateTime

						FROM t_sub_history sh

						INNER JOIN #updatesub_1 tmp

							ON tmp.id_sub = sh.id_sub

							AND tmp.tt_end = sh.tt_end

 						if (@@error <>0)

						begin

	  						RETURN

						end



						UPDATE t_sub

						SET vt_end = tmp.vt_end

						FROM t_sub sh

						INNER JOIN #updatesub_1 tmp

							ON tmp.id_sub = sh.id_sub

 						if (@@error <>0)

						begin

	  						RETURN

						end

					-- ------------------------------------------------------------

					-- ------------------- t_sub & t_sub_history ------------------

					-- ------------------------------------------------------------



					-- ------------------------------------------------------------

					-- ------------ reverse t_gsubmember & t_gsubmember_historical --------

					-- ------------------------------------------------------------



						-- Find those records that were updated by the PFBToCL 

						-- and have not yet been updated again

						-- and thus can be reversed

						SELECT gh2.id_group, gh2.id_acc, gh2.vt_start, gh2.vt_end, gh2.tt_end

						INTO #updategsub_1

						FROM (SELECT gh.id_group, gh.id_acc, gh.vt_start, gh.vt_end, gh.tt_start

							FROM t_gsubmember_historical gh

							INNER JOIN #updatestate_1 tmp

								ON tmp.id_acc = gh.id_acc

								AND gh.vt_end = DATEADD(s, -1, @ref_date_modSOD)

								AND gh.tt_end = @varMaxDateTime

							) rev

						INNER JOIN t_gsubmember_historical gh2

							ON gh2.id_group = rev.id_group

							AND gh2.id_acc = rev.id_acc

							AND gh2.vt_start = rev.vt_start

							AND gh2.tt_end = DATEADD(ms, -10, rev.tt_start)

 						if (@@error <>0)

						begin

	  						RETURN

						end



						UPDATE t_gsubmember_historical

						SET tt_end = DATEADD(ms, -10, @CurrentSystemGMTDateTime)

						FROM t_gsubmember_historical gh

						INNER JOIN #updategsub_1 tmp

							ON tmp.id_group = gh.id_group

							AND tmp.id_acc = gh.id_acc

							AND tmp.vt_start = gh.vt_start

							AND gh.tt_end = @varMaxDateTime

 						if (@@error <>0)

						begin

	  						RETURN

						end



						INSERT INTO t_gsubmember_historical

						(id_group, id_acc, vt_start, vt_end, tt_start, tt_end)

						SELECT gh.id_group, gh.id_acc, gh.vt_start, gh.vt_end,

							@CurrentSystemGMTDateTime,@varMaxDateTime

						FROM t_gsubmember_historical gh

						INNER JOIN #updategsub_1 tmp

							ON tmp.id_group = gh.id_group

							AND tmp.id_acc = gh.id_acc

							AND tmp.vt_start = gh.vt_start

							AND tmp.tt_end = gh.tt_end

 						if (@@error <>0)

						begin

	  						RETURN

						end



						UPDATE t_gsubmember

						SET vt_end = tmp.vt_end

						FROM t_gsubmember gh

						INNER JOIN #updategsub_1 tmp

							ON tmp.id_group = gh.id_group

							AND tmp.id_acc = gh.id_acc

							AND tmp.vt_start = gh.vt_start

 						if (@@error <>0)

						begin

	  						RETURN

						end



					-- ------------------------------------------------------------

					-- ------------ t_gsubmember & t_gsubmember_historical --------

					-- ------------------------------------------------------------

					END

					-- Reverse actions for the identified id_accs

					EXEC Reverse_UpdateStateRecordSet @status OUTPUT



					--select @status = 1

					DROP TABLE #updatestate_0

					DROP TABLE #updatestate_1



					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE Reverse_UpdateStateRecordSet (

					@status INT output)

				AS

				Begin

					declare @varMaxDateTime datetime

					declare @CurrentSystemGMTDateTime DATETIME



					select @status = -1



					-- Set the maxdatetime into a variable

					select @varMaxDateTime = dbo.MTMaxDate()



					select @CurrentSystemGMTDateTime = getutcdate()



					-- Reverse actions for the identified id_accs



					-- Remove the existing set of states for these id_accs

					DELETE FROM t_account_state

					WHERE id_acc IN (SELECT id_acc from #updatestate_1)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Add the reversed set of states back for these id_accs

					INSERT INTO t_account_state (id_acc,status,vt_start,vt_end)

					SELECT tmp.id_acc, ash.status, ash.vt_start, ash.vt_end 

					FROM t_account_state_history ash

					INNER JOIN #updatestate_1 tmp

						ON ash.id_acc = tmp.id_acc

						AND tmp.tt_end BETWEEN ash.tt_start AND ash.tt_end

 					if (@@error <>0)

					begin

	  					RETURN

					end

					

					-- Update the tt_end in history

					UPDATE t_account_state_history

					SET tt_end = DATEADD(ms, -10, @CurrentSystemGMTDateTime)

					FROM t_account_state_history ash

					INNER JOIN #updatestate_1 tmp

						ON tmp.id_acc = ash.id_acc

						AND ash.tt_end = @varMaxDateTime 

 					if (@@error <>0)

					begin

	  					RETURN

					end


					-- Record these changes to the history table

					INSERT INTO t_account_state_history

					(id_acc,status,vt_start,vt_end,tt_start,tt_end)

					SELECT tmp.id_acc, ash.status, ash.vt_start, ash.vt_end, 

						@CurrentSystemGMTDateTime, @varMaxDateTime 

					FROM t_account_state_history ash

					INNER JOIN #updatestate_1 tmp

						ON tmp.id_acc = ash.id_acc

						AND tmp.tt_end BETWEEN ash.tt_start AND ash.tt_end

 					if (@@error <>0)

					begin

	  					RETURN

					end



					select @status=1

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


      

			CREATE PROC SelectAccountsToBeDeleted

				@accountIDList varchar(255)

			AS

			set nocount on

				-- Break down into simple account IDs

				-- This block of SQL can be used as an example to get 

				-- the account IDs from the list of account IDs that are

				-- passed in

				CREATE TABLE #AccountIDsTable (

				  ID int NOT NULL,

					status int NULL,

					message varchar(255) NULL)



				PRINT '------------------------------------------------'

				PRINT '-- Start of Account Deletion Stored Procedure --'

				PRINT '------------------------------------------------'



				PRINT '-- Parsing Account IDs passed in and inserting in tmp table --'

				WHILE CHARINDEX(',', @accountIDList) > 0

				BEGIN

					INSERT INTO #AccountIDsTable (ID, status, message)

 					SELECT SUBSTRING(@accountIDList,1,(CHARINDEX(',', @accountIDList)-1)), 1, 'Okay to delete'

 					SET @accountIDList = 

 						SUBSTRING (@accountIDList, (CHARINDEX(',', @accountIDList)+1),

  										(LEN(@accountIDList) - (CHARINDEX(',', @accountIDList))))

				END

 						INSERT INTO #AccountIDsTable (ID, status, message) 

						SELECT @accountIDList, 1, 'Okay to delete'

				-- SELECT ID as one FROM #AccountIDsTable



				-- Transitive Closure (check for folder/corporation)

				PRINT '-- Inserting children (if any) into the tmp table --'

				INSERT INTO #AccountIDsTable (ID, status, message)

				SELECT DISTINCT 

				  aa.id_descendent,

					1,

					'Okay to delete'

				FROM 

				  t_account_ancestor aa INNER JOIN #AccountIDsTable tmp ON 
					tmp.ID = aa.id_ancestor AND

					aa.num_generations > 0 AND

				NOT EXISTS (

				  SELECT 

					  ID 

					FROM 

					  #AccountIDsTable tmp1 

					WHERE 

					  tmp1.ID = aa.id_descendent)



				INSERT INTO #AccountIDsTable (ID, status, message)

				SELECT DISTINCT 

				  aa.id_descendent,

					1,

					'Okay to delete'

				FROM 

				  t_account_ancestor aa where id_ancestor in (select id from  #AccountIDsTable)

					AND

					aa.num_generations > 0 AND

				NOT EXISTS (

				  SELECT 

					  ID 

					FROM 

					  #AccountIDsTable tmp1 

					WHERE 

					  tmp1.ID = aa.id_descendent)



				PRINT '-- Account does not exists check --'

				UPDATE 

					tmp

				SET

					status = 0, -- failure

					message = 'Account does not exists!'

				FROM

					#AccountIDsTable tmp

				WHERE

					not EXISTS (

						SELECT 

							1

						FROM 

							t_account acc 

						WHERE

							acc.id_acc = tmp.ID )

							

				-- SELECT * from #AccountIDsTable			

					

				-- Print out the accounts with their login names

				SELECT 

					ID as accountID, 

					nm_login as LoginName,

					message

				FROM 

					#AccountIDsTable a left outer join

					t_account_mapper b

				on

					a.ID = b.id_acc

			
			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				

				CREATE  procedure SequencedDeleteAccountOwnership

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

      

      UPDATE t_acc_ownership SET tt_end = dateadd(s, -1, @p_tt_current) 

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



      UPDATE t_acc_ownership SET tt_end = dateadd(s, -1, @p_tt_current) 

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

      UPDATE t_acc_ownership SET tt_end = dateadd(s, -1, @p_tt_current)

      WHERE id_owner = @p_id_owner AND id_owned = @p_id_owned

	    AND vt_start >= @p_vt_start AND vt_end <= @p_vt_end AND tt_end = @p_tt_max;

      IF @@error <> 0

      BEGIN

        SET @p_status = @@error

        return

      END

      end

				
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure SequencedDeleteGsubRecur 

			@p_id_group_sub int,

			@p_id_prop int,

			@p_vt_start datetime,

			@p_vt_end datetime,

			@p_tt_current datetime,

			@p_tt_max datetime,

			@p_status int OUTPUT

		as

		begin

		  SET @p_status = 0

      INSERT INTO t_gsub_recur_map(id_prop, id_group, id_acc, vt_start, vt_end, tt_start, tt_end) 

        SELECT id_prop, id_group, id_acc, dateadd(s,1,@p_vt_end) AS vt_start, vt_end, @p_tt_current as tt_start, @p_tt_max as tt_end

        FROM t_gsub_recur_map 

        WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start < @p_vt_start AND vt_end > @p_vt_end and tt_end = @p_tt_max;

      IF @@error <> 0

      BEGIN

        SET @p_status = @@error

        return

      END

			-- Valid time update becomes bi-temporal insert and update

      INSERT INTO t_gsub_recur_map(id_prop, id_group, id_acc, vt_start, vt_end, tt_start, tt_end) 

      SELECT id_prop, id_group, id_acc, vt_start, dateadd(s,-1,@p_vt_start) AS vt_end, @p_tt_current AS tt_start, @p_tt_max AS tt_end 

      FROM t_gsub_recur_map WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start < @p_vt_start AND vt_end >= @p_vt_start AND tt_end = @p_tt_max;

        UPDATE t_gsub_recur_map SET tt_end = dateadd(s, -1, @p_tt_current) WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start < @p_vt_start AND vt_end >= @p_vt_start AND tt_end = @p_tt_max;

      IF @@error <> 0

      BEGIN

        SET @p_status = @@error

        return
      END

			-- Valid time update becomes bi-temporal insert (of the modified existing history into the past history) and update (of the modified existing history)

      INSERT INTO t_gsub_recur_map(id_prop, id_group, id_acc, vt_start, vt_end, tt_start, tt_end) 

      SELECT id_prop, id_group, id_acc, dateadd(s,1,@p_vt_end) AS vt_start, vt_end, @p_tt_current AS tt_start, @p_tt_max AS tt_end 

      FROM t_gsub_recur_map WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start <= @p_vt_end AND vt_end > @p_vt_end AND tt_end = @p_tt_max;

      UPDATE t_gsub_recur_map SET tt_end = dateadd(s, -1, @p_tt_current) WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start <= @p_vt_end AND vt_end > @p_vt_end AND tt_end = @p_tt_max;

      IF @@error <> 0

      BEGIN

        SET @p_status = @@error

        return

      END

      -- Now we delete any interval contained entirely in the interval we are deleting.

      -- Transaction table delete is really an update of the tt_end

      --   [----------------]                 (interval that is being modified)

      -- [------------------------]           (interval we are deleting)

      UPDATE t_gsub_recur_map SET tt_end = dateadd(s, -1, @p_tt_current)

      WHERE id_prop = @p_id_prop AND id_group = @p_id_group_sub AND vt_start >= @p_vt_start AND vt_end <= @p_vt_end AND tt_end = @p_tt_max;

      IF @@error <> 0

      BEGIN

        SET @p_status = @@error

        return

      END

		end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



    create procedure SequencedInsertAccountOwnership

		@p_id_owner	int,

		@p_id_owned	int,

		@p_id_relation_type	int,

		@p_percent int,

		@p_vt_start	datetime,

		@p_vt_end	datetime,

		@p_tt_current	datetime,

		@p_tt_max	datetime,

		@p_status	int	OUTPUT

    as

    begin

    DECLARE	@cnt INTEGER

    SET	@p_status	=	0

    -- Check referential integrity upfront without

    -- running multiple	select queries.	I	just took

    -- this	appoach	from SequencedInsertGsubRecur	stored proc

    INSERT INTO	t_acc_ownership(id_owner,	id_owned,	id_relation_type,	n_percent,	vt_start,	vt_end,	tt_start,	tt_end)	

    SELECT owner.id_acc, owned.id_acc, ed.id_enum_data,	@p_percent,	@p_vt_start, @p_vt_end,	@p_tt_current, @p_tt_max

    FROM t_account owner

    CROSS	JOIN t_account owned

    CROSS	JOIN t_enum_data ed

    WHERE	

    owner.id_acc=@p_id_owner

    AND

    owned.id_acc=@p_id_owned

    AND

    ed.id_enum_data=@p_id_relation_type

    IF @@rowcount	<> 1 

    BEGIN

    -- No	row, look	for	specific RI	failure	to give	better message

    SELECT @cnt	=	COUNT(*) FROM	t_account	where	id_acc = @p_id_owner

    IF @cnt	=	0

    BEGIN

    -- KIOSK_ERR_ACCOUNT_NOT_FOUND

    SET	@p_status	=	-515899365

    RETURN

    END

    SELECT @cnt	=	COUNT(*) FROM	t_account	where	id_acc = @p_id_owned

    IF @cnt	=	0

    BEGIN

    -- KIOSK_ERR_ACCOUNT_NOT_FOUND

    SET	@p_status	=	-515899365

    RETURN

    END

    SELECT @cnt	=	COUNT(*) FROM	t_enum_data	where	id_enum_data = @p_id_relation_type

    IF @cnt	=	0

    BEGIN

    -- E_FAIL

    SET	@p_status	=	-2147483607

    RETURN

    END

    END

    END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


		

		create procedure SequencedInsertGsubRecur 

			@p_id_group_sub int,

			@p_id_prop int,

			@p_id_acc int,

			@p_vt_start datetime,

			@p_vt_end datetime,

			@p_tt_current datetime,

			@p_tt_max datetime,

			@p_status int OUTPUT

		as

		begin

		  DECLARE @cnt INTEGER

      SET @p_status = 0

			-- I admit this is a bit wierd, but what I am doing is detecting

			-- a referential integrity failure without generating an error.

			-- This is needed because SQL Server won't let one suppress the

			-- RI failure (and this causes an exception up in ADO land).

			-- This is a little more concise (and perhaps more performant)

			-- than multiple queries up front.

		  INSERT INTO t_gsub_recur_map(id_group, id_prop, id_acc, vt_start, vt_end, tt_start, tt_end) 

			SELECT s.id_group, r.id_prop, a.id_acc, @p_vt_start, @p_vt_end, @p_tt_current, @p_tt_max

      FROM t_sub s

      CROSS JOIN t_account a

      CROSS JOIN t_recur r

      WHERE 

      s.id_group=@p_id_group_sub

      AND

			a.id_acc=@p_id_acc

      AND

      r.id_prop=@p_id_prop



			IF @@rowcount <> 1 

      BEGIN

			-- No row, look for specific RI failure to give better message

		  SELECT @cnt = COUNT(*) FROM t_recur where id_prop = @p_id_prop

			IF @cnt = 0 

        BEGIN

          -- MTPC_CHARGE_ACCOUNT_ONLY_ON_RC

				  SET @p_status = -490799065

				  RETURN

        END

		  SELECT @cnt = COUNT(*) FROM t_account where id_acc = @p_id_acc

			IF @cnt = 0 

        BEGIN

          -- KIOSK_ERR_ACCOUNT_NOT_FOUND

				  SET @p_status = -515899365

				  RETURN

        END

		  SELECT @cnt = COUNT(*) FROM t_sub where id_group = @p_id_group_sub

			IF @cnt = 0 

        BEGIN

          -- Return E_FAIL absent better info

				  SET @p_status = -2147483607

				  RETURN

        END

			-- Return E_FAIL absent better info

      SET @p_status = -2147483607

      END



      -- post-operation business rule check (relies on rollback of work done up until this point)

      -- checks to make sure the receiver's payer's do not violate EBCR cycle constraints

      SELECT @p_status = dbo.CheckGroupReceiverEBCRConstraint(@p_tt_current, @p_id_group_sub)

      IF (@p_status = 1) -- careful... success values between the function and the sproc differ

        SET @p_status = 0



		END

		
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


				

				create procedure SequencedUpsertAccountOwnership

	    	@p_id_owner int,

		    @p_id_owned int,

		    @p_id_relation_type int,

		    @p_percent int,

		    @p_vt_start datetime,

		    @p_vt_end datetime,

		    @p_tt_current datetime,

		    @p_tt_max datetime,

		    @p_status int OUTPUT

        as

        begin

          exec SequencedDeleteAccountOwnership @p_id_owner, @p_id_owned, @p_vt_start, @p_vt_end, @p_tt_current, @p_tt_max, @p_status output

        if @p_status <> 0 return

        else

          exec SequencedInsertAccountOwnership @p_id_owner, @p_id_owned, @p_id_relation_type, 

	      @p_percent, @p_vt_start, @p_vt_end, @p_tt_current, @p_tt_max, @p_status output

        END

				
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create procedure SequencedUpsertGsubRecur 

			@p_id_group_sub int,

			@p_id_prop int,

			@p_id_acc int,

			@p_vt_start datetime,

			@p_vt_end datetime,

			@p_tt_current datetime,

			@p_tt_max datetime,

			@p_status int OUTPUT

		as

		begin

	  	  set @p_status = 0

	  	  DECLARE @p_id_po INTEGER



		  select @p_id_po = id_po 

			from t_sub sub

			inner join t_group_sub gsub

			on sub.id_group = gsub.id_group

			where gsub.id_group = @p_id_group_sub



   		       -- Check that both account and PO have the same currency

		      if (dbo.IsAccountAndPOSameCurrency(@p_id_acc, @p_id_po) = '0')

		       begin

			-- MT_ACCOUNT_PO_CURRENCY_MISMATCH

			select @p_status = -486604729

			return

		       end		  

		  exec SequencedDeleteGsubRecur @p_id_group_sub, @p_id_prop, @p_vt_start, @p_vt_end, @p_tt_current, @p_tt_max, @p_status output

      if @p_status <> 0 return

		  exec SequencedInsertGsubRecur @p_id_group_sub, @p_id_prop, @p_id_acc, @p_vt_start, @p_vt_end, @p_tt_current, @p_tt_max, @p_status output

		end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			 create procedure SetTariffs (@id_enum_tariff varchar(255),
			 @tx_currency nvarchar (255))	 
			 as
			 if not exists (select * from t_tariff where id_enum_tariff = 
			 @id_enum_tariff and tx_currency = @tx_currency) 
			 begin 
				 insert into t_tariff (id_enum_tariff, tx_currency) values (
				 @id_enum_tariff, @tx_currency)
			end
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE SoftCloseUsageIntervals

(

  @dt_now DATETIME,     -- MetraTech system date

  @id_interval INT,     -- specific usage interval to close or null for automatic detection based on grace periods

  @pretend INT,         -- if pretend is true no intervals are closed but instead are just returned

  @n_count INT OUTPUT   -- the number of usage intervals closed (or that would have been closed)

)

AS



  BEGIN TRAN



  DECLARE @closing_intervals TABLE

  (

    id_interval INT NOT NULL,

    id_usage_cycle INT NOT NULL,

    id_cycle_type INT NOT NULL,

    dt_start DATETIME NOT NULL,

    dt_end DATETIME NOT NULL,

    tx_interval_status VARCHAR(1) NOT NULL

  )



  -- determines which intervals to close

  IF (@id_interval IS NULL)

  BEGIN

    -- looks at all the intervals in the system

    INSERT INTO @closing_intervals

    SELECT ui.id_interval, ui.id_usage_cycle, uct.id_cycle_type, ui.dt_start, ui.dt_end, 'C'

    FROM t_usage_interval ui

    INNER JOIN t_usage_cycle uc ON uc.id_usage_cycle = ui.id_usage_cycle

    INNER JOIN t_usage_cycle_type uct ON uct.id_cycle_type = uc.id_cycle_type

    WHERE

      CASE WHEN uct.n_grace_period IS NOT NULL THEN

        -- take into account the cycle type's grace period

        ui.dt_end + uct.n_grace_period 

      ELSE

        -- the grace period has been disabled, so don't close this interval

        @dt_now

      END < @dt_now AND

      ui.tx_interval_status = 'O'



    SET @n_count = @@ROWCOUNT

  END

  ELSE

  BEGIN

    -- only close the given interval (regardless of grace period/end date)

    INSERT INTO @closing_intervals

    SELECT ui.id_interval, ui.id_usage_cycle, uct.id_cycle_type, ui.dt_start, ui.dt_end, ui.tx_interval_status

    FROM t_usage_interval ui

    INNER JOIN t_usage_cycle uc ON uc.id_usage_cycle = ui.id_usage_cycle

    INNER JOIN t_usage_cycle_type uct ON uct.id_cycle_type = uc.id_cycle_type

    WHERE ui.tx_interval_status = 'O'

          AND ui.id_interval = @id_interval



    SET @n_count = @@ROWCOUNT

  END



  -- only closes the intervals if pretend is false

  IF @pretend = 0

  BEGIN

    UPDATE t_usage_interval

    SET tx_interval_status = 'C'

    FROM t_usage_interval ui

    INNER JOIN @closing_intervals cui ON cui.id_interval = ui.id_interval



    -- adds instance entries for each interval that closed

    INSERT INTO t_recevent_inst(id_event,id_arg_interval,dt_arg_start,dt_arg_end,b_ignore_deps,dt_effective,tx_status)

    SELECT 

      evt.id_event id_event,

      cui.id_interval id_arg_interval,

      NULL dt_arg_start,

      NULL dt_arg_end,

      'N' b_ignore_deps,

      NULL dt_effective,

      -- the start root event is created as Succeeded

      -- the end root event is created as ReadyToRun (for auto hard close)

      -- all others are created as  NotYetRun

      CASE WHEN evt.tx_name = '_StartRoot' AND evt.tx_type = 'Root' THEN 'Succeeded' 

           WHEN evt.tx_name = '_EndRoot'   AND evt.tx_type = 'Root' THEN 'ReadyToRun' ELSE

           'NotYetRun' 

      END tx_status

    FROM @closing_intervals cui

    INNER JOIN t_usage_cycle uc ON uc.id_usage_cycle = cui.id_usage_cycle

    INNER JOIN t_recevent_schedule sch ON 

               -- the schedule is not constrained in any way

               ((sch.id_cycle_type IS NULL AND sch.id_cycle IS NULL) OR

               -- the schedule's cycle type is constrained

               (sch.id_cycle_type = uc.id_cycle_type) OR

               -- the schedule's cycle is constrained

               (sch.id_cycle = uc.id_usage_cycle))

    INNER JOIN t_recevent evt ON evt.id_event = sch.id_event

    WHERE 

      -- event must be active

      evt.dt_activated <= @dt_now and

      (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND

      -- event must be of type: root, end-of-period or checkpoint

      (evt.tx_type in ('Root', 'EndOfPeriod', 'Checkpoint')) AND

      evt.id_event NOT IN 

      (

        -- only adds instances if they are missing

        -- this guards against extra instances after closing -> reopening -> closing

        SELECT evt.id_event

        FROM @closing_intervals cui 

        INNER JOIN t_recevent_inst inst ON inst.id_arg_interval = cui.id_interval

        INNER JOIN t_recevent evt ON evt.id_event = inst.id_event

        WHERE  

          -- event must be active

          evt.dt_activated <= @dt_now and

          (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated)

      )

  END



  SELECT * FROM @closing_intervals

  COMMIT

  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE SubmitEventForExecution
(
  @dt_now DATETIME,
  @id_instance INT,
  @b_ignore_deps VARCHAR(1),
  @dt_effective DATETIME,
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @status INT OUTPUT
)
AS

BEGIN

  BEGIN TRAN

  SELECT @status = -99

  -- if the event is a checkpoint, synchronously acknowledges it
  DECLARE @isCheckpoint INT
  SELECT @isCheckpoint = 1 
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    inst.id_instance = @id_instance AND
    evt.tx_type = 'Checkpoint'

  IF (@isCheckpoint = 1)
  BEGIN
    EXEC AcknowledgeCheckpoint @dt_now, @id_instance, @b_ignore_deps, @id_acc, @tx_detail, @status OUTPUT
    IF (@status = 0)
      COMMIT
    ELSE
      ROLLBACK
    RETURN 
  END

  -- updates the run state to 'ReadyToRun' only after the run is valid
  UPDATE t_recevent_inst
  SET tx_status = 'ReadyToRun', b_ignore_deps = @b_ignore_deps, dt_effective = @dt_effective
  FROM t_recevent_inst inst INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.id_instance = @id_instance AND
    -- instance must presently be in the NotYetRun state
    -- or the ReadyToRun state (this allows updates to an already
    -- submitted instance)
    inst.tx_status IN ('NotYetRun', 'ReadyToRun') AND
    -- interval, if any, must be in the closed state
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')

  -- if the update was made, return successfully
  IF (@@ROWCOUNT = 1)
  BEGIN

    -- records the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'SubmitForExecution', @b_ignore_deps, @dt_effective, @tx_detail, @dt_now) 

    COMMIT
    SELECT @status = 0
    RETURN
  END

  --
  -- otherwise, attempts to figure out what went wrong
  --
  DECLARE @count INT
  SELECT @count = COUNT(*) FROM t_recevent_inst WHERE id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- the instance does not exist
    ROLLBACK
    SELECT @status = -1
    RETURN
  END


  SELECT @count = COUNT(*)  
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.tx_status = 'NotYetRun' AND
    inst.id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- instance is not in the proper state
    ROLLBACK
    SELECT @status = -2
    RETURN
  END

  SELECT @count = COUNT(*)  
  FROM t_recevent_inst inst
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    inst.id_instance = @id_instance AND
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')

  IF (@count = 0)
  BEGIN
    -- end-of-period instance's usage interval is not in the proper state
    ROLLBACK
    SELECT @status = -5 
    RETURN
  END

	  -- couldn't submit for some other unknown reason 
  ROLLBACK
  SELECT @status = -99 
END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE SubmitEventForReversal
(
  @dt_now DATETIME,
  @id_instance INT,
  @b_ignore_deps VARCHAR(1),
  @dt_effective DATETIME,
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @status INT OUTPUT
)
AS

BEGIN

  BEGIN TRAN

  SELECT @status = -99

  -- if the instance is a checkpoint, synchronously unacknowledges it
  DECLARE @isCheckpoint INT
  SELECT @isCheckpoint = 1 
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    inst.id_instance = @id_instance AND
    evt.tx_type = 'Checkpoint'
  IF (@isCheckpoint = 1)
  BEGIN
    EXEC UnacknowledgeCheckpoint @dt_now, @id_instance, @b_ignore_deps, @id_acc, @tx_detail, @status OUTPUT
    IF (@status = 0)
      COMMIT
    ELSE
      ROLLBACK
    RETURN 
  END

  -- updates the instance's state to 'ReadyToReverse'
  UPDATE t_recevent_inst
  SET tx_status = 'ReadyToReverse', b_ignore_deps = @b_ignore_deps, dt_effective = @dt_effective
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    evt.tx_reverse_mode IN ('Auto', 'Custom', 'NotNeeded') AND
    inst.id_instance = @id_instance AND
    -- instance must have previously succeeded or failed
    inst.tx_status IN ('Succeeded', 'Failed', 'ReadyToReverse') AND
    -- interval, if any, must be in the closed state
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')

  -- if the update was made, return successfully
  IF (@@ROWCOUNT = 1)
  BEGIN

    -- records the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'SubmitForReversal', @b_ignore_deps, @dt_effective, @tx_detail, @dt_now) 

    COMMIT
    SELECT @status = 0
    RETURN
  END

  --
  -- otherwise, attempts to figure out what went wrong
  --
  DECLARE @count INT
  SELECT @count = COUNT(*) FROM t_recevent_inst WHERE id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- instance doesn't exist at all
    ROLLBACK
    SELECT @status = -1 
    RETURN
  END

  SELECT @count = COUNT(*)
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.tx_status IN ('Succeeded', 'Failed') AND
    inst.id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- instance is not in the proper state
    ROLLBACK
    SELECT @status = -2
    RETURN
  END

  SELECT @count = COUNT(*)
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    evt.tx_reverse_mode IN ('Auto', 'Custom', 'NotNeeded') AND
    inst.id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- event is not reversible 
    ROLLBACK
    SELECT @status = -3
    RETURN
  END

  SELECT @count = COUNT(*)  
  FROM t_recevent_inst inst
  LEFT OUTER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    inst.id_instance = @id_instance AND
    (inst.id_arg_interval IS NULL OR ui.tx_interval_status = 'C')

  IF (@count = 0)
  BEGIN
    -- end-of-period instance's usage interval is not in the proper state
    ROLLBACK
    SELECT @status = -5 
    RETURN
  END

  -- couldn't submit for some other unknown reason 
  ROLLBACK
  SELECT @status = -99
END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE UnacknowledgeCheckpoint
(
  @dt_now DATETIME,
  @id_instance INT,
  @b_ignore_deps VARCHAR(1),
  @id_acc INT,
  @tx_detail nvarchar(2048),
  @status INT OUTPUT
)
AS

BEGIN

  -- NOTE: for now, just use the calling procedure's transaction

  SELECT @status = -99

  -- enforces that the checkpoints dependencies are satisfied
  IF (@b_ignore_deps = 'N')
  BEGIN
    DECLARE @unsatisfiedDeps INT
    SELECT @unsatisfiedDeps = COUNT(*) 
    FROM GetEventReversalDeps (@dt_now, @id_instance)
    WHERE tx_status <> 'NotYetRun'

    IF (@unsatisfiedDeps > 0)
    BEGIN
      SELECT @status = -4  -- deps aren't satisfied
      RETURN
    END
  END

  -- updates the checkpoint instance's state to 'NotYetRun'
  UPDATE t_recevent_inst
  SET tx_status = 'NotYetRun', b_ignore_deps = @b_ignore_deps, dt_effective = NULL
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.id_instance = @id_instance AND
    -- checkpoint must presently be in the Succeeded or Failed state
    inst.tx_status IN ('Succeeded', 'Failed') AND
    -- interval, if any, must be in the closed state
    ui.tx_interval_status = 'C'

  -- if the update was made, return successfully
  IF (@@ROWCOUNT = 1)
  BEGIN

    -- records the action
    INSERT INTO t_recevent_inst_audit(id_instance,id_acc,tx_action,b_ignore_deps,dt_effective,tx_detail,dt_crt)
    VALUES(@id_instance, @id_acc, 'Unacknowledge', @b_ignore_deps, NULL, @tx_detail, @dt_now) 

    SELECT @status = 0
    RETURN
  END

  --
  -- otherwise, attempts to figure out what went wrong
  --
  DECLARE @count INT
  SELECT @count = COUNT(*) FROM t_recevent_inst WHERE id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- the instance does not exist
    SELECT @status = -1
    RETURN
  END

  SELECT @count = COUNT(*)
  FROM t_recevent_inst inst
  INNER JOIN t_recevent evt ON evt.id_event = inst.id_event
  WHERE 
    -- event is active
    evt.dt_activated <= @dt_now AND
    (evt.dt_deactivated IS NULL OR @dt_now < evt.dt_deactivated) AND
    inst.tx_status IN ('Succeeded', 'Failed') AND
    inst.id_instance = @id_instance

  IF (@count = 0)
  BEGIN
    -- instance is not in the proper state
    SELECT @status = -2
    RETURN
  END

  SELECT @count = COUNT(*)  
  FROM t_recevent_inst inst
  INNER JOIN t_usage_interval ui ON ui.id_interval = inst.id_arg_interval
  WHERE 
    inst.id_instance = @id_instance AND
    ui.tx_interval_status = 'C'

  IF (@count = 0)
  BEGIN
    -- end-of-period instance's usage interval is not in the proper state
    SELECT @status = -5 
    RETURN
  END

  -- couldn't submit for some other unknown reason 
  SELECT @status = -99 
END
  
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


	create proc UndoAccounts @id_acc int, @nm_login nvarchar(255), @nm_space nvarchar(40) as 
         begin tran 
           if exists (select * from t_account_mapper where id_acc = @id_acc) 
             begin delete from t_account_mapper where id_acc = @id_acc end 

           if exists (select * from t_account where id_acc = @id_acc) 
             begin delete from t_account where id_acc = @id_acc end 

           if exists (select * from t_acc_usage_cycle where id_acc = @id_acc) 
             begin delete from t_acc_usage_cycle where id_acc = @id_acc end 

           if exists (select * from t_user_credentials where nm_login = @nm_login and nm_space = @nm_space)
             begin delete from t_user_credentials where nm_login = @nm_login and nm_space = @nm_space end 

           if exists (select * from t_acc_usage_interval where id_acc = @id_acc) 
             begin delete from t_acc_usage_interval where id_acc = @id_acc end 

           if exists (select * from t_site_user where nm_login = @nm_login)
			       begin delete from t_site_user where nm_login = @nm_login end 

           if exists (select * from t_av_internal where id_acc = @id_acc) 
             begin delete from t_av_internal where id_acc = @id_acc end 
         commit tran
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE UpdStateFromClosedToArchived (

					@system_date datetime,

					@dt_start datetime,

					@dt_end datetime,

					@age int,

					@status INT output)

				AS

				Begin

					declare @varMaxDateTime datetime

					declare @varSystemGMTDateTimeSOD datetime



					SELECT @status = -1



					-- Use the true current GMT time for the tt_ dates

					SELECT @varSystemGMTDateTimeSOD = dbo.mtstartofday(@system_date)



					-- Set the maxdatetime into a variable

					SELECT @varMaxDateTime = dbo.MTMaxDate()



					-- Save the id_acc

					CREATE TABLE #updatestate_1(id_acc int)

					INSERT INTO #updatestate_1 (id_acc)

					SELECT ast.id_acc 

					FROM t_account_state ast

					WHERE ast.vt_end = @varMaxDateTime

					AND ast.status = 'CL' 

					AND ast.vt_start BETWEEN (dbo.mtstartofday(@dt_start) - @age) AND 

					                         (DATEADD(s, -1, dbo.mtstartofday(@dt_end) + 1) - @age)



					EXECUTE UpdateStateRecordSet

					@system_date,

					@varSystemGMTDateTimeSOD,

					'CL', 'AR',

					@status OUTPUT



					DROP TABLE #updatestate_1

					

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE UpdateAccount (

	@p_loginname nvarchar(255),

	@p_namespace nvarchar(40),

	@p_id_acc int,

	@p_acc_state varchar(2),

	@p_acc_state_ext int,

	@p_acc_statestart datetime,

	@p_tx_password nvarchar(64),

	@p_ID_CYCLE_TYPE int,

	@p_DAY_OF_MONTH  int,

	@p_DAY_OF_WEEK int,

	@p_FIRST_DAY_OF_MONTH int,

	@p_SECOND_DAY_OF_MONTH  int,

	@p_START_DAY int,

	@p_START_MONTH int,

	@p_START_YEAR int,

	@p_id_payer int,

	@p_payer_login nvarchar(255),

  @p_payer_namespace nvarchar(40),

	@p_payer_startdate datetime,

	@p_payer_enddate datetime,

	@p_id_ancestor int,

	@p_ancestor_name nvarchar(255),

	@p_ancestor_namespace nvarchar(40),

	@p_hierarchy_movedate datetime,

	@p_systemdate datetime,

	@p_billable varchar,

	@p_enforce_same_corporation varchar,

	--pass the currency through so that CreatePaymenrRecord

	--validates it, because the currency can be updated

	@p_account_currency nvarchar(5),

	@p_status int output,

	@p_cyclechanged int output,

	@p_newcycle int output,

	@p_accountID int output,

	@p_hierarchy_path varchar(4000) output,

	--if account is being moved, select old ancestor id

	@p_old_id_ancestor_out int output,

	--if account is being moved, select new ancestor id

	@p_id_ancestor_out int output,

	@p_corporate_account_id int OUTPUT

	)

as

begin

	declare @accountID int

	declare @oldcycleID int

	declare @usagecycleID int

	declare @intervalenddate datetime

	declare @intervalID int

	declare @pc_start datetime

	declare @pc_end datetime

	declare @oldpayerstart datetime

	declare @oldpayerend datetime

	declare @oldpayer int

	declare @payerenddate datetime

	declare @payerID int

	declare @AncestorID int

	declare @payerbillable varchar(1)

	select @accountID = -1

	select @oldcycleID = 0

	select @p_status = 0

	

	set @p_old_id_ancestor_out = @p_id_ancestor

	-- step : resolve the account if necessary

	if (@p_id_acc is NULL) begin

		if (@p_loginname is not NULL and @p_namespace is not NULL) begin

			select @accountID = dbo.LookupAccount(@p_loginname,@p_namespace) 

			if (@accountID < 0) begin

				-- MTACCOUNT_RESOLUTION_FAILED

					select @p_status = -509673460

      end

		end

		else 

			begin

  	-- MTACCOUNT_RESOLUTION_FAILED

      select @p_status = -509673460

		end 

	end

	else

	begin

		select @accountID = @p_id_acc

	end 

	if (@p_status < 0) begin

		return

	end

 -- step : update the account password if necessary.  catch error

 -- if the account does not exist or the login name is not valid.  The system

 -- should check that both the login name, namespace, and password are 

 -- required to change the password.

	if (@p_loginname is not NULL and @p_namespace is not NULL and 

			@p_tx_password is not NULL)

			begin

			 update t_user_credentials set tx_password = @p_tx_password

				where nm_login = @p_loginname and nm_space = @p_namespace

			 if (@@rowcount = 0) 

	       begin

				 -- MTACCOUNT_FAILED_PASSWORD_UPDATE

				 select @p_status =  -509673461

         end

      end

			-- step : figure out if we need to update the account's billing cycle.  this

			-- may fail because the usage cycle information may not be present.

	begin

		select @usagecycleID = id_usage_cycle 

		from t_usage_cycle cycle where

	  cycle.id_cycle_type = @p_ID_CYCLE_TYPE 

		AND (@p_DAY_OF_MONTH = cycle.day_of_month or @p_DAY_OF_MONTH is NULL)

		AND (@p_DAY_OF_WEEK = cycle.day_of_week or @p_DAY_OF_WEEK is NULL)

		AND (@p_FIRST_DAY_OF_MONTH= cycle.FIRST_DAY_OF_MONTH  or @p_FIRST_DAY_OF_MONTH is NULL)

		AND (@p_SECOND_DAY_OF_MONTH = cycle.SECOND_DAY_OF_MONTH or @p_SECOND_DAY_OF_MONTH is NULL)

		AND (@p_START_DAY= cycle.START_DAY or @p_START_DAY is NULL)

		AND (@p_START_MONTH= cycle.START_MONTH or @p_START_MONTH is NULL)

		AND (@p_START_YEAR = cycle.START_YEAR or @p_START_YEAR is NULL)

    if (@usagecycleid is null)

		 begin

			SELECT @usagecycleID = -1

		 end

   end

	 select @oldcycleID = id_usage_cycle from

	 t_acc_usage_cycle where id_acc = @accountID

	 if (@oldcycleID <> @usagecycleID AND @usagecycleID <> -1)

	  begin



      -- checks to see if this account is affiliated with an EBCR charge

      SET @p_status = dbo.IsBillingCycleUpdateProhibitedByGroupEBCR(@p_systemdate, @p_id_acc)

      IF @p_status <> 1

        RETURN



      -- updates the account's billing cycle mapping

      UPDATE t_acc_usage_cycle SET id_usage_cycle = @usagecycleID

      WHERE id_acc = @accountID



      -- post-operation business rule check (relies on rollback of work done up until this point)

      -- CR9906: checks to make sure the account's new billing cycle matches all of it's and/or payee's 

      -- group subscription BCR constraints

      SELECT @p_status = ISNULL(MIN(dbo.CheckGroupMembershipCycleConstraint(@p_systemdate, groups.id_group)), 1)

      FROM 

      (

        -- gets all of the payer's payee's and/or the payee's group subscriptions

        SELECT DISTINCT gsm.id_group id_group

        FROM t_gsubmember gsm

        INNER JOIN t_payment_redirection pay ON pay.id_payee = gsm.id_acc

        WHERE 

          pay.id_payer = @accountID OR

          -- TODO: is payee criteria necessary?  

          pay.id_payee = @accountID

      ) groups

      IF @p_status <> 1

        RETURN

    

			-- deletes any mappings to intervals in the future from the old cycle

			DELETE FROM t_acc_usage_interval 

			WHERE 

        t_acc_usage_interval.id_acc = @accountID AND

        id_usage_interval IN 

        ( 

          SELECT id_interval 

          FROM t_usage_interval ui

          INNER JOIN t_acc_usage_interval aui ON 

            t_acc_usage_interval.id_acc = @accountID AND

            aui.id_usage_interval = ui.id_interval

          WHERE dt_start > @p_systemdate

			  )



      -- only one pending update is allowed at a time

			-- deletes any previous update mappings which have not yet

      -- transitioned (dt_effective is still in the future)

			DELETE FROM t_acc_usage_interval 

      WHERE 

        dt_effective IS NOT NULL AND

        id_acc = @accountID AND

        dt_effective >= @p_systemdate



      -- gets the current interval's end date

			SELECT @intervalenddate = ui.dt_end 

      FROM t_acc_usage_interval aui

			INNER JOIN t_usage_interval ui ON 

        ui.id_interval = aui.id_usage_interval AND

        @p_systemdate BETWEEN ui.dt_start AND ui.dt_end

		  WHERE aui.id_acc = @AccountID



      -- future dated accounts may not yet be associated with an interval (CR11047)

      IF @intervalenddate IS NOT NULL

      BEGIN

        -- figures out the new interval ID based on the end date of the current interval  

			  SELECT 

          @intervalID = id_interval,

          @pc_start = dt_start,

          @pc_end = dt_end 

			  FROM t_pc_interval

        WHERE

          id_cycle = @usagecycleID AND

			    dbo.addsecond(@intervalenddate) BETWEEN dt_start AND dt_end



        -- inserts the new usage interval if it doesn't already exist

        -- (needed for foreign key relationship in t_acc_usage_interval)

			  INSERT INTO t_usage_interval

        SELECT 

          @intervalID,

          @usagecycleID,

          @pc_start,

          @pc_end,

          'O'

			  WHERE @intervalID NOT IN (SELECT id_interval FROM t_usage_interval)



			  -- creates the special t_acc_usage_interval mapping to the interval of

        -- new cycle. dt_effective is set to the end of the old interval.

			  INSERT INTO t_acc_usage_interval VALUES(@accountID, @intervalID, 'O', @intervalenddate)

      END



			-- indicate that the cycle changed

			select @p_newcycle = @UsageCycleID

			select @p_cyclechanged = 1



    END

	else

  -- indicate to the caller that the cycle did not change

  begin

    select @p_cyclechanged = 0

  end

		-- step : update the payment redirection information.  Only update

		-- the payment information if the payer and payer_startdate is specified

	if ((@p_id_payer is NOT NULL OR (@p_payer_login is not NULL AND 

			@p_payer_namespace is not NULL)) AND @p_payer_startdate is NOT NULL) 

		begin

			-- resolve the paying account id if necessary

			if (@p_payer_login is not null and @p_payer_namespace is not null)

			 begin

				select @payerId = dbo.LookupAccount(@p_payer_login,@p_payer_namespace) 

				if (@payerID = -1)

				 begin 

					-- MT_CANNOT_RESOLVE_PAYING_ACCOUNT

				 select @p_status = -486604792

				 return

				 end 

			 end

			else

       begin

        select @payerID = @p_id_payer

			 end 

		-- default the payer end date to the end of the account

		if (@p_payer_enddate is NULL)

		 begin

			select @payerenddate = dbo.mtmaxdate()

		 end 

		else

		 begin 

			select @payerenddate = @p_payer_enddate

    end 

		-- find the old payment information

		select @oldpayerstart = vt_start,@oldpayerend = vt_end ,@oldpayer = id_payer

		from t_payment_redirection

		where id_payee = @AccountID and

		dbo.overlappingdaterange(vt_start,vt_end,@p_payer_startdate,dbo.mtmaxdate())=1

		-- if the new record is in range of the old record and the payer is the same as the older payer,

		-- update the record

		if (@payerID = @oldpayer) begin

	    exec UpdatePaymentRecord @payerID,@accountID,@oldpayerstart,@oldpayerend,

															 @p_payer_startdate,@payerenddate,@p_systemdate,@p_enforce_same_corporation, @p_account_currency, @p_status output

			if (@p_status <> 1)

			 begin

				return

			 end 

	  end

	  else begin

		 select @payerbillable = case when @payerID = @accountID then @p_billable else NULL end

		 exec CreatePaymentRecord @payerID,@accountID,@p_payer_startdate,@payerenddate,@payerbillable,

			@p_systemdate,'N', @p_enforce_same_corporation, @p_account_currency, @p_status output

		 if (@p_status <> 1)

		  begin

      return

			end

  	end

  end

	-- check if the account has any payees before setting the account as Non-billable.  It is important

	-- that this check take place after creating any payment redirection records	

	if dbo.IsAccountBillable(@AccountID) = '1' AND @p_billable = 'N' begin

		if dbo.DoesAccountHavePayees(@AccountID,@p_systemdate) = 'Y' begin

			-- MT_ACCOUNT_NON_BILLABLE_AND_HAS_NON_PAYING_SUBSCRIBERS

			select @p_status = -486604767

			return

		end

	end

	if (((@p_ancestor_name is not null AND @p_ancestor_namespace is not NULL)

			 or @p_id_ancestor is not null) AND @p_hierarchy_movedate is not null)

		begin	 

			if (@p_ancestor_name is not NULL and @p_ancestor_namespace is not NULL)

			 begin

				select @ancestorID = dbo.LookupAccount(@p_ancestor_name,@p_ancestor_namespace) 

				SET @p_id_ancestor_out = @ancestorID

				if (@ancestorID = -1)

				 begin

					-- MT_CANNOT_RESOLVE_HIERARCHY_ACCOUNT

					select @p_status = -486604791

					return

				 end 

       end

		  else

       begin

				select @ancestorID = @p_id_ancestor

			 end

    exec MoveAccount @ancestorID,@AccountID, @p_hierarchy_movedate, @p_enforce_same_corporation, @p_status output, @p_old_id_ancestor_out output

		if (@p_status <> 1)

		 begin

			return

		 end 

	end

	-- step : resolve the hierarchy path based on the current time

 begin

	select @p_hierarchy_path = tx_path  from t_account_ancestor
	where id_ancestor =1  and id_descendent = @AccountID and

	@p_systemdate between vt_start and vt_end

  if (@p_hierarchy_path is null)

	 begin

		select @p_hierarchy_path = '/'  

	 end

 end

 

	--resolve accounts' corporation

	--select ancestor whose direct ancestor is 1

	select @p_corporate_account_id = ancestor.id_ancestor from t_account_ancestor ancestor

	inner join t_account_ancestor corporation on corporation.id_descendent = ancestor.id_ancestor

	where

	-- ancestor.id_descendent = ancestor.id_ancestor and

	ancestor.id_descendent = @AccountID and

	corporation.id_ancestor = 1 

	AND corporation.num_generations = 1

	AND @p_systemdate  BETWEEN ancestor.vt_start and ancestor.vt_end

	AND @p_systemdate  BETWEEN corporation.vt_start and corporation.vt_end

 -- done
 select @p_accountID = @AccountID

 select @p_status = 1

 end

	
			 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE UpdateAccountState (

				  @id_acc int,

					@new_status varchar(2),

					@start_date datetime,

					@system_date datetime,

					@status int OUTPUT

					)

				AS

				BEGIN

					select @status = 0



					-- Set the maxdatetime into a variable

					declare @varMaxDateTime datetime

					declare @realstartdate datetime

					declare @realenddate datetime



					select @varMaxDateTime = dbo.MTMaxDate()



					select @realstartdate = dbo.mtstartofday(@start_date)

					select @realenddate = dbo.mtstartofday(@varMaxDateTime)



					exec CreateAccountStateRecord

					  @id_acc,

					  @new_status,

						@realstartdate,

						@realenddate,

						@system_date,

						@status output

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			create procedure UpdateBaseProps(

			@a_id_prop int,

			@a_id_lang int,

			@a_nm_name NVARCHAR(255),

			@a_nm_desc NVARCHAR(255),

			@a_nm_display_name NVARCHAR(255))

		AS

		begin

      declare @old_id_name int

      declare @id_name int

      declare @old_id_desc int

      declare @id_desc int

      declare @old_id_display_name int

      declare @id_display_name int

			select @old_id_name = n_name, @old_id_desc = n_desc, 

			@old_id_display_name = n_display_name

     	from t_base_props where id_prop = @a_id_prop

			exec UpsertDescription @a_id_lang, @a_nm_name, @old_id_name, @id_name output

			exec UpsertDescription @a_id_lang, @a_nm_desc, @old_id_desc, @id_desc output

			exec UpsertDescription @a_id_lang, @a_nm_display_name, @old_id_display_name, @id_display_name output

			UPDATE t_base_props

				SET n_name = @id_name, n_desc = @id_desc, n_display_name = @id_display_name,

						nm_name = @a_nm_name, nm_desc = @a_nm_desc, nm_display_name = @a_nm_display_name

				WHERE id_prop = @a_id_prop

		END

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure UpdateBatchStatus

	@tx_batch VARBINARY(16),

	@tx_batch_encoded varchar(24),

	@n_completed int,

	@sysdate datetime

as

declare @initialStatus char(1)

declare @finalStatus char(1)



if not exists (select * from t_batch with(updlock) where tx_batch_encoded = @tx_batch_encoded)

begin
  insert into t_batch (tx_namespace, tx_name, tx_batch, tx_batch_encoded, tx_status, n_completed, n_failed, dt_first, dt_crt)

    values ('pipeline', @tx_batch_encoded, @tx_batch, @tx_batch_encoded, 'A', 0, 0, @sysdate, @sysdate)

end



select @initialStatus = tx_status from t_batch with(updlock) where tx_batch_encoded = @tx_batch_encoded



update t_batch

  set t_batch.n_completed = t_batch.n_completed + @n_completed,

    t_batch.tx_status =

       case when ((t_batch.n_completed + t_batch.n_failed + @n_completed) = t_batch.n_expected

                   or (((t_batch.n_completed + t_batch.n_failed + @n_completed) = t_batch.n_metered) and t_batch.n_expected = 0)) then 'C'

				 when ((t_batch.n_completed + t_batch.n_failed + @n_completed) < t_batch.n_expected

                   or (((t_batch.n_completed + t_batch.n_failed + @n_completed) < t_batch.n_metered) and t_batch.n_expected = 0)) then 'A'

         when ((t_batch.n_completed + t_batch.n_failed + @n_completed) > t_batch.n_expected) and t_batch.n_expected > 0 then 'F'

         else t_batch.tx_status end,

     t_batch.dt_last = @sysdate,

     t_batch.dt_first =

       case when t_batch.n_completed = 0 then @sysdate else t_batch.dt_first end

  where tx_batch_encoded = @tx_batch_encoded



select @finalStatus = tx_status from t_batch where tx_batch_encoded = @tx_batch_encoded

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


					create proc UpdateCounterInstance
											@id_lang_code int,
                      @id_prop int,
											@counter_type_id int,
											@nm_name nvarchar(255),
											@nm_desc nvarchar(255)
					AS
					BEGIN TRAN
            exec UpdateBaseProps @id_prop, @id_lang_code, NULL, @nm_desc, NULL
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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					CREATE PROC UpdateCounterPropDef

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

					BEGIN TRAN

						exec UpdateBaseProps @id_prop, @id_lang_code, @nm_name, NULL, @nm_display_name

						UPDATE t_counterpropdef 

						SET

							nm_servicedefprop = @nm_servicedefprop,

							n_order = @n_order,

							nm_preferredcountertype = @nm_preferredcountertype

						WHERE id_prop = @id_prop

					COMMIT TRAN

         
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			CREATE PROCEDURE UpdateDataForEnumToString
			@table varchar(200),
			@column varchar(200)
			AS

			DECLARE @query varchar(1000)

			SET @query = 'update ' +@table +' set ' +@column +'= (select '
			SET @query = @query + 'REVERSE(SUBSTRING( REVERSE(nm_enum_data),1, CHARINDEX(''/'',REVERSE(nm_enum_data))-1) )'
			SET @query = @query +  ' from t_enum_data WHERE id_enum_data = ' +@column +')'

			exec (@query)
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			CREATE PROCEDURE UpdateDataForStringToEnum
			@table varchar(200),
			@column varchar(200),
			@enum_string varchar(200)
			AS

			DECLARE @query varchar(1000)
			DECLARE  @query1 varchar(1000)

			SET  @query1 = 'IF (select sum(case when ' +@column +'  is null then 0 else 1 end)  from (select distinct ' +'''' +@enum_string +'/' +'''+' +@column +' mydata, ' +@column +' from ' +@table +' ) data '
			SET  @query1 = @query1 +' where not exists (select ''x'' from  t_enum_data where nm_enum_data = data.mydata)) is not null BEGIN RAISERROR(''NULL value found for some column while converting enum to string'',16,1)  END'

			exec(  @query1)

			SET @query = 'update ' +@table +' set ' +@column +'= (select id_enum_data from t_enum_data WHERE nm_enum_data = ' +'''' +@enum_string +'/' +'''' +'+' +@column +')'

			exec (@query)
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure UpdateGroupSubMembership(

@p_id_acc int,

@p_id_sub int,

@p_id_po int,

@p_id_group int,	

@p_startdate datetime,

@p_enddate datetime,

@p_systemdate datetime,

@p_status int OUTPUT,

@p_datemodified varchar OUTPUT

)

as

begin

declare @realstartdate datetime

declare @realenddate datetime



	exec AdjustGsubMemberDates @p_id_sub,@p_startdate,@p_enddate,

	@realstartdate OUTPUT,@realenddate OUTPUT,@p_datemodified OUTPUT,@p_status OUTPUT

	if @p_status <> 1 begin

		return

	end





 -- check that the new date does not conflict with another subscription

	-- to the same product offering

select @p_status = dbo.checksubscriptionconflicts(@p_id_acc,@p_id_po,@realstartdate,@realenddate,@p_id_sub) 

if (@p_status <> 1)

	begin

	return

	end 

-- end business rule checks

begin

	exec CreateGSubMemberRecord @p_id_group,@p_id_acc,@realstartdate,@realenddate,

		@p_systemdate,@p_status OUTPUT

	if (@@error <> 0)

		begin

		-- not in group subscription, MT_GROUPSUB_ACCOUNT_NOT_IN_GROUP_SUB

		select @p_status = -486604777 

		end

-- done

end

end

		 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure UpdateGroupSubscription(

@p_id_group int,

@p_name nvarchar(255),

@p_desc nvarchar(255),

@p_startdate datetime,

@p_enddate datetime,

@p_proportional varchar,

@p_supportgroupops varchar,

@p_discountaccount int,

@p_CorporateAccount int,

@p_systemdate datetime,

@p_enforce_same_corporation varchar,

@p_status int OUTPUT,

@p_datemodified varchar OUTPUT

)

as

begin

	declare @idPO as int

	declare @idSUB as int

	declare @realenddate as datetime

	declare @oldstartdate as datetime

	declare @oldenddate as datetime

	declare @varMaxDateTime as datetime

	declare @idusagecycle int

	select @varMaxDateTime = dbo.MTMaxDate()

	



-- Section 1

	-- find the product offering ID

	select @idPO = id_po, @idusagecycle = tg.id_usage_cycle,@idSUB = t_sub.id_sub

	from t_sub 

	INNER JOIN t_group_sub tg on tg.id_group = @p_id_group

	where t_sub.id_group = @p_id_group

	



-- Section 2

	-- business rule checks

	if (@p_enddate is null)

		begin

		select @realenddate = @varMaxDateTime

		end

	else

		begin

		select @realenddate = @p_enddate

		end 

	exec CheckGroupSubBusinessRules @p_name,@p_desc,@p_startdate,@p_enddate,@idPO,

	@p_proportional,@p_discountaccount,@p_CorporateAccount,@p_id_group,@idusagecycle,@p_systemdate,@p_enforce_same_corporation, @p_status output

	if (@p_status <> 1) begin

		return

	end

	exec UpdateSub @idSUB,@p_startdate,@realenddate,'N','N',@idPO,NULL,@p_systemdate,

		@p_status OUTPUT,@p_datemodified OUTPUT

	if @p_status <> 1 begin

		return

	end

	update t_group_sub set tx_name = @p_name,tx_desc = @p_desc,b_proportional = @p_proportional,

	id_corporate_account = @p_CorporateAccount,id_discountaccount = @p_discountaccount,

	b_supportgroupops = @p_supportgroupops

	where id_group = @p_id_group

	



-- Section 3

	-- Ok, here is how I propose to do this.

	-- First of all, we will end the current history of all memberships whose duration

	-- falls, partially or completely, out of the group subscription duration.

	-- This is accomplished with the following statement.

	update t_gsubmember_historical

	set tt_end = @p_systemdate

	where id_group = @p_id_group 

		AND tt_end = @varMaxDateTime

		AND ((@p_startdate > vt_start) OR (@realenddate < vt_end))

		

-- TODO: When converting this procedure to oracle, sections 4, 5, and 6 have changed since 3.0.1

-- Section 4

	-- The next step involves inserting the new history of the memberships that were changed somehow.

	-- Except that we do not need to insert new history for the memberships that were *completely* left out

	-- of the group sub duration. Those are effectively deleted, and the last entry on t_gsubmember_history

	-- for them will have tt_end = systemdate.

	insert into t_gsubmember_historical (id_group,id_acc,vt_start,vt_end,tt_start,tt_end)

	select id_group,id_acc,

	dbo.mtmaxoftwodates(tgs.vt_start,@p_startdate),

	dbo.mtminoftwodates(tgs.vt_end,@realenddate),

	@p_systemdate,

	@varMaxDateTime

	from t_gsubmember tgs

	where tgs.id_group = @p_id_group

		and ((@p_startdate > vt_start and vt_end >= @p_startdate) OR (@realenddate < vt_end and vt_start <= @realenddate))



-- Section 5

	-- Finally, we will select the records that are still relevant to the current format of the group subscription

	-- and insert them from t_gsubmember_historical into t_gsubmember.

	

	-- First remove the old records

	delete from t_gsubmember where id_group = @p_id_group

	-- Then import the records that are relevant to this group subscription

	insert into t_gsubmember (id_group,id_acc,vt_start,vt_end)

		select id_group,id_acc,vt_start,vt_end

		from t_gsubmember_historical

		where id_group = @p_id_group and tt_end = @varMaxDateTime





  -- post-operation business rule checks (relies on rollback of work done up until this point)



  -- CR9906: check to make sure the newly added member does not violate a BCR constraint

  SELECT @p_status = dbo.CheckGroupMembershipCycleConstraint(@p_systemdate, @p_id_group)

  IF (@p_status <> 1)

    RETURN

  

  -- checks to make sure the member's payer's do not violate EBCR cycle constraints

  SELECT @p_status = dbo.CheckGroupMembershipEBCRConstraint(@p_systemdate, @p_id_group)

  IF (@p_status <> 1)

    RETURN



  -- checks to make sure the receiver's payer's do not violate EBCR cycle constraints

  SELECT @p_status = dbo.CheckGroupReceiverEBCRConstraint(@p_systemdate, @p_id_group)

end

		 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



			CREATE PROC UpdateMeteredCount

			  @tx_batch varchar(255),

				@n_metered int,

				@dt_change datetime,

				@status int output

			AS

			BEGIN

			  declare @id_batch int

				declare @batch_status char(1) 

				SELECT

				  @id_batch = id_batch,

					@batch_status = tx_status

				FROM

				  t_batch

				WHERE

				  tx_batch_encoded = @tx_batch



				UPDATE 

				  t_batch 

				SET 

				  n_metered = @n_metered 

				WHERE

				  tx_batch_encoded = @tx_batch



		    SELECT @status = 1 

				RETURN

			END

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure UpdatePaymentRecord(

@p_payer int,

@p_payee int,

@p_oldstartdate datetime,

@p_oldenddate datetime,

@p_startdate datetime,

@p_enddate datetime,

@p_systemdate datetime,

@p_enforce_same_corporation varchar,

@p_account_currency nvarchar(5),

@p_status int OUTPUT

)

as

begin

declare @realoldstartdate datetime

declare @realoldenddate datetime

declare @realstartdate datetime

declare @realenddate datetime

declare @testenddate datetime

declare @billable char

declare @varMaxDateTime datetime

declare @accstartdate datetime

declare @tempvar int

select @varMaxDateTime = dbo.MTMaxDate()

select @p_status = 0

-- normalize dates

select @realstartdate = dbo.mtstartofday(@p_startdate) 

if (@p_enddate is null)

	begin

	select @realenddate = dbo.mtstartofday(@varMaxDateTime)  

	end

else

	begin

	select @realenddate = dbo.mtstartofday(@p_enddate) 

	end

select @realoldstartdate = dbo.mtstartofday(@p_oldstartdate) 

select @realoldenddate = dbo.mtstartofday(@p_oldenddate)  

 -- business rule checks

 -- if the account is not billable, we must make sure that they are 

	-- not changing the most recent payment redirection record's end date from

	-- MTMaxDate(). 

select @testenddate = max(vt_end), @billable = c_billable from t_payment_redirection redir

INNER JOIN t_av_internal tav on tav.id_acc = @p_payee

where

redir.id_payee = @p_payee and redir.id_payer = @p_payer

group by c_billable

 -- if the enddate matches the record we are changing

if (@testenddate = @realoldstartdate AND

-- the user is changing the enddate and the account is not billable

@realoldenddate <> @realenddate AND @billable = '0')

	begin

	-- MT_PAYMENT_UDDATE_END_DATE_INVALID

	select @p_status = -486604780

	return

	end 

if (@p_oldenddate = @varMaxDateTime AND @p_enddate <> @varMaxDateTime) begin

	-- MT_CANNOT_MOVE_MODIFY_PAYMENT_ENDDATE_IF_INFINITE

	select @p_status = -486604749

	return

end

select @accstartdate = dbo.mtstartofday(dt_crt) from t_account where id_acc = @p_payee

if (@p_oldstartdate = @accstartdate AND @p_startdate <> @accstartdate) begin

	-- MT_CANNOT_MOVE_MODIFY_PAYMENT_STARTDATE_IF_ACC_STARTDATE

	select @p_status = -486604748

	return

end

-- end business rules

exec CreatePaymentRecord @p_payer,@p_payee,@realstartdate,@realenddate,NULL,@p_systemdate,'Y', @p_enforce_same_corporation, 

												@p_account_currency, @p_status output

if (@p_status is null)

	begin

	-- MT_PAYMENTUPDATE_FAILED

	select @p_status = -486604781

	end

end

		 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc UpdateProductViewProperty 
			@a_id_prod_view_prop int,
			@a_id_prod_view int,
			@a_nm_name nvarchar(255),
			@a_nm_data_type nvarchar(255),
			@a_nm_column_name nvarchar(255),
			@a_b_required char(1),
			@a_b_composite_idx char(1),
			@a_b_single_idx char(1),
      @a_b_part_of_key char(1),
      @a_b_exportable char(1),
      @a_b_filterable char(1),
      @a_b_user_visible char(1),
			@a_nm_default_value nvarchar(255),
			@a_n_prop_type int,
			@a_nm_space nvarchar(255),
			@a_nm_enum nvarchar(255),
      @a_b_core char(1)
			as
      update t_prod_view_prop 
			set
			id_prod_view=@a_id_prod_view,
			nm_name=@a_nm_name,
			nm_data_type=@a_nm_data_type,
			nm_column_name=@a_nm_column_name,
			b_required=@a_b_required,
			b_composite_idx=@a_b_composite_idx,
			b_single_idx=@a_b_single_idx,
      b_part_of_key=@a_b_part_of_key,
      b_exportable=@a_b_exportable,
      b_filterable=@a_b_filterable,
      b_user_visible=@a_b_user_visible,
			nm_default_value=@a_nm_default_value,
			n_prop_type=@a_n_prop_type,
			nm_space=@a_nm_space,
			nm_enum=@a_nm_enum,
      b_core=@a_b_core
			where
			id_prod_view_prop=@a_id_prod_view_prop
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	
			create proc UpdateProductViewPropertyFromName
			@a_id_prod_view int,
			@a_nm_name nvarchar(255),
			@a_nm_data_type nvarchar(255),
			@a_nm_column_name nvarchar(255),
			@a_b_required char(1),
			@a_b_composite_idx char(1),
			@a_b_single_idx char(1),
			@a_b_part_of_key char(1),
			@a_b_exportable char(1),
			@a_b_filterable char(1),
			@a_b_user_visible char(1),
			@a_nm_default_value nvarchar(255),
			@a_n_prop_type int,
			@a_nm_space nvarchar(255),
			@a_nm_enum nvarchar(255),
			@a_b_core char(1)
			as
			
			update t_prod_view_prop 
			set
				nm_data_type=@a_nm_data_type,
				nm_column_name=@a_nm_column_name,
				b_required=@a_b_required,
				b_composite_idx=@a_b_composite_idx,
				b_single_idx=@a_b_single_idx,
				b_part_of_key=@a_b_part_of_key,
				b_exportable=@a_b_exportable,
				b_filterable=@a_b_filterable,
				b_user_visible=@a_b_user_visible,
				nm_default_value=@a_nm_default_value,
				n_prop_type=@a_n_prop_type,
				nm_space=@a_nm_space,
				nm_enum=@a_nm_enum,
				b_core=@a_b_core
			where
				id_prod_view=@a_id_prod_view and
				nm_name=@a_nm_name
		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE PROCEDURE UpdateServiceEndpointConnection

            @a_id_se int,

            @a_date_start DATETIME,

            @a_new_start DATETIME,

            @a_new_end DATETIME,

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_temp AS int

            DECLARE @a_se_end as DATETIME

            DECLARE @a_se_start as DATETIME



            SET @a_status = 0



            --Check for the connection

            SELECT @a_temp = COUNT(*) FROM t_se_parent WHERE id_se = @a_id_se AND dt_start = @a_date_start

            IF @a_temp = 0 BEGIN

              SET @a_status = -483458963

              RETURN

            END



            --Check the end date

            IF @a_new_end IS NULL BEGIN

              SET @a_new_end = dbo.MTMaxDate()

            END

            

            --Make sure the endpoint exists for the new end date

            SELECT @a_se_end = dt_end FROM t_service_endpoint where id_se = @a_id_se

            

            IF @a_new_end > @a_se_end BEGIN

              SET @a_status = -483458951

              RETURN

            END

          

            --Check if the start date was specified, if not, get the existing start

            IF @a_new_start IS NULL BEGIN

              SELECT @a_new_start = dt_start FROM t_se_parent WHERE id_se = @a_id_se AND dt_start = @a_date_start

            END

            

            --Make sure the endpoint exists for the new start date

            SELECT @a_se_start = dt_start FROM t_service_endpoint where id_se = @a_id_se

            

            IF @a_new_start < @a_se_start BEGIN

              SET @a_status = -483458950

              RETURN

            END

          

            --Check the date

            IF @a_new_start > @a_new_end BEGIN

              SET @a_status = -483458962

              RETURN

            END

          

            --Make sure new dates won't cause any overlap

            SELECT 

              @a_temp = COUNT(*) 

            FROM 

              t_se_parent 

            WHERE 

              id_se = @a_id_se AND 

              ((dt_start BETWEEN @a_new_start AND @a_new_end) OR

              (dt_end BETWEEN @a_new_start AND @a_new_end)) AND 

              dt_Start <> @a_date_start

              

            IF @a_temp > 0 BEGIN

              SET @a_status = -483458961

              RETURN

            END 

          

            --UPDATE the date

            UPDATE t_se_parent SET dt_start = @a_new_start, dt_end = @a_new_end WHERE id_se = @a_id_se AND dt_start = @a_date_start

            SET @a_status = @@error

            IF @a_status <> 0 BEGIN

              RETURN

            END          

          END        

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE PROCEDURE UpdateServiceEndpointDates

              @a_id_se int,

            @a_date_start DATETIME,

            @a_date_end DATETIME,

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_temp AS int

            

            SET @a_status = 0            

            

            --Verify the SE exists

            SELECT @a_temp = COUNT(*) FROM t_service_endpoint WHERE id_se = @a_id_se

            IF @a_temp = 0 BEGIN

              SET @a_status = -483458960

              RETURN

            END

            

            --Check NULL start date

            IF @a_date_start IS NULL BEGIN

              SET @a_status = -483458959

              RETURN

            END

                    

            --Check for NULL date

            IF @a_date_end IS NULL BEGIN

              SET @a_date_end = dbo.MTMaxDate()

            END          

        

            --Check dates

            IF @a_date_start > @a_date_end BEGIN

              SET @a_status = -483458958

              RETURN

            END



   	    --Verify that changing the dates wouldn't hose a connection

            --Check new endpoint start date

	    SELECT @a_temp = COUNT(*) FROM t_se_parent WHERE @a_date_start > dt_start AND @a_id_se = id_se

	    IF @a_temp > 0 BEGIN

	      SET @a_status = -483458947

              RETURN

            END



            --Check new endpoint end date

            SELECT @a_temp = COUNT(*) FROM t_se_parent WHERE @a_date_end < dt_end AND @a_id_se = id_se

            IF @a_temp > 0 BEGIN

              SET @a_status = -483458946

              RETURN

            END

        

            --Ensure that the new date range won't cause an ID conflict

            SELECT

              @a_temp = COUNT(*)

            FROM

              t_se_mapper tsem

            INNER JOIN t_service_endpoint tse ON tse.id_se = tsem.id_se AND

                                                 ((tse.dt_start BETWEEN @a_date_start AND @a_date_end) OR

                                                  (@a_date_start BETWEEN tse.dt_start AND tse.dt_end))

            WHERE

              LOWER(tsem.nm_login) IN (select LOWER(nm_login) from t_se_mapper where id_se = @a_id_se)

	      AND LOWER(tsem.nm_space) IN (select LOWER(nm_space) from t_se_mapper where id_se = @a_id_se)

              AND ((tsem.id_corp IN (select id_corp from t_se_mapper where id_se = @a_id_se)) OR

                  (tsem.id_corp IS NULL AND (select id_corp from t_se_mapper where id_se = @a_id_se) IS NULL))

              AND tsem.id_se <> @a_id_se



	          IF @a_temp > 0 BEGIN

              SET @a_status = -483458944

              RETURN

            END



            --Update the end date

            UPDATE t_service_endpoint SET dt_start = @a_date_start, dt_end = @a_date_end WHERE id_se = @a_id_se

         

            SET @a_status = @@error

            IF @a_status <> 0 BEGIN

              RETURN

            END

          END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



          CREATE PROCEDURE UpdateServiceEndpointIDMapping

            @a_id_se int,

            @a_id_corp int,

            @a_id NVARCHAR(255),

            @a_space NVARCHAR(40),

            @a_new_id NVARCHAR(255),

            @a_new_space NVARCHAR(40),

            @b_primary VARCHAR(1),

            @a_status int OUTPUT

          AS 

          

          BEGIN

            DECLARE @a_temp AS INT

	          DECLARE @a_temp_primary AS VARCHAR(1)

            DECLARE @a_transaction_started as int

  

      	    IF @@trancount = 0 BEGIN

              BEGIN TRAN

              SET @a_transaction_started = 1

            END               

            

            SET @a_status = 0

            

            --Make sure the mapping exists

            IF @a_id_corp IS NULL BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

              SELECT @a_temp_primary = b_primary FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

            END

            ELSE BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

              SELECT @a_temp_primary = b_primary FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_id) AND LOWER(nm_space) = LOWER(@a_space)

            END

            

            IF @a_temp = 0 BEGIN

              SET @a_status = -483458956

              GOTO errHandler

            END



            --If the ID mapping has not changed, do nothing, prevents following check from raising error

            IF LOWER(@a_id) = LOWER(@a_new_id) BEGIN

              IF LOWER(@a_space) = LOWER(@a_new_space) BEGIN

                IF @a_temp_primary = @b_primary BEGIN

                  SET @a_status = 0

                  GOTO errHandler

                END

              END

            END



            --Make sure the new mapping does not duplicate another

 	          --Two cases to look out for

            -- 1) Just setting the primary flag for an existing mapping

            -- 2) Changing a mapping name/namespace and or primary flag

	   

            -- Only check duplicate names if changing name or namespace

            IF LOWER(@a_id) <> LOWER(@a_new_id) OR LOWER(@a_space) <> LOWER(@a_new_space) BEGIN

              IF @a_id_corp IS NULL BEGIN

            		SELECT

  		            @a_temp = COUNT(*)

  		          FROM

  		            t_se_mapper tsem

  	   	          INNER JOIN t_service_endpoint tse ON tsem.id_se = tse.id_se

  		          WHERE

   	  	          tsem.id_corp IS NULL	

  		            AND LOWER(tsem.nm_login) = LOWER(@a_new_id)

  	  	          AND LOWER(tsem.nm_space) = LOWER(@a_new_space)

  		            AND (tse.dt_start BETWEEN (select dt_start from t_service_endpoint where id_se = @a_id_se) AND (select dt_end from t_service_endpoint where id_se = @a_id_se) OR 

                      (select dt_start from t_service_endpoint where id_se = @a_id_se) BETWEEN tse.dt_start AND tse.dt_end)



--	              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_corp IS NULL AND LOWER(nm_login) = LOWER(@a_new_id) AND LOWER(nm_space) = LOWER(@a_new_space)

              END

              ELSE BEGIN

  		          SELECT

  		            @a_temp = COUNT(*)

            		FROM

            		  t_se_mapper tsem

          	   	  INNER JOIN t_service_endpoint tse ON tsem.id_se = tse.id_se

            		WHERE

           	  	  tsem.id_corp = @a_id_corp

            		  AND LOWER(tsem.nm_login) = LOWER(@a_new_id)

           	  	  AND LOWER(tsem.nm_space) = LOWER(@a_new_space)

            		  AND (tse.dt_start BETWEEN (select dt_start from t_service_endpoint where id_se = @a_id_se) AND (select dt_end from t_service_endpoint where id_se = @a_id_se) OR 

                      (select dt_start from t_service_endpoint where id_se = @a_id_se) BETWEEN tse.dt_start AND tse.dt_end)



--                SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_corp = @a_id_corp AND LOWER(nm_login) = LOWER(@a_new_id) AND LOWER(nm_space) = LOWER(@a_new_space)

              END

            END

            

            --Not changing mapping, just primary, so no problem

            ELSE BEGIN

              SET @a_temp = 0

            END



            IF @a_temp > 0 BEGIN

              SET @a_status = -483458945

              GOTO errHandler

            END

          

            --Get the number of mappings for the SE

            IF @a_id_corp IS NULL BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp IS NULL

            END

            ELSE BEGIN

              SELECT @a_temp = COUNT(*) FROM t_se_mapper WHERE id_se = @a_id_se AND id_corp = @a_id_corp

            END

           

            --If primary set, remove the old primary

            --If primary not set, make sure not unsetting the existing primary

            IF @a_temp > 1 BEGIN

              IF @a_temp_primary = '1' BEGIN

                --Do not allow removal of primary flag

                IF @b_primary <> '1' BEGIN

                  SET @a_status = -483458948

                  GOTO errHandler

                END

              END



              SET @a_temp_primary = @b_primary

              IF @b_primary = '1' BEGIN

                UPDATE t_se_mapper SET b_primary = '0' WHERE id_se = @a_id_se AND b_primary = '1'

                SET @a_status = @@error

                IF @a_status <> 0 BEGIN

                  GOTO errHandler

                END

              END

            END

            ELSE BEGIN

              --If only one item, this must be the primary

              IF @b_primary <> '1' BEGIN

                 SET @a_status = -483458948

                 GOTO errHandler

              END

            END

            

            --Now update the mapping

            UPDATE 

              t_se_mapper 

            SET 

              nm_login = @a_new_id, 

              nm_space = @a_new_space, 

              b_primary = @a_temp_primary 

            WHERE 

              id_se = @a_id_se AND

              LOWER(nm_login) = LOWER(@a_id) AND

              LOWER(nm_space) = LOWER(@a_space)

            

            SET @a_status = @@error

            IF @a_status <> 0 BEGIN

               GOTO errHandler

            END

                          

            IF @a_transaction_started = 1 BEGIN

              COMMIT TRAN

              SET @a_status = 0

              RETURN

            END

            

            errHandler:

            IF @a_transaction_started = 1 BEGIN

              ROLLBACK TRAN

            END

            RETURN

          END

        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE UpdateStateFromClosedToPFB (

					@system_date datetime,

					@dt_start datetime,

					@dt_end datetime,

					@status INT output)

				AS

				Begin

					declare @varMaxDateTime datetime

					declare @varSystemGMTDateTime datetime 

					declare @varSystemGMTBDateTime datetime  

					declare @varSystemGMTEDateTime datetime 

					declare @ref_date_mod DATETIME



					select @status = -1



					-- Use the true current GMT time for the tt_ dates

					SELECT @varSystemGMTDateTime = @system_date



					-- Set the maxdatetime into a variable

					select @varMaxDateTime = dbo.MTMaxDate()



					select @varSystemGMTBDateTime = dbo.mtstartofday(@dt_start - 1)

					select @varSystemGMTEDateTime = DATEADD(s, -1, dbo.mtstartofday(@dt_end) + 1)



					-- Save those id_acc whose state MAY be updated to a temp table (had usage the previous day)

					create table #updatestate_0 (id_acc int)

					INSERT INTO #updatestate_0 (id_acc)

					SELECT DISTINCT id_acc 

					FROM (SELECT id_acc FROM t_acc_usage au

					      WHERE au.dt_crt between @varSystemGMTBDateTime and @varSystemGMTEDateTime) ttt

					-- Also save id_acc that had adjustments in the approved state

					UNION

					SELECT DISTINCT id_acc_payer AS id_acc 

  					FROM (SELECT id_acc_payer FROM t_adjustment_transaction ajt

					      WHERE  ajt.c_status = 'A' AND 

					      ajt.dt_modified between @varSystemGMTBDateTime and @varSystemGMTEDateTime) ttt

					-- Save those id_acc whose state WILL be updated to a temp 

					-- table (has CL state)

					create table #updatestate_1(id_acc int)

					INSERT INTO #updatestate_1 (id_acc)

					SELECT tmp0.id_acc 

					FROM t_account_state ast, #updatestate_0 tmp0

					WHERE ast.id_acc = tmp0.id_acc

					AND ast.vt_end = @varMaxDateTime

					AND ast.status = 'CL'



					EXECUTE UpdateStateRecordSet

					@system_date,

					@varSystemGMTDateTime,

					'CL', 'PF',

					@status OUTPUT



					DROP TABLE #updatestate_0

					DROP TABLE #updatestate_1

					

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE proc UpdateStateFromPFBToClosed (

					@id_interval INT,

					@ref_date DATETIME,

					@system_date datetime,

					@status INT OUTPUT)

				AS

 				BEGIN

					DECLARE @ref_date_mod DATETIME, @varMaxDateTime DATETIME, @ref_date_modSOD DATETIME



					SELECT @status = -1

					-- Set the maxdatetime into a variable

					SELECT @varMaxDateTime = dbo.MTMaxDate()



					IF (@ref_date IS NULL)

					BEGIN

						SELECT @ref_date_mod = @system_date

					END

					ELSE

					BEGIN

						SELECT @ref_date_mod = @ref_date

					END



					SELECT @ref_date_modSOD = dbo.mtstartofday(@ref_date_mod)



					-- Save those id_acc whose state MAY be updated to a temp table 

					-- (had usage the previous day)

					CREATE TABLE #updatestate_0 (id_acc int)

					INSERT INTO #updatestate_0 (id_acc)

					SELECT id_acc 

					FROM t_acc_usage_interval aui

					WHERE aui.id_usage_interval = @id_interval



					-- Save those id_acc whose state WILL be updated to a temp 

					-- table (has PF state)

					CREATE TABLE #updatestate_1(id_acc int)

					INSERT INTO #updatestate_1 (id_acc)

					SELECT tmp0.id_acc 

					FROM t_account_state ast, #updatestate_0 tmp0

					WHERE ast.id_acc = tmp0.id_acc

					AND ast.vt_end = @varMaxDateTime

					AND ast.status = 'PF'

					AND @ref_date_mod BETWEEN vt_start and vt_end



					-- ------------------------------------------------------------

					-- ------------------- t_sub & t_sub_history ------------------
					-- ------------------------------------------------------------

					-- update all of the current subscriptions in t_sub_history 

					-- where the account ID matches and tt_end = dbo.mtmaxdate().  

					-- Set tt_end = systemtime.



					-- add a new record to t_sub_history where vt_end is the account 

					-- close date.

					-- Update the end date of the relevant subscriptions in t_sub 

					-- where id_acc = closed accounts

					-- Set vt_end = account close date.



					-- follow same pattern for t_gsubmember_historical and t_gsubmember.

					declare @varSystemGMTDateTime datetime

					SELECT @varSystemGMTDateTime = @system_date

					declare @rowcnt int

					SELECT @rowcnt = count(*)

					FROM #updatestate_1



					IF @rowcnt > 0

					BEGIN

					UPDATE t_sub_history 

					SET tt_end = DATEADD(ms, -10, @varSystemGMTDateTime)

					WHERE ((@ref_date_mod between vt_start and vt_end) OR 

					       (@ref_date_mod <= vt_start))

					AND tt_end = @varMaxDateTime

					AND EXISTS (SELECT NULL FROM #updatestate_1 tmp

							WHERE tmp.id_acc = t_sub_history.id_acc)



					INSERT INTO t_sub_history (

						id_sub,

						id_sub_ext,

						id_acc,

						id_po,

						dt_crt,

						id_group,

						vt_start,

						vt_end,

						tt_start,

						tt_end )

					SELECT 

						sub.id_sub,

						sub.id_sub_ext,

						sub.id_acc,

						sub.id_po,

						sub.dt_crt,

						sub.id_group,

						sub.vt_start,

						--@ref_date_mod,

						dbo.subtractsecond(@ref_date_modSOD),

						@varSystemGMTDateTime,

						@varMaxDateTime

					FROM t_sub sub, #updatestate_1 tmp

					WHERE sub.id_acc = tmp.id_acc

					AND ((@ref_date_mod between sub.vt_start and sub.vt_end) OR 

					     (@ref_date_mod <= vt_start))



					-- Update the vt_end field of the Current records for the accounts

					UPDATE t_sub 

					SET vt_end = dbo.subtractsecond(@ref_date_modSOD)

					WHERE ((@ref_date_mod between vt_start and vt_end) OR 

					       (@ref_date_mod <= vt_start))

					AND EXISTS (SELECT NULL FROM #updatestate_1 tmp

							WHERE tmp.id_acc = t_sub.id_acc)
					-- ------------------------------------------------------------

					-- ------------------- t_sub & t_sub_history ------------------

					-- ------------------------------------------------------------



					-- ------------------------------------------------------------

					-- ------------ t_gsubmember & t_gsubmember_historical --------

					-- ------------------------------------------------------------

					UPDATE t_gsubmember_historical 

					SET tt_end = DATEADD(ms, -10, @varSystemGMTDateTime)

					WHERE ((@ref_date_mod between vt_start and vt_end) OR 

					       (@ref_date_mod <= vt_start))

					AND tt_end = @varMaxDateTime

					AND EXISTS (SELECT NULL FROM #updatestate_1 tmp

							WHERE tmp.id_acc = t_gsubmember_historical.id_acc)



					INSERT INTO t_gsubmember_historical (

						id_group,

						id_acc,

						vt_start,

						vt_end,

						tt_start,

						tt_end)

					SELECT 

						gsub.id_group,

						gsub.id_acc,

						gsub.vt_start,

						dbo.subtractsecond(@ref_date_modSOD),

						@varSystemGMTDateTime,

						@varMaxDateTime

					FROM t_gsubmember gsub, #updatestate_1 tmp

					WHERE gsub.id_acc = tmp.id_acc

					AND ((@ref_date_mod between vt_start and vt_end) OR 

				       (@ref_date_mod <= vt_start))



					-- Update the vt_end field of the Current records for the accounts

					UPDATE t_gsubmember 

					SET vt_end = dbo.subtractsecond(@ref_date_modSOD)

					WHERE ((@ref_date_mod between vt_start and vt_end) OR 

					       (@ref_date_mod <= vt_start))

					AND EXISTS (SELECT NULL FROM #updatestate_1 tmp

							WHERE tmp.id_acc = t_gsubmember.id_acc)

					END

					-- ------------------------------------------------------------

					-- ------------ t_gsubmember & t_gsubmember_historical --------

					-- ------------------------------------------------------------

					EXECUTE UpdateStateRecordSet

					@system_date,

					@ref_date_mod,

					'PF', 'CL',

					@status OUTPUT



					DROP TABLE #updatestate_0

					DROP TABLE #updatestate_1



					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



				CREATE PROCEDURE UpdateStateRecordSet (

					@system_date DATETIME,

					@start_date_mod DATETIME,

					@from_status CHAR(2),

					@to_status CHAR(2),

					@status INT OUTPUT)

				AS

 				BEGIN

					DECLARE @varMaxDateTime DATETIME,

						@varSystemGMTDateTime DATETIME,

						@varSystemGMTDateTimeSOD DATETIME,

						@start_date_modSOD DATETIME

					DECLARE @table_formerge TABLE (id_acc INT, status CHAR(2), vt_start DATETIME) 



					-- Set the maxdatetime into a variable

					SELECT @varMaxDateTime = dbo.MTMaxDate()

					-- Use the true current GMT time for the tt_ dates

					SELECT @varSystemGMTDateTime = @system_date

					SELECT @varSystemGMTDateTimeSOD = dbo.mtstartofday(@system_date)

					SELECT @start_date_modSOD = dbo.mtstartofday(@start_date_mod)

					SELECT @status = -1



					--CREATE TABLE #updatestate_1 (id_acc INT)



					-- Update the tt_end field of the t_account_state_history record 

					-- for the accounts

					UPDATE t_account_state_history 

					SET tt_end = DATEADD(ms, -10, @varSystemGMTDateTime)

					WHERE vt_end = @varMaxDateTime

					AND tt_end = @varMaxDateTime

					AND status = @from_status

					AND EXISTS (SELECT NULL FROM #updatestate_1 tmp 

						    WHERE tmp.id_acc = t_account_state_history.id_acc)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Insert the to-be-updated Current records into the History table 

					-- for the accounts, exclude the one that needs to be override

					INSERT INTO t_account_state_history

					SELECT 

						ast.id_acc,

						ast.status,

						ast.vt_start,

						dbo.subtractsecond(@start_date_modSOD),

						@varSystemGMTDateTime,

						@varMaxDateTime

					FROM t_account_state ast, #updatestate_1 tmp

					WHERE ast.id_acc = tmp.id_acc

					AND ast.vt_end = @varMaxDateTime

					AND ast.status = @from_status

					AND @start_date_mod between ast.vt_start and ast.vt_end

					-- exclude the one that needs to be override

					AND ast.vt_start <> @start_date_modSOD

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Update the vt_end field of the Current records for the accounts

					-- when the new status is on a different day

					UPDATE t_account_state 

					SET vt_end = dbo.subtractsecond(@start_date_modSOD)

					FROM t_account_state, #updatestate_1 tmp

					WHERE tmp.id_acc = t_account_state.id_acc

					AND t_account_state.vt_end = @varMaxDateTime

					AND t_account_state.status = @from_status 

					AND @start_date_mod between t_account_state.vt_start and t_account_state.vt_end

					AND t_account_state.vt_start <> @start_date_modSOD

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- MERGE: Identify if needs to be merged with the previous record 

					INSERT INTO @table_formerge

					SELECT tmp.id_acc, status, vt_start

					FROM t_account_state ast, #updatestate_1 tmp

					WHERE ast.id_acc = tmp.id_acc

					AND ast.status = @to_status

					AND ast.vt_end = dateadd(second,-1,@start_date_modSOD)

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- MERGE: Remove the to-be-merged records

					DELETE t_account_state

					FROM t_account_state, @table_formerge mrg

					WHERE t_account_state.id_acc = mrg.id_acc

					AND t_account_state.status = mrg.status

					AND t_account_state.vt_start = mrg.vt_start

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Remove the Current records for the accounts if the new 

					-- status is from the same day

					DELETE t_account_state

					FROM t_account_state, #updatestate_1 tmp

					WHERE t_account_state.id_acc = tmp.id_acc

					AND t_account_state.vt_end = @varMaxDateTime

					AND t_account_state.status = @from_status

					AND t_account_state.vt_start = @start_date_modSOD

 					if (@@error <>0)

					begin

	  					RETURN

					end



					DELETE t_account_state_history

					FROM t_account_state_history, @table_formerge mrg

					WHERE t_account_state_history.id_acc = mrg.id_acc

					AND t_account_state_history.status = mrg.status

					AND t_account_state_history.vt_start = mrg.vt_start

					AND t_account_state_history.tt_end = @varMaxDateTime

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Insert new records to the Current table

					INSERT INTO t_account_state (

						id_acc,

						status,

						vt_start,

						vt_end)

					SELECT tmp.id_acc,

						@to_status,

						CASE WHEN mrg.vt_start IS NULL 

							THEN @start_date_modSOD

							ELSE mrg.vt_start END,

						@varMaxDateTime

					FROM #updatestate_1 tmp LEFT OUTER JOIN @table_formerge mrg

						ON mrg.id_acc = tmp.id_acc

 					if (@@error <>0)

					begin

	  					RETURN

					end



					-- Insert new records to the History table



					INSERT INTO t_account_state_history (

						id_acc,

						status,

						vt_start,

						vt_end,

						tt_start,

						tt_end)

					SELECT tmp.id_acc,

						@to_status,

						CASE WHEN mrg.vt_start IS NULL 

							THEN @start_date_modSOD

							ELSE mrg.vt_start END,

						@varMaxDateTime,

						@varSystemGMTDateTime,

						@varMaxDateTime

					FROM #updatestate_1 tmp LEFT OUTER JOIN @table_formerge mrg

						ON mrg.id_acc = tmp.id_acc

 					if (@@error <>0)

					begin

	  					RETURN

					end



					select @status = 1

					RETURN

				END

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create proc UpsertDescription

			@id_lang_code int,

			@a_nm_desc NVARCHAR(255),

			@a_id_desc_in int, 

			@a_id_desc int OUTPUT

		AS

		begin

      declare @var int

			IF (@a_id_desc_in IS NOT NULL and @a_id_desc_in <> 0)

				BEGIN

					-- there was a previous entry

				UPDATE t_description

					SET

						tx_desc = @a_nm_desc

					WHERE

						id_desc = @a_id_desc_in AND id_lang_code = @id_lang_code



					IF (@@RowCount=0)

					BEGIN

					  -- The entry didn't previously exist for this language code

						INSERT INTO t_description

							(id_desc, id_lang_code, tx_desc)

						VALUES

							(@a_id_desc_in, @id_lang_code, @a_nm_desc)

					END



					-- continue to use old ID

					select @a_id_desc = @a_id_desc_in

				END



			ELSE

			  begin

				-- there was no previous entry

				IF (@a_nm_desc IS NULL)

				 begin

					-- no new entry

					select @a_id_desc = 0

				 end

				 ELSE

					BEGIN

						-- generate a new ID to use

						INSERT INTO t_mt_id default values

						select @a_id_desc = @@identity



						INSERT INTO t_description

							(id_desc, id_lang_code, tx_desc)

						VALUES

							(@a_id_desc, @id_lang_code, @a_nm_desc)

					 END

			END 

			end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE UpsertListener @tx_machine NVARCHAR(128), @id_listener INT OUTPUT

AS

BEGIN

  UPDATE t_listener 

	SET b_online = '1'

	WHERE tx_machine = @tx_machine



  IF (@@ROWCOUNT = 0)

	  INSERT INTO t_listener (tx_machine, b_online) VALUES (@tx_machine, '1')



  SELECT @id_listener = id_listener 

  FROM t_listener

  WHERE tx_machine = @tx_machine

END

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE UpsertPipeline @tx_machine nvarchar(128), @id_pipeline int OUTPUT

AS

BEGIN

      update t_pipeline 

			set 

			b_online = '1'

			where

			tx_machine = @tx_machine



			if (@@ROWCOUNT = 0)

			insert into t_pipeline(tx_machine, b_online, b_paused, b_processing) values (@tx_machine, '1', '0', '0')



			select @id_pipeline=id_pipeline from t_pipeline where tx_machine=@tx_machine

END

			
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

Create procedure account_bucket_mapping

(@interval int,

@hash int,

@result nvarchar(4000) output)

as

declare @sql nvarchar(4000)

if not exists (select 1 from t_usage_interval where id_interval=@interval and tx_interval_status = 'H')

BEGIN

	set @result = '4000001-account_bucket_mapping operation failed-->Interval does not exist or is not Hard Closed'

	return

END

if exists (select 1 from t_acc_bucket_map where id_usage_interval=@interval)

BEGIN

	set @result = '4000002-account_bucket_mapping operation failed-->Mapping already exists'

	return

END

begin tran

select @sql = 'insert into t_acc_bucket_map(id_usage_interval,id_acc,bucket,status,tt_start,tt_end) 

		select distinct id_usage_interval,id_acc,id_acc%' + cast(@hash as nvarchar(10)) + ',''U'',getdate(),

		dbo.mtmaxdate() from t_acc_usage where id_usage_interval =' + cast(@interval as nvarchar(10))

exec (@sql)

if (@@error <> 0) 

begin

	set @result = '4000003-account_bucket_mapping operation failed-->error in insert into t_acc_bucket_map'

	rollback tran

	return

end

set @result = '0-account_bucket_mapping operation successful'

commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE procedure addsubscriptionbase(

@p_id_acc int,

@p_id_group int,

@p_id_po int,

@p_startdate datetime,

@p_enddate datetime,

@p_GUID varbinary(16),

@p_systemdate datetime,

@p_id_sub int,

@p_status int output,

@p_datemodified varchar output)

as

declare @varSystemGMTDateTime datetime,

				@varMaxDateTime datetime,

				@realstartdate datetime,

				@realenddate datetime,

				@realguid varbinary(16),

        @po_cycle integer,

        @cycle_type integer

begin

	select @varMaxDateTime = dbo.mtmaxdate()  



	select @p_status = 0

	exec AdjustSubDates @p_id_po,@p_startdate,@p_enddate,@realstartdate OUTPUT,

		@realenddate OUTPUT,@p_datemodified OUTPUT,@p_status OUTPUT

	

	if @p_status <> 1 begin

		return

	end



	-- Check availability of the product offering

	select @p_status = case 

		when ta.n_begintype = 0 or ta.n_endtype = 0 then -289472451

		when ta.n_begintype <> 0 and ta.dt_start > @p_systemdate then -289472449

		when ta.n_endtype <> 0 and ta.dt_end < @p_systemdate then -289472450

		else 1

		end 

	from t_po po 

	inner join t_effectivedate ta on po.id_avail=ta.id_eff_date

	where

	po.id_po=@p_id_po



	if (@p_status <> 1) begin

    return

	end



if (@p_id_acc is not NULL) begin

	select @p_status = dbo.CheckSubscriptionConflicts(@p_id_acc,@p_id_po,@realstartdate,@realenddate,-1)

	if (@p_status <> 1) begin

    return

	end



  -- fetches the cycle type of the subscriber (payee)

  SELECT 

  @cycle_type = id_cycle_type

  FROM t_acc_usage_cycle

  INNER JOIN t_usage_cycle on t_usage_cycle.id_usage_cycle = t_acc_usage_cycle.id_usage_cycle 

  WHERE 

  t_acc_usage_cycle.id_acc = @p_id_acc



  -- fetch the cycle of the PI's on the PO

  select @po_cycle = dbo.poConstrainedCycleType(@p_id_po)



  if @po_cycle <> 0 begin

	  if @cycle_type <> @po_cycle begin

		  -- MTPCUSER_CYCLE_CONFLICTS_WITH_ACCOUNT_CYCLE

		  select @p_status = -289472464

      return

	  end

  end



  -- checks the subscriber's billing cycle for EBCR cycle conflicts

  IF EXISTS 

  (

    SELECT NULL

    FROM t_pl_map plmap

    INNER JOIN t_recur rc ON rc.id_prop = plmap.id_pi_template OR

                             rc.id_prop = plmap.id_pi_instance

    WHERE 

      rc.tx_cycle_mode = 'EBCR' AND

      (dbo.CheckEBCRCycleTypeCompatibility(rc.id_cycle_type, @cycle_type) = 0) AND

      plmap.id_po = @p_id_po

  )

  BEGIN

    -- MTPCUSER_EBCR_CYCLE_CONFLICTS_WITH_ACCOUNT_CYCLE

    SELECT @p_status = -289472444

    RETURN

  END



end 



if (@p_GUID is NULL)

	begin

	select @realguid = newid()
	end

else

	begin

	select @realguid = @p_GUID

	end 

	exec CreateSubscriptionRecord @p_id_sub,@realguid,@p_id_acc,

		@p_id_group,@p_id_po,@p_systemdate,@realstartdate,@realenddate,

		@p_systemdate,@status = @p_status OUTPUT

end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

Create  procedure archive_delete

			(

			@interval int,

			@result nvarchar(4000) output

			)

		as

		--How to run this stored procedure

--		declare @result nvarchar(2000)

--		exec archive_delete @interval=11931,@result=@result output

--		print @result

		set nocount on

		declare @sql1 nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @var1 nvarchar(1000)

		declare @vartime datetime

		declare @maxtime datetime

		declare @acc int

		declare	@servername nvarchar(100)

		declare	@dbname nvarchar(100)



		--Checking the following Business rules

		--Interval should exist and in export state

		--Interval should not be already archived

		if  not exists (select top 1 * from t_archive where id_interval=@interval and status ='E' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '2000001-archive operation failed-->Interval is not exported..run the archive_export procedure'

			return

		end

		if  exists (select top 1 * from t_archive where id_interval=@interval and status ='A' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '2000002-archive operation failed-->Interval is already archived'

			return

		end

		if  exists (select top 1 * from t_archive where id_interval=@interval and status ='D' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '2000003-archive operation failed-->Interval is Dearchived..run the trash procedure'

			return

		end



		select @servername = @@servername

		select @dbname = db_name()

		select @vartime = getdate()

		select @maxtime = dbo.mtmaxdate()



		if object_id('tempdb..tmp_t_acc_usage') is not null

		drop table tempdb..tmp_t_acc_usage

		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction

		select @sql1 = N'SELECT id_sess into tempdb..tmp_t_acc_usage FROM ' + @dbname + '..t_acc_usage where id_usage_interval=' + cast (@interval as varchar(10))

		exec (@sql1)

		create unique clustered index idx_tmp_t_acc_usage on tempdb..tmp_t_acc_usage(id_sess)

		select @sql1 = N'SELECT id_adj_trx into tempdb..tmp_t_adjustment_transaction FROM ' + @dbname + '..t_adjustment_transaction where id_usage_interval=' + cast (@interval as varchar(10)) + N' order by id_sess'

		exec (@sql1)

		create unique clustered index idx_tmp_t_adjustment_transaction on tempdb..tmp_t_adjustment_transaction(id_adj_trx)

		

		declare  c1 cursor fast_forward for select distinct id_view from t_acc_usage where 

		id_usage_interval = @interval

		create table #adjustment(name nvarchar(2000))

		declare c2 cursor fast_forward for select table_name from information_schema.tables where 

		table_name like 't_aj_%' and table_name not in ('T_AJ_TEMPLATE_REASON_CODE_MAP','t_aj_type_applic_map')

		open c2

		fetch next from c2 into @var1

		while (@@fetch_status = 0)

		begin

		--Get the name of t_aj tables that have usage in this interval

		set @sql1 = N'if exists

				(select 1 from ' + @var1 + ' where id_adjustment in 

				(select id_adj_trx from t_adjustment_transaction where id_usage_interval = ' + cast(@interval as varchar(10)) + N')) 

				insert into #adjustment values(''' + @var1 + ''')'

				EXEC sp_executesql @sql1

		SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

				EXEC sp_executesql @sql1

		fetch next from c2 into @var1

		end

		close c2

		deallocate c2



		begin tran

			select distinct id_view into #id_view from t_acc_usage where id_usage_interval = @interval

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1 --and nm_table_name not like '%temp%'
				--Delete from product view tables

				select @sql1 = N'delete pv FROM ' + @dbname + '..' + @tab1 + 

				' pv inner join tempdb..tmp_t_acc_usage tmp on pv.id_sess = tmp.id_sess'

				exec (@sql1)

				if (@@error <> 0)

				begin

					set @result = '2000004-archive operation failed-->Error in product view Delete operation'

					rollback tran

					close c1

					deallocate c1

					return

				end

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1



			declare  c1 cursor fast_forward for select distinct name from #adjustment

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				--Delete from t_aj tables

				select @sql1 = N'delete aj FROM ' + @dbname + '..' + @var1 +  

						' aj inner join tempdb..tmp_t_adjustment_transaction tmp on aj.id_adjustment = tmp.id_adj_trx'

				exec (@sql1)

				if (@@error <> 0)

				begin

					set @result = '2000005-archive operation failed-->Error in t_aj tables Delete operation'

					rollback tran

					close c1

					deallocate c1

					return

				end

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1



			--Delete from t_adjustment_transaction table

			select @sql1 = N'delete FROM ' + @dbname + '..t_adjustment_transaction where id_usage_interval=' + cast (@interval as varchar(10))

			exec (@sql1)

			if (@@error <> 0)

			begin

				set @result = '2000006-Error in Delete from t_adjustment_transaction table'

				rollback tran

				return

			end



			--Checking for post bill adjustments that have corresponding usage archived

			create table #t_adjustment_transaction_temp(id_sess int)

			select @sql1 =  N'insert into #t_adjustment_transaction_temp select id_sess 

						from t_adjustment_transaction where n_adjustmenttype=1 

						and id_sess in (select id_sess from t_acc_usage where id_usage_interval=' + cast(@interval as varchar(10)) + ' )'

			execute (@sql1)

			if (@@error <> 0)

			begin

				set @result = '2000007-archive operation failed-->Error in create adjustment temp table operation'

				rollback tran

				return

			end

			IF ((SELECT count(*) FROM #t_adjustment_transaction_temp) > 0) 

			begin

				update t_adjustment_transaction set archive_sess=id_sess,id_sess=null

				where id_sess in (select id_sess from #t_adjustment_transaction_temp)

				if (@@error <> 0)

				begin

					set @result = '2000008-archive operation failed-->Error in Update adjustment operation'

					rollback tran

					return

				end

			end



			--Delete from t_acc_usage table

			select @sql1 = N'delete au FROM ' + @dbname + '..t_acc_usage au inner join tempdb..tmp_t_acc_usage

					tmp on au.id_sess = tmp.id_sess'

			exec (@sql1)

			if (@@error <> 0)

			begin

				set @result = '2000009-archive operation failed-->Error in Delete t_acc_usage operation'

				rollback tran

				return

			end



			update t_archive 

			set tt_end = dateadd(s,-1,@vartime)

			where id_interval=@interval 

			and ( 

			id_view in (select id_view from #id_view) 

			or

			adj_name in (select distinct name from #adjustment) 

			)

			and status='E' 

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0)

			begin

				set @result = '2000010-archive operation failed-->Error in update t_archive table'

				rollback tran

				return

			end

			insert into t_archive 

			select @interval,id_view,null,'A',@vartime,@maxtime from #id_view

			union all

			select distinct @interval,null,name,'A',@vartime,@maxtime from #adjustment

			if (@@error <> 0)

			begin

				set @result = '2000011-archive operation failed-->Error in insert t_archive table'

				rollback tran

				return

			end

			update t_acc_bucket_map 

			set tt_end = dateadd(s,-1,@vartime)

			where id_usage_interval=@interval 

			and status = 'E' 

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0)

			begin

				set @result = '2000012-archive operation failed-->Error in update t_acc_bucket_map table'

				rollback tran

				return

			end

			insert into t_acc_bucket_map (id_usage_interval,id_acc,bucket,status,tt_start,tt_end) 

			select @interval,id_acc,bucket,'A',@vartime,@maxtime from t_acc_bucket_map

			where id_usage_interval=@interval

			and status ='E' 

			and tt_end=dateadd(s,-1,@vartime)

			if (@@error <> 0)

			begin

				set @result = '2000013-archive operation failed-->Error in insert into t_acc_bucket_map table'

				rollback tran

				return

			end



		if object_id('tempdb..tmp_t_acc_usage') is not null

		drop table tempdb..tmp_t_acc_usage

		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction

			

		set @result = '0-archive_delete operation successful'

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

Create procedure archive_export 

			(

			@interval int,

			@path nvarchar(1000),

			@result nvarchar(4000) output

			)

		as

		--How to run this stored procedure

--		declare @result nvarchar(2000)

--		exec archive @interval=11931,@path='c:\backup\archive',@result=@result output

--		print @result

		set nocount on

		declare @sql1 nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @var1 nvarchar(1000)

		declare @vartime datetime

		declare @maxtime datetime

		declare @acc int

		declare	@servername nvarchar(100)

		declare	@dbname nvarchar(100)



		--Checking the following Business rules

		--Interval should exist and hard-closed

		--Interval should not be already archived

		if not exists (select 1 from t_usage_interval where id_interval=@interval and tx_interval_status = 'H')

		BEGIN

			set @result = '1000001-archive operation failed-->Interval does not exist or is not Hard Closed'

			return

		END

		if  exists (select top 1 * from t_archive where id_interval=@interval and status ='A' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '1000002-archive operation failed-->Interval is already archived-Deleted'

			return

		end

		if not exists (select top 1 * from t_acc_bucket_map where id_usage_interval=@interval)

		BEGIN

			set @result = '1000003-archive operation failed-->Interval does not have bucket mappings'

			return

		END

		if  exists (select top 1 * from t_archive where id_interval=@interval and status ='D' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '1000004-archive operation failed-->Interval is Dearchived and not be exported..run trash/delete procedure'

			return

		end



		select @servername = @@servername

		select @dbname = db_name()

		select @vartime = getdate()

		select @maxtime = dbo.mtmaxdate()

		create table #bcpoutput(OutputLine nvarchar(4000))

		declare  c1 cursor fast_forward for select distinct id_view from t_acc_usage where 

		id_usage_interval = @interval

		declare  c2 cursor fast_forward for select distinct bucket from t_acc_bucket_map where 

		id_usage_interval =  @interval

		open c2

		fetch next from c2 into @acc

		while (@@fetch_status = 0)

		begin	

		--We are creating view to avoid queryout parameter bug

			SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

			EXEC sp_executesql @sql1

			select @sql1 = N'create view bcpview as SELECT top 100 percent au.* FROM ' + @dbname + 

					'..t_acc_usage au inner join t_acc_bucket_map act on 

	 				au.id_usage_interval = act.id_usage_interval and au.id_acc = act.id_acc

					where au.id_usage_interval=' + cast (@interval as varchar(10)) + 

					N' and act.bucket =' + cast(@acc as varchar(10)) + ' and act.status = ''U'''

					 + ' and act.id_usage_interval =' + cast(@interval as varchar(10))

			exec (@sql1)

			--BCP out the data from t_acc_usage

			select @sql1 = 'bcp "' + @dbname + '..bcpview" out "' +  @path + '\t_acc_usage_' + cast (@interval as varchar (10)) + '_' + cast (@acc as varchar (10)) + '.txt" -n -S' + @servername

			insert into #bcpoutput exec master.dbo.xp_cmdshell @sql1

			IF (SELECT count(*) FROM #bcpoutput) = 0 

			BEGIN

				set @result = '1000005-archive operation failed-->Error in bcp out usage table, check the user permissions'

				close c2

				deallocate c2

				deallocate c1

				return

			END

			IF EXISTS(SELECT NULL FROM #bcpoutput 

				WHERE OutputLine like '%Error%' 

					OR OutputLine like '%ODBC SQL Server Driver%')

			BEGIN

				set @result = '1000006-archive operation failed-->Error in bcp out usage table, check the archive directory or hard disk space or database name or servername'

				select * from #bcpoutput

				close c2

				deallocate c2

				deallocate c1

				return

			END

	

			truncate table #bcpoutput

			if object_id('tempdb..tmp_t_acc_usage') is not null

			drop table tempdb..tmp_t_acc_usage

			select @sql1 = 'SELECT au.id_sess,au.id_usage_interval,au.id_acc into tempdb..tmp_t_acc_usage FROM ' + @dbname + 

					'..t_acc_usage au inner join t_acc_bucket_map act on au.id_usage_interval = act.id_usage_interval

					 and au.id_acc = act.id_acc where au.id_usage_interval=' + cast (@interval as varchar(10)) 

					+ ' and act.status = ''U'' and act.bucket = ' + cast(@acc as varchar(10)) + ' and act.id_usage_interval =' + cast (@interval as varchar(10))

			exec (@sql1)

			create unique clustered index idx_tmp_t_acc_usage on tempdb..tmp_t_acc_usage(id_sess,id_usage_interval)

			create index idx1_tmp_t_acc_usage on tempdb..tmp_t_acc_usage(id_acc)



			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1 --and nm_table_name not like '%temp%'

				SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

					EXEC sp_executesql @sql1

				select @sql1 = N'create view bcpview as SELECT top 100 percent pv.* FROM ' + 

						@dbname + '..' + @tab1 + ' pv inner join tempdb..tmp_t_acc_usage au on 

						pv.id_sess=au.id_sess 
						inner join t_acc_bucket_map act on 

						au.id_usage_interval = act.id_usage_interval and au.id_acc = act.id_acc

						where act.bucket =' + cast(@acc as varchar(10)) + 

						' and act.id_usage_interval =' + cast(@interval as varchar(10)) +

						' and au.id_usage_interval =' + cast(@interval as varchar(10)) +

						' and act.status = ''U'''

				exec (@sql1)

				--BCP out the data from product view tables

				select @sql1 = 'bcp "' + @dbname + '..bcpview" out "' + @path + '\' + @tab1 + '_' + cast (@interval as varchar (10)) + '_' + cast (@acc as varchar (10)) + '.txt" -n -S' + @servername

				truncate table #bcpoutput

				insert into #bcpoutput exec master.dbo.xp_cmdshell @sql1

				IF EXISTS(SELECT NULL FROM #bcpoutput 

	    			WHERE OutputLine like '%Error%' 

	        			OR OutputLine like '%ODBC SQL Server Driver%')

				BEGIN

					set @result = '1000007-archive operation failed-->Error in bcp out the ' + cast(@tab1 as varchar(1000)) + ' product view table, check the hard disk space'

					select * from #bcpoutput

					close c1

					deallocate c1

					close c2

					deallocate c2

					return

				END

			fetch next from c1 into @var1

			end

			close c1

--		deallocate c1		

		fetch next from c2 into @acc

		end

		deallocate c1

		close c2

		deallocate c2



		SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

				EXEC sp_executesql @sql1

		select @sql1 = N'create view bcpview as SELECT top 100 percent * FROM ' + @dbname +'..t_adjustment_transaction where id_usage_interval=' + 

				cast (@interval as varchar(10)) + N' order by id_sess'

				exec (@sql1)

		--BCP out the data from t_adjustment_transaction

		select @sql1 = 'bcp "' + @dbname + '..bcpview" out "' + @path + '\t_adjustment_transaction' + '_' + cast (@interval as varchar (10)) + '.txt" -n -S' + @servername

		truncate table #bcpoutput

		insert into #bcpoutput exec master.dbo.xp_cmdshell @sql1

		IF EXISTS(SELECT NULL FROM #bcpoutput 

			WHERE OutputLine like '%Error%' 

				OR OutputLine like '%ODBC SQL Server Driver%')

		BEGIN

			set @result = '1000008-archive operation failed-->Error in bcp out adjustment transaction table, check the hard disk space'

			select * from #bcpoutput

			return

		END

		truncate table #bcpoutput



		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction

		select @sql1 = N'SELECT id_adj_trx into tempdb..tmp_t_adjustment_transaction FROM ' + @dbname + '..t_adjustment_transaction where id_usage_interval=' + cast (@interval as varchar(10)) + N' order by id_sess'

		exec (@sql1)

		create unique clustered index idx_tmp_t_adjustment_transaction on tempdb..tmp_t_adjustment_transaction(id_adj_trx)



		create table #adjustment(name nvarchar(2000))

		declare c1 cursor fast_forward for select table_name from information_schema.tables where 

		table_name like 't_aj_%' and table_name not in ('T_AJ_TEMPLATE_REASON_CODE_MAP','t_aj_type_applic_map')

		open c1

		fetch next from c1 into @var1

		while (@@fetch_status = 0)

		begin

		--Get the name of t_aj tables that have usage in this interval

		set @sql1 = N'if exists

				(select 1 from ' + @var1 + ' where id_adjustment in 

				(select id_adj_trx from t_adjustment_transaction where id_usage_interval = ' + cast(@interval as varchar(10)) + N')) 
				insert into #adjustment values(''' + @var1 + ''')'

				EXEC sp_executesql @sql1

		SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

				EXEC sp_executesql @sql1

		fetch next from c1 into @var1

		end

		close c1

		deallocate c1



		declare c1 cursor for select name from #adjustment

		open c1

		fetch next from c1 into @var1

		while (@@fetch_status = 0)

		begin

			SET @sql1 = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

				EXEC sp_executesql @sql1

			--BCP out the data from t_aj tables

			select @sql1 = N'create view bcpview as SELECT top 100 percent aj.* FROM ' + @dbname + '..' + @var1 

			+ ' aj inner join tempdb..tmp_t_adjustment_transaction trans on aj.id_adjustment=trans.id_adj_trx'

				exec (@sql1)

			select @sql1 = 'bcp "' + @dbname +'..bcpview" out "' + @path + '\' + @var1 + '_' + cast (@interval as varchar (10)) + '.txt" -n -S' + @servername

			truncate table #bcpoutput

			insert into #bcpoutput exec master.dbo.xp_cmdshell @sql1

			IF EXISTS(SELECT NULL FROM #bcpoutput 

    			WHERE OutputLine like '%Error%' 

        			OR OutputLine like '%ODBC SQL Server Driver%')

			BEGIN

				set @result = '1000009-archive operation failed-->Error in bcp out ' + cast(@var1 as varchar(1000)) + ' table, check the hard disk space'

				select * from #bcpoutput

				close c1

				deallocate c1

				return

			END

			fetch next from c1 into @var1

		end

		close c1

		deallocate c1



		select distinct id_view into #id_view from t_acc_usage where id_usage_interval = @interval

		begin tran

			update t_archive 

			set tt_end = dateadd(s,-1,@vartime)

			where id_interval=@interval 

			and ( 

			id_view in (select id_view from #id_view) 

			or

			adj_name in (select name from #adjustment) 

			)

			and status='E' 

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0)

			begin

				set @result = '1000010-archive operation failed-->Error in update t_archive table'

				rollback tran

				return

			end

			insert into t_archive 

			select @interval,id_view,null,'E',@vartime,@maxtime from #id_view

			union all

			select @interval,null,name,'E',@vartime,@maxtime from #adjustment

			if (@@error <> 0)

			begin

				set @result = '1000011-archive operation failed-->Error in insert t_archive table'

				rollback tran

				return

			end



			update t_acc_bucket_map 

			set tt_end = dateadd(s,-1,@vartime)

			where id_usage_interval=@interval 

			and status in ('E','U') 

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0)

			begin

				set @result = '1000012-archive operation failed-->Error in update t_acc_bucket_map table'

				rollback tran

				return

			end

			insert into t_acc_bucket_map(id_usage_interval,id_acc,bucket,status,tt_start,tt_end) 

			select @interval,id_acc,bucket,'E',@vartime,@maxtime from t_acc_bucket_map

			where id_usage_interval=@interval

			and status in ('E','U') 

			and tt_end=dateadd(s,-1,@vartime)

			if (@@error <> 0)

			begin

				set @result = '1000013-archive operation failed-->Error in insert into t_acc_bucket_map table'

				rollback tran

				return

			end

		if object_id('tempdb..tmp_t_acc_usage') is not null

		drop table tempdb..tmp_t_acc_usage

		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction



		set @result = '0-archive_export operation successful'

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

  create  procedure archive_queue

			(

			@result nvarchar(4000) output

			)

		as

		--How to run this stored procedure

--		declare @result nvarchar(2000)

--		exec archive_queues @result=@result output

--		print @result

		set nocount on

		declare @sql1 nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @var1 nvarchar(1000)

		declare @vartime datetime

		declare @maxtime datetime

		declare @count int



--create table t_archive_queue (id_svc int, status varchar(1), tt_start datetime, tt_end datetime)

		select @vartime = getdate()

		select @maxtime = dbo.mtmaxdate()



		if object_id('tempdb..#tmp_t_session_state') is not null drop table #tmp_t_session_state

		if (@@error <> 0) 

		begin

			set @result = '7000001--archive_queues operation failed-->error in dropping #tmp_t_session_state'

			return

		end

		SELECT state.id_sess 

		into #tmp_t_session_state

		FROM 

		t_session_state state 

		where 

		state.tx_state ='H'

		if (@@error <> 0)

		begin

			set @result = '7000002-archive_queues operation failed-->Error in creating #tmp_t_session_state'

			return

		end

		create clustered index idx_tmp_t_session_state on #tmp_t_session_state(id_sess)

		if (@@error <> 0)

		begin

			set @result = '7000003-archive_queues operation failed-->Error in creating index on #tmp_t_session_state'

			return

		end



		IF (SELECT COUNT(*) FROM #tmp_t_session_state) = 0

		begin

			set @result = '7000004-archive_queues operation failed-->No rows to archive'

			return

		end

		

		select * into #tmp2_t_session_state from t_session_state

		where tx_state <> 'H'

		if (@@error <> 0)

		begin

			set @result = '7000005-archive_queues operation failed-->Error in creating #tmp2_t_session_state'

			return

		end

		create clustered index idx_tmp2_t_session_state on #tmp2_t_session_state(id_sess)



		declare  c1 cursor fast_forward for 

		select distinct id_svc from t_session_set set1

		inner join t_session sess on set1.id_ss = sess.id_ss

		inner join #tmp_t_session_state state on state.id_sess = sess.id_source_sess	



		begin tran

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				select @tab1 = log1.nm_table_name from t_enum_data enum1

				inner join 

				t_service_def_log log1

				on enum1.nm_enum_data = log1.nm_service_def

				where enum1.id_enum_data = @var1



				select @sql1 = N'select ' + cast(@count as varchar(10)) + ' = count(*) FROM ' + @tab1 + ' svc inner join #tmp_t_session_state au on 

				svc.id_source_sess = au.id_sess'

				if (@@error <> 0) 

				begin

					set @result = '7000006-archive_queues operation failed-->Error in getting count'

					rollback tran

					close c1

					deallocate c1

					return

				end

				if (@count > 5)

				begin

					if object_id('tempdb..#svc') is not null

					drop table #svc

					if (@@error <> 0) 

					begin

						set @result = '7000006--archive_queues operation failed-->error in dropping #svc table'

						rollback tran

						close c1

						deallocate c1

						return

					end

					select @sql1 = N'select * into #svc from ' + @tab1 + ' svc inner join #tmp2_t_session_state au

					on svc.id_source_sess = au.id_sess'

					exec (@sql1)

					if (@@error <> 0)

					begin
						set @result = '7000007-archive_queues operation failed-->Error in t_svc Delete operation'

						rollback tran

						close c1

						deallocate c1

						return

					end

					exec ('truncate table ' + @tab1)

					if (@@error <> 0)

					begin

						set @result = '7000008-archive_queues operation failed-->Error in t_svc Delete operation'

						rollback tran

						close c1

						deallocate c1

						return

					end

					select @sql1 = N'insert into ' + @tab1 + ' select * from #svc'

					exec (@sql1)

					if (@@error <> 0)

					begin

						set @result = '7000009-archive_queues operation failed-->Error in t_svc Delete operation'

						rollback tran

						close c1

						deallocate c1

						return

					end

				--Delete from t_svc tables

				end

				else

				begin

					select @sql1 = N'delete FROM svc from ' + @tab1 + ' svc inner join #tmp_t_session_state au on 

					svc.id_source_sess = au.id_sess'

					exec (@sql1)

					if (@@error <> 0)

					begin

						set @result = '7000010-archive_queues operation failed-->Error in t_svc Delete operation'

						rollback tran

						close c1

						deallocate c1

						return

					end

				end

				insert into t_archive_queue (id_svc,status,tt_start,tt_end)

				select @var1,'A',@vartime,@maxtime

				if (@@error <> 0)

				begin

					set @result = '7000011-archive_queues operation failed-->Error in insert t_archive table'

					rollback tran

					close c1

					deallocate c1

					return

				end

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1



			--Delete from t_session and t_session_state table

			select * into #tmp_t_session from t_session where id_source_sess

			not in (select id_sess from #tmp_t_session_state) 

			if (@@error <> 0)

			begin

				set @result = '7000012-archive_queues operation failed-->Error in insert into tmp_t_session'

				rollback tran

				return

			end

			truncate table t_session

			if (@@error <> 0)

			begin

				set @result = '7000013-archive_queues operation failed-->Error in Delete from t_session'

				rollback tran

				return

			end

			insert into t_session select * from #tmp_t_session

			if (@@error <> 0)

			begin

				set @result = '7000014-archive_queues operation failed-->Error in insert into t_session'

				rollback tran

				return

			end

			select * into #tmp_t_session_set from t_session_set where id_ss in

			(select id_ss from t_session)

			if (@@error <> 0)

			begin

				set @result = '7000015-archive_queues operation failed-->Error in insert into tmp_t_session_set'

				rollback tran

				return

			end

			truncate table t_session_set

			if (@@error <> 0)

			begin

				set @result = '7000016-archive_queues operation failed-->Error in Delete from t_session_set'

				rollback tran

				return

			end

			insert into t_session_set select * from #tmp_t_session_set

			if (@@error <> 0)

			begin

				set @result = '7000017-archive_queues operation failed-->Error in insert into t_session_set'

				rollback tran

				return

			end

			select * into #tmp_t_message from t_message where id_message in

			(select id_message from t_session_set)

			if (@@error <> 0)

			begin

				set @result = '7000018-archive_queues operation failed-->Error in insert into tmp_t_message'

				rollback tran

				return

			end

			truncate table t_message

			if (@@error <> 0)

			begin

				set @result = '7000019-archive_queues operation failed-->Error in Delete from t_message'

				rollback tran

				return

			end

			insert into t_message select * from #tmp_t_message

			if (@@error <> 0)

			begin

				set @result = '7000020-archive_queues operation failed-->Error in insert into t_message'

				rollback tran

				return

			end

			truncate table t_session_state

			if (@@error <> 0)

			begin

				set @result = '7000021-archive_queues operation failed-->Error in Delete from t_session_state table'

				rollback tran

				return

			end

			insert into t_session_state select * from #tmp2_t_session_state

			if (@@error <> 0)

			begin

				set @result = '7000022-archive_queues operation failed-->Error in insert into t_session_state table'

				rollback tran

				return

			end

		set @result = '0-archive_queue operation successful'

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

  Create procedure archive_trash

			(

			@interval int,

			@accountIDList nvarchar(4000),

			@result nvarchar(4000) output

			)

		as

		--How to run this stored procedure

--		declare @result nvarchar(2000)

--		exec archive_trash @interval=11931,@accountIDList=null,@result=@result output

--		print @result

		set nocount on

		declare @sqlstmt nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @var1 nvarchar(1000)

		declare @vartime datetime

		declare @maxtime datetime

		declare	@dbname nvarchar(100)



		select @dbname = db_name()

		select @vartime = getdate()

		select @maxtime = dbo.mtmaxdate()



		--Checking the following Business rules

		--Interval should be already archived

		if  not exists (select top 1 * from t_archive where id_interval=@interval and status  in ('A','D') and tt_end = dbo.mtmaxdate())

		begin

			set @result = '3000001-trash operation failed-->Interval is not already archived/dearchived'

			return

		end



		CREATE TABLE #AccountIDsTable (ID int NOT NULL)

		if (@accountIDList is not null)

		begin

			WHILE CHARINDEX(',', @accountIDList) > 0

				BEGIN

					INSERT INTO #AccountIDsTable (ID)

					SELECT SUBSTRING(@accountIDList,1,(CHARINDEX(',', @accountIDList)-1))

					SET @accountIDList = SUBSTRING (@accountIDList, (CHARINDEX(',', @accountIDList)+1),

										(LEN(@accountIDList) - (CHARINDEX(',', @accountIDList))))

				END

			INSERT INTO #AccountIDsTable (ID) SELECT @accountIDList

		end

		else

		begin

			set @sqlstmt = 'insert into #AccountIDsTable select distinct id_acc from t_acc_usage where id_usage_interval = ' + cast(@interval as varchar(20))

			exec (@sqlstmt)

		end



		if  not exists (select top 1 id_acc from t_acc_bucket_map where id_usage_interval=@interval and status ='D' and tt_end = dbo.mtmaxdate())

		begin

			set @result = '3000002-trash operation failed-->account in the list is not dearchived'

			return 

		end



		if object_id('tempdb..tmp_t_acc_usage') is not null

		drop table tempdb..tmp_t_acc_usage

		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction

		select @sqlstmt = N'SELECT id_sess,id_acc into tempdb..tmp_t_acc_usage FROM ' + 

		@dbname + '..t_acc_usage where id_usage_interval=' + cast (@interval as varchar(10)) + 

		' and id_acc in (select id from #AccountIDsTable)'

		exec (@sqlstmt)

		create unique clustered index idx_tmp_t_acc_usage on tempdb..tmp_t_acc_usage(id_sess)

		create index idx1_tmp_t_acc_usage on tempdb..tmp_t_acc_usage(id_acc)



		declare  c1 cursor fast_forward for select distinct id_view from t_acc_usage 

		where id_usage_interval = @interval

		begin tran

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1 --and nm_table_name not like '%temp%'

				--Delete from product view tables

				select @sqlstmt = N'delete pv FROM ' + @dbname + '..' + @tab1 + ' pv inner join 

				tempdb..tmp_t_acc_usage tmp on pv.id_sess = tmp.id_sess'

				exec (@sqlstmt)

				if (@@error <> 0)

				begin

					set @result = '3000003-trash operation failed-->Error in Delete operation'

					rollback tran

					close c1

					deallocate c1

					return

				end

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1



		if not exists (select 1 from t_acc_usage where id_usage_interval = @interval and id_acc not in

				(select id from #AccountIDsTable))

		begin 

			select distinct id_view into #id_view from t_acc_usage where id_usage_interval = @interval

			select @sqlstmt = N'SELECT id_adj_trx into tempdb..tmp_t_adjustment_transaction FROM ' 

			+ @dbname + '..t_adjustment_transaction where id_usage_interval=' + cast (@interval as varchar(10))

			exec (@sqlstmt)

			create unique clustered index idx_tmp_t_adjustment_transaction on 

			tempdb..tmp_t_adjustment_transaction(id_adj_trx)

			create table #adjustment(name nvarchar(2000))

			declare c1 cursor fast_forward for select table_name from information_schema.tables where 

			table_name like 't_aj_%' and table_name not in ('T_AJ_TEMPLATE_REASON_CODE_MAP','t_aj_type_applic_map')

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

			--Get the name of t_aj tables that have usage in this interval

			set @sqlstmt = N'if exists

					(select 1 from ' + @var1 + ' where id_adjustment in 

					(select id_adj_trx from t_adjustment_transaction where id_usage_interval = ' + cast(@interval as varchar(10)) + N')) 

					insert into #adjustment values(''' + @var1 + ''')'

			EXEC (@SQLStmt)

			SET @SQLStmt = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(''bcpview'')) DROP view bcpview'

			EXEC (@SQLStmt)

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1

	

			declare  c1 cursor fast_forward for select distinct name from #adjustment

			open c1

			fetch next from c1 into @var1

			while (@@fetch_status = 0)

			begin

			--Delete from t_aj tables

				select @sqlstmt = N'delete aj FROM ' + @dbname + '..' + @var1 +  

						' aj inner join tempdb..tmp_t_adjustment_transaction tmp

						on aj.id_adjustment = tmp.id_adj_trx'

				exec (@sqlstmt)

				if (@@error <> 0)

				begin

					set @result = '3000004-trash operation failed-->Error in Delete from t_aj tables'

					rollback tran

					close c1

					deallocate c1

					return

				end

			fetch next from c1 into @var1

			end

			close c1

			deallocate c1



			--Delete from t_adjustment_transaction table

			select @sqlstmt = N'delete FROM ' + @dbname + '..t_adjustment_transaction where id_usage_interval=' + cast (@interval as varchar(10))

				exec (@sqlstmt)

			if (@@error <> 0)

			begin

				set @result = '3000005-Error in Delete from t_adjustment_transaction table'

				rollback tran

				return

			end



			--Checking for post bill adjustments that have corresponding usage archived

			create table #t_adjustment_transaction_temp(id_sess int)

			select @sqlstmt =  N'insert into #t_adjustment_transaction_temp select id_sess 

						from t_adjustment_transaction where n_adjustmenttype=1 

						and id_sess in (select id_sess from t_acc_usage where id_usage_interval=' + cast(@interval as varchar(10)) + ' )'

			execute (@sqlstmt)

			if (@@error <> 0)

			begin

				set @result = '3000006-archive operation failed-->Error in create adjustment temp table operation'

				rollback tran

				return

			end

			IF ((SELECT count(*) FROM #t_adjustment_transaction_temp) > 0) 

			begin

				update t_adjustment_transaction set archive_sess=id_sess,id_sess=null

				where id_sess in (select id_sess from #t_adjustment_transaction_temp)

				if (@@error <> 0)

				begin

					set @result = '3000007-trash operation failed-->Error in Update adjustment operation'

					rollback tran

					return

				end

			end

			update t_archive set tt_end = dateadd(s,-1,@vartime)

			where id_interval=@interval

			and status = 'D'

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0) 

			begin

				set @result = '3000008-trash operation failed-->error in update t_acc_bucket_map'

				rollback tran

				return

			end

			insert into t_archive 

			select @interval,id_view,null,'A',@vartime,@maxtime from #id_view

			union all

			select distinct @interval,null,name,'A',@vartime,@maxtime from #adjustment

			if (@@error <> 0) 

			begin

				set @result = '3000009-trash operation failed-->error in insert into t_acc_bucket_map'

				rollback tran

				return

			end

		end

	

			--Delete from t_acc_usage table

			select @sqlstmt = N'delete au FROM ' + @dbname + '..t_acc_usage au inner join 

			tempdb..tmp_t_acc_usage tmp on au.id_sess = tmp.id_sess'
			exec (@sqlstmt)

			if (@@error <> 0)

			begin

				set @result = '3000010-trash operation failed-->Error in Delete t_acc_usage operation'

				rollback tran

				return

			end

		

			update t_acc_bucket_map set tt_end = dateadd(s,-1,@vartime)

			where id_usage_interval=@interval and id_acc in (select id from #AccountIDsTable) 

			and status = 'D'

			and tt_end=dbo.mtmaxdate()

			if (@@error <> 0) 

			begin

				set @result = '3000011-trash operation failed-->error in update t_acc_bucket_map'

				rollback tran

				return

			end

			insert into t_acc_bucket_map(id_usage_interval,id_acc,bucket,status,tt_start,tt_end)

			select @interval,id,bucket,'A',@vartime,@maxtime from #AccountIDsTable tmp

			inner join t_acc_bucket_map act on tmp.id = act.id_acc

			and act.id_usage_interval = @interval

			and act.status = 'D'

			and tt_end = dateadd(s,-1,@vartime)

			if (@@error <> 0) 

			begin

				set @result = '3000012-trash operation failed-->error in insert into t_acc_bucket_map'

				rollback tran

				return

			end



		if object_id('tempdb..tmp_t_acc_usage') is not null

		drop table tempdb..tmp_t_acc_usage

		if object_id('tempdb..tmp_t_adjustment_transaction') is not null

		drop table tempdb..tmp_t_adjustment_transaction	

		set @result = '0-archive_trash operation successful'

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



					CREATE procedure copytemplate(

					@id_folder int,

					@id_parent int,

          @p_systemdate datetime,

          @p_enforce_same_corporation varchar,

					@status int output)

					as

				 	begin

					declare @parentID int

					declare @cdate datetime

					declare @nexttemplate int

					declare @parentTemplateID int

					 begin

						--only check same hierarchy for parent if corp business rule is

						--enforced.

						if (@p_enforce_same_corporation = '1' AND @id_parent is NULL)

						 begin

							select @parentID = id_ancestor 
							from t_account_ancestor where id_descendent = @id_folder

							AND @p_systemdate between vt_start AND vt_end AND

							num_generations = 1

						  if (@parentID is null)

							 begin

						     select @status = -486604771 -- MT_PARENT_NOT_IN_HIERARCHY

							   return

							 end

						 end

						else

						 begin

							select @parentID = @id_parent  

						 end 

						end	

						begin

							select @parentTemplateID = id_acc_template from t_acc_template

							where id_folder = @parentID

							if (@parentTemplateID is null)

							 begin

								SELECT @status = -486604772

							  return

							 end

						end	

							

							exec clonesecuritypolicy @id_parent,@id_folder,'D','D'



							insert into t_acc_template 

							 (id_folder,dt_crt,tx_name,tx_desc,b_applydefaultpolicy)

							 select @id_folder,@p_systemdate,

							 tx_name,tx_desc,b_applydefaultpolicy

							 from t_acc_template where id_folder = @parentID

  					  select @nexttemplate =@@identity

         		  

							insert into t_acc_template_props (id_acc_template,nm_prop_class,

							nm_prop,nm_value)

							select @nexttemplate,existing.nm_prop_class,existing.nm_prop,

							existing.nm_value from 

							t_acc_template_props existing where 

							existing.id_acc_template = @parentTemplateID



							insert into t_acc_template_subs (id_po,id_acc_template,b_group,

							vt_start,vt_end,nm_groupsubname)

						  select existing.id_po,@nexttemplate,existing.b_group,

							existing.vt_start,existing.vt_end,existing.nm_groupsubname

							from t_acc_template_subs existing

							where

							existing.id_acc_template = @parentTemplateID

							

							select @status = 1

					 end

				
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

		CREATE procedure databaseproperties (@hierarchy nvarchar(5), @datamart nvarchar(5), @status int output)

		as

		Begin Tran

		delete from t_db_values

		if (@@error <> 0 )

		begin

			set @status = -99

			rollback tran

			return

		end

		insert into t_db_values(parameter,value) values('Hierarchy_RestrictedOperations',@hierarchy)

		if (@@error <> 0 )

		begin

			set @status = -99

			rollback tran

			return

		end

		insert into t_db_values(parameter,value) values('DATAMART',@datamart)

		if (@@error <> 0 )

		begin

			set @status = -99

			rollback tran

			return

		end

		set @status = 0

		commit tran

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

create procedure dearchive_files

			(

			@interval int,

			@accountIDList nvarchar(4000),

			@result nvarchar(4000) output

			)

		as

		set nocount on

		declare @sql1 nvarchar(4000)

		declare @tab1 nvarchar(1000)

		declare @tab2 nvarchar(1000)

		declare @var1 nvarchar(100)

		declare @str1 nvarchar(1000)

		declare @str2 nvarchar(2000)

		declare @vartime datetime

		declare @maxtime datetime

		declare @bucket int

		declare	@dbname nvarchar(100)



		begin

		select @vartime = getdate()

		select @maxtime = dbo.mtmaxdate()

		select @dbname = db_name()

		--how to run this procedure

		--declare @result varchar(4000)

		--exec dearchive_files intervalid,'accountid',@result output

		--print @result



		--Checking following Business rules :

		--Interval should be archived

		--Account is in archived state

		--Verify the database name 

		select @tab2 = table_name from information_schema.tables where table_name='T_ACC_USAGE' and table_catalog = @dbname

		if (@tab2 is null)

		begin 

			set @result = '6000001-dearchive_files operation failed-->check the database name'

			return

		end

		if not exists (select top 1 * from t_archive where id_interval=@interval and status ='A' and tt_end = @maxtime)

		begin

			set @result = '6000002-dearchive_files operation failed-->Interval is not archived'

			return

		end

--TO GET LIST OF ACCOUNT

		CREATE TABLE #file (filename nvarchar(4000),id_acc int)

		CREATE TABLE #AccountIDsTable (ID int NOT NULL,bucket int)

		if (@accountIDList is not null)

		begin

			WHILE CHARINDEX(',', @accountIDList) > 0

				BEGIN

					INSERT INTO #AccountIDsTable (ID)

					SELECT SUBSTRING(@accountIDList,1,(CHARINDEX(',', @accountIDList)-1))

					SET @accountIDList = SUBSTRING (@accountIDList, (CHARINDEX(',', @accountIDList)+1),

										(LEN(@accountIDList) - (CHARINDEX(',', @accountIDList))))

					if (@@error <> 0) 

					begin

						set @result = '6000003-dearchive_files operation failed-->error in insert into #AccountIDsTable'

						return

					end

				END

			INSERT INTO #AccountIDsTable (ID) SELECT @accountIDList

			if (@@error <> 0) 

			begin

				set @result = '6000004-dearchive_files operation failed-->error in insert into #AccountIDsTable'

				return

			end

	

			update #AccountIDsTable set bucket = act.bucket

			from #AccountIDsTable inner join t_acc_bucket_map act

			on #AccountIDsTable.id = act.id_acc

			where act.id_usage_interval=@interval

			if (@@error <> 0) 

			begin

				set @result = '6000005-dearchive_files operation failed-->error in update #AccountIDsTable'

				return

			end

		end

		else

		begin

			set @sql1 = 'insert into #AccountIDsTable(id,bucket) select id_acc,bucket from

			t_acc_bucket_map where id_acc not in (select distinct id_acc from t_acc_usage where id_usage_interval = ' + cast(@interval as varchar(20)) + ')

			 and status = ''A'' and tt_end = dbo.mtmaxdate()'

			print(@sql1)

			exec (@sql1)

			if (@@error <> 0) 

			begin

				set @result = '6000006-dearchive_files operation failed-->error in insert into #AccountIDsTable'

				return

			end

		end



		if exists (select 1 from t_acc_bucket_map where id_usage_interval=@interval and status ='D' and tt_end = @maxtime

				and id_acc in (select id from #AccountIDsTable))

		begin

			set @result = '6000007-dearchive_files operation failed-->one of the account is already dearchived'

			return

		end

		if EXISTS(SELECT 1 FROM #AccountIDsTable WHERE bucket is null)

		begin

			set @result = '6000008-dearchive_files operation failed-->one of the account does not have bucket mapping...check the accountid'

			return

		end	



		declare  c1 cursor fast_forward for select distinct id_view from t_archive where id_interval = @interval

		and tt_end = @maxtime and id_view is not null

		declare c2 cursor fast_forward for select distinct bucket from #AccountIDsTable

		open c2

		fetch next from c2 into @bucket

		while (@@fetch_status = 0)

		begin

		--Checking the existence of import files for each table

			declare	@FileName nvarchar(128)

			select  @FileName = 't_acc_usage' + '_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'

			insert into #file select @FileName,id from #AccountIDsTable where bucket = @bucket

			if (@@error <> 0)

			begin

				set @result = '6000009-dearchive_files operation failed-->insert into file table for t_acc_usage'

				close c2

				deallocate c2

				deallocate c1

				return

			end

	

			open c1

			fetch next from c1 into @var1

			while @@fetch_status = 0

			begin

				select @tab1 = nm_table_name from t_prod_view where id_view=@var1

				select @filename = @tab1 + '_' + cast(@interval as varchar(10)) + '_' + cast(@bucket as varchar(10)) + '.txt'

				insert into #file select @FileName,id from #AccountIDsTable where bucket = @bucket

				if (@@error <> 0)

				begin

					set @result = '6000010-dearchive_files operation failed-->insert into file table for product views'

					close c1

					deallocate c1

					close c2

					deallocate c2

					return

				end

			fetch next from c1 into @var1

			end

			close c1

		fetch next from c2 into @bucket

		end

		close c2

		deallocate c1



		if not exists (select top 1 id_adj_trx from t_adjustment_transaction where id_usage_interval = @interval)

		begin 

			select  @FileName = 't_adjustment_transaction' + '_' + cast(@interval as varchar(10)) + '.txt'

				insert into #file select @FileName,id from #AccountIDsTable where bucket = @bucket

				if (@@error <> 0)

				begin

				set @result = '6000011-dearchive_files operation failed-->insert into file table for t_adjustment_transaction'

				return

				end

		

			declare  c1 cursor fast_forward for select distinct adj_name from t_archive where id_interval = @interval and tt_end = @maxtime

			and adj_name is not null and status='A'

			open c1

			fetch next from c1 into @var1

			while @@fetch_status = 0

			begin

				select @filename = @var1 + '_' + cast(@interval as varchar(10)) + '.txt'

				insert into #file select @FileName,id from #AccountIDsTable where bucket = @bucket

				if (@@error <> 0)

				begin

					set @result = '6000012-dearchive_files operation failed-->insert into file table for t_aj_tables'

					close c1
					deallocate c1

					return

				end

				fetch next from c1 into @var1

			end

			close c1

			deallocate c1

		end

		select filename,id_acc from #file order by id_acc

		set @result = '0-dearchive_files operation successful'

		end

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

	

			create procedure mtsp_BackoutInvoices (



			@id_interval int,



			@id_run int,



			@num_invoices int OUTPUT,



			@info_string nvarchar(500) OUTPUT,



			@return_code int OUTPUT



			)



			as



			begin



				DECLARE @debug_flag bit



				DECLARE @msg nvarchar(256)



				DECLARE @usage_cycle_type int



				SET @msg = 'Invoice-Backout: Invoice adapter reversed'



				SET @debug_flag = 1



				--SET @debug_flag = 0



				SET @info_string = '' 



				set @usage_cycle_type = (select id_usage_cycle from t_usage_interval 

							 where id_interval = @id_interval)



				select top 1 t_invoice.id_invoice from t_invoice left outer join t_usage_interval

 					on t_invoice.id_interval = t_usage_interval.id_interval

 					where id_usage_cycle = @usage_cycle_type

 					and t_invoice.id_interval > @id_interval

				if (@@rowcount > 0) 

 					SET @info_string = 'Reversing the invoice adapter for this interval has caused the invoices for subsequent intervals to be invalid'



				--truncate the table so that all rows corresponding to this interval are removed



				DELETE FROM t_invoice



				WHERE



					id_interval = @id_interval



				SET @num_invoices = @@ROWCOUNT



				--update the t_invoice_range table's id_run field



					UPDATE t_invoice_range



						SET id_run = @id_run WHERE id_interval = @id_interval



					IF @debug_flag = 1 



					INSERT INTO t_recevent_run_details (id_run, tx_type, tx_detail, dt_crt)

					  VALUES (@id_run, 'Debug', @msg, getutcdate()) 



    					SET @return_code = 0


			end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create procedure refreshdatamart

@status int output

as

declare @sql nvarchar(4000)

set nocount on

begin

--drop tables



	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payer_interval_2'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payer_interval_2'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payer_interval_3'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payer_interval_3'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payee_session'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payee_session'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payee_session_2'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payee_session_2'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payee_session_3'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payee_session_3'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'if exists (select * from dbo.sysobjects where id = object_id(''t_dm_account'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) 

	drop table t_dm_account'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create table t_dm_account(id_dm_acc integer identity(1000,1) ,

	id_acc integer,

	vt_start datetime,

	vt_end datetime)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	--drop table t_dm_account_ancestor'	

	select @sql = 'if exists (select * from dbo.sysobjects where id = object_id(''t_dm_account_ancestor'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1)

	drop table [dbo].[t_dm_account_ancestor]'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create table t_dm_account_ancestor(id_dm_ancestor integer, id_dm_descendent integer, num_generations integer)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end


	select @sql = 'insert into t_dm_account	select id_descendent, vt_start, vt_end

	from

	t_account_ancestor

	where

	id_ancestor=1'

	execute (@sql)

					if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	select @sql = 'insert into t_dm_account_ancestor

	select dm2.id_dm_acc, dm1.id_dm_acc, aa1.num_generations

	from

	t_account_ancestor aa1

	inner join t_dm_account dm1 on aa1.id_descendent=dm1.id_acc and aa1.vt_start <= dm1.vt_end and dm1.vt_start <= aa1.vt_end

	inner join t_dm_account dm2 on aa1.id_ancestor=dm2.id_acc and aa1.vt_start <= dm2.vt_end and dm2.vt_start <= aa1.vt_end

	where dm1.id_acc <> dm2.id_acc

	and dm1.vt_start >= dm2.vt_start

	and dm1.vt_end <= dm2.vt_end

	order by dm1.id_dm_acc,aa1.num_generations'

	execute (@sql)

	if (@@error <> 0)
	begin

		set @status = -99

		return

	end



	select @sql = 'insert into t_dm_account_ancestor 

	select id_dm_acc,id_dm_acc,0

	from t_dm_account'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create clustered index idx_dm_account on t_dm_account(id_acc,id_dm_acc)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create clustered index idx_dm_account_ancestor on t_dm_account_ancestor(id_dm_ancestor, id_dm_descendent)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'Delete from t_dm_payer_interval where id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	declare @colname varchar(100)

	select @colname = a.name from sysindexkeys c,sysindexes a,syscolumns b,sysobjects d

					where c.indid=a.indid

					and c.colid=b.colid

					and a.id=d.id

					and b.id=d.id

					and d.xtype='U'

					and c.id=d.id

					and d.name = 't_dm_payer_interval'

					and keyno=1

					and b.name = 'id_acc'

					and a.name not like '_WA%'

	if (@colname is not null) 

	begin

	select @sql = 'drop index t_dm_payer_interval.' + @colname

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	end



	select @colname = a.name from sysindexkeys c,sysindexes a,syscolumns b,sysobjects d

					where c.indid=a.indid

					and c.colid=b.colid

					and a.id=d.id

					and b.id=d.id

					and d.xtype='U'

					and c.id=d.id

					and d.name = 't_dm_payer_interval'

					and keyno=1

					and b.name = 'id_se'

					and a.name not like '_WA%'

	if (@colname is not null) 

	begin

	select @sql = 'drop index t_dm_payer_interval.' + @colname

	execute (@sql)

		if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	end



select @sql = 'insert into t_dm_payer_interval 

	select 

	au.id_acc,

	acc.id_dm_acc,

	au.id_usage_interval,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se,

	SUM({fn IFNULL(au.Amount, 0.0)}),

	SUM({fn IFNULL(au.Tax_Federal, 0.0)}),

	SUM({fn IFNULL(au.Tax_State, 0.0)}),

	SUM({fn IFNULL(au.Tax_Federal, 0.0)}) + SUM({fn IFNULL(au.Tax_State, 0.0)}) + SUM({fn IFNULL(au.Tax_County, 0.0)}) + 

	SUM({fn IFNULL(au.Tax_Local, 0.0)}) + SUM({fn IFNULL(au.Tax_Other, 0.0)}),

	0.0,

	0.0,0.0,0.0,0.0,0.0,0.0,

	0.0,

	0.0,0.0,0.0,0.0,0.0,0.0,

	SUM({fn IFNULL(au.Amount, 0.0)}),

  SUM({fn IFNULL(au.Amount, 0.0)}),

	0,

	0,

	COUNT(*) as NumTransactions

	from

	t_acc_usage au 

	inner join t_dm_account acc on au.id_payee=acc.id_acc

	and dt_session between vt_start and vt_end

	where id_parent_sess is null

					and au.id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())

	group by

	au.id_acc,

	au.id_usage_interval,

	acc.id_dm_acc,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'select

	au.id_acc,

	acc.id_dm_acc,

	au.id_usage_interval,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.AdjustmentAmount

	ELSE 0 END) AS CompoundPrebillAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_federal

	ELSE 0 END) AS CompoundPrebillFederalTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_state

	ELSE 0 END) AS CompoundPrebillStateTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_county

	ELSE 0 END) AS CompoundPrebillCountyTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_local

	ELSE 0 END) AS CompoundPrebillLocalTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_other

	ELSE 0 END) AS CompoundPrebillOtherTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN (prebillajs.aj_tax_federal + prebillajs.aj_tax_state + prebillajs.aj_tax_county + prebillajs.aj_tax_local + prebillajs.aj_tax_other)

	ELSE 0 END) AS CompoundPrebillTotalTaxAdjustmentAmount,

	SUM(CASE WHEN (au.id_parent_sess IS NULL AND prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status = ''A'')	

	THEN 1 ELSE 0 END) + 

	SUM(CASE WHEN (au.id_parent_sess IS NOT NULL AND prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status =''A'') THEN 1 ELSE 0 END)

	as NumPrebillAdjustments	

	into t_dm_payer_interval_2

	from

	t_acc_usage au1 

	inner join t_dm_account acc on au1.id_payee=acc.id_acc and dt_session between vt_start and vt_end

	inner join t_adjustment_transaction prebillajs on prebillajs.id_sess=au1.id_sess AND prebillajs.c_status IN (''A'', ''P'') AND prebillajs.n_adjustmenttype=0

	inner join t_acc_usage au on au.id_sess=isnull(au1.id_parent_sess,au1.id_sess)

					where au1.id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())

					and au.id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())

	group by

	au.id_acc,

	acc.id_dm_acc,

	au.id_usage_interval,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'select

	au.id_acc,

	acc.id_dm_acc,

	au.id_usage_interval,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se,

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.AdjustmentAmount

	ELSE 0 END) AS CompoundPostbillAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_federal

	ELSE 0 END) AS CompoundPostbillFederalTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_state

	ELSE 0 END) AS CompoundPostbillStateTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_county

	ELSE 0 END) AS CompoundPostbillCountyTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_local

	ELSE 0 END) AS CompoundPostbillLocalTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_other

	ELSE 0 END) AS CompoundPostbillOtherTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN (postbillajs.aj_tax_federal + postbillajs.aj_tax_state + 

					postbillajs.aj_tax_county + postbillajs.aj_tax_local + postbillajs.aj_tax_other)

	ELSE 0 END) AS CompoundPostbillTotalTaxAdjustmentAmount,	

	SUM(CASE WHEN (au.id_parent_sess IS NULL AND postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status = ''A'')	

	THEN 1 ELSE 0 END) +

	SUM(CASE WHEN (au.id_parent_sess IS NOT NULL AND postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status =''A'')  THEN 1 ELSE 0 END)

	as NumPostbillAdjustments

	into t_dm_payer_interval_3

	from

	t_acc_usage au1 

	inner join t_dm_account acc on au1.id_payee=acc.id_acc and dt_session between vt_start and vt_end

	inner join t_adjustment_transaction postbillajs on postbillajs.id_sess=au1.id_sess AND postbillajs.c_status IN (''A'', ''P'') AND postbillajs.n_adjustmenttype=1

	inner join t_acc_usage au on au.id_sess=isnull(au1.id_parent_sess,au1.id_sess)

					where au1.id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())

					and au.id_usage_interval not in (select id_interval from t_archive where

					status = ''A'' and tt_end = dbo.mtmaxdate())

	group by

	au.id_acc,

	acc.id_dm_acc,

	au.id_usage_interval,

	au.id_prod,

  	au.id_view,

	au.id_pi_instance,

	au.id_pi_template,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'update dm_1

	set dm_1.PrebillAdjustmentAmount = IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0)

	,dm_1.PrebillFederalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillFederalTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillStateTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillStateTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillCountyTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillCountyTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillLocalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillLocalTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillOtherTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillOtherTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillTotalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillTotalTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillAdjustedAmount = dm_1.PrebillAdjustedAmount + IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0),

	dm_1.PostbillAdjustedAmount = dm_1.PostbillAdjustedAmount + IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0),

	dm_1.NumPrebillAdjustments=dm_1.NumPrebillAdjustments+isnull(tmp2.NumPrebillAdjustments,0)

	from t_dm_payer_interval dm_1 inner join t_dm_payer_interval_2 tmp2 on dm_1.id_acc=tmp2.id_acc

	and dm_1.id_usage_interval=tmp2.id_usage_interval

	and dm_1.id_dm_acc=tmp2.id_dm_acc

	and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0)

	and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0)

	and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0)

	and dm_1.am_currency=tmp2.am_currency

	and isnull(dm_1.id_se,0)=isnull(tmp2.id_se,0)'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'update dm_1

	set dm_1.PostbillAdjustmentAmount = IsNULL(tmp2.CompoundPostbillAdjustmentAmount, 0.0)

	,dm_1.PostbillFederalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillFederalTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillStateTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillStateTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillCountyTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillCountyTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillLocalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillLocalTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillOtherTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillOtherTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillTotalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillTotalTaxAdjustmentAmount, 0.0)				

	,dm_1.PostbillAdjustedAmount = dm_1.PostbillAdjustedAmount + IsNULL(tmp2.CompoundPostbillAdjustmentAmount, 0.0),

	dm_1.NumPostbillAdjustments=dm_1.NumPostbillAdjustments+isnull(tmp2.NumPostbillAdjustments,0)

	from t_dm_payer_interval dm_1 inner join t_dm_payer_interval_3 tmp2 on dm_1.id_acc=tmp2.id_acc

	and dm_1.id_usage_interval=tmp2.id_usage_interval

	and dm_1.id_dm_acc=tmp2.id_dm_acc

	and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0)

	and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0)

	and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0)

	and dm_1.am_currency=tmp2.am_currency

	and isnull(dm_1.id_se,0)=isnull(tmp2.id_se,0)'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'create clustered index idx_payer_interval on t_dm_payer_interval(id_acc,id_usage_interval,id_dm_acc)'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'create index idx_se_payer_interval on t_dm_payer_interval(id_se)'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'CREATE TABLE [dbo].[t_dm_payee_session] (

	[id_dm_acc] [int] NOT NULL ,

	[id_prod] [int] NULL ,

	[id_view] [int] NOT NULL ,

	[id_pi_template] [int] NULL ,

	[id_pi_instance] [int] NULL ,

	[am_currency] [nvarchar] (3),

	[id_se] [int] NULL ,

	[dt_session] [datetime] NULL ,

	[TotalAmount] [numeric](38, 6) NULL ,

	[TotalFederalTax] [numeric](38, 6) NULL ,

	[TotalStateTax] [numeric](38, 6) NULL ,

	[TotalTax] [numeric](38, 6) NULL ,

	[PrebillAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillFederalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillStateTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillCountyTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillLocalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillOtherTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillTotalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillFederalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillStateTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillCountyTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillLocalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillOtherTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PostbillTotalTaxAdjustmentAmount] [numeric](38, 6) NULL ,

	[PrebillAdjustedAmount] [numeric](38, 6) NULL ,

	[PostbillAdjustedAmount] [numeric](38, 6) NULL ,

	[NumPrebillAdjustments] [int] NULL ,

	[NumPostbillAdjustments] [int] NULL ,

	[NumTransactions] [int] NULL)'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'insert into t_dm_payee_session 

	select 

	acc.id_dm_acc,

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se,

	convert(datetime,convert(char(10),dt_session,120)),

	SUM({fn IFNULL(au.Amount, 0.0)}),

	SUM({fn IFNULL(au.Tax_Federal, 0.0)}),

	SUM({fn IFNULL(au.Tax_State, 0.0)}),

	SUM({fn IFNULL(au.Tax_Federal, 0.0)}) + SUM({fn IFNULL(au.Tax_State, 0.0)}) + SUM({fn IFNULL(au.Tax_County, 0.0)}) + 

	SUM({fn IFNULL(au.Tax_Local, 0.0)}) + SUM({fn IFNULL(au.Tax_Other, 0.0)}),

	0.0,

	0.0,0.0,0.0,0.0,0.0,0.0,

  0.0,

  0.0,0.0,0.0,0.0,0.0,0.0,

	SUM({fn IFNULL(au.Amount, 0.0)}),

  	SUM({fn IFNULL(au.Amount, 0.0)}),

	0,

	0,

	COUNT(*)

	from

	t_acc_usage au 

	inner join t_dm_account acc on au.id_payee=acc.id_acc

	and dt_session between vt_start and vt_end

	where id_parent_sess is null

	group by

	acc.id_dm_acc,

	convert(datetime,convert(char(10),dt_session,120)),

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'select

	acc.id_dm_acc,

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se,

	convert(datetime,convert(char(10),au.dt_session,120)) as dt_session,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.AdjustmentAmount
	ELSE 0 END) AS CompoundPrebillAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_federal

	ELSE 0 END) AS CompoundPrebillFederalTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_state

	ELSE 0 END) AS CompoundPrebillStateTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_county

	ELSE 0 END) AS CompoundPrebillCountyTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_local

	ELSE 0 END) AS CompoundPrebillLocalTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN prebillajs.aj_tax_other

	ELSE 0 END) AS CompoundPrebillOtherTaxAdjustmentAmount,

	SUM(CASE WHEN (prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status = ''A'') THEN (prebillajs.aj_tax_federal + prebillajs.aj_tax_state + prebillajs.aj_tax_county + prebillajs.aj_tax_local + prebillajs.aj_tax_other)

	ELSE 0 END) AS CompoundPrebillTotalTaxAdjustmentAmount,			

	SUM(CASE WHEN (au.id_parent_sess IS NULL AND prebillajs.id_adj_trx IS NOT NULL AND prebillajs.c_status = ''A'')	

	THEN 1 ELSE 0 END) + 

	SUM(CASE WHEN (au.id_parent_sess IS NOT NULL AND prebillajs.AdjustmentAmount IS NOT NULL AND prebillajs.c_status =''A'') THEN 1 ELSE 0 END)

	as NumPrebillAdjustments

	into t_dm_payee_session_2

	from

	t_acc_usage au1 

	inner join t_dm_account acc on au1.id_payee=acc.id_acc and dt_session between vt_start and vt_end

	inner join t_adjustment_transaction prebillajs on prebillajs.id_sess=au1.id_sess AND prebillajs.c_status IN (''A'', ''P'') AND 

	prebillajs.n_adjustmenttype=0

	inner join t_acc_usage au on au.id_sess=isnull(au1.id_parent_sess,au1.id_sess)

	group by

	acc.id_dm_acc,

	convert(datetime,convert(char(10),au.dt_session,120)),

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'select

	acc.id_dm_acc,

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se,

	convert(datetime,convert(char(10),au.dt_session,120)) as dt_session,

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.AdjustmentAmount

	ELSE 0 END) AS CompoundPostbillAdjustmentAmount,

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_federal

	ELSE 0 END) AS CompoundPostbillFederalTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_state

	ELSE 0 END) AS CompoundPostbillStateTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_county

	ELSE 0 END) AS CompoundPostbillCountyTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_local

	ELSE 0 END) AS CompoundPostbillLocalTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN postbillajs.aj_tax_other

	ELSE 0 END) AS CompoundPostbillOtherTaxAdjustmentAmount,	

	SUM(CASE WHEN (postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status = ''A'') THEN (postbillajs.aj_tax_federal + postbillajs.aj_tax_state + 

					postbillajs.aj_tax_county + postbillajs.aj_tax_local + postbillajs.aj_tax_other)

	ELSE 0 END) AS CompoundPostbillTotalTaxAdjustmentAmount,

	SUM(CASE WHEN (au.id_parent_sess IS NULL AND postbillajs.id_adj_trx IS NOT NULL AND postbillajs.c_status = ''A'')	

	THEN 1 ELSE 0 END) +

	SUM(CASE WHEN (au.id_parent_sess IS NOT NULL AND postbillajs.AdjustmentAmount IS NOT NULL AND postbillajs.c_status =''A'')  THEN 1 ELSE 0 END)

	as NumPostbillAdjustments

	into t_dm_payee_session_3

	from

	t_acc_usage au1 

	inner join t_dm_account acc on au1.id_payee=acc.id_acc and dt_session between vt_start and vt_end

	inner join t_adjustment_transaction postbillajs on postbillajs.id_sess=au1.id_sess AND postbillajs.c_status IN (''A'', ''P'') 

	AND postbillajs.n_adjustmenttype=1

	inner join t_acc_usage au on au.id_sess=isnull(au1.id_parent_sess,au1.id_sess)

	group by

	acc.id_dm_acc,

	convert(datetime,convert(char(10),au.dt_session,120)),

	au.id_prod,

  	au.id_view,

	au.id_pi_template,

	au.id_pi_instance,

	au.am_currency,

	au.id_se'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'update dm_1

	set dm_1.PrebillAdjustmentAmount = IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0)

	,dm_1.PrebillFederalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillFederalTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillStateTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillStateTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillCountyTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillCountyTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillLocalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillLocalTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillOtherTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillOtherTaxAdjustmentAmount, 0.0)

	,dm_1.PrebillTotalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPrebillTotalTaxAdjustmentAmount, 0.0)			

	,dm_1.PrebillAdjustedAmount = dm_1.PrebillAdjustedAmount + IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0),

					dm_1.PostbillAdjustedAmount = dm_1.PostbillAdjustedAmount + IsNULL(tmp2.CompoundPrebillAdjustmentAmount, 0.0),					dm_1.NumPrebillAdjustments=dm_1.NumPrebillAdjustments+isnull(tmp2.NumPrebillAdjustments,0)

	from t_dm_payee_session dm_1 inner join t_dm_payee_session_2 tmp2 on dm_1.id_dm_acc=tmp2.id_dm_acc

	and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0)

	and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0)

	and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0)

	and dm_1.am_currency=tmp2.am_currency

	and isnull(dm_1.id_se,0)=isnull(tmp2.id_se,0)

	and dm_1.dt_session=tmp2.dt_session'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



select @sql = 'update dm_1

	set dm_1.PostbillAdjustmentAmount = IsNULL(tmp2.CompoundPostbillAdjustmentAmount, 0.0)

	,dm_1.PostbillFederalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillFederalTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillStateTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillStateTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillCountyTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillCountyTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillLocalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillLocalTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillOtherTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillOtherTaxAdjustmentAmount, 0.0)

	,dm_1.PostbillTotalTaxAdjustmentAmount = IsNULL(tmp2.CompoundPostbillTotalTaxAdjustmentAmount, 0.0)				

	,dm_1.PostbillAdjustedAmount = dm_1.PostbillAdjustedAmount + IsNULL(tmp2.CompoundPostbillAdjustmentAmount, 0.0),

	dm_1.NumPostbillAdjustments=dm_1.NumPostbillAdjustments+isnull(tmp2.NumPostbillAdjustments,0)

	from t_dm_payee_session dm_1 inner join t_dm_payee_session_3 tmp2 on dm_1.id_dm_acc=tmp2.id_dm_acc

	and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0)

	and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0)

	and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0)

	and dm_1.am_currency=tmp2.am_currency

	and isnull(dm_1.id_se,0)=isnull(tmp2.id_se,0)

	and dm_1.dt_session=tmp2.dt_session'

execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create clustered index idx_payee_session on t_dm_payee_session(id_dm_acc,dt_session)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'if EXISTS (select * from sysobjects where name = ''t_dm_sess'')

      	drop table t_dm_sess'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'create table t_dm_sess(id_sess integer)'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end



	select @sql = 'insert into t_dm_sess select isnull(max(id_sess),(select id_current-1 from t_current_id where nm_current=''id_sess'')) from t_acc_usage'

	execute (@sql)

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	

	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payer_interval_2'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payer_interval_2'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	

	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payer_interval_3'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payer_interval_3'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	

	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payee_session_2'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payee_session_2'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

	if (@@error <> 0)

	begin

		set @status = -99

		return

	end

	

	SET @SQL = N'IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N''t_dm_payee_session_3'') 

			and OBJECTPROPERTY(id, N''IsUserTable'') = 1)' + N'DROP TABLE t_dm_payee_session_3'

	-- PRINT @SQLStmt 

	EXEC sp_executesql @SQL

		if (@@error <> 0)

	begin

		set @status = -99

		return

	end



    	SELECT @status = 1 

	RETURN

	END

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


    

		Create  Procedure resubmit @rerun_table_name nvarchar(30), @message_size int, @metradate nvarchar(30), @context text, @return_code int OUTPUT 

      as

      begin



      declare @sql nvarchar (4000)

      declare @args NVARCHAR(255)



      declare @id_svc int

      declare @curr_sessions int

      declare @maxsize int

      declare @num_parent_sessions int

      declare @num_service_sessions int



      set @maxsize = @message_size



      declare @runningTotal int

      declare @id_ss_start int

      declare @id_schedule_start int



      declare @child_svc int

      declare @id_parent binary(16)

      declare @parent_id_ss_start int

      declare @parent_id_schedule_start int



      declare @svctablename nvarchar(255)



      SET @return_code = 0



      create table #t_svc_relations (

			      id_svc int primary key,

			      parent_id_svc int)



      create table #aggregate(

	      id_parent_source_sess binary(16),

	      sessions_in_compound int)



      set @sql = N'insert into #t_svc_relations (id_svc, parent_id_svc)

		      select distinct id_svc, null from ' + @rerun_table_name +

		      N' where id_parent_source_sess is null'



      EXEC sp_executesql @sql



      set @sql = N'insert into #t_svc_relations (id_svc, parent_id_svc)

			      select  distinct child.id_svc, parent.id_svc

			      from ' + @rerun_table_name + N' child

			      inner join ' + @rerun_table_name + N' parent

			      on child.id_parent_source_sess = parent.id_source_sess'



      EXEC sp_executesql @sql



      select * from #t_svc_relations



      DECLARE tablename_cursor CURSOR FOR

	      select id_svc from #t_svc_relations

	      where parent_id_svc is null

	      OPEN tablename_cursor

	      FETCH NEXT FROM tablename_cursor into @id_svc



      WHILE @@FETCH_STATUS = 0

      BEGIN

	      PRINT 'the service considered is: ' + cast(@id_svc as varchar(4))

	      -- Bug Fix: 12614 Check to see if all sessions of this parent service exist in the

	      -- corresponding service def table. If the counts are not same, throw 

	      -- an error.

	      set @svctablename = (select nm_table_name from t_service_def_log slog

				    inner join t_enum_data ed

				    on slog.nm_service_def = ed.nm_enum_data

				    where ed.id_enum_data = @id_svc)

	





	      set @sql = N'select @num_parent_sessions = count(*) from ' +

			            @rerun_table_name +

			            N' rr where rr.id_svc = ' +

			            cast(@id_svc as nvarchar(4)) +

			            N' and rr.id_parent_source_sess is null'



	    

        select @args = N'@num_parent_sessions INT OUTPUT'



	      exec sp_executesql @sql, @args, @num_parent_sessions OUTPUT



       	set @sql = N'select @num_service_sessions = count(*) from ' +

			  @rerun_table_name +

			  N' rr inner join ' +

			  @svctablename +

			  N' svc on rr.id_source_sess = svc.id_source_sess where rr.id_svc = ' +

			  cast(@id_svc as nvarchar(4))

 

	      select @args = N'@num_service_sessions INT OUTPUT'



	      exec sp_executesql @sql, @args, @num_service_sessions OUTPUT



	      if (@num_service_sessions < @num_parent_sessions)

	      begin

		      set @return_code = -100 --one or more sessions that have been identified for resubmission are missing.

		      GOTO FATALERROR

	      end



	      -- insert into the aggregate table details of compounds for this svc

	      -- if this a parent of a compound 

	      declare @numChildrenSvc int

	      select @numChildrenSvc = count(*)

	      from #t_svc_relations

	      where parent_id_svc = @id_svc

	      if (@numChildrenSvc > 0)

	      BEGIN

		      set @sql = N'insert into #aggregate
			      select  rr_parent.id_source_sess, count(*) + 1

			      from ' + @rerun_table_name + N' rr_parent

			      inner join ' + @rerun_table_name + N' rr_child

			      on rr_parent.id_source_sess = rr_child.id_parent_source_sess

			      where rr_parent.id_parent_source_sess is null

			      and rr_parent.id_svc = ' + cast(@id_svc as nvarchar(4)) + 

			      N' and rr_parent.tx_state = ''B''

			      group by rr_parent.id_source_sess'

	      END

	      ELSE

	      begin

		      set @sql = N'insert into #aggregate

			      select id_source_sess, 1

			      from ' + @rerun_table_name + 

			      N' where id_svc = ' + cast(@id_svc as nvarchar(4)) +

			      N' and tx_state = ''B'''

	      end



	      EXEC sp_executesql @sql



	      if ((select MAX(sessions_in_compound) from #aggregate) > @maxsize)

	      begin

		      set @return_code = -517996536 --one compound is larger than the entire message size

		      GOTO FATALERROR

	      end



	      select * from #aggregate

	

	      -- update the t_svc table's _intervalID (Bug Fix for 12173)

	      

	      set @sql = N'update ' + @svctablename + N' 

			set ' + @svctablename + N'._IntervalId = rr.id_interval

			from ' + @rerun_table_name + N' rr

			inner join ' + @svctablename + N' svc

			on rr.id_source_sess = svc.id_source_sess'



	      exec sp_executesql @sql

	      set @runningTotal = 0



	      --inner loop to build the message

	      DECLARE CURRENT_COMPOUND CURSOR  for

		      select id_parent_source_sess, sessions_in_compound

		      from #aggregate

	      OPEN CURRENT_COMPOUND

	      FETCH NEXT FROM CURRENT_COMPOUND into @id_parent, @curr_sessions

	      WHILE (@@FETCH_STATUS = 0)

	      BEGIN

		      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

		      select @id_schedule_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuesch'

	

		      set @runningTotal = @runningTotal + @curr_sessions

		      if(@runningTotal <= @maxsize)

		      BEGIN

		      insert into t_session (id_ss, id_source_sess) select @id_ss_start, @id_parent

		      GOTO STEP1

		      END

		      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

		      select @id_schedule_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuesch'



		      set @runningtotal = 0



		      insert into t_session_set(id_ss, id_message, id_svc, session_count, b_root)

		      select id_ss, @id_schedule_start, @id_svc, count(*), '1'

		      from t_session

		      where id_ss = @id_ss_start

		      group by id_ss



		      set @parent_id_ss_start = @id_ss_start

		      set @parent_id_schedule_start = @id_schedule_start



		      insert into t_message(id_message, id_route, dt_crt, dt_assigned, 

		      id_listener, id_pipeline, dt_completed, id_feedback, dt_metered, tx_sc_serialized, tx_ip_address) 

		      values (@id_schedule_start, null, cast(@metradate as datetime), null, null, null, 

		      null, null, cast(@metradate as datetime), @context, '127.0.0.1')



		      update t_current_id 

		      set id_current = id_current + 1

		      where nm_current='id_dbqueuess'



		      update t_current_id 

		      set id_current = id_current + 1

		      where nm_current='id_dbqueuesch'



		      -- we need to create session sets for each child of this parent service

		      DECLARE Children_cursor CURSOR for

		      select id_svc from #t_svc_relations where parent_id_svc = @id_svc

		      OPEN Children_cursor

		      FETCH NEXT FROM Children_cursor into @child_svc

		      WHILE @@FETCH_STATUS = 0

		      BEGIN

			      PRINT 'dealing with child service' + cast (@child_svc as varchar(4))

			      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

			      set @sql = N'insert into t_session (id_ss, id_source_sess)

				      select ' + cast(@id_ss_start as nvarchar(10)) + N', rr.id_source_sess

				      from ' + @rerun_table_name + N' rr

				      inner join t_session ss

				      on ss.id_source_sess = rr.id_parent_source_sess

				      where ss.id_ss = ' + cast(@parent_id_ss_start as nvarchar(10)) +

				      N' and rr.id_svc = ' + cast(@child_svc as nvarchar(4))



			      EXEC sp_executesql @sql



			      insert into t_session_set(id_ss, id_message, id_svc, session_count, b_root)

				      select @id_ss_start, @parent_id_schedule_start, @child_svc, count(*), '0'

				      from t_session

				      where id_ss = @id_ss_start

				      group by id_ss



			      update t_current_id 

				      set id_current = id_current + 1

				      where nm_current='id_dbqueuess'



			      FETCH NEXT FROM Children_cursor into @child_svc

		      END

		      CLOSE Children_cursor

		      DEALLOCATE Children_cursor



		      if not exists (select 1 from t_session where id_source_sess = @id_parent

				      and id_ss = @parent_id_ss_start)

		      begin

			      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

			      insert into t_session (id_ss, id_source_sess) select @id_ss_start, @id_parent

			      set @runningTotal = @runningTotal + @curr_sessions

		      end



	      STEP1: FETCH NEXT FROM CURRENT_COMPOUND into @id_parent, @curr_sessions

	      END	-- end iterating over parent compounds

		      -- repeated code, need to think of a better way

		      -- to do this



		      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

		      select @id_schedule_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuesch'



		      insert into t_session_set(id_ss, id_message, id_svc, session_count, b_root)

		      select id_ss, @id_schedule_start, @id_svc, count(*), '1'

		      from t_session

		      where id_ss = @id_ss_start

		      group by id_ss



		      set @parent_id_ss_start = @id_ss_start

		      set @parent_id_schedule_start = @id_schedule_start



		      insert into t_message(id_message, id_route, dt_crt, dt_assigned, 

		      id_listener, id_pipeline, dt_completed, id_feedback, dt_metered, tx_sc_serialized, tx_ip_address) 

		      values (@id_schedule_start, null, cast(@metradate as datetime), null, null, null, 

		      null, null, cast(@metradate as datetime), @context, '127.0.0.1')



		      update t_current_id 

		      set id_current = id_current + 1

		      where nm_current='id_dbqueuess'



		      update t_current_id 

		      set id_current = id_current + 1

		      where nm_current='id_dbqueuesch'

   		

		      -- repeating this code, bad bad bad

		      DECLARE Children_cursor CURSOR for

		      select id_svc from #t_svc_relations where parent_id_svc = @id_svc

		      OPEN Children_cursor

		      FETCH NEXT FROM Children_cursor into @child_svc

		      WHILE @@FETCH_STATUS = 0

		      BEGIN

			      PRINT 'dealing with child service' + cast (@child_svc as varchar(4))

			      select @id_ss_start = id_current from t_current_id with(updlock) where nm_current='id_dbqueuess'

			      set @sql = N'insert into t_session (id_ss, id_source_sess)

				      select ' + cast(@id_ss_start as nvarchar(10)) + N' , rr.id_source_sess

				      from ' + @rerun_table_name + N' rr

				      inner join t_session ss

				      on ss.id_source_sess = rr.id_parent_source_sess

				      where ss.id_ss = ' + cast(@parent_id_ss_start as nvarchar(10)) +

				      N' and rr.id_svc = ' + cast(@child_svc as nvarchar(4))



			      EXEC sp_executesql @sql



			      insert into t_session_set(id_ss, id_message, id_svc, session_count, b_root)

				      select @id_ss_start, @parent_id_schedule_start, @child_svc, count(*), '0'

				      from t_session

				      where id_ss = @id_ss_start

				      group by id_ss



			      update t_current_id 

				      set id_current = id_current + 1

				      where nm_current='id_dbqueuess'



			      FETCH NEXT FROM Children_cursor into @child_svc

		      END

		      CLOSE Children_cursor

		      DEALLOCATE Children_cursor

	      CLOSE CURRENT_COMPOUND

	      DEALLOCATE CURRENT_COMPOUND

	      truncate table #aggregate

	      FETCH NEXT FROM tablename_cursor into @id_svc

	      END -- end iterating over all parents in the t_rerun_session table



	      CLOSE tablename_cursor

	      DEALLOCATE tablename_cursor



	      IF OBJECT_ID('tempdb..#aggregate') IS NOT NULL 

		      DROP table #aggregate

	      IF OBJECT_ID('tempdb..#t_svc_relations') IS NOT NULL 

		      DROP table #t_svc_relations



	      --adjust the session state

	      set @sql = N'update t_session_state

		        set dt_end =  ''' + @metradate + N'''

		        from ' + @rerun_table_name + N' rr

		      inner join t_session_state ss

		      on rr.id_source_sess = ss.id_sess

		      where ss.dt_end = dbo.MTMaxDate()

		      and rr.tx_state = ''B'' '



	      EXEC sp_executesql @sql





	      set @sql = N'INSERT INTO t_session_state (id_sess, dt_start, dt_end, tx_state) 

		        SELECT rr.id_source_sess, ''' + @metradate + N''', dbo.MTMaxDate(), ''R''

		        from ' + @rerun_table_name + N' rr

		        where rr.tx_state = ''B'' '



	      EXEC sp_executesql @sql



 	

	      --mark the records that were submitted to 'R' in t_failed_transaction

	      set @sql = N'update ft

	                    set State = ''R''

	                    from ' + @rerun_table_name + N' rr

	                    inner join t_failed_transaction ft

	                    on rr.id_source_sess = ft.tx_failureID

	                    where rr.tx_state = ''B''

	                    and ft.id_failed_transaction >= (select MAX(id_failed_transaction) from t_failed_transaction ft1 where ft.tx_failureID = ft1.tx_failureID)'

  	      EXEC sp_executesql @sql	              



	      return @return_code



      FATALERROR: IF OBJECT_ID('tempdb..#t_svc_relations') IS NOT NULL 

		      DROP table #t_svc_relations

	          IF OBJECT_ID('tempdb..#aggregate') IS NOT NULL 

		      DROP table #aggregate

		  IF (@return_code = 0)

			SET @return_code = -1

	          return @return_code



      end



   

    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create procedure sp_DeletePricelist 

		(

			@a_plID int,

			@status INT OUTPUT

		)

		as

		begin

			declare @n_pl_maps as int

			declare @n_def_acc as int



			declare @CursorVar CURSOR 

			declare @count as int

			declare @i as int

			declare @id_rs as int

			

			set @n_pl_maps = (select count(*) from t_pl_map where id_pricelist = @a_plID)

			if (@n_pl_maps > 0)

			begin

				select @status = 1

				return

			end



			set @n_def_acc = (select count(*) from t_av_internal where c_pricelist = @a_plID)

			if (@n_def_acc > 0)

			begin

				select @status = 2

				return

			end

			

			set @i = 0

			set @CursorVar = CURSOR STATIC



			for select id_sched from t_rsched

					where id_pricelist = @a_plID

			open @CursorVar

			select @count = @@cursor_rows

			while @i < @count 

				begin

					fetch next from @CursorVar into @id_rs

					set @i = (select @i + 1)

					exec sp_DeleteRateSchedule @id_rs

				end

			close @CursorVar

			deallocate @CursorVar



			delete from t_pricelist where id_pricelist = @a_plID

			execute DeleteBaseProps @a_plID

			

			select @status = 0

			return (0)

		end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



		create procedure sp_DeleteRateSchedule 

			@a_rsID int

		as

		begin

			declare @id_effdate int

			declare @id_paramtbl int

			declare @nm_paramtbl NVARCHAR(255)

			declare @SQLString NVARCHAR(255)



			-- Find the information we need to delete rates

			set @id_effdate = (select id_eff_date from t_rsched where id_sched = @a_rsID)

			set @id_paramtbl = (select id_pt from t_rsched where id_sched = @a_rsID)			

			set @nm_paramtbl = (select nm_instance_tablename from t_rulesetdefinition where id_paramtable = @id_paramtbl)



			-- Create the delete statement for the particular rule table and execute it

			set @SQLString = N'delete from ' + @nm_paramtbl + ' where id_sched = ' + CAST(@a_rsID AS NVARCHAR(10))

			execute sp_executesql @SQLString



			-- Delete the remaining rate schedule info

			delete from t_rsched where id_sched = @a_rsID

			delete from t_effectivedate where id_eff_date = @id_effdate

			execute DeleteBaseProps @a_rsID

		end

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						create procedure sp_InsertAtomicCapType 

						(@aGuid varbinary(16), @aName NVARCHAR(255), @aDesc NVARCHAR(255), @aProgid NVARCHAR(255), @aEditor NVARCHAR(255),

						@ap_id_prop int OUTPUT)

						as

						

						begin

            	INSERT INTO t_atomic_capability_type(tx_guid,tx_name,tx_desc,tx_progid,tx_editor) VALUES (

            	@aGuid, @aName, @aDesc, @aProgid, @aEditor)

            	  if (@@error <> 0) 

                  begin

                  select @ap_id_prop = -99

                  end

                  else

                  begin

                  select @ap_id_prop = @@identity

                  end

            end

				 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


			create proc sp_InsertBaseProps @a_kind int,
						@a_nameID int,
						@a_descID int,
						@a_approved char(1),
						@a_archive char(1),
						@a_nm_name NVARCHAR(255),
						@a_nm_desc NVARCHAR(255),
						@a_id_prop int OUTPUT
			as
			insert into t_base_props (n_kind,n_name,n_desc,nm_name,nm_desc,b_approved,b_archive) values
				(@a_kind,@a_nameID,@a_descID,@a_nm_name,@a_nm_desc,@a_approved,@a_archive)
			select @a_id_prop =@@identity
	 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

					  CREATE procedure sp_InsertCapabilityInstance

						(@aGuid VARCHAR(16), @aParentInstance int, @aPolicy int, @aCapType int,

						@ap_id_prop int OUTPUT)

						as

						

						begin

            	INSERT INTO t_capability_instance (tx_guid, id_parent_cap_instance, id_policy, id_cap_type) 

            	VALUES (cast (@aGuid as varbinary(16)), @aParentInstance, @aPolicy, @aCapType)

              if (@@error <> 0) 

                begin

                select @ap_id_prop = -99

                end

              else

                begin

                select @ap_id_prop = @@identity

                end

           	end

					 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						create procedure sp_InsertCompositeCapType 

						(@aGuid VARBINARY(16), @aName NVARCHAR(255), @aDesc NVARCHAR(255), @aProgid NVARCHAR(255), 

             @aEditor NVARCHAR(255),@aCSRAssignable VARCHAR, @aSubAssignable VARCHAR,

             @aMultipleInstances VARCHAR, @aUmbrellaSensitive VARCHAR , @ap_id_prop int OUTPUT)

						as

						

						begin

            	INSERT INTO t_composite_capability_type(tx_guid,tx_name,tx_desc,tx_progid,tx_editor,

              csr_assignable,subscriber_assignable,multiple_instances,umbrella_sensitive) VALUES (

							@aGuid, @aName, @aDesc, @aProgid, @aEditor, @aCSRAssignable,

						  @aSubAssignable, @aMultipleinstances,@aUmbrellaSensitive)

							if (@@error <> 0) 

                  begin

                  select @ap_id_prop = -99

                  end

                  else

                  begin

                  select @ap_id_prop = @@identity

                  end

        		END

				 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

						create procedure sp_InsertPolicy

						(@aPrincipalColumn VARCHAR(255),

						 @aPrincipalID int,

						 @aPolicyType VARCHAR(2),

             @ap_id_prop int OUTPUT)

		        as

		        

            declare @args NVARCHAR(255)

		        declare @str nvarchar(2000)

						declare @selectstr nvarchar(2000)

            begin

						 select @selectstr = N'SELECT @ap_id_prop = id_policy  FROM t_principal_policy WHERE ' + 

																CAST(@aPrincipalColumn AS nvarchar(255))

																+  N' = ' + CAST(@aPrincipalID AS nvarchar(38)) + N' AND ' + N'policy_type=''' 

																+ CAST(@aPolicyType AS nvarchar(2)) + ''''

						 select @str = N'INSERT INTO t_principal_policy (' + CAST(@aPrincipalColumn AS nvarchar(255)) + N',

						               policy_type)' + N' VALUES ( ' + CAST(@aPrincipalID AS nvarchar(38)) + N', ''' + 

						               CAST(@aPolicyType AS nvarchar(2))	+ N''')' 

            select @args = '@ap_id_prop INT OUTPUT'

            exec sp_executesql @selectstr, @args, @ap_id_prop OUTPUT

             if (@ap_id_prop is null)

	            begin

              exec sp_executesql @str

  	          select @ap_id_prop = @@identity

              end

            end

         
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


        

					  create procedure sp_InsertRole

						(@aGuid VARBINARY(16), @aName NVARCHAR(255), @aDesc NVARCHAR(255),

						 @aCSRAssignable VARCHAR, @aSubAssignable VARCHAR, @ap_id_prop int OUTPUT)

						as

						

	          begin

             INSERT INTO t_role (tx_guid, tx_name, tx_desc, csr_assignable, subscriber_assignable) VALUES (@aGuid,

             @aName, @aDesc, @aCSRAssignable, @aSubAssignable)

						 if (@@error <> 0) 

							begin

              select @ap_id_prop = -99

              end

             else

              begin

              select @ap_id_prop = @@identity

              end

            end

				 
        
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE updatesub (

@p_id_sub INT,

@p_dt_start datetime,

@p_dt_end datetime,

@p_nextcycleafterstartdate VARCHAR,

@p_nextcycleafterenddate VARCHAR,

@p_id_po INT,

@p_id_acc INT,

@p_systemdate datetime,

@p_status INT OUTPUT,

@p_datemodified varchar OUTPUT

)

AS

BEGIN

	DECLARE @real_begin_date as datetime

	DECLARE @real_end_date as datetime

	declare @varMaxDateTime datetime

	declare @temp_guid varbinary(16)

	declare @id_group as integer

  declare @cycle_type as integer

  declare @po_cycle as integer



	select @varMaxDateTime = dbo.MTMaxDate()

	-- step 1: compute usage cycle dates if necessary

	select @p_status = 0

	SELECT @temp_guid = id_sub_ext

	FROM t_sub

	WHERE id_sub = @p_id_sub



	if @p_id_acc is not NULL begin

	

		IF (@p_nextcycleafterstartdate = 'Y') begin

			select @real_begin_date =dbo.nextdateafterbillingcycle (@p_id_acc, @p_dt_start) 

		end

		ELSE begin

			select @real_begin_date = @p_dt_start

		END

		IF (@p_nextcycleafterenddate = 'Y') begin

		-- CR 5785: make sure the end date of the subscription if using billing cycle

		-- relative is at the end of the current billing cycle

			select @real_end_date = dbo.subtractsecond (

		                        dbo.nextdateafterbillingcycle (@p_id_acc, @p_dt_end))

		end

		ELSE begin

			select @real_end_date = @p_dt_end

		END

		-- step 2: if the begin date is after the end date, make the begin date match the end date

		IF (@real_begin_date > @real_end_date) begin

			select @real_begin_date = @real_end_date

		END 

		select @p_status = dbo.checksubscriptionconflicts (

		                 @p_id_acc,@p_id_po,@real_begin_date,@real_end_date,

		                 @p_id_sub)

		IF (@p_status <> 1) begin

		  RETURN

		END



    -- fetch the cycle of the account

    select 

    @cycle_type = id_cycle_type

    from t_acc_usage_cycle

    INNER JOIN t_usage_cycle on t_usage_cycle.id_usage_cycle = t_acc_usage_cycle.id_usage_cycle 

    where 

    t_acc_usage_cycle.id_acc = @p_id_acc



    -- fetch the cycle of the PI's on the PO

    select @po_cycle = dbo.poConstrainedCycleType(@p_id_po)



    if @po_cycle <> 0 begin

	    if @cycle_type <> @po_cycle begin

		    -- MTPCUSER_CYCLE_CONFLICTS_WITH_ACCOUNT_CYCLE

		    select @p_status = -289472464

        return

	    end

    end



	end

	else begin

		select @real_begin_date = @p_dt_start

		select @real_end_date = @p_dt_end

		select @id_group = id_group from t_sub where id_sub = @p_id_sub

	end



	-- verify that the start and end dates are inside the product offering effective

	-- date

	exec AdjustSubDates @p_id_po,@real_begin_date,@real_end_date,

		@real_begin_date OUTPUT,@real_end_date OUTPUT,@p_datemodified OUTPUT,

		@p_status OUTPUT

	if @p_status <> 1 begin

		return

	end



	exec CreateSubscriptionRecord @p_id_sub,@temp_guid,@p_id_acc,@id_group,

		@p_id_po,@p_systemdate,@real_begin_date,@real_end_date,

		@p_systemdate,@p_status OUTPUT

END

		
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

