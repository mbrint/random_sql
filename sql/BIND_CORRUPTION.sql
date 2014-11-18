set serverout on
exec dbms_output.enable(100000);
declare
  pag    number;
  len    number;
  c      varchar2(10);
  charpp number := 8132/2;

begin
  for r in (select rowid rid, dbms_lob.getlength (DOC_CNTNT_TXT) len
            from   KREW_DOC_HDR_CNTNT_T) loop
    if r.len is not null then
      for page in 0..r.len/charpp loop
        begin
          dbms_output.put_line('Processing row ' || r || ' page ' || page);
          select dbms_lob.substr (DOC_CNTNT_TXT, 1, 1+ (page * charpp))
          into   c
          from KREW_DOC_HDR_CNTNT_T
          where  rowid = r.rid;

        exception
          when others then
            dbms_output.put_line ('Error on rowid ' ||R.rid||' page '||page);
            dbms_output.put_line (sqlerrm);
        end;
      end loop;
    end if;
  end loop;
end;
/

