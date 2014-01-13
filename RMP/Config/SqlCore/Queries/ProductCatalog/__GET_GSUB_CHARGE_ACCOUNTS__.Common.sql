
			select grm.id_prop, bp.nm_display_name, grm.id_acc, grm.vt_start, grm.vt_end
			from t_gsub_recur_map grm
			inner join t_base_props bp on grm.id_prop=bp.id_prop
			where grm.id_group=%%ID_GSUB%% and grm.vt_start <= %%VT_DATE%% and grm.vt_end > %%VT_DATE%% and grm.tt_end = %%VT_MAX%%
      union all
			select r.id_prop, bp.nm_display_name, NULL id_acc, NULL vt_start, NULL vt_end
			from t_sub s
      inner join t_pl_map m on s.id_po=m.id_po
      inner join t_recur r on m.id_pi_instance=r.id_prop
			inner join t_base_props bp on r.id_prop=bp.id_prop
			where s.id_group=%%ID_GSUB%%
      and m.id_paramtable is null
      and r.b_charge_per_participant = 'N'
			and not exists 
      (
        select * from t_gsub_recur_map gr 
        where gr.id_group=%%ID_GSUB%% and vt_start <= %%VT_DATE%% and vt_end > %%VT_DATE%% and gr.tt_end = %%VT_MAX%%
        and gr.id_prop=r.id_prop
      )
		