drop tablespace mg_dwh  including contents and datafiles cascade constraints;
drop user mg_dwh cascade;

CREATE USER mg_dwh IDENTIFIED BY "odb60mg_dwh";
grant create session to mg_dwh;
grant create synonym to mg_dwh;
grant create procedure to mg_dwh;
grant create trigger to mg_dwh;
grant create table to mg_dwh;
grant create type to mg_dwh;
grant create view to mg_dwh;
grant create sequence to mg_dwh;
-- needed for kim_info link
grant create database link to mg_dwh;
CREATE TABLESPACE mg_dwh DATAFILE  '/oradata/kcdev/mg_dwh001.dbf' SIZE 10000000 
                           AUTOEXTEND ON NEXT 10485760 MAXSIZE 1097152000,
                                     '/oradata/kcdev/mg_dwh002.dbf' SIZE 10971520
                           AUTOEXTEND ON NEXT 8192 MAXSIZE 2097152000,
                                     '/oradata/kcdev/mg_dwh003.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 4097152000,
                                     '/oradata/kcdev/mg_dwh004.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 8097152000,
                                     '/oradata/kcdev/mg_dwh005.dbf' SIZE 10971520
                            AUTOEXTEND ON NEXT 8192 MAXSIZE 16097152000
         LOGGING ONLINE PERMANENT BLOCKSIZE 8192
         EXTENT MANAGEMENT LOCAL AUTOALLOCATE DEFAULT 
         NOCOMPRESS  SEGMENT SPACE MANAGEMENT AUTO;
alter user mg_dwh default tablespace mg_dwh;
alter user mg_dwh quota unlimited on mg_dwh;