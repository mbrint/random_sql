select * from dba_tab_columns where column_name like '%NOTEPAD_ID%' and owner = 'MGPROD';

select * from dba_tab_columns where data_type like 'BLOB' and owner = 'MGPROD' order by table_name,column_name;

select unique table_name from dba_tab_columns where table_name like '%DL%' and owner = 'MGPROD';


select * from dba_tab_columns where owner = 'MGPROD';

select * from attachment_file ;

select * from mgprod.proposal_notepad where proposal_number = '1468';

select * from mgprod.krns_att_t where file_nm like '1468%';

select * from mgprod.proposal where proposal_number = '1468';





