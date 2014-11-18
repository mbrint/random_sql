declare version_val INTEGER := 0;
begin
select nvl(max(version),0) + 1 into version_val from AA_TABLE_ROW_ANALYSIS;
 insert into AA_TABLE_ROW_ANALYSIS 
  select 'ABSTRACT_TYPE' as table_name, count(*) as row_count, version_val as version from ABSTRACT_TYPE UNION
  select 'ACCOUNT_TYPE' as table_name, count(*) as row_count, version_val as version from ACCOUNT_TYPE UNION
  select 'ACCT_DD_ATTR_DOC' as table_name, count(*) as row_count, version_val as version from ACCT_DD_ATTR_DOC;
dbms_output.put_line(version_val);
commit;
end;

