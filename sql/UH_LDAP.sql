-- Table created and loaded via pentaho script after dumping ldap to excel sheet using
-- ldap manager  
-- after export add column A as uhuuid with formula =MID(B2,8,8) for row 2
-- and copy to all rows  B column=DN
--
-- currently MGTEST contains this table.

drop table uh_ldap;

delete from uh_ldap;

select * from uh_ldap where uh_uid like 'ishii';

select * from uh_ldap where mail like 'etaomae@hawaii.edu';

select * from uh_ldap where uhpreferredmail like '%nakasone%';

select * from uh_ldap where UHUUID = '10340949';