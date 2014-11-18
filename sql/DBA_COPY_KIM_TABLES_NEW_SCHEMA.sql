--Note: originally I excluded the PND tables but this broke person edit so I 
--      removed this exclusion
-- Run the results of this query as MGPROD
select 'grant select on ' || TABLE_NAME || ' to mgtestnp;'
from dba_tables
where table_name  like 'KRIM_%T' 
  and owner = 'MGPROD'
  and num_rows > 0;
  
-- Run these results as MGTESTNP
select 'alter table ' || TABLE_NAME || ' rename to ' || TABLE_NAME || '_BK;'
from dba_tables
where table_name  like 'KRIM_%T' 
  and owner = 'MGPROD'
  and num_rows > 0;

select * from dba_tables where table_name  like 'KRIM_%T_BK' and owner = 'MGTESTNP' ;
  
-- Run these results as MGTESTNP
select 'create table ' || TABLE_NAME || ' as select * from MGPROD.' || TABLE_NAME || ';'
from dba_tables
where table_name  like 'KRIM_%T' 
  and owner = 'MGPROD'
  and num_rows > 0;
  
  select * from dba_tables where table_name  like 'KRIM_%T_BK' and owner = 'MGTESTNP' ;
  
