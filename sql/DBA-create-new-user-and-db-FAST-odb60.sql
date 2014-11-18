CREATE USER mgprod IDENTIFIED BY "odb60mgprod";
grant create session to mgprod;
grant create synonym to mgprod;
grant create procedure to mgprod;
grant create trigger to mgprod;
grant create table to mgprod;
grant create type to mgprod;
grant create view to mgprod;
grant create sequence to mgprod;
-- needed for kim_info link
grant create database link to mgprod;
grant DEBUG CONNECT SESSION to mgprod;
grant DEBUG ANY PROCEDURE to mgprod;

--CREATE TABLESPACE mgprod DATAFILE  '/oradata/kcdev/mgprod001.dbf' SIZE 10000000 
--                           AUTOEXTEND ON NEXT 10485760 MAXSIZE 1097152000,
--                                     '/oradata/kcdev/mgprod002.dbf' SIZE 10971520
--                           AUTOEXTEND ON NEXT 8192 MAXSIZE 2097152000,
--                                     '/oradata/kcdev/mgprod003.dbf' SIZE 10971520
--                            AUTOEXTEND ON NEXT 8192 MAXSIZE 4097152000,
--                                     '/oradata/kcdev/mgprod004.dbf' SIZE 10971520
--                            AUTOEXTEND ON NEXT 8192 MAXSIZE 8097152000,
--                                     '/oradata/kcdev/mgprod005.dbf' SIZE 10971520
--                            AUTOEXTEND ON NEXT 8192 MAXSIZE 16097152000
--         LOGGING ONLINE PERMANENT BLOCKSIZE 8192
--         EXTENT MANAGEMENT LOCAL AUTOALLOCATE DEFAULT 
--         NOCOMPRESS  SEGMENT SPACE MANAGEMENT AUTO;
CREATE TABLESPACE mgprod DATAFILE  '/oradata/kcdev/mgprod01.dbf' SIZE 1G
                           AUTOEXTEND ON NEXT 1G  MAXSIZE 15G,
                                     '/oradata/kcdev/mgprod02.dbf' SIZE 100K
                           AUTOEXTEND ON NEXT 1G  MAXSIZE 10G,
                                     '/oradata/kcdev/mgprod03.dbf' SIZE 100K
                           AUTOEXTEND ON NEXT 1G  MAXSIZE 5G,
                                     '/oradata/kcdev/mgprod04.dbf' SIZE 100K
                           AUTOEXTEND ON NEXT 100M MAXSIZE 5G,
                                     '/oradata/kcdev/mgprod05.dbf' SIZE 100K
                            AUTOEXTEND ON NEXT 100M MAXSIZE 5G,
                                     '/oradata/kcdev/mgprod06.dbf' SIZE 100K
                            AUTOEXTEND ON NEXT 100M MAXSIZE 5G,
                                     '/oradata/kcdev/mgprod07.dbf' SIZE 100K
                            AUTOEXTEND ON NEXT 100M MAXSIZE 5G
         EXTENT MANAGEMENT LOCAL AUTOALLOCATE DEFAULT
         NOCOMPRESS  SEGMENT SPACE MANAGEMENT AUTO; 
         
alter user mgprod default tablespace mgprod;
alter user mgprod quota unlimited on mgprod;