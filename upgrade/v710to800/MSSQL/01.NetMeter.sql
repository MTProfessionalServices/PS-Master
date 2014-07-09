/*
Run this script on:

        (local).NetMeter    -  This database will be modified

to synchronize it with:

        10.200.85.87.NetMeter

You are recommended to back up your database before running this script

Script created by SQL Compare version 10.7.0 from Red Gate Software Ltd at 7/8/2014 4:36:56 AM

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
PRINT N'Dropping constraints from [dbo].[mvm_scheduled_tasks]'
GO
ALTER TABLE [dbo].[mvm_scheduled_tasks] DROP CONSTRAINT [DF__mvm_sched__mvm_p__04CFADEC]
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
PRINT N'Refreshing [dbo].[VW_ADJUSTMENT_SUMMARY]'
GO
EXEC sp_refreshview N'[dbo].[VW_ADJUSTMENT_SUMMARY]'
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
PRINT N'Refreshing [dbo].[t_vw_expanded_sub]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_expanded_sub]'
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
          @subscriptionStart        DATETIME,
          @subscriptionEnd          DATETIME,
          @isEndDateUpdated         BIT = 0,
  /* TODO: Remove duplicated values once 1-st and 2-nd query is executed conditionally */
          @rcActionForEndDateUpdate2 nvarchar(20),
          @subscriptionStart2        DATETIME,
          @subscriptionEnd2          DATETIME,
          @isStartDateUpdated        BIT = 0

  /* Assuming only 1 subscription can be changed at a time */
  SELECT @newSubStart = new_sub.vt_start, @newSubEnd = new_sub.vt_end,
         @curSubStart = current_sub.vt_start, @curSubEnd = current_sub.vt_end
  FROM #recur_window_holder rw
      INNER LOOP JOIN t_sub_history new_sub ON new_sub.id_acc = rw.c__AccountID
          AND new_sub.id_sub = rw.c__SubscriptionID
          AND new_sub.tt_end = dbo.MTMaxDate()
      INNER LOOP JOIN t_sub_history current_sub ON current_sub.id_acc = rw.c__AccountID
          AND current_sub.id_sub = rw.c__SubscriptionID
          AND current_sub.tt_end = dbo.SubtractSecond(new_sub.tt_start)

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
         /* TODO: Fix backdating */
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

 UNION

	SELECT DISTINCT
	/* Now, handle the exceptional case above, where (a) an arrears charge, (b) old sub end date was after the end of the pci, (c) new sub end date is inside the pci.
	* In this case, issue a debit from the pci start to the subscription end immediately. */
         'Debit'                                                                                    AS c_RCActionType,
	       pci.dt_start                                                                               AS c_RCIntervalStart,
	       pci.dt_end                                                                                 AS c_RCIntervalEnd,
	       paymentInterval.dt_start                                                                   AS c_BillingIntervalStart,
	       paymentInterval.dt_end                                                                     AS c_BillingIntervalEnd,
	       dbo.mtmaxoftwodates(pci.dt_start, new_sub.vt_start)                                        AS c_RCIntervalSubscriptionStart,
	       new_sub.vt_end                                                                             AS c_RCIntervalSubscriptionEnd,
	       new_sub.vt_start                                                                           AS c_SubscriptionStart,
	       new_sub.vt_end                                                                             AS c_SubscriptionEnd,
	       new_sub.vt_start                                                                           AS c_BilledRateDate,
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
	FROM   #recur_window_holder rw
	       INNER LOOP JOIN t_sub_history new_sub ON new_sub.id_acc = rw.c__AccountID AND new_sub.id_sub = rw.c__SubscriptionID AND new_sub.tt_end = dbo.MTMaxDate()
	       INNER LOOP JOIN t_sub_history current_sub ON current_sub.id_acc = rw.c__AccountID AND current_sub.id_sub = rw.c__SubscriptionID
                                                   AND current_sub.tt_end = dbo.SubtractSecond(new_sub.tt_start)
	       INNER LOOP JOIN t_recur rcr ON rw.c__priceableiteminstanceid = rcr.id_prop
	       INNER LOOP JOIN t_acc_usage_cycle auc ON auc.id_acc = rw.c__payingaccount
	       /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
	       INNER LOOP JOIN t_pc_interval pci WITH(INDEX(pci_cycle_dt_idx))
	            ON pci.id_cycle = CASE
	                                    WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle
	                                    WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN auc.id_usage_cycle
	                                    WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(auc.id_usage_cycle,rw.c_SubscriptionStart,rcr.id_cycle_type)
	                                    ELSE NULL
	                               END
	            AND dbo.MTMinOfTwoDates(pci.dt_end, current_sub.vt_end) != dbo.MTMinOfTwoDates(pci.dt_end, new_sub.vt_end)
	            AND pci.dt_start < dbo.MTMaxOfTwoDates(current_sub.vt_end, new_sub.vt_end)
              AND pci.dt_end > dbo.MTMinOfTwoDates(current_sub.vt_start, new_sub.vt_start)
	            AND pci.dt_end BETWEEN rw.c_payerstart AND rw.c_payerend /* rc start goes to this payer */
	            AND rw.c_unitvaluestart      < pci.dt_end AND rw.c_unitvalueend      > pci.dt_start /* rc overlaps with this UDRC */
	            AND rw.c_membershipstart     < pci.dt_end AND rw.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
	       INNER LOOP JOIN t_usage_interval paymentInterval ON pci.dt_start BETWEEN paymentInterval.dt_start AND paymentInterval.dt_end
	            AND paymentInterval.id_usage_cycle = pci.id_cycle
	       INNER LOOP JOIN t_usage_cycle ccl
	            ON  ccl.id_usage_cycle = CASE
	                                          WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle
	                                          WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN auc.id_usage_cycle
	                                          WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(auc.id_usage_cycle, rw.c_SubscriptionStart, rcr.id_cycle_type)
	                                          ELSE NULL
	                                     END
	       INNER LOOP JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
	       INNER JOIN t_usage_interval currentui ON @currentDate BETWEEN currentui.dt_start AND currentui.dt_end AND currentui.id_usage_cycle = paymentInterval.id_usage_cycle
	WHERE
	       EXISTS (SELECT 1 FROM t_sub_history tsh WHERE tsh.id_sub = rw.C__SubscriptionID AND tsh.id_acc = rw.c__AccountID AND tsh.tt_end < dbo.MTMaxDate())
	       AND (rcr.b_prorate_on_deactivate='Y' OR pci.dt_start > dbo.mtendofday(rw.c_SubscriptionEnd))
	       /* Deal with the above-mentioned exceptional case here.
	       */
	       AND (rcr.b_advance = 'N' AND current_sub.vt_end > pci.dt_end AND new_sub.vt_end < pci.dt_end)
	       AND rw.c__IsAllowGenChargeByTrigger = 1;

	
 /* Now determine if th interval and if the RC adapter has run, if no remove those adavanced charge credits */
    DECLARE @prev_interval INT, @cur_interval INT, @do_credit INT

select @prev_interval = pui.id_interval, @cur_interval = cui.id_interval
from t_usage_interval cui WITH(NOLOCK)
inner join #tmp_rc_1 on #tmp_rc_1.c__IntervalID = cui.id_interval
inner join t_usage_cycle uc WITH(NOLOCK) on cui.id_usage_cycle = uc.id_usage_cycle
inner join t_usage_interval pui WITH(NOLOCK) ON pui.dt_end = dbo.SubtractSecond( cui.dt_start ) AND pui.id_usage_cycle = cui.id_usage_cycle
select @do_credit = (CASE WHEN ISNULL(rei.id_arg_interval, 0) = 0 THEN 0
ELSE
CASE WHEN (rr.tx_type = 'Execute' AND rei.tx_status = 'Succeeded') THEN 1 ELSE 0 END
END)
from t_recevent re
left outer join t_recevent_inst rei on re.id_event = rei.id_event and rei.id_arg_interval = @prev_interval
left outer join t_recevent_run rr on rr.id_instance = rei.id_instance
where 1=1
and re.dt_deactivated is null
and re.tx_name = 'RecurringCharges'
and rr.id_run = (
select MAX(rr.id_run)
from t_recevent re
left outer join t_recevent_inst rei on re.id_event = rei.id_event and rei.id_arg_interval = @prev_interval
left outer join t_recevent_run rr on rr.id_instance = rei.id_instance
where 1=1
and re.dt_deactivated is null
and re.tx_name = 'RecurringCharges'
)

    IF @do_credit = 0
    BEGIN
        delete rcred
        from #tmp_rc_1 rcred
        inner join t_usage_interval ui on ui.id_interval = @cur_interval and rcred.c_BillingIntervalStart = ui.dt_start
    END;
	SELECT *,NEWID() AS idSourceSess INTO #tmp_rc FROM #tmp_rc_1;
--If no charges to meter, return immediately
    IF (NOT EXISTS (SELECT 1 FROM #tmp_rc)) RETURN;
 
   EXEC InsertChargesIntoSvcTables;
	  
	UPDATE rw
	SET c_BilledThroughDate = @currentDate
	FROM #recur_window_holder rw
	where rw.c__IsAllowGenChargeByTrigger = 1;

 END;
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
PRINT N'Refreshing [dbo].[t_vw_rc_arrears_relative]'
GO
EXEC sp_refreshview N'[dbo].[t_vw_rc_arrears_relative]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[MeterUdrcFromRecurWindow]'
GO
ALTER PROCEDURE [dbo].[MeterUdrcFromRecurWindow]
@currentDate dateTime
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @id_run INT
	declare @idMessage BIGINT
	DECLARE @idService INT
	DECLARE @numBlocks INT
	
IF ((SELECT value FROM t_db_values WHERE parameter = N'InstantRc') = 'false') return;

	SELECT      DISTINCT
      pci.dt_start      AS c_RCIntervalStart
      ,pci.dt_end      AS c_RCIntervalEnd
      ,ui.dt_start      AS c_BillingIntervalStart
      ,ui.dt_end          AS c_BillingIntervalEnd
      ,CASE WHEN rcr.tx_cycle_mode <> 'Fixed' AND ui.dt_start <> rw_new.c_cycleEffectiveDate
       THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(rw_new.c_cycleEffectiveDate), pci.dt_start)
       ELSE pci.dt_start END as c_RCIntervalSubscriptionStart
      ,dbo.mtminoftwodates(pci.dt_end, rw_new.c_SubscriptionEnd)          AS c_RCIntervalSubscriptionEnd
      ,rw_new.c_SubscriptionStart          AS c_SubscriptionStart
      ,rw_new.c_SubscriptionEnd          AS c_SubscriptionEnd
    --Booleans are, stupidly enough, stored as Y/N in one table, but 0/1 in another table.  Convert them.
    ,case when rw_new.c_advance  ='Y' then '1' else '0' end          AS c_Advance
    ,case when rcr.b_prorate_on_activate ='Y' then '1' else '0' end         AS c_ProrateOnSubscription
      ,dbo.MTMaxOfTwoDates(rw_new.c_UnitValueStart, trv.vt_start) AS c_UnitValueStart
      ,dbo.MTMinOfTwoDates(rw_new.c_UnitValueEnd, trv.vt_end) AS c_UnitValueEnd
      ,tou.n_value AS c_UnitValueAdvanceCorrection
      ,rw_new.c_UnitValue AS c_UnitValueDebitCorrection
      ,rcr.n_rating_type AS c_RatingType
      ,case when rcr.b_prorate_on_deactivate  ='Y' then '1' else '0' end          AS c_ProrateOnUnsubscription
      ,CASE WHEN rcr.b_fixed_proration_length = 'Y' THEN fxd.n_proration_length ELSE 0 END          AS c_ProrationCycleLength
      ,dbo.MTMinOfTwoDates(pci.dt_end,rw_new.c_SubscriptionEnd)  AS c_BilledRateDate
      ,rw_new.c__subscriptionid      AS c__SubscriptionID
      ,rw_new.c__accountid AS c__AccountID
      ,rw_new.c__payingaccount      AS c__PayingAccount
      ,rw_new.c__priceableiteminstanceid      AS c__PriceableItemInstanceID
      ,rw_new.c__priceableitemtemplateid      AS c__PriceableItemTemplateID
      ,rw_new.c__productofferingid      AS c__ProductOfferingID
      ,currentui.id_interval AS c__IntervalID
    INTO #tmp_udrc_1
    FROM #recur_window_holder rw_new
	INNER JOIN t_recur_window trw ON rw_new.c__AccountID = trw.c__AccountID AND rw_new.c__SubscriptionID = trw.c__SubscriptionID
	   -- AND (rw_new.c_UnitValueStart <= trw.c_UnitValueStart OR rw_new.c_UnitValueEnd >= trw.c_UnitValueEnd)
	INNER JOIN t_recur_value trv on trv.id_sub = rw_new.C__SubscriptionID AND trv.tt_end = dbo.MTMaxDate()
	  and trv.vt_start < rw_new.c_UnitValueEnd AND trv.vt_end > rw_new.c_UnitValueStart
	INNER JOIN t_usage_interval ui ON
	  rw_new.c_UnitValueStart < ui.dt_end and rw_new.c_UnitValueEnd > ui.dt_start
	INNER JOIN t_recur rcr ON rw_new.c__priceableiteminstanceid = rcr.id_prop
    INNER JOIN t_usage_cycle ccl ON ccl.id_usage_cycle =
        CASE WHEN rcr.tx_cycle_mode = 'Fixed' THEN rcr.id_usage_cycle
        WHEN rcr.tx_cycle_mode = 'BCR Constrained' THEN ui.id_usage_cycle
        WHEN rcr.tx_cycle_mode = 'EBCR' THEN dbo.DeriveEBCRCycle(ui.id_usage_cycle, rw_new.c_SubscriptionStart, rcr.id_cycle_type)
        ELSE NULL END
    JOIN t_acc_usage_cycle auc on auc.id_acc = rw_new.c__payingaccount and auc.id_usage_cycle = ccl.id_usage_cycle
    /* NOTE: we do not join RC interval by id_interval.  It is different (not sure what the reasoning is) */
    INNER JOIN t_pc_interval pci ON pci.id_cycle = ccl.id_usage_cycle
                                   AND pci.dt_start BETWEEN ui.dt_start     AND ui.dt_end                            /* rc start falls in this interval */
                                   AND pci.dt_start < dbo.MTMinOfTwoDates(rw_new.c_PayerEnd, rw_new.c_payerend)
                                   AND pci.dt_end > dbo.MTMaxOfTwoDates(rw_new.c_payerstart, rw_new.c_PayerStart)             /* rc start goes to this payer */
                                   AND rw_new.c_membershipstart     < pci.dt_end AND rw_new.c_membershipend     > pci.dt_start /* rc overlaps with this membership */
                                   AND rw_new.c_cycleeffectivestart < pci.dt_end AND rw_new.c_cycleeffectiveend > pci.dt_start /* rc overlaps with this cycle */
                                   AND rw_new.c_SubscriptionStart   < pci.dt_end AND rw_new.c_subscriptionend   > pci.dt_start /* rc overlaps with this subscription */

    INNER JOIN t_usage_cycle_type fxd ON fxd.id_cycle_type = ccl.id_cycle_type
	inner join t_usage_interval currentui on @currentDate between currentui.dt_start and currentui.dt_end and currentui.id_usage_cycle = ui.id_usage_cycle
    INNER JOIN #tmp_old_units tou ON tou.n_value IS NOT NULL
  where
      --Don't issue corrections for old values that are going to stay the same.
      NOT EXISTS (SELECT 1 FROM #tmp_old_units tou WHERE rw_new.c_UnitValueStart = tou.vt_start OR rw_new.c_UnitValueEnd = tou.vt_end)
      --Only issue corrections if there's a previous iteration.
      AND EXISTS (SELECT 1 FROM t_recur_value trv WHERE trv.id_sub = rw_new.c__SubscriptionID AND trv.tt_end < dbo.MTMaxDate())
      AND rw_new.c_UnitValue IS NOT NULL
      AND rw_new.c__IsAllowGenChargeByTrigger = 1;
 
      	SELECT 'AdvanceCorrection' AS c_RCActionType
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
           ,'N' AS c_ProrateInstantly
           ,c_UnitValueStart
           ,c_UnitValueEnd
           ,c_UnitValueAdvanceCorrection AS c_UnitValue
           ,c_RatingType
           ,c_ProrateOnUnsubscription
           ,c_ProrationCycleLength
           ,c_BilledRateDate
           ,c__SubscriptionID
           ,c__AccountID
           ,c__PayingAccount
           ,c__PriceableItemInstanceID
           ,c__PriceableItemTemplateID
           ,c__ProductOfferingID
           ,c__IntervalID
           ,NEWID() AS idSourceSess INTO #tmp_rc FROM #tmp_udrc_1
           
           UNION ALL
           
      	SELECT 'DebitCorrection' AS c_RCActionType
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
           ,'N' AS c_ProrateInstantly
           ,c_UnitValueStart
           ,c_UnitValueEnd
           ,c_UnitValueDebitCorrection AS c_UnitValue
           ,c_RatingType
           ,c_ProrateOnUnsubscription
           ,c_ProrationCycleLength
           ,c_BilledRateDate
           ,c__SubscriptionID
           ,c__AccountID
           ,c__PayingAccount
           ,c__PriceableItemInstanceID
           ,c__PriceableItemTemplateID
           ,c__ProductOfferingID
           ,c__IntervalID
           ,NEWID() AS idSourceSess FROM #tmp_udrc_1 ;
    --If no charges to meter, return immediately
    IF (NOT EXISTS (SELECT 1 FROM #tmp_rc)) RETURN;
     
     EXEC InsertChargesIntoSvcTables;
	 
	UPDATE rw
	SET c_BilledThroughDate = @currentDate
	FROM #recur_window_holder rw
	where rw.c__IsAllowGenChargeByTrigger = 1;

  
 end;
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
PRINT N'Refreshing [dbo].[VW_AJ_INFO]'
GO
EXEC sp_refreshview N'[dbo].[VW_AJ_INFO]'
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
PRINT N'Refreshing [dbo].[VW_ADJUSTMENT_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_ADJUSTMENT_DETAILS]'
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
PRINT N'Refreshing [dbo].[VW_NOTDELETED_ADJ_DETAILS]'
GO
EXEC sp_refreshview N'[dbo].[VW_NOTDELETED_ADJ_DETAILS]'
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
	  and rw.c_BilledThroughDate < (CASE WHEN rcr.tx_cycle_mode <> 'Fixed' AND nui.dt_start <> c_cycleEffectiveDate
                                    THEN dbo.MTMaxOfTwoDates(dbo.AddSecond(c_cycleEffectiveDate), pci.dt_start)
                                    ELSE pci.dt_start END)
)A      ;

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
		   dbo.GreatestDate(@sub_start, subs.sub_start),
		   dbo.LeastDate(@sub_end, subs.sub_end),
		   subs.sub_start,
		   subs.sub_end
	FROM
	(
		SELECT t1.id_po
				, MAX(t1.id_group) AS id_group
				, MAX(ed.dt_start) AS sub_start
				, ISNULL(MAX(ed.dt_end), dbo.MTMaxDate()) AS sub_end
			FROM (
				SELECT ISNULL(ts.id_po,s.id_po) AS id_po, s.id_group
					FROM t_acc_template_subs ts
					LEFT JOIN t_sub s ON s.id_group = ts.id_group
					WHERE ts.id_acc_template = @template_id
			) t1
			JOIN t_po po ON po.id_po = t1.id_po
			JOIN t_effectivedate ed ON po.id_eff_date = ed.id_eff_date
			GROUP BY t1.id_po

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
PRINT N'Altering [dbo].[mvm_scheduled_tasks]'
GO
ALTER TABLE [dbo].[mvm_scheduled_tasks] ALTER COLUMN [mvm_poll_guid] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
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
PRINT N'Altering [dbo].[t_be_cor_qu_quoteheader]'
GO
ALTER TABLE [dbo].[t_be_cor_qu_quoteheader] ALTER COLUMN [c_QuoteDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
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
PRINT N'Adding constraints to [dbo].[mvm_scheduled_tasks]'
GO
ALTER TABLE [dbo].[mvm_scheduled_tasks] ADD CONSTRAINT [DF__mvm_sched__mvm_p__04CFADEC] DEFAULT ('0') FOR [mvm_poll_guid]
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
PRINT N'Altering trigger [dbo].[trig_update_t_recur_window_with_recur_value] on [dbo].[t_recur_value]'
GO
ALTER trigger trig_update_t_recur_window_with_recur_value
 ON t_recur_value for INSERT, UPDATE, delete
 as
BEGIN
declare @startDate datetime;
select @startDate = tt_start from inserted
  --Get the values which are new (the problem is that we delete and
  --     re-insert EVERY unit value for this subscription, even the
  --     ones that haven't changed.
  select * into #tmp_new_units
  FROM inserted rdnew
  WHERE NOT EXISTS
   (SELECT * FROM inserted rdold where
     rdnew.n_value = rdold.n_value
     AND rdnew.vt_start = rdold.vt_start
     AND rdnew.vt_end = rdold.vt_end
	  and rdnew.id_prop = rdold.id_prop
     and rdnew.id_sub = rdold.id_sub
     AND rdold.tt_end < dbo.MTMaxDate()) /* FIXME: this should join to new tt_start + 1 second */
     
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
      INTO #recur_window_holder
      FROM t_sub sub
      INNER JOIN t_payment_redirection pay ON pay.id_payee = sub.id_acc AND pay.vt_start < sub.vt_end AND pay.vt_end > sub.vt_start
      INNER JOIN t_pl_map plm ON plm.id_po = sub.id_po AND plm.id_paramtable IS NULL
      INNER JOIN t_recur rcr ON plm.id_pi_instance = rcr.id_prop
      INNER JOIN t_base_props bp ON bp.id_prop = rcr.id_prop
      JOIN #tmp_new_units rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub AND rv.tt_end = dbo.MTMaxDate()
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
      JOIN #tmp_new_units rv ON rv.id_prop = rcr.id_prop
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
      JOIN #tmp_new_units rv ON rv.id_prop = rcr.id_prop AND sub.id_sub = rv.id_sub
      AND rv.tt_end = dbo.MTMaxDate()
      AND rv.vt_start < sub.vt_end AND rv.vt_end > sub.vt_start
      AND rv.vt_start < pay.vt_end AND rv.vt_end > pay.vt_start
      WHERE
      	grm.tt_end = dbo.mtmaxdate()
      	AND rcr.b_charge_per_participant = 'N'
      	AND (bp.n_kind = 20 OR rv.id_prop IS NOT NULL)
;
--Get the old vt_start and vt_end for recur values that have changed
select distinct trw.c__SubscriptionID AS id_sub,
    trw.c_UnitValue as n_value,
   IsNull(trw.c_UnitValueStart, dbo.mtmindate()) AS vt_start,
    IsNull(trw.c_UnitValueEnd, dbo.mtmaxdate()) AS vt_end,
    trv.tt_end
  into  #tmp_old_units
  FROM
     t_recur_window trw
     JOIN #recur_window_holder rwh ON
  trw.c__SubscriptionID = rwh.c__SubscriptionID
  and trw.c__PriceableItemTemplateId = rwh.c__PriceableItemTemplateId
  and trw.c__PriceableItemInstanceId = rwh.c__PriceableItemInstanceId
  AND trw.c_UnitValue = rwh.c_UnitValue
  --A possibly clumsy attempt at an XOR.  We want one of the start or end dates
  --  to match the old start/end, but not the other one.
  AND (trw.c_UnitValueStart = rwh.c_UnitValueStart
  or trw.c_UnitValueEnd = rwh.c_UnitValueEnd)
  AND (trw.c_UnitValueStart != rwh.c_UnitValueStart
  or trw.c_UnitValueEnd != rwh.c_UnitValueEnd)
  JOIN t_recur_value trv
    ON rwh.c__SubscriptionID = trv.id_sub
    and trv.id_prop = rwh.c__PriceableItemInstanceId
    AND trw.c_UnitValueStart = trv.vt_start
    and trw.c_UnitValueEnd = trv.vt_end
    AND trv.tt_end < dbo.MTMaxDate() ; /* FIXME: this should join to new tt_start + 1 second */
    
--The recur_window_holder has too many entries, because of the way we drop all entries for a sub
--  then re-insert them.  So, drop all the entries that already exist in t_recur_window
DELETE FROM #recur_window_holder WHERE EXISTS
(SELECT 1 FROM t_recur_window trw  JOIN t_recur_value trv
    ON trw.c__SubscriptionID = trv.id_sub
    AND trw.c__PriceableItemInstanceId = trv.id_prop
    AND trw.c_UnitValueStart = trv.vt_start
    AND trw.c_UnitValueEnd = trv.vt_end
    AND trv.tt_end = dbo.MTMaxDate()
WHERE
   trw.c__SubscriptionID = #recur_window_holder.c__SubscriptionID
   AND trw.c_UnitValue = #recur_window_holder.c_UnitValue
   AND trw.c_UnitValueStart = #recur_window_holder.c_UnitValueStart
   AND trw.c_UnitValueEnd = #recur_window_holder.c_UnitValueEnd
   and trw.c__PriceableItemInstanceID = #recur_window_holder.c__PriceableItemInstanceID
   and trw.c__PriceableItemTemplateID = #recur_window_holder.c__PriceableItemTemplateID
)
      
      EXEC MeterInitialFromRecurWindow @currentDate = @startDate;
	  EXEC MeterUdrcFromRecurWindow @currentDate = @startDate;

--Delete old values from t_recur_window
delete from t_recur_window WHERE EXISTS
  (SELECT 1 FROM t_recur_value oldunits join t_pl_map plm on oldunits.id_sub = plm.id_sub
  and oldunits.id_prop = plm.id_pi_instance
     where
  t_recur_window.c__SubscriptionID = oldunits.id_sub
  AND t_recur_window.c_UnitValueStart = oldunits.vt_start
  AND t_recur_window.c_UnitValueEnd = oldunits.vt_end
  and plm.id_pi_instance = t_recur_window.c__PriceableItemInstanceID
  and plm.id_pi_template = t_recur_window.c__PriceableItemTemplateID
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
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MetraNet instance from which the data originated.', 'SCHEMA', N'dbo', 'TABLE', N'Customer', 'COLUMN', N'InstanceId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'This ProductOffering table stores descriptions for product offerings.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', NULL, NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'When this product offering stops being available for subscriptions.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'AvailableEndDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'When this product offering becomes available for subscriptions.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'AvailableStartDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Latest date when a subscription to this product offering is allowed to end.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'EffectiveEndDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Earliest date when a subscription to this product offering is allowed to begin.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'EffectiveStartDate'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MetraNet instance from which the data originated.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'InstanceId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether this product offering is hidden from the list of available offerings.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'IsHidden'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether the user can self-subscribe to this offering.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'IsUserSubscribable'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether the user can self-unsubscribe to this offering.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'IsUserUnsubscribable'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product Offering Identifier.', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'ProductOfferingId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Name of the product offering (should be unique by InstanceId).', 'SCHEMA', N'dbo', 'TABLE', N'ProductOffering', 'COLUMN', N'ProductOfferingName'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'This SubscriptionSummary aggregates the SubscriptionsByMonth Table by POCode. Note that MRR and all fields thereafter are a simple sum.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', NULL, NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of days in the month.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'DaysInMonth'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of unique customers. For example, a company may have 200 users with the subscription, that would be ONE here and 200 in Subscriptions above.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'DistinctHierarchies'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MetraNet instance from which the data originated.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'InstanceId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The calendar month in which the fee was or will be incurred (1-12)', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'Month'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The base MRR, in the primary currency (i.e., what we are expecting from the prior month). In the first month this will be zero and in the last month it will have a value. No report option.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRBasePrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MRR loss due to a cancelation, in the primary currency. Must be zero or negative MRRBase. Report option "MRR Cancelations". ', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRCancelationPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MRR loss due to churn, in the primary currency. Must be zero or negative MRRBase. At the moment we can''t distinguish between Churn and early termination as we don''t have the contract terms. "MRR Churn"', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRChurnPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'MRRNew converted to the Primary Currency.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRNewPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The change in MRR due to a price increase or decrease, in the primary currency. This may be positive or negative. Defaults to zero. Report option "MRR Price Changes"', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRPriceChangePrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Monthly Recurring Revenue (MRR) in the primary currency. This is the sum of MRRBase, MRRRenewal, MRRPriceChange, MRRChurn, MRRNew and MRRCancellation.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The MRR increase due to a renewal, in the primary currency. This will only have a non-zero value in the month the renewal occurred. Defaults to zero. Report option "MRR Renewals"', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'MRRRenewalPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of new customers in the month who have the subscription in the month (i.e., it likely attracted them).', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'NewParticipants'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product Offering Identifier.  Can join to ProductOffering DataMart table to get display name and details.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'ProductOfferingId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The monetary amount of revenue for the month, in the primary currency.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'SubscriptionRevPrimaryCurrency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of subscriptions.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'TotalParticipants'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', N'The calendar year in which the fee was or will be incurred.', 'SCHEMA', N'dbo', 'TABLE', N'SubscriptionSummary', 'COLUMN', N'Year'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Stores information about the rated usage data which is common to all product views', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', NULL, NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The currency code of the monetary amounts calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'am_currency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'amount'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Division amount', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'div_amount'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Division currency ', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'div_currency'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The date and time the session was added to the database', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'dt_crt'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The date and time the usage occurred', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'dt_session'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The payer identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_acc'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The parent session identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_parent_sess'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The account identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_payee'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The database ID for the priceable item instance associated with the usage', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_pi_instance'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The database ID for the priceable item template associated with the usage', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_pi_template'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The Product Offering identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_prod'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The database identifier for associated service endpoint', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_se'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'MetraNet generated surrogate key for session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_sess'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The service identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_svc'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The billing period identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_usage_interval'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The product view identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'id_view'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'If set to "Y" tax is assumed to be already part of the given amount.  More information here implied tax', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'is_implied_tax'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Quote unique identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'quote_id'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Has the tax already been calculated', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_calculated'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount of country tax calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_county'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount of federal tax calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_federal'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Is this tax informational-only', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_informational'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount of local tax calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_local'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount of other tax calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_other'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The monetary amount of state tax calculated for the session', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tax_state'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The batch session identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tx_batch'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'The unique external session identifier', 'SCHEMA', N'dbo', 'TABLE', N't_acc_usage_quoting', 'COLUMN', N'tx_UID'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Partition identifier of this product offering', 'SCHEMA', N'dbo', 'TABLE', N't_po', 'COLUMN', N'c_POPartitionId'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
EXEC sp_addextendedproperty N'MS_Description', 'Partition identifier of the pricelist', 'SCHEMA', N'dbo', 'TABLE', N't_pricelist', 'COLUMN', N'c_PLPartitionId'
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
