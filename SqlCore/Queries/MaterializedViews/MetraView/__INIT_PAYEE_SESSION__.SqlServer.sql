
    /* Following temp tables are created for storing intermediate results during MV code processing */
	
	begin
	if object_id('%%%NETMETERSTAGE_PREFIX%%%summ_delta_i_payee_session') is null
	begin
		exec ('CREATE TABLE %%%NETMETERSTAGE_PREFIX%%%summ_delta_i_payee_session (
		id_acc int NOT NULL,
		id_dm_acc int NOT NULL,
		id_usage_interval int NOT NULL,
		id_prod int NULL,
		id_view int NOT NULL,
		id_pi_template int NULL,
		id_pi_instance int NULL,
		am_currency nvarchar (3),
		id_se int NULL,
		dt_session datetime NULL,
		TotalAmount numeric(38, 6) NULL,
		TotalFederalTax numeric(38, 6) NULL,
		TotalCountyTax [numeric](38, 6) NULL,
		TotalLocalTax [numeric](38, 6) NULL,
		TotalOtherTax [numeric](38, 6) NULL,	
		TotalStateTax numeric(38, 6) NULL,
		TotalTax numeric(38, 6) NULL,
		PrebillAdjAmt numeric(38, 6) NULL,
		PrebillFedTaxAdjAmt numeric(38, 6) NULL,
		PrebillStateTaxAdjAmt numeric(38, 6) NULL,
		PrebillCntyTaxAdjAmt numeric(38, 6) NULL,
		PrebillLocalTaxAdjAmt numeric(38, 6) NULL,
		PrebillOtherTaxAdjAmt numeric(38, 6) NULL,
		PrebillTotalTaxAdjAmt numeric(38, 6) NULL,
		PostbillAdjAmt numeric(38, 6) NULL,
		PostbillFedTaxAdjAmt numeric(38, 6) NULL,
		PostbillStateTaxAdjAmt numeric(38, 6) NULL,
		PostbillCntyTaxAdjAmt numeric(38, 6) NULL,
		PostbillLocalTaxAdjAmt numeric(38, 6) NULL,
		PostbillOtherTaxAdjAmt numeric(38, 6) NULL,
		PostbillTotalTaxAdjAmt numeric(38, 6) NULL,
		PrebillAdjustedAmount numeric(38, 6) NULL,
		PostbillAdjustedAmount numeric(38, 6) NULL,
		NumPrebillAdjustments int NULL,
		NumPostbillAdjustments int NULL,
		NumTransactions int NULL)')
		exec ('CREATE clustered index i_summ_delta_i_payee_session on  %%%NETMETERSTAGE_PREFIX%%%summ_delta_i_payee_session(id_dm_acc,id_acc,id_usage_interval,dt_session,id_se,id_view,am_currency)')
	end
	if object_id('%%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payee_session') is null
	begin
		exec ('CREATE TABLE %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payee_session (
		id_acc int NOT NULL,
		id_dm_acc int NOT NULL,
		id_usage_interval int NOT NULL,
		id_prod int NULL,
		id_view int NOT NULL,
		id_pi_template int NULL,
		id_pi_instance int NULL,
		am_currency nvarchar (3),
		id_se int NULL,
		dt_session datetime NULL,
		TotalAmount numeric(38, 6) NULL,
		TotalFederalTax numeric(38, 6) NULL,
		TotalCountyTax [numeric](38, 6) NULL,
		TotalLocalTax [numeric](38, 6) NULL,
		TotalOtherTax [numeric](38, 6) NULL,	
		TotalStateTax numeric(38, 6) NULL,
		TotalTax numeric(38, 6) NULL,
		PrebillAdjAmt numeric(38, 6) NULL,
		PrebillFedTaxAdjAmt numeric(38, 6) NULL,
		PrebillStateTaxAdjAmt numeric(38, 6) NULL,
		PrebillCntyTaxAdjAmt numeric(38, 6) NULL,
		PrebillLocalTaxAdjAmt numeric(38, 6) NULL,
		PrebillOtherTaxAdjAmt numeric(38, 6) NULL,
		PrebillTotalTaxAdjAmt numeric(38, 6) NULL,
		PostbillAdjAmt numeric(38, 6) NULL,
		PostbillFedTaxAdjAmt numeric(38, 6) NULL,
		PostbillStateTaxAdjAmt numeric(38, 6) NULL,
		PostbillCntyTaxAdjAmt numeric(38, 6) NULL,
		PostbillLocalTaxAdjAmt numeric(38, 6) NULL,
		PostbillOtherTaxAdjAmt numeric(38, 6) NULL,
		PostbillTotalTaxAdjAmt numeric(38, 6) NULL,
		PrebillAdjustedAmount numeric(38, 6) NULL,
		PostbillAdjustedAmount numeric(38, 6) NULL,
		NumPrebillAdjustments int NULL,
		NumPostbillAdjustments int NULL,
		NumTransactions int NULL)')
		exec ('CREATE clustered index i_summ_delta_d_payee_session on  %%%NETMETERSTAGE_PREFIX%%%summ_delta_d_payee_session(id_dm_acc,id_acc,id_usage_interval,dt_session,id_se,id_view,am_currency)')
	end

	if object_id('%%%NETMETERSTAGE_PREFIX%%%tmp_insert_payee_session') is null
	begin
		exec ('CREATE TABLE %%%NETMETERSTAGE_PREFIX%%%tmp_insert_payee_session (
		id_acc int NOT NULL,
		id_dm_acc int NOT NULL,
		id_usage_interval int NOT NULL,
		id_prod int NULL,
		id_view int NOT NULL,
		id_pi_template int NULL,
		id_pi_instance int NULL,
		am_currency nvarchar (3),
		id_se int NULL,
		dt_session datetime NULL,
		TotalAmount numeric(38, 6) NULL,
		TotalFederalTax numeric(38, 6) NULL,
		TotalCountyTax [numeric](38, 6) NULL,
		TotalLocalTax [numeric](38, 6) NULL,
		TotalOtherTax [numeric](38, 6) NULL,	
		TotalStateTax numeric(38, 6) NULL,
		TotalTax numeric(38, 6) NULL,
		PrebillAdjAmt numeric(38, 6) NULL,
		PrebillFedTaxAdjAmt numeric(38, 6) NULL,
		PrebillStateTaxAdjAmt numeric(38, 6) NULL,
		PrebillCntyTaxAdjAmt numeric(38, 6) NULL,
		PrebillLocalTaxAdjAmt numeric(38, 6) NULL,
		PrebillOtherTaxAdjAmt numeric(38, 6) NULL,
		PrebillTotalTaxAdjAmt numeric(38, 6) NULL,
		PostbillAdjAmt numeric(38, 6) NULL,
		PostbillFedTaxAdjAmt numeric(38, 6) NULL,
		PostbillStateTaxAdjAmt numeric(38, 6) NULL,
		PostbillCntyTaxAdjAmt numeric(38, 6) NULL,
		PostbillLocalTaxAdjAmt numeric(38, 6) NULL,
		PostbillOtherTaxAdjAmt numeric(38, 6) NULL,
		PostbillTotalTaxAdjAmt numeric(38, 6) NULL,
		PrebillAdjustedAmount numeric(38, 6) NULL,
		PostbillAdjustedAmount numeric(38, 6) NULL,
		NumPrebillAdjustments int NULL,
		NumPostbillAdjustments int NULL,
		NumTransactions int NULL)')
	end

	if object_id('%%%NETMETERSTAGE_PREFIX%%%tmp_delete_payee_session') is null
	begin
		exec ('CREATE TABLE %%%NETMETERSTAGE_PREFIX%%%tmp_delete_payee_session (
		id_acc int NOT NULL,
		id_dm_acc int NOT NULL,
		id_usage_interval int NOT NULL,
		id_prod int NULL,
		id_view int NOT NULL,
		id_pi_template int NULL,
		id_pi_instance int NULL,
		am_currency nvarchar (3),
		id_se int NULL,
		dt_session datetime NULL,
		TotalAmount numeric(38, 6) NULL,
		TotalFederalTax numeric(38, 6) NULL,
		TotalStateTax numeric(38, 6) NULL,
		TotalTax numeric(38, 6) NULL,
		PrebillAdjAmt numeric(38, 6) NULL,
		PrebillFedTaxAdjAmt numeric(38, 6) NULL,
		TotalCountyTax [numeric](38, 6) NULL,
		TotalLocalTax [numeric](38, 6) NULL,
		TotalOtherTax [numeric](38, 6) NULL,	
		PrebillStateTaxAdjAmt numeric(38, 6) NULL,
		PrebillCntyTaxAdjAmt numeric(38, 6) NULL,
		PrebillLocalTaxAdjAmt numeric(38, 6) NULL,
		PrebillOtherTaxAdjAmt numeric(38, 6) NULL,
		PrebillTotalTaxAdjAmt numeric(38, 6) NULL,
		PostbillAdjAmt numeric(38, 6) NULL,
		PostbillFedTaxAdjAmt numeric(38, 6) NULL,
		PostbillStateTaxAdjAmt numeric(38, 6) NULL,
		PostbillCntyTaxAdjAmt numeric(38, 6) NULL,
		PostbillLocalTaxAdjAmt numeric(38, 6) NULL,
		PostbillOtherTaxAdjAmt numeric(38, 6) NULL,
		PostbillTotalTaxAdjAmt numeric(38, 6) NULL,
		PrebillAdjustedAmount numeric(38, 6) NULL,
		PostbillAdjustedAmount numeric(38, 6) NULL,
		NumPrebillAdjustments int NULL,
		NumPostbillAdjustments int NULL,
		NumTransactions int NULL)')
	end

	end
	