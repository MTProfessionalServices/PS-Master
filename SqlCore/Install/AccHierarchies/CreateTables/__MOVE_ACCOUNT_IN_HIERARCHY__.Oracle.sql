
create  or replace 
procedure MoveAccount
    (p_new_parent int,
     p_account_being_moved int,
   p_vt_move_start date,
   p_enforce_same_corporation varchar2,
   p_system_time date,
   p_status out int ,
   p_id_ancestor_out out int,
   p_ancestor_type out varchar2,
   p_acc_type out varchar2
)
as
vt_move_end date;
varMaxDateTime  date;
v_AccCreateDate  date;
v_AccMaxCreateDate  date;
v_dt_start date;
v_realstartdate  date;
v_id_ancestor  int;
v_id_descendent  int;
v_ancestor_acc_type  varchar(5);
v_descendent_acc_type  varchar(5);
originalAncestor int;
syntheticroot varchar2(1);
dummy_type int;
p_vt_move_start_trunc date;
allTypesSupported int;
templateId int;
templateOwner int;
templateCount int;
sessionId int;
begin
    vt_move_end := dbo.MTMaxDate();

    p_vt_move_start_trunc := dbo.MTStartofDay(p_vt_move_start);

    /* plug business rules back in*/

    v_dt_start      := p_vt_move_start_trunc;
    v_id_ancestor   := p_new_parent;
    v_id_descendent := p_account_being_moved;

    v_realstartdate := dbo.mtstartofday(v_dt_start) ;
        select max(vt_end) into varMaxDateTime from t_account_ancestor where id_descendent = v_id_descendent
        and id_ancestor = 1;

    begin

        select
        dbo.mtminoftwodates(dbo.mtstartofday(ancestor.dt_crt),dbo.mtstartofday(descendent.dt_crt)),
        ancestor.id_type, descendent.id_type
        into v_AccCreateDate,v_ancestor_acc_type,v_descendent_acc_type
        from t_account ancestor
        inner join t_account descendent ON
        ancestor.id_acc = v_id_ancestor and
        descendent.id_acc = v_id_descendent;
    exception
    when no_data_found then
        null;
    end;

select name into p_ancestor_type
from t_account_type
where id_type = v_ancestor_acc_type;


select name into p_acc_type
from t_account_type
where id_type = v_descendent_acc_type;

    begin
        select
        dbo.mtmaxoftwodates(dbo.mtstartofday(ancestor.dt_crt),dbo.mtstartofday(descendent.dt_crt))
        into v_AccMaxCreateDate
        from t_account ancestor,t_account descendent where ancestor.id_acc = v_id_ancestor and
        descendent.id_acc = v_id_descendent;
    exception
            when no_data_found then
            null;
    end;

    if dbo.mtstartofday(v_dt_start) < dbo.mtstartofday(v_AccMaxCreateDate)  then
        /* MT_CANNOT_MOVE_ACCOUNT_BEFORE_START_DATE*/
        p_status := -486604750;
        return;
    end if;


    /* step : make sure that the new ancestor is not actually a child*/
    select count(*) into p_status
    from t_account_ancestor
    where id_ancestor = v_id_descendent
    and id_descendent = v_id_ancestor AND
    v_realstartdate between vt_start AND vt_end;

    if p_status > 0 then
        /* MT_NEW_PARENT_IS_A_CHILD*/
        p_status := -486604797;
        return;
    end if;

    select count(*) into p_status
    from t_account_ancestor
    where id_ancestor = v_id_ancestor
    and id_descendent = v_id_descendent
    and num_generations = 1
    and v_realstartdate >= vt_start
    and vt_end = varMaxDateTime;

    if p_status > 0 then
        /* MT_NEW_ANCESTOR_IS_ALREADY_ A_ANCESTOR*/
        p_status := 1;
        return;
    end if;

      /* step : make sure that the account is not archived or closed*/
    select count(*)  into p_status from t_account_state
    where id_acc = v_id_descendent
    and (dbo.IsClosed(p_status) = 1 OR dbo.isArchived(p_status) = 1)
    and v_realstartdate between vt_start AND vt_end;
    if (p_status > 0 ) then
        /* OPERATION_NOT_ALLOWED_IN_CLOSED_OR_ARCHIVED*/
        p_status := -469368827;
        return;
    end if;

    /* step : make sure that the account is not a corporate account*/
    /*only check next 2 business rules if p_enforce_same_corporation rule is turned on*/
    if p_enforce_same_corporation = 1 then
        if (dbo.iscorporateaccount(v_id_descendent,v_dt_start) = 1)
        then
            /* MT_CANNOT_MOVE_CORPORATE_ACCOUNT*/
            p_status := -486604770;
            return;
    end if;
        /* do this check if the original ancestor of the account being moved is not -1
         or the new ancestor is not -1 */
        select id_ancestor into originalAncestor from t_account_ancestor
            where id_descendent =  v_id_descendent
            and num_generations = 1
            and p_vt_move_start_trunc >= vt_start and p_vt_move_start_trunc <= vt_end;

        if (originalAncestor <> -1 AND v_id_ancestor <> -1 AND
        dbo.IsInSameCorporateAccount(v_id_ancestor,v_id_descendent,v_realstartdate) <> 1)
        then
            /* MT_CANNOT_MOVE_BETWEEN_CORPORATE_HIERARCHIES*/
            p_status := -486604759;
            return;
        end if;
    end if;

    /*check that both ancestor and descendent are subscriber accounts.  This check has to be recast.. you can
     only move if the new ancestor allows children of type @descendent_acc_type */

    select count(*) into dummy_type from dual
    where exists (select 1 from t_acctype_descendenttype_map
    where id_type = v_ancestor_acc_type
    and id_descendent_type = v_descendent_acc_type);
    if (dummy_type = 0)
    then
        /* MT_ANCESTOR_OF_INCORRECT_TYPE */
        p_status := -486604714;
        return;
    END if;

    /* check that only accounts whose type says b_canHaveSyntheticRoot is true can have -1 as an ancestor.*/
    if (v_id_ancestor = -1)
    then
    select b_CanhaveSyntheticRoot into syntheticroot from t_account_type where id_type = v_descendent_acc_type;
    if (syntheticroot <> '1')
    then
    /* MT_ANCESTOR_INVALID_SYNTHETIC_ROOT */
        p_status := -486604713;
        return;
    END if;
    END if;

    /* end business rules*/

/*METRAVIEW DATAMART */

insert into tmp_t_dm_account  select * from t_dm_account where id_acc in
(
select distinct id_descendent from t_account_ancestor where id_ancestor = p_account_being_moved
);
/* Deleting all the entries from ancestor table */
delete from t_dm_account_ancestor where id_dm_descendent in (select id_dm_acc from tmp_t_dm_account);
delete from t_dm_account where id_dm_acc in (select id_dm_acc from tmp_t_dm_account);

    insert into tmp_deletethese
    select
    aa2.id_ancestor,
    aa2.id_descendent,
    aa2.num_generations,
    aa2.b_children,
    dbo.MTMaxOfTwoDates(p_vt_move_start_trunc, dbo.MTMaxOfTwoDates(dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start), aa3.vt_start)) as vt_start,
    dbo.MTMinOfTwoDates(vt_move_end, dbo.MTMinOfTwoDates(dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end), aa3.vt_end)) as vt_end,
    aa2.tx_path
    from
    t_account_ancestor aa1
    inner join t_account_ancestor aa2 on aa1.id_ancestor=aa2.id_ancestor and aa1.vt_start <= aa2.vt_end and aa2.vt_start <= aa1.vt_end and aa2.vt_start <= vt_move_end and p_vt_move_start_trunc <= aa2.vt_end
    inner join t_account_ancestor aa3 on aa2.id_descendent=aa3.id_descendent and aa3.vt_start <= aa2.vt_end and aa2.vt_start <= aa3.vt_end and aa3.vt_start <= vt_move_end and p_vt_move_start_trunc <= aa3.vt_end
    where
    aa1.id_descendent=p_account_being_moved
    and
    aa1.num_generations > 0
    and
    aa1.vt_start <= vt_move_end
    and
    p_vt_move_start_trunc <= aa1.vt_end
    and
    aa3.id_ancestor=p_account_being_moved;

    /* select old direct ancestor id*/
    begin
        select id_ancestor into p_id_ancestor_out from tmp_deletethese
        where num_generations = 1 and p_vt_move_start_trunc between vt_start and vt_end;
    exception
        when no_data_found then
        null;
    end;

    /*select * from #deletethese
     The four statements of the sequenced delete follow.  Watch carefully :-)

     Create a new interval for the case in which the applicability interval of the update
     is contained inside the period of validity of the existing interval
     [------------------] (existing)
        [-----------] (update)*/

    insert into t_account_ancestor(id_ancestor, id_descendent, num_generations,b_children, vt_start, vt_end,tx_path)
    select aa.id_ancestor, aa.id_descendent, aa.num_generations, d.b_children,d.vt_start, d.vt_end,
    case when aa.id_descendent = 1 then
        aa.tx_path || d.tx_path
        else
        d.tx_path || '/' || aa.tx_path
        end
    from
    t_account_ancestor aa
    inner join tmp_deletethese d on aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
        aa.num_generations=d.num_generations and aa.vt_start < d.vt_start and aa.vt_end > d.vt_end;

    /* Update end date of existing records for which the applicability interval of the update
     starts strictly inside the existing record:
     [---------] (existing)
        [-----------] (update)
     or
     [---------------] (existing)
        [-----------] (update)*/
    update t_account_ancestor aa
    set
    vt_end = (select dbo.subtractsecond(d.vt_start) from
                            tmp_deletethese d where aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
                            aa.num_generations=d.num_generations and aa.vt_start < d.vt_start and aa.vt_end > d.vt_start)
        where exists
        (select 1 from
                            tmp_deletethese d where aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
                            aa.num_generations=d.num_generations and aa.vt_start < d.vt_start and aa.vt_end > d.vt_start);

    /* Update start date of existing records for which the effectivity interval of the update
     ends strictly inside the existing record:
                  [---------] (existing)
        [-----------] (update)*/
    update t_account_ancestor aa
    set
    vt_start = (select dbo.addsecond(d.vt_end)
    from tmp_deletethese d where aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
        aa.num_generations=d.num_generations and aa.vt_start <= d.vt_end and aa.vt_end > d.vt_end)
    where exists
    (select 1
    from tmp_deletethese d where aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
        aa.num_generations=d.num_generations and aa.vt_start <= d.vt_end and aa.vt_end > d.vt_end);

    /* Delete existing records for which the effectivity interval of the update
     contains the existing record:
           [---------] (existing)
         [---------------] (update)*/
    delete t_account_ancestor aa
    where exists
    (select 1
    from tmp_deletethese d where aa.id_ancestor=d.id_ancestor and aa.id_descendent=d.id_descendent and
        aa.num_generations=d.num_generations and aa.vt_start >= d.vt_start and aa.vt_end <= d.vt_end);

    /* SEQUENCED INSERT JOIN*/
    /* Now do the sequenced insert into select from with the sequenced*/
    /* cross join as the source of the data.*/

    insert into t_account_ancestor(id_ancestor, id_descendent, num_generations,b_children, vt_start, vt_end,tx_path)
    select aa1.id_ancestor,
    aa2.id_descendent,
    aa1.num_generations+aa2.num_generations+1 as num_generations,
    aa2.b_children,
    dbo.MTMaxOfTwoDates(p_vt_move_start_trunc, dbo.MTMaxOfTwoDates(aa1.vt_start, aa2.vt_start)) as vt_start,
    dbo.MTMinOfTwoDates(vt_move_end, dbo.MTMinOfTwoDates(aa1.vt_end, aa2.vt_end)) as vt_end,
    case when aa2.id_descendent = 1 then
        aa1.tx_path || aa2.tx_path
        else
        aa1.tx_path || '/' || aa2.tx_path
        end
    from
    t_account_ancestor aa1
    inner join t_account_ancestor aa2 on aa1.vt_start < aa2.vt_end and aa2.vt_start < aa1.vt_end and aa2.vt_start < vt_move_end and p_vt_move_start_trunc < aa2.vt_end
    where
    aa1.id_descendent = p_new_parent
    and
    aa1.vt_start < vt_move_end
    and
    p_vt_move_start_trunc < aa1.vt_end
    and
    aa2.id_ancestor = p_account_being_moved;

    /* Implement the coalescing step.*/
    /* TODO: Improve efficiency by restricting the updates to the rows that*/
    /* might need coalesing.*/
    update t_account_ancestor aa
    set vt_end = (
        select max(aa2.vt_end)
        from
        t_account_ancestor aa2
        where
        aa.id_ancestor=aa2.id_ancestor
        and
        aa.id_descendent=aa2.id_descendent
        and
        aa.num_generations=aa2.num_generations
        and
        aa.vt_start < aa2.vt_start
        and
        dbo.addsecond(aa.vt_end) >= aa2.vt_start
        and
        aa.vt_end < aa2.vt_end
        and
        aa.tx_path=aa2.tx_path
    )
    where
    exists (
        select *
        from
        t_account_ancestor aa2
        where
        aa.id_ancestor=aa2.id_ancestor
        and
        aa.id_descendent=aa2.id_descendent
        and
        aa.num_generations=aa2.num_generations
        and
        aa.vt_start < aa2.vt_start
        and
        dbo.addsecond(aa.vt_end) >= aa2.vt_start
        and
        aa.vt_end < aa2.vt_end
        and
        aa.tx_path=aa2.tx_path
    )
    and aa.id_descendent in (select id_descendent from tmp_deletethese);

    delete from t_account_ancestor AA
    where
    exists (
        select *
        from t_account_ancestor aa2
        where
        AA.id_ancestor=aa2.id_ancestor
        and
        AA.id_descendent=aa2.id_descendent
        and
        AA.num_generations=aa2.num_generations
        and
        AA.tx_path=aa2.tx_path
        and
        (
        (aa2.vt_start < AA.vt_start and AA.vt_end <= aa2.vt_end)
        or
        (aa2.vt_start <= AA.vt_start and AA.vt_end < aa2.vt_end)
        )
    )
    and id_descendent in (select id_descendent from TMP_deletethese);


   update t_path_capability
    set param_value = (
        select distinct aa.tx_path || '/'
        from
        t_account_ancestor aa
        inner join TMP_deletethese d on aa.id_descendent=d.id_descendent and aa.id_ancestor = 1
        inner join t_principal_policy p on p.id_acc = aa.id_descendent
        inner join t_capability_instance ci on ci.id_policy = p.id_policy
        where ci.id_cap_instance = t_path_capability.id_cap_instance
        and p_system_time between aa.vt_start and aa.vt_end
    )
    where exists (
        select 1
        from
        t_account_ancestor aa
        inner join TMP_deletethese d on aa.id_descendent=d.id_descendent and aa.id_ancestor = 1
        inner join t_principal_policy p on p.id_acc = aa.id_descendent
        inner join t_capability_instance ci on ci.id_policy = p.id_policy
        where ci.id_cap_instance = t_path_capability.id_cap_instance
        and p_system_time between aa.vt_start and aa.vt_end
   );

    update t_account_ancestor set b_Children = 'Y' where
    id_descendent = p_new_parent
    and b_children ='N';

    update t_account_ancestor old set b_Children = 'N' where
    id_descendent = p_id_ancestor_out and
    not exists (select 1 from t_account_ancestor new where new.id_ancestor=old.id_descendent
    and num_generations <>0 );

/* DataMart insert new id_dm_acc for moving account and descendents */
        insert into t_dm_account(id_dm_acc,id_acc,vt_start,vt_end) select seq_t_dm_account.nextval,anc.id_descendent, anc.vt_start, anc.vt_end
        from t_account_ancestor anc
        inner join tmp_t_dm_account acc on anc.id_descendent = acc.id_acc
        where anc.id_ancestor=1
        and acc.vt_end = varMaxDateTime;

        insert into t_dm_account_ancestor
        select dm2.id_dm_acc, dm1.id_dm_acc, aa1.num_generations
        from
        t_account_ancestor aa1
        inner join t_dm_account dm1 on aa1.id_descendent=dm1.id_acc and aa1.vt_start <= dm1.vt_end and dm1.vt_start <= aa1.vt_end
        inner join t_dm_account dm2 on aa1.id_ancestor=dm2.id_acc and aa1.vt_start <= dm2.vt_end and dm2.vt_start <= aa1.vt_end
        inner join tmp_t_dm_account acc on aa1.id_descendent = acc.id_acc
        where dm1.id_acc <> dm2.id_acc
        and dm1.vt_start >= dm2.vt_start
        and dm1.vt_end <= dm2.vt_end
        and acc.vt_end = varMaxDateTime;

        /*we are adding 0 level record for all children of moving account */
        insert into t_dm_account_ancestor select dm1.id_dm_acc,dm1.id_dm_acc,0
        from
        t_dm_account dm1
        inner join tmp_t_dm_account acc on dm1.id_acc = acc.id_acc
        and acc.vt_end = varMaxDateTime;

        delete from tmp_t_dm_account;
        delete from tmp_deletethese;


    SELECT NVL(MAX(all_types),0)
        INTO allTypesSupported
        FROM t_acc_tmpl_types;
    SELECT NVL(MIN(id_acc_template),-1), NVL(MIN(templOwner),-1), COUNT(*)
        INTO templateId, templateOwner, templateCount
        FROM
        (
        select  id_acc_template
                , template.id_folder as templOwner
            from
                    t_acc_template template
            INNER JOIN t_account_ancestor ancestor on template.id_folder = ancestor.id_ancestor
            INNER JOIN t_account_mapper mapper on mapper.id_acc = ancestor.id_ancestor
            inner join t_account_type atype on template.id_acc_type = atype.id_type
                WHERE id_descendent = p_new_parent AND
                    p_system_time between vt_start AND vt_end AND
                    (atype.name = p_acc_type OR allTypesSupported = 1)
            ORDER BY num_generations asc
        )
        where ROWNUM = 1;

    IF (templateCount <> 0 AND templateId <> -1)
    THEN
        updateprivatetempates(
            id_template => templateId
        );
        inserttemplatesession(templateOwner, p_acc_type, 0, ' ', 0, 0, 0, sessionId, 'N');
        ApplyAccountTemplate(
            accountTemplateId => templateId,
            sessionId => sessionId,
            systemDate => p_system_time,
            sub_start => p_system_time,
            sub_end => NULL,
            next_cycle_after_startdate => 'N',
            next_cycle_after_enddate   => 'N',
            id_event_success           => NULL,
            id_event_failure           => NULL,
            account_id                 => p_account_being_moved,
            doCommit                   => 'N'
        );
    ELSE
        FOR tmpl IN (
            SELECT template.id_acc_template, template.id_folder, atype.name
                FROM t_account_ancestor ancestor
                JOIN t_acc_template template ON ancestor.id_descendent = template.id_folder
                JOIN t_account_type atype on template.id_acc_type = atype.id_type
                WHERE ancestor.id_ancestor = p_new_parent
        )
        LOOP
            updateprivatetempates(
                id_template => tmpl.id_acc_template
            );
            inserttemplatesession(templateOwner, p_acc_type, 0, ' ', 0, 0, 0, sessionId, 'N');
            ApplyAccountTemplate(
                accountTemplateId => tmpl.id_acc_template,
                sessionId => sessionId,
                systemDate => p_system_time,
                sub_start => p_system_time,
                sub_end => NULL,
                next_cycle_after_startdate => 'N',
                next_cycle_after_enddate   => 'N',
                id_event_success           => NULL,
                id_event_failure           => NULL,
                account_id                 => p_account_being_moved,
                doCommit                   => 'N'
            );
        END LOOP;

    END IF;

    p_status:=1;
END;