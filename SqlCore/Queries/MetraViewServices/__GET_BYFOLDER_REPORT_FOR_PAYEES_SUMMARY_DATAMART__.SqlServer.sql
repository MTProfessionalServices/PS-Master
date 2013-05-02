
			select 
				/* DATAMART enabled */
				'' as HierarchyPath,
				au.id_acc as PayingAccountId,
				mapd1.hierarchydisplayname as PayingAccountName,
				acc.id_acc as AccountId,
				{fn IFNULL(mapd3.hierarchydisplayname, '')} as AccountName,
				acc.vt_start as AccountStart,
				acc.vt_end as AccountEnd,
				SUM({fn IFNULL(TotalAmount,0)}) as Amount,
				SUM({fn IFNULL(TotalFederalTax,0)}) as TotalFederalTax,
			  SUM({fn IFNULL(TotalCountyTax,0)}) as TotalCountyTax,
			  SUM({fn IFNULL(TotalLocalTax,0)}) as TotalLocalTax,
			  SUM({fn IFNULL(TotalOtherTax,0)}) as TotalOtherTax,
				SUM({fn IFNULL(TotalStateTax,0)}) as TotalStateTax,
				SUM({fn IFNULL(TotalTax,0)}) as TotalTax,
				SUM({fn IFNULL(PrebillAdjAmt,0)}) as PrebillAdjAmt,
 				SUM({fn IFNULL(PostbillAdjAmt,0)}) as PostbillAdjAmt,
 				SUM({fn IFNULL(PrebillFedTaxAdjAmt,0)}) as PrebillFedTaxAdjAmt,
				SUM({fn IFNULL(PrebillStateTaxAdjAmt,0)}) as PrebillStateTaxAdjAmt,
				SUM({fn IFNULL(PrebillCntyTaxAdjAmt,0)}) as PrebillCntyTaxAdjAmt,
				SUM({fn IFNULL(PrebillLocalTaxAdjAmt,0)}) as PrebillLocalTaxAdjAmt,
				SUM({fn IFNULL(PrebillOtherTaxAdjAmt,0)}) as PrebillOtherTaxAdjAmt,
				SUM({fn IFNULL(PrebillTotalTaxAdjAmt,0)}) as PrebillTotalTaxAdjAmt,
				SUM({fn IFNULL(PostbillFedTaxAdjAmt,0)}) as PostbillFedTaxAdjAmt,
				SUM({fn IFNULL(PostbillStateTaxAdjAmt,0)}) as PostbillStateTaxAdjAmt,
				SUM({fn IFNULL(PostbillCntyTaxAdjAmt,0)}) as PostbillCntyTaxAdjAmt,
				SUM({fn IFNULL(PostbillLocalTaxAdjAmt,0)}) as PostbillLocalTaxAdjAmt,
				SUM({fn IFNULL(PostbillOtherTaxAdjAmt,0)}) as PostbillOtherTaxAdjAmt,
				SUM({fn IFNULL(PostbillTotalTaxAdjAmt,0)}) as PostbillTotalTaxAdjAmt,
 				SUM({fn IFNULL(PrebillAdjustedAmount,0)}) as PrebillAdjustedAmount,
				SUM({fn IFNULL(PostbillAdjustedAmount,0)}) as PostbillAdjustedAmount,
 				SUM({fn IFNULL(NumPrebillAdjustments,0)}) as NumPrebillAdjustments,
 				SUM({fn IFNULL(NumPostbillAdjustments,0)}) as NumPostbillAdjustments,
				SUM({fn IFNULL(NumTransactions,0)}) as NumTransactions,
 				au.am_currency as Currency
				from
				t_dm_account_ancestor s1
				inner join t_dm_account_ancestor d3 on s1.id_dm_descendent=d3.id_dm_ancestor
				inner join t_dm_account acc on acc.id_dm_acc=s1.id_dm_descendent
				left outer join vw_mps_acc_mapper mapd3 on acc.id_acc=mapd3.id_acc
				inner join t_mv_payer_interval au on d3.id_dm_descendent=au.id_dm_acc
				inner join t_view_hierarchy vh on au.id_view = vh.id_view
				inner join vw_mps_acc_mapper mapd1 on au.id_acc=mapd1.id_acc
				left outer join t_pi_template piTemplated2 on piTemplated2.id_template=au.id_pi_template
				left outer join t_base_props pi_type_props on pi_type_props.id_prop=piTemplated2.id_pi
				inner join t_enum_data enumd2 on au.id_view=enumd2.id_enum_data
				where 	vh.id_view = vh.id_view_parent
 				and	au.id_acc = @idPayer
				and
				(pi_type_props.n_kind IS NULL or pi_type_props.n_kind <> 15 or %%%UPPER%%%(enumd2.nm_enum_data) %%LIKE_OR_NOT_LIKE%% '%_TEMP')
				and %%TIME_PREDICATE%% and
				s1.id_dm_ancestor in (
				select id_dm_acc from t_dm_account
				where id_acc= @idAcc
				and vt_start <= @dtEnd and vt_end >= @dtEnd
		  group by id_dm_acc)
				and s1.num_generations = 1
				group by
				au.id_acc,
				mapd1.hierarchydisplayname,
				acc.id_acc,
				acc.vt_start,
				acc.vt_end,
				mapd3.hierarchydisplayname,
 				au.am_currency
			order by
				PayingAccountName,
				AccountName,
				AccountStart
			