set define off;

begin
do_http_request('http://kca01.pvt.hawaii.edu:8080/solr/collection1/dataimport?command=full-import&clean=false&commit=true');
end;
/