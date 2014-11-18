select * from dba_directories;

grant read,write ON DIRECTORY data_pump_dir to MGPROD;

-- run as oracle on odb80
-- place dmp file in directory tied to "data_pump_dir" use query above to query location
-- ***********    Import as MGPROD
-- impdp MGPROD/odb80mgprod@KCDEV SCHEMAS=MGPROD DIRECTORY=data_pump_dir DUMPFILE=mgprod20111110.dmp
--
-- for multi file dump  (Note: %U  represents a two digit number starting at 01...)
-- impdp MGPROD/odb80mgprod@KCDEV SCHEMAS=MGPROD DIRECTORY=data_pump_dir DUMPFILE=kc_%U_20111201.112148.dmp logfile=kc_01_20111201.112148.log

-- ***********    Import as SYSDBA into MGPROD
-- export ORACLE_SID=kcdev
-- impdp userid=\"/ as sysdba\" SCHEMAS=MGPROD directory=data_pump_dir dumpfile=mgprod20111110.dmp logfile=mgprod20111110.log

--  **********    Remap schema and tablespace
-- export ORACLE_SID=kcdev
-- impdp userid=\"/ as sysdba\" SCHEMAS=MGPROD remap_schema=mgprod:mgprod01 remap_tablespace=mgprod:mgprod01 directory=data_pump_dir dumpfile=kc_%U_20111202.174815.dmp logfile=kc_XX_20111202.174815.dmp.log





