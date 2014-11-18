call dbms_xdb.cfg_update(updateXML(dbms_xdb.cfg_get(), '/xdbconfig/sysconfig/protocolconfig/httpconfig/http-port/text()', 8083));

exec dbms_xdb.cfg_refresh;


