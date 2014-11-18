create table KRIM_ENTITY_NM_PROF_TMP as
select unique 
       en.ENTITY_NM_ID        ENTITY_NM_ID
      ,SYS_GUID()    OBJ_ID
      ,1             VER_NBR
      ,en.entity_id  ENTITY_ID
      ,'OTH'         NM_TYP_CD
      ,ki.firstname  FIRST_NM
      ,ki.middlename MIDDLE_NM
      ,ki.lastname   LAST_NM
      ,en.suffix_nm  SUFFIX_NM
      ,en.title_nm   TITLE_NM
      ,'Z'           DFLT_IND 
      ,'Y'           ACTV_IND
      ,sysdate       LAST_UPDT_DT
from kim_info ki,
     krim_entity_nm_t en
where ki.uhuuid = en.entity_id
  and en.nm_typ_cd = 'PRFR'
  and ki.profileid != '42211'
  and (upper(ki.firstname) != upper(en.first_nm)
       or upper(ki.lastname) != upper(en.last_nm)
       or upper(ki.middlename) != upper(en.middle_nm)
       or en.suffix_nm is not null
       );
       
drop table KRIM_ENTITY_NM_PROF_TMP;

select * from kim_info where profileid = '42211';

select count(*) from KRIM_ENTITY_NM_PROF_TMP;

select entity_id,count(*)
from KRIM_ENTITY_NM_PROF_TMP
group by entity_id
having count(*) > 1;

select * from krim_entity_nm_prof_tmp where entity_id = '10367380';
select * from kim_info where uhuuid = '10367380';

select count(unique entity_id) from KRIM_ENTITY_NM_PROF_TMP;
select count(entity_id) from KRIM_ENTITY_NM_PROF_TMP;

--select * from krim_entity_nm_t where last_updt_dt > '24-FEB-13' and nm_typ_cd != 'PRFR';
--select * from KRIM_ENTITY_NM_PROF_TMP where last_nm = 'Krot';
       
-- Update existing entries to "N" Default Indicator so we can insert new
-- Default entires
update krim_entity_nm_t
set dflt_ind = 'X'
  , LAST_UPDT_DT = sysdate
where entity_id in (select entity_id from KRIM_ENTITY_NM_PROF_TMP);
       
insert into krim_entity_nm_t
    ( ENTITY_NM_ID
      ,OBJ_ID
      ,VER_NBR
      ,ENTITY_ID
      ,NM_TYP_CD
      ,FIRST_NM
      ,MIDDLE_NM
      ,LAST_NM
      ,SUFFIX_NM
      ,TITLE_NM
      ,DFLT_IND 
      ,ACTV_IND
      ,LAST_UPDT_DT )
select KRIM_ENTITY_NM_ID_S.nextval
      ,OBJ_ID
      ,VER_NBR
      ,ENTITY_ID
      ,NM_TYP_CD
      ,FIRST_NM
      ,MIDDLE_NM
      ,LAST_NM
      ,SUFFIX_NM
      ,TITLE_NM
      ,DFLT_IND
      ,ACTV_IND
      ,LAST_UPDT_DT
      from KRIM_ENTITY_NM_PROF_TMP
      ;
      
      
select * from krim_entity_nm_t where DFLT_IND in ('X','Z') order by entity_id,dflt_ind;
       
update krim_entity_nm_t set DFLT_IND = 'N' where DFLT_IND = 'X';
update krim_entity_nm_t set DFLT_IND = 'Y' where DFLT_IND = 'Z';

select * from KRIM_ENTITY_NM_T where NM_TYP_CD = 'OTH';
select * from KRIM_ENTITY_NM_PROF_TMP where entity_id = '10921638';
select * from KRIM_ENTITY_NM_T where entity_id = '10921638';

