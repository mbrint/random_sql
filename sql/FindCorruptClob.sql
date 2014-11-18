set serveroutput on;
exec dbms_output.enable(100000);
declare
  pag    number;
  len    number;
  c      varchar2(10);
  charpp number := 8132/2;

begin
  dbms_output.put_line ('started');
  for r in (select rowid rid, dbms_lob.getlength (SERIALZD_DOC_FRM) len
            from   KRNS_SESN_DOC_T) loop
    if r.len is not null then
      for page in 0..r.len/charpp loop
        begin
          select dbms_lob.substr (SERIALZD_DOC_FRM, 1, 1+ (page * charpp))
          into   c
          from   KRNS_SESN_DOC_T 
          where  rowid = r.rid;
        
        exception
          when others then
            dbms_output.put_line ('Error on rowid ' ||R.rid||' page '||page);
            dbms_output.put_line (sqlerrm);
            exit; -- Only need to see the first failed page
        end;
      end loop;
    end if;
  end loop;
end;
/
