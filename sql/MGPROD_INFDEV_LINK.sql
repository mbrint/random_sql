-- run as mgprod on odb60
create database link infdevlnk connect to dm_infoed_administrator
identified by "97ANSwk" using '(DESCRIPTION =
        (ADDRESS_LIST =
                (ADDRESS = (PROTOCOL = TCP)(HOST = odb24.pvt.hawaii.edu)(PORT = 1521))
        )
        (CONNECT_DATA =
                (SID = infdev)
                (SERVER = DEDICATED)
        ))'
;

--drop database link infdevlnk;

--test the link
select spon_code from proposal@infdevlnk;
