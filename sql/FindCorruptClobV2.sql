--create table corrupt_lobs (corrupt_rowid rowid, err_num number); 

declare 
  error_1578 exception; 
  error_1555 exception; 
  error_22922 exception; 
  pragma exception_init(error_1578,-1578); 
  pragma exception_init(error_1555,-1555); 
  pragma exception_init(error_22922,-22922); 
  n number; 
begin 
  for cursor_lob in (select rowid r, SERIALZD_DOC_FRM from KRNS_SESN_DOC_T) loop 
  begin 
    n:=dbms_lob.instr(cursor_lob.SERIALZD_DOC_FRM ,hextoraw('889911')); 
  exception 
    when error_1578 then 
      insert into corrupt_lobs values (cursor_lob.r, 1578);
      commit; 
    when error_1555 then 
      insert into corrupt_lobs values (cursor_lob.r, 1555);
      commit; 
    when error_22922 then 
      insert into corrupt_lobs values (cursor_lob.r, 22922);
      commit; 
    end; 
  end loop; 
end; 
/ 

--select * from corrupt_lobs;
--drop table corrupt_lobs;


