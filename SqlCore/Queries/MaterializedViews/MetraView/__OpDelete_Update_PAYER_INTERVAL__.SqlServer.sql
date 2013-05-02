

declare @rowcount3 int

/* Cleanup the temporary delta table */
Truncate table %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval

/* Insert the changes in temporary table based on payee_session delta table */

Insert into  %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval
select id_acc,id_dm_acc,id_usage_interval,id_prod,id_view,id_pi_instance,id_pi_template,
am_currency,id_se,
SUM(TotalAmount) TotalAmount,
SUM(TotalFederalTax) TotalFederalTax, 
sum(TotalCountyTax) TotalCountyTax,
sum(TotalLocalTax) TotalLocalTax,
sum(TotalOtherTax) TotalOtherTax,
SUM(TotalStateTax) TotalStateTax, 
SUM(TotalTax) TotalTax, 
SUM(PrebillAdjAmt) PrebillAdjAmt, 
SUM(PrebillFedTaxAdjAmt) PrebillFedTaxAdjAmt,
SUM(PrebillStatetaxAdjAmt) PrebillStatetaxAdjAmt,
SUM(PrebillCntytaxAdjAmt) PrebillCntytaxAdjAmt,
SUM(PrebillLocaltaxAdjAmt) PrebillLocaltaxAdjAmt,
SUM(PrebillOthertaxAdjAmt) PrebillOthertaxAdjAmt,
SUM(PrebillTotaltaxAdjAmt) PrebillTotaltaxAdjAmt,
SUM(PostbillAdjAmt) PostbillAdjAmt, 
SUM(PostbillFedTaxAdjAmt) PostbillFedTaxAdjAmt,
SUM(PostbillStatetaxAdjAmt) PostbillStatetaxAdjAmt,
SUM(PostbillCntytaxAdjAmt) PostbillCntytaxAdjAmt,
SUM(PostbillLocaltaxAdjAmt) PostbillLocaltaxAdjAmt,
SUM(PostbillOthertaxAdjAmt) PostbillOthertaxAdjAmt,
SUM(PostbillTotaltaxAdjAmt) PostbillTotaltaxAdjAmt,
SUM(PrebillAdjustedAmount) PrebillAdjustedAmount, 
SUM(PostbillAdjustedAmount) PostbillAdjustedAmount, 
sum(NumPrebillAdjustments) NumPrebillAdjustments, 
sum(NumPostbillAdjustments) NumPostbillAdjustments, 
sum(NumTransactions) NumTransactions
from %%DELTA_DELETE_PAYEE_SESSION%% 
group by 
id_acc, 
id_dm_acc, 
id_usage_interval, 
id_prod, 
id_view, 
id_pi_instance, 
id_pi_template, 
am_currency, 
id_se
update statistics %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval with fullscan


insert into %%DELTA_DELETE_PAYER_INTERVAL%%  select dm_1.* from %%PAYER_INTERVAL%% dm_1 
inner join  %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval tmp2 on 
			dm_1.id_dm_acc=tmp2.id_dm_acc 
      and dm_1.id_acc=tmp2.id_acc 
      and dm_1.id_usage_interval=tmp2.id_usage_interval 
      and dm_1.id_view=tmp2.id_view
      and dm_1.am_currency=tmp2.am_currency 
      and dm_1.id_se=tmp2.id_se
      and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0) 
      and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0) 
      and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0) 
set @rowcount3 = @@rowcount

if (@rowcount3 > 0)
begin
	update dm_1 set
	dm_1.TotalAmount = IsNULL(dm_1.TotalAmount,0.0) - IsNULL(tmp2.TotalAmount, 0.0),
	dm_1.TotalFederalTax = IsNULL(dm_1.TotalFederalTax,0.0) - IsNULL(tmp2.TotalFederalTax, 0.0),
	dm_1.TotalCountyTax = IsNULL(dm_1.TotalCountyTax,0.0) - IsNULL(tmp2.TotalCountyTax, 0.0),
	dm_1.TotalLocalTax = IsNULL(dm_1.TotalLocalTax,0.0) - IsNULL(tmp2.TotalLocalTax, 0.0),
	dm_1.TotalOtherTax = IsNULL(dm_1.TotalOtherTax,0.0) - IsNULL(tmp2.TotalOtherTax, 0.0),
	dm_1.TotalStateTax = IsNULL(dm_1.TotalStateTax,0.0) - IsNULL(tmp2.TotalStateTax, 0.0),
	dm_1.TotalTax = IsNULL(dm_1.TotalTax,0.0) - IsNULL(tmp2.TotalTax, 0.0),
	dm_1.PrebillAdjAmt = IsNULL(dm_1.PrebillAdjAmt,0.0) - IsNULL(tmp2.PrebillAdjAmt, 0.0),
	dm_1.PrebillFedTaxAdjAmt = IsNULL(dm_1.PrebillFedTaxAdjAmt,0.0) - IsNULL(tmp2.PrebillFedTaxAdjAmt, 0.0), 
	dm_1.PrebillStatetaxAdjAmt = IsNULL(dm_1.PrebillStatetaxAdjAmt,0.0) - IsNULL(tmp2.PrebillStatetaxAdjAmt, 0.0), 
	dm_1.PrebillCntytaxAdjAmt = IsNULL(dm_1.PrebillCntytaxAdjAmt,0.0) - IsNULL(tmp2.PrebillCntytaxAdjAmt, 0.0), 
	dm_1.PrebillLocaltaxAdjAmt = IsNULL(dm_1.PrebillLocaltaxAdjAmt,0.0) - IsNULL(tmp2.PrebillLocaltaxAdjAmt, 0.0), 
	dm_1.PrebillOthertaxAdjAmt = IsNULL(dm_1.PrebillOthertaxAdjAmt,0.0) - IsNULL(tmp2.PrebillOthertaxAdjAmt, 0.0), 
	dm_1.PrebillTotaltaxAdjAmt = IsNULL(dm_1.PrebillTotaltaxAdjAmt,0.0) - IsNULL(tmp2.PrebillTotaltaxAdjAmt, 0.0), 
	dm_1.PostbillAdjAmt = IsNULL(dm_1.PostbillAdjAmt,0.0) + IsNULL(tmp2.PostbillAdjAmt, 0.0), 
	dm_1.PostbillFedTaxAdjAmt = IsNULL(dm_1.PostbillFedTaxAdjAmt,0.0) - IsNULL(tmp2.PostbillFedTaxAdjAmt, 0.0), 
	dm_1.PostbillStatetaxAdjAmt = IsNULL(dm_1.PostbillStatetaxAdjAmt,0.0) - IsNULL(tmp2.PostbillStatetaxAdjAmt, 0.0), 
	dm_1.PostbillCntytaxAdjAmt = IsNULL(dm_1.PostbillCntytaxAdjAmt,0.0) - IsNULL(tmp2.PostbillCntytaxAdjAmt, 0.0), 
	dm_1.PostbillLocaltaxAdjAmt = IsNULL(dm_1.PostbillLocaltaxAdjAmt,0.0) - IsNULL(tmp2.PostbillLocaltaxAdjAmt, 0.0), 
	dm_1.PostbillOthertaxAdjAmt = IsNULL(dm_1.PostbillOthertaxAdjAmt,0.0) - IsNULL(tmp2.PostbillOthertaxAdjAmt, 0.0), 
	dm_1.PostbillTotaltaxAdjAmt = IsNULL(dm_1.PostbillTotaltaxAdjAmt,0.0) - IsNULL(tmp2.PostbillTotaltaxAdjAmt, 0.0), 
	dm_1.PrebillAdjustedAmount = IsNULL(dm_1.PrebillAdjustedAmount,0.0) - IsNULL(tmp2.PrebillAdjustedAmount, 0.0), 
	dm_1.PostbillAdjustedAmount = IsNULL(dm_1.PostbillAdjustedAmount,0.0) - IsNULL(tmp2.PostbillAdjustedAmount, 0.0), 
	dm_1.NumPrebillAdjustments = IsNULL(dm_1.NumPrebillAdjustments,0.0) - IsNULL(tmp2.NumPrebillAdjustments, 0.0), 
	dm_1.NumPostbillAdjustments = IsNULL(dm_1.NumPostbillAdjustments,0.0) - IsNULL(tmp2.NumPostbillAdjustments, 0.0), 
	dm_1.NumTransactions = IsNULL(dm_1.NumTransactions,0.0) - IsNULL(tmp2.NumTransactions, 0.0) 
	from %%PAYER_INTERVAL%% dm_1 inner join %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval tmp2 on 
	dm_1.id_dm_acc=tmp2.id_dm_acc 
	and dm_1.id_acc=tmp2.id_acc 
	and dm_1.id_usage_interval=tmp2.id_usage_interval 
	and dm_1.id_view=tmp2.id_view
	and dm_1.am_currency=tmp2.am_currency 
	and dm_1.id_se=tmp2.id_se
	and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0) 
	and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0) 
	and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0) 

	/* Delete the MV rows that have NumTransactions=0 i.e. corresponding rows in the base tables are deleted */
 	/* ESR-2908 delete with same predicate as previous update */
	delete dm_1 from %%PAYER_INTERVAL%% dm_1
		inner join %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval tmp2 on
				dm_1.id_dm_acc=tmp2.id_dm_acc 
				and dm_1.id_acc=tmp2.id_acc 
				and dm_1.id_usage_interval=tmp2.id_usage_interval 
				and dm_1.id_view=tmp2.id_view
				and dm_1.am_currency=tmp2.am_currency 
				and dm_1.id_se=tmp2.id_se
				and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0) 
				and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0) 
				and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0) 
				and dm_1.NumTransactions <= 0

	insert into %%DELTA_INSERT_PAYER_INTERVAL%%  select dm_1.* from %%PAYER_INTERVAL%% dm_1 
	inner join  %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payer_interval tmp2 on 
				dm_1.id_dm_acc=tmp2.id_dm_acc 
				and dm_1.id_acc=tmp2.id_acc 
				and dm_1.id_usage_interval=tmp2.id_usage_interval 
				and dm_1.id_view=tmp2.id_view
				and dm_1.am_currency=tmp2.am_currency 
				and dm_1.id_se=tmp2.id_se
				and isnull(dm_1.id_prod,0)=isnull(tmp2.id_prod,0) 
				and isnull(dm_1.id_pi_instance,0)=isnull(tmp2.id_pi_instance,0) 
				and isnull(dm_1.id_pi_template,0)=isnull(tmp2.id_pi_template,0) 
end
			