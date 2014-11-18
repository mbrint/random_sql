SET SERVEROUTPUT ON
SET DEFINE OFF
DECLARE
x utl_http.html_pieces;
BEGIN
x := utl_http.request_pieces('http://ovm99.pvt.hawaii.edu:8080/solr/collection1/dataimport?command=full-import&clean=true&entity=SPONSOR&commit=true',100);
dbms_output.put_line(x.count);
for i in 1 .. x.count loop
dbms_output.put_line(x(i));
END LOOP;
END;