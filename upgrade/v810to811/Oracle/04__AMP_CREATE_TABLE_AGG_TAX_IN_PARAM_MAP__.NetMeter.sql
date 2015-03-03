WHENEVER SQLERROR EXIT SQL.SQLCODE
declare
table_exists integer;
BEGIN
  BEGIN
    select count(*) into table_exists  from user_tables where table_name = 'AGG_TAX_IN_PARAM_MAP';
  EXCEPTION
  WHEN OTHERS THEN
    RAISE;
  END;
  IF table_exists = 0
  THEN
    BEGIN
      execute immediate
      '       CREATE TABLE AGG_TAX_IN_PARAM_MAP(
        ID_TAX_VENDOR NUMBER(10,0) NOT NULL, 
        TAX_VENDOR_PARAM NVARCHAR2(200) NOT NULL, 
        ID_VIEW NUMBER(10,0) NOT NULL,
        CHARGE_NAME NVARCHAR2(200) NOT NULL,
        FILTER NVARCHAR2(2000) NULL, 
        POPULATION_STRING NVARCHAR2(2000) NULL, 
        DEFAULT_VALUE NVARCHAR2(255) NULL,
        PRIMARY KEY (ID_TAX_VENDOR, TAX_VENDOR_PARAM, ID_VIEW, CHARGE_NAME))';
    EXCEPTION
    WHEN OTHERS THEN
      RAISE;
    END;
  END IF;
END;  
/