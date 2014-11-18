set serveroutput on;
exec dbms_output.enable(100000);
begin
  dbms_output.put_line ('started');
  for r in 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE(to_char(r));
      for x in 1..6 LOOP
        DBMS_OUTPUT.PUT_LINE('     ' || to_char(x));
        exit when x = 3;
      END LOOP;
  END LOOP;
END;
/