
        select 
        id_template,
        tbp.n_kind n_kind,
        tbp.n_name n_name,
        tbp.n_desc n_desc,
        tbp.n_display_name n_display_name,
        tbp.nm_name nm_name,
        tbp.nm_desc nm_desc,
        tbp.nm_display_name nm_display_name,
        CAST(NULL AS INT) n_rating_type 
        from t_pi_template tpt
        INNER JOIN t_base_props tbp ON tbp.id_prop = tpt.id_template        
        where id_template_parent = %%ID_PARENT%%
      