/* For a given account, what are the Analytics we want to show as a summary from the SalesSummary datamart */
/* TBD: MRR */
select SUM(invoice_amount) as LTV, 1234.56 as MRR, 1012.34 as MRRPrevious from t_invoice
where id_acc = %%ACCOUNT_ID%%
