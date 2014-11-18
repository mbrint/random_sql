--select count(*) from all_tables where tablespace_name = 'MGPROD';

BEGIN
         FOR i IN ( select 'grant select on ' ||  table_name || ' to mg_report' cmd from user_tables where tablespace_name = 'MGPROD' order by table_name)
         LOOP
             EXECUTE IMMEDIATE(i.cmd);
         END LOOP;
END;


