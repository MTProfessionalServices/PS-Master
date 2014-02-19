SELECT re.tx_display_name as Name,
rer.dt_end as Date,
rer.tx_detail as Message 
FROM t_recevent_run rer
join t_recevent_inst rei on   rei.id_instance = rer.id_instance
join t_recevent re on re.id_event = rei.id_event
where rei.tx_status = 'Failed'
and rer.tx_status = 'Failed'
and rer.dt_start > DATEADD(month, -1, getdate())
order by Date desc