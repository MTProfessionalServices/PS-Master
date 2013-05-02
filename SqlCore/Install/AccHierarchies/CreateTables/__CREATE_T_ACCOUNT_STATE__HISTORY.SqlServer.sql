
				create table t_account_state_history (
				id_acc int not null,
				status char(2) not null,
				vt_start datetime not null,
				vt_end datetime not null,
				tt_start datetime not null,
				tt_end datetime not null,
				CONSTRAINT t_account_statehis_check CHECK (status = 'PA' OR status = 'AC' 
				OR status = 'SU' or status = 'PF' or status = 'CL' or status = 'AR'),
				CONSTRAINT date_state_hist_check1 check ( vt_start <= vt_end)
				)
				