
  select 
	  t_vw_base_props.id_prop, t_vw_base_props.nm_name, t_vw_base_props.nm_desc, t_vw_base_props.nm_display_name, t_vw_base_props.n_display_name, t_vw_base_props.n_kind,
	  t_pi_template.id_pi as id_pi_type, t_pi_template.id_template_parent as id_pi_parent, NULL as id_pi_template, NULL as id_po, t_vw_base_props.n_desc
  from t_vw_base_props
  join t_pi_template on t_vw_base_props.id_prop = t_pi_template.id_template
  where t_vw_base_props.id_prop = %%ID_CHILD%% and t_vw_base_props.id_lang_code = %%ID_LANG%%
	  and t_pi_template.id_template_parent = %%ID_PARENT%%
     and rownum < 2
  union
  select 
	  t_vw_base_props.id_prop, t_vw_base_props.nm_name, t_vw_base_props.nm_desc, t_vw_base_props.nm_display_name, t_vw_base_props.n_display_name, t_vw_base_props.n_kind,
	  t_pl_map.id_pi_type, t_pl_map.id_pi_instance_parent as id_pi_parent, t_pl_map.id_pi_template, t_pl_map.id_po, t_vw_base_props.n_desc
  from t_vw_base_props
  join t_pl_map on t_vw_base_props.id_prop = t_pl_map.id_pi_instance
  where t_vw_base_props.id_prop = %%ID_CHILD%% and t_vw_base_props.id_lang_code = %%ID_LANG%%
  and t_pl_map.id_pi_instance_parent = %%ID_PARENT%% and t_pl_map.id_paramtable is null
     and rownum < 2
						