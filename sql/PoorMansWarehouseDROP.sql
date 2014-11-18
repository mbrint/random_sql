create or replace procedure DWH_DROP_WAREHOUSE as 
BEGIN 
  FOR i IN (SELECT owner,table_name FROM all_tables where owner = 'MG_DWH' and table_name like 'RPT_%') 
    LOOP 
      EXECUTE IMMEDIATE('DROP TABLE ' || i.owner || '.' || i.table_name || ' CASCADE CONSTRAINTS'); 
    END LOOP; 
END;