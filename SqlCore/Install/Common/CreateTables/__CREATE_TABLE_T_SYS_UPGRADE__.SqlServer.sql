/*
	<initialization table="t_sys_upgrade">
		<insert_only/>
		<primary_key>
			<field name="target_db_version"/>
		</primary_key>
	</initialization>
*/
				CREATE TABLE t_sys_upgrade
				(upgrade_id int IDENTITY,
				target_db_version varchar(50) NOT NULL,
				core_db_schema_version varchar(50) NULL,
				customization_version varchar(50) NULL,
				dt_start_db_upgrade datetime NULL,
				dt_end_db_upgrade datetime NULL,
				db_upgrade_status char(1) NOT NULL,
				constraint pk_t_sys_upgrade primary key clustered(upgrade_id)
				)

