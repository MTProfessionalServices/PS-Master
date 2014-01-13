
		BEGIN    
		FOR DATA IN (SELECT 'X' FROM USER_TABLES WHERE UPPER(TABLE_NAME) = UPPER('tmp_ARReverse'))
		LOOP
			exec_ddl( 'DROP TABLE tmp_ARReverse');
			EXIT;
		END LOOP;
		exec_ddl( q'[CREATE TABLE tmp_ARReverse AS 
		      SELECT * FROM (SELECT
          adj.id_adj_trx as ID,
          CASE WHEN (adj.AdjustmentAmount+adj.aj_tax_federal+adj.aj_tax_state+adj.aj_tax_county+adj.aj_tax_local+adj.aj_tax_other) >= 0 THEN 'Credit' ELSE 'Debit' END as CompensatedType,
		      CASE WHEN (adj.AdjustmentAmount+adj.aj_tax_federal+adj.aj_tax_state+adj.aj_tax_county+adj.aj_tax_local+adj.aj_tax_other) < 0 THEN 'Credit' ELSE 'Debit' END as RecreateType,
          adj.ARBatchID as RecreateBatchID,
          adj.tx_desc as Description,
          adj.dt_modified as AdjustmentDate,
          am.ExtAccount as ExtAccountID,
          am.ExtNamespace as ExtNamespace,
          /* CASE WHEN adj.AdjustmentAmount < 0 THEN -adj.AdjustmentAmount ELSE adj.AdjustmentAmount END as Amount, */
	        ABS(adj.AdjustmentAmount+adj.aj_tax_federal+adj.aj_tax_state+adj.aj_tax_county+adj.aj_tax_local+adj.aj_tax_other) as Amount,
          au.am_currency as Currency,
          adj.ARDelAction
          FROM t_adjustment_transaction adj
          JOIN t_acc_usage au ON adj.id_sess = au.id_sess
          INNER JOIN vw_ar_acc_mapper am ON am.id_acc = adj.id_acc_payer
          WHERE ARBatchID IS NOT NULL
          AND ARDelBatchID = '%%AR_BATCH_ID%%'
			)  WHERE ROWNUM <= %%SET_SIZE%%]');
		END;
      