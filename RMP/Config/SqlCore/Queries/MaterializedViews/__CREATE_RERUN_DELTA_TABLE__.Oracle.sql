
			begin
				if not table_exists('%%DELTA_TABLE_NAME%%') then
					exec_ddl('create table %%DELTA_TABLE_NAME%%
							as select * from %%BASE_TABLE_NAME%% where 0=1');
				end if;
			end;
		