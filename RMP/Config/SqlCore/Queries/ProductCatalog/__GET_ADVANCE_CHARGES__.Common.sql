
INSERT INTO %%%TEMP_TABLE_PREFIX%%%tmp_recurring_charges
/*  __GET_ADVANCE_CHARGES__ */
SELECT
tmp.c_RCActionType,
tmp.c__AccountID,
tmp.c__PayingAccount,
tmp.c_BillingIntervalStart, 
tmp.c_BillingIntervalEnd,
tmp.c_NextBillingIntervalStart,
tmp.c_NextBillingIntervalEnd,
tmp.c__PriceableItemInstanceID, 
tmp.c__PriceableItemTemplateID,
tmp.c__ProductOfferingID,
tmp.c_RCIntervalStart, 
tmp.c_RCIntervalEnd, 
tmp.c__SubscriptionID,
tmp.c_SubscriptionStart,
tmp.c_SubscriptionEnd,
tmp.c_RCIntervalSubscriptionStart,
tmp.c_RCIntervalSubscriptionEnd,
tmp.c_Advance,
tmp.c_ProrateOnSubscription,
tmp.c_ProrateInstantly,
tmp.c_ProrateOnUnsubscription,
tmp.c_ProrationCycleLength,
tmp.c_BilledRateDate,
  tmp.c_UnitValue,
  tmp.c_UnitValueStart,
  tmp.c_UnitValueEnd,
	tmp.c_RatingType,
	tmp.run_id_event as run_id_event,
	tmp.run_vt_start as run_vt_start
FROM
%%%TEMP_TABLE_PREFIX%%%tmp_recurring_charge_candidate tmp
WHERE NOT EXISTS (
SELECT *
FROM
/*  BEGIN */
/* Uncomment for individual and per-participant */
/* t_payment_redir_history prevpay  */
/* Uncomment for per-subscription */
/* t_gsub_recur_map grm */
/* INNER JOIN t_sub s ON grm.id_group=s.id_group */
/* INNER JOIN t_payment_redir_history prevpay ON prevpay.id_payee=grm.id_acc */
%%PER_PARTICIPANT_OR_PER_SUBSCRIPTION_TABLES%%
/*  END  */
INNER JOIN t_acc_usage_interval prevabinterval ON prevabinterval.id_acc=prevpay.id_payer
INNER JOIN t_usage_interval prevbinterval ON prevabinterval.id_usage_interval=prevbinterval.id_interval
INNER JOIN t_usage_interval prevnextbinterval ON prevnextbinterval.id_usage_cycle=prevbinterval.id_usage_cycle
  AND prevnextbinterval.dt_start = dbo.addsecond(prevbinterval.dt_end )
INNER JOIN t_billgroup_member bgm ON bgm.id_acc=prevpay.id_payer 
INNER JOIN t_billgroup bg ON bg.id_billgroup=bgm.id_billgroup AND bg.id_usage_interval=prevbinterval.id_interval
INNER JOIN t_recevent_inst rei ON rei.id_arg_interval=prevbinterval.id_interval AND rei.id_arg_billgroup=bg.id_billgroup
INNER JOIN (
  select
  rer.id_instance,
  max(rer.dt_start) as run_vt_start
  from
  t_recevent_run rer
  group by rer.id_instance
  ) rer ON rer.id_instance=rei.id_instance
/*  Advance Charge Rule: */
/*  Charge is billed using payment history version that was (transaction time) */
/*  effective at the time the adapter for the interval in which it was billed was run. */
/*  Charge is billed using originator history version that was (transaction time) */
/*  effective at the time the adapter for the interval in which it was billed was run. */
  AND rer.run_vt_start BETWEEN prevpay.tt_start AND prevpay.tt_end
/*  BEGIN */
/*  Uncomment for per-subscription */
/*   AND prevbinterval.dt_end BETWEEN grm.tt_start AND grm.tt_end */
%%PER_SUBSCRIPTION_QUALIFIYING_ORIGINATOR_TIME_CLAUSE%%
/*  END */
/*  End Advance Charge Rule */
WHERE
rei.id_event=tmp.run_id_event AND 
/*  This is the magic rule; we don't generate the charge if some "previous" */
/*  candidate payer already satisfied all of the conditions.  The rest of the  */
/*  rules are just the ordinary rules for which (payer, bill interval) is  */
/*  a candidate for an RCI. */
(
prevpay.tt_end < tmp.candidate_tt_end
/* BEGIN */
/* For per-subscription charges only */
/* OR */
/* grm.tt_end < tmp.candidate_originator_tt_end */
%%PER_SUBSCRIPTION_CANDIDATE_ORIGINATOR_TIME_CLAUSE%%
/* END */
)
AND
/* BEGIN */
/*  For per-participant charges: */
/* tmp.c__AccountID=prevpay.id_payee */
/* AND */
/* tmp.b_per_subscription='N' */
/*  For per-subscription charges: */
/* s.id_sub=tmp.c__SubscriptionID AND grm.id_prop=tmp.c__PriceableItemInstanceID */
/* AND */
/* tmp.b_per_subscription='Y' */
%%PER_PARTICIPANT_OR_PER_SUBSCRIPTION_WHERE_CLAUSE%%
/* END */
/*  Advance Charge Rule: */
/*   Charge is billed by payer from history who is (valid time) effective */
/*   at the end of the recurring charge interval. */
AND
tmp.c_RCIntervalEnd BETWEEN prevpay.vt_start AND prevpay.vt_end
/*  End Advance Charge Rule */
/*  Advance Charge Rule: Process subscriptions that   */
/*   Begin prior to the beginning of the next billing interval */
/*   End after the beginning of the next billing interval */
/*   Recurring charge begins in next interval. */
AND 
prevnextbinterval.dt_start > tmp.c_SubscriptionStart
AND 
prevnextbinterval.dt_start <= tmp.c_SubscriptionEnd
AND
tmp.c_RCIntervalStart BETWEEN prevnextbinterval.dt_start AND prevnextbinterval.dt_end
/*  End Advance Charge Rule */
)
%%PER_PARTICIPANT_OR_PER_SUBSCRIPTION_WHERE_CLAUSE2%%
