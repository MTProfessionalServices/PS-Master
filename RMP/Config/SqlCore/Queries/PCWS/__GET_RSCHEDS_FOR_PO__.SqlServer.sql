
            select 
              rs.id_sched       ID,
              rs.id_pricelist   PriceListID,
              rs.id_pt          ParameterTableID,
              rs.id_eff_date    EffectiveDate,
              effdate.id_eff_date Effective_Id,
              effdate.n_begintype Effective_BeginType,
              effdate.dt_start Effective_StartDate,
              effdate.n_beginoffset Effective_BeginOffset,
              effdate.n_endtype Effective_EndType,
              effdate.dt_end Effective_EndDate,
              effdate.n_endoffset Effective_EndOffSet,      
              bp.nm_desc        Description              
              from t_po po
              inner join t_pl_map map on po.id_po = map.id_po
              inner join t_rsched rs on map.id_pricelist = rs.id_pricelist 
                and rs.id_pt = map.id_paramtable and map.id_pi_template = rs.id_pi_template
              inner join t_effectivedate effdate on rs.id_eff_date = effdate.id_eff_date
              left outer join t_base_props bp on rs.id_sched = bp.id_prop
              where
                map.id_sub is null
                and map.id_po = %%ID_PO%%
                and rs.id_pt = %%ID_PT%%
                and map.id_pi_instance =  %%ID_PI_INSTANCE%%
                order by ID asc

              select 
                pt.id_sched ScheduleID, n_order  RateIndex %%COLUMNS%% 
              from %%PT_NAME%% pt
              inner join t_rsched rs on pt.id_sched = rs.id_sched
              inner join t_pl_map map on rs.id_pricelist = map.id_pricelist and rs.id_pt = map.id_paramtable and map.id_pi_template = rs.id_pi_template
              inner join t_po po on map.id_po = po.id_po
              left outer join t_base_props bp on rs.id_sched = bp.id_prop
              where
                map.id_sub is null
                and map.id_po = %%ID_PO%%
                and rs.id_pt = %%ID_PT%%
                and map.id_pi_instance =  %%ID_PI_INSTANCE%%
                and %%MT_TIME%% >= pt.tt_start and (%%MT_TIME%% <= pt.tt_end or pt.tt_end is NULL)
              order by pt.id_sched, n_order asc

          