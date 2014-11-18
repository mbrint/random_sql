--As Admin
grant create database link to MGPROD;

--   THIS IS HOW YOU CREATE LINK AND SYNONYM
--  drop synonym KIM_INFO;
--  drop database link KC_PROF_DEV_LINK.PVT.HAWAII.EDU;

-- As DB User (Prompt for password then create link)
-- NOTE: uhialtst=profdbtst.pvt.hawaii.edu (aka odb72.pvt.hawaii.edu (172.16.4.82))
ACCEPT usr_pwd PROMPT 'Enter PROF_KC_USR Password on UHIA1TST 
database: ' HIDE;
create database link KC_PROF_DEV_LINK
   connect to prof_kc_usr
   identified by "&usr_pwd"
   USING 'uhia1tst';
   
CREATE OR REPLACE SYNONYM MGPROD.KIM_INFO FOR PROFADM.KIM_INFO@KC_PROF_DEV_LINK.PVT.HAWAII.EDU;

--Prod Synonym for copy of prod db
CREATE OR REPLACE SYNONYM MGPROD.KIM_INFO FOR PROFADM.KIM_INFO@KC_PROF_LINK.PVT.HAWAII.EDU;


select * from kim_info;

-- Synonym version created by Greg, not sure if this is all that is needed to create it.
CREATE OR REPLACE SYNONYM "MGPROD"."KIM_INFO" FOR "PROFADM"."KIM_INFO"@"KC_PROF_LINK.PVT.HAWAII.EDU";

create or replace synonym "MGPROD"."KIM_INFO" FOR profadm.kim_info@KC_PROF_LINK_RRG;

select * from KIM_INFO_RRG;

select * from KIM_INFO;

select * 
from KIM_INFO K1,
     KIM_INFO K2
where K1.uhuuid = K2.uhuuid
  and K1.profileid != K2.profileid
  order by K1.firstname,K1.lastname;
  
select *
from
(
select * from kim_info 
where active = 'Y'
union
select * from kim_info
where active = 'N'
  and uhuuid not in (select uhuuid from kim_info where active = 'Y')
)
where firstname = 'Shaun';

select *
from
(
select * 
from kim_info a 
where active = (select max(active) from kim_info b where b.uhuuid = a.uhuuid)
)
where firstname = 'Shaun';


   
drop view KIM_INFO;

--Test as user
select count(*) from profadm.kim_info@kc_prof_link;
select * from profadm.kim_info@KC_PROF_LINK_RRG;
select UHUUID PRNCPL_ID, PROFILEID ENTITY_ID, UHUSERNAME PRNCPL_NM, FIRSTNAME, MIDDLENAME, LASTNAME from profadm.kim_info@KC_PROF_LINK_RRG;

create view KRIM_INFO_RRG as select UHUUID PRNCPL_ID, PROFILEID ENTITY_ID, UHUSERNAME PRNCPL_NM, FIRSTNAME, MIDDLENAME, LASTNAME from profadm.kim_info@kc_prof_link;

select * from KRIM_INFO;

select * from KIM_INFO_DEV;

select * from KRIM_INFO where PRNCPL_NM = 'yzuo';
   
drop view KRIM_INFO;   
drop view KIM_INFO;
   
--As Admin   
revoke create database link from kcdev31a;


