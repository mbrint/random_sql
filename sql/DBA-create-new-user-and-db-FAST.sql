CREATE USER MGPROD IDENTIFIED BY "odb60mgprod";
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
alter user mgprod default tablespace MGPROD;
alter user mgprod quota unlimited on mgprod;