
			SELECT 
				i.id_acc as c__accountID,
				id_interval as c__intervalID,
				id_interval as c_originalintervalID,
				invoice_currency as c__currency,
				current_balance as c__amount
			FROM 
				t_invoice i
				inner join t_billgroup_member bg
				on i.id_acc = bg.id_acc and bg.id_billgroup = %%ID_BILLGROUP%%
				inner join t_av_internal av
				on i.id_interval = %%INTERVAL_ID%% and i.id_acc = av.id_acc
			WHERE
				av.c_paymentmethod = %%ENUM_ID%% and i.current_balance <> 0
      