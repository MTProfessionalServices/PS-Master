
if object_id('tempdb..#summary_delta_del_fashionsale') is not null drop table #summary_delta_del_fashionsale

select 
au.id_acc,au.id_usage_interval,sum(isnull(au.tax_federal,0)) + sum(isnull(au.tax_state,0))
+ sum(isnull(au.tax_county,0)) + sum(isnull(au.tax_local,0)) + sum(isnull(au.tax_other,0)) taxes,
sum(isnull(c_totalprice,0)) c_totalprice,count(*) NumTransactions
into #summary_delta_del_fashionsale
from %%DELTA_DELETE_T_ACC_USAGE%% au with(readcommitted)
inner join %%DELTA_DELETE_T_PV_FASHIONSALE%% pv with(readcommitted) 
on au.id_sess = pv.id_sess and au.id_usage_interval=pv.id_usage_interval
group by au.id_acc,au.id_usage_interval
--Update the existing rows in the MV table and keep all the changes in the delta_delete and delta_insert mv table
insert into %%DELTA_DELETE_FASHIONSALE%% select dm_1.*
      from %%FASHIONSALE%% dm_1 inner join #summary_delta_del_fashionsale tmp2 
      on dm_1.id_acc=tmp2.id_acc
      and dm_1.id_usage_interval=tmp2.id_usage_interval

update dm_1 set 
	  dm_1.taxes = IsNULL(dm_1.taxes,0.0) - IsNULL(tmp2.taxes, 0.0),
      dm_1.c_totalprice = IsNULL(dm_1.c_totalprice,0.0) - IsNULL(tmp2.c_totalprice, 0.0), 
      dm_1.NumTransactions = IsNULL(dm_1.NumTransactions,0.0) - IsNULL(tmp2.NumTransactions, 0.0) 
      from %%FASHIONSALE%% dm_1 inner join #summary_delta_del_fashionsale tmp2 
      on dm_1.id_acc=tmp2.id_acc
      and dm_1.id_usage_interval=tmp2.id_usage_interval

insert into %%DELTA_INSERT_FASHIONSALE%% select dm_1.*
      from %%FASHIONSALE%% dm_1 inner join #summary_delta_del_fashionsale tmp2 
      on dm_1.id_acc=tmp2.id_acc
      and dm_1.id_usage_interval=tmp2.id_usage_interval
--Delete the MV rows that have NumTransactions=0 i.e. corresponding rows in the base tables are deleted
/* ESR-2908 delete with same predicate as previous update */
delete from %%FASHIONSALE%% dm_1 inner join #summary_delta_del_fashionsale  tmp2 
      on dm_1.id_acc=tmp2.id_acc
      where dm_1.NumTransactions <= 0


if object_id('tempdb..#summary_delta_del_fashionsale') is not null drop table #summary_delta_del_fashionsale
			