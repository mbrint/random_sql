CREATE USER MGPROD IDENTIFIED BY "odb80mgprod";
grant create session to MGPROD;
grant create synonym to MGPROD;
grant create procedure to MGPROD;
grant create trigger to MGPROD;
grant create table to MGPROD;
grant create type to MGPROD;
grant create view to MGPROD;
grant create sequence to MGPROD;
-- needed for kim_info link
grant create database link to MGPROD;
-- needed by rich for debugging plsql
grant debug connect session to MGRICE;
grant debug any procedure to MGRICE;

grant read,write ON DIRECTORY data_pump_dir to MGPROD;

grant read,write ON DIRECTORY ron_data_pump_dir to MGPROD;

create directory ron_data_pump_dir as '/dpdump/ron';

alter user MGPROD identified by "odb60mgprod";
ALTER USER MGPROD ACCOUNT UNLOCK;

-- Nice query for user/tablespace/tablespace location/tablespace size
SELECT A.USERNAME, A.DEFAULT_TABLESPACE, B.FILE_NAME, b.bytes as bytes_used FROM DBA_USERS A, DBA_DATA_FILES B WHERE A.DEFAULT_TABLESPACE = B.TABLESPACE_NAME 
and default_tablespace not in ('USERS','SYSAUX','SYSTEM') ORDER BY USERNAME; 

select b.name as bname, a.name as aname, a.bytes from v$datafile a, v$tablespace b where a.ts# = b.ts# order by b.name, a.name ;

select	TABLESPACE_NAME,	INITIAL_EXTENT,	NEXT_EXTENT,	MIN_EXTENTS,	MAX_EXTENTS,	PCT_INCREASE,	STATUS,	CONTENTS
from 	dba_tablespaces order 	by TABLESPACE_NAME ;

select * from all_users;
-- users with default tablespace list
select * from dba_users;

select username,default_tablespace from dba_users
where default_tablespace not in ('USERS','SYSAUX','SYSTEM')
and default_tablespace not like 'DEV1_DISCO_%';

SELECT * from DBA_TABLESPACES where tablespace_name = 'kc20110124';
SELECT * from DBA_TABLESPACES;

-- create tablespace on oracle xe on my pc
create tablespace mglocal datafile 'C:\oraclexe\app\oracle\product\10.2.0\server\dbs\mglocal.dbf' size 10M autoextend on next 10M MAXSIZE 2000M;

-- CREATE TABLESPACE on OVM99 Oracle XE
create tablespace MGLOGAL datafile '/usr/lib/oracle/xe/app/oracle/product/10.2.0/server/rdbms/dbs/mglocal.dbf' size 10M autoextend on next 10M MAXSIZE 2000M;

-- CREATE TABLESPACE on odb80
--create bigfile tablespace mgprod datafile '/recovery_area02/kcdev/kcdev/mgprod.dbf' size 100M autoextend on next 10M maxsize 65G;
create tablespace mgprod datafile '/recovery_area02/kcdev/kcdev/mgprod.dbf' size 100M autoextend on next 10M maxsize 30G;

-- CREATE TABLESPACE on odb60
--create bigfile tablespace mgprod datafile '/recovery_area02/kcdev/kcdev/mgprod.dbf' size 100M autoextend on next 10M maxsize 65G;
CREATE TABLESPACE mgprod DATAFILE  '/oradata/kcdev/mgprod001.dbf' SIZE 10000000 
                           AUTOEXTEND ON NEXT 10485760 MAXSIZE 1097152000,
                                     '/oradata/kcdev/mgprod002.dbf' SIZE 10971520
                           AUTOEXTEND ON NEXT 8192 MAXSIZE 2097152000,
                                     '/oradata/kcdev/mgprod003.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 4097152000,
                                     '/oradata/kcdev/mgprod004.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 8097152000,
                                     '/oradata/kcdev/mgprod005.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 16097152000
         LOGGING ONLINE PERMANENT BLOCKSIZE 8192
         EXTENT MANAGEMENT LOCAL AUTOALLOCATE DEFAULT 
         NOCOMPRESS  SEGMENT SPACE MANAGEMENT AUTO;

alter database datafile '/oradata/kcdev/kcdev/mguat.dbf' autoextend on next 10m maxsize 12000M;

alter user mgprod default tablespace mgprod;

alter user mgprod quota unlimited on mgprod;

SELECT * from DBA_TABLESPACES;
-- drop tablespace
drop tablespace MGPROD  including contents and datafiles cascade constraints;
-- drop user
drop user MGPROD cascade;

select username, osuser, terminal, CLIENT_INFO 
from v$session
where username is not null
order by username, osuser;

-- Look for sessions for a user and kill session
select * from v$session where username = 'MGPROD';
select 'alter system kill session ''' || sid || ',' || serial# || ''';' from v$session where username = 'MGPROD';
alter system kill session '415,22399';
alter system kill session '438,51482';
alter system kill session '49,41134';
alter system kill session '67,22617';
alter system kill session '60,33303';

alter system kill session '20,29528';
alter system kill session '430,13964';

alter system kill session '52,3357';
alter system kill session '418,25175';
alter system kill session '25,10038';
alter system kill session '424,4713';

select * from obj$;
-- fix corrupted database tablespace that gets error
-- SQL Error: ORA-01561: failed to remove all objects in the tablespace  specified
-- http://www.bestremotedba.com/ora-01561-failed-to-remove-all-objects-in-the-table-space-specified/

-- get tablespace number
select * from ts$ where name = 'MGPROD' ;
-- use tablespace number to change seg type
select * from seg$ where ts#='39';
update seg$ set type# = 3 where ts#='39';
--
-- as sysdba do the following
-- shutdown abort
-- startup

--DISABLE: archive
--logon to oracle as, Enter user-name: sys as sysdba
-- sudo su - oracle
-- sqlplus "/ as sysdba"
shutdown immediate;
startup mount;
alter database noarchivelog;
archive log list;
shutdown immediate;
startup;
archive log list;

--Enable archive
archive log list;
shutdown immediate;
startup mount;
archive log list;
alter database archivelog;
archive log list;
shutdown immediate;
startup;
archive log list;

--create kim_info synonym
-- login odb80
-- sudo su - oradba
-- /home/oradba/scripts/ron_driver_link {mgprod password on odb80}




