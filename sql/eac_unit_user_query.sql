--run on odb80 in MGRCUAT
create table EAC_UNIT_USR_MAP as 
select unique b.eac, d.prmry_dept_cd as "UNIT", e.unit_name "MYGRANT_UNIT_NAME", b.description as "PEOPLE_SOFT_DEPT"
from uh_peoplesoft_t a, 
     uh_eac_t b, 
     krim_entity_nm_t c, 
     krim_entity_emp_info_t d, 
     unit e 
where substr(a.eac, 0, 8) = b.eac 
and a.employee_alt_id = c.entity_id 
and a.employee_alt_id = d.entity_id 
and d.prmry_dept_cd = e.unit_number 
and a.empl_record_no = 1 
and d.prmry_ind ='Y' 
order by EAC,UNIT;

select * 
from MGPROD.uh_eac_unit_map
order by EAC,campus_cd,unit_number;

grant select on uh_eac_unit_map to MGRCUAT;

select EUCODE from (
select  EAC || '_' || UNIT_NUMBER EUCODE
from MGPROD.uh_eac_unit_map
where EAC is not null) a
; 

select EUCODE from (
select EAC  || '_' || UNIT EUCODE
from EAC_UNIT_USR_MAP ) b;

select EUCODE from (
select  EAC || '_' || UNIT_NUMBER EUCODE
from MGPROD.uh_eac_unit_map
where EAC is not null) a
where EUCODE not in (select EUCODE from (
select EAC  || '_' || UNIT EUCODE
from EAC_UNIT_USR_MAP ) b); 

select EUCODE from (
select EAC  || '_' || UNIT EUCODE
from EAC_UNIT_USR_MAP ) b
where EUCODE not in (
select EUCODE from (
select  EAC || '_' || UNIT_NUMBER EUCODE
from MGPROD.uh_eac_unit_map
where EAC is not null) a
);

select eac, unit, 'USR' from EAC_UNIT_USR_MAP
union 
select eac, unit_number, 'DPT' from MGPROD.uh_eac_unit_map
order by 1;

create table uh_eac_unit_map as (select * from MGPROD.uh_eac_unit_map);

select eac from uh_eac_t 
where eac not in 
 ((select eac from EAC_UNIT_USR_MAP
union select eac from uh_eac_unit_map));

select * from EAC_UNIT_USR_MAP;
select * from uh_eac_unit_map where eac is not null;

drop table EAC_MAPS_COMBINED;
create table EAC_MAPS_COMBINED
as (
select EAC,UNIT,MYGRANT_UNIT_NAME,PEOPLE_SOFT_DEPT,'USER_BASED' SOURCE from EAC_UNIT_USR_MAP
union select EAC,UNIT_NUMBER,UNIT_NAME,DESCRIPTION,'NAME MATCH' from uh_eac_unit_map where eac is not null
);

select count(*) from EAC_MAPS_COMBINED;
select count(*) from EAC_UNIT_USR_MAP;
select count(*) from uh_eac_unit_map;

-- Final results exported to excell
--Mapped
select * from EAC_MAPS_COMBINED order by eac;
-- EAC unmapped
select * 
from uh_eac_t
where eac not in (select eac from EAC_MAPS_COMBINED);
-- unit unmapped
select * 
from unit
where unit_number not in (select unit from eac_maps_combined);

-- NOTE; We stopped here.  This query is the result for eac's we have not yet mapped.
create table eac_unmapped as
select eac from (
select a.eac EAC, b.eac EAC2
from uh_eac_t a
     , EAC_MAPS_COMBINED b
where a.eac = b.eac (+))
where eac2 is null;

select count(*) from uh_eac_t;
select count(*) from uh_eac_t where eac in (select eac from EAC_MAPS_COMBINED);
select count(*) from uh_eac_t where eac in (select * from eac_unmapped);

select * from uh_eac_t where eac in (select * from eac_unmapped);
select  m.*
from uh_eac_t e
    ,EAC_MAPS_COMBINED m
where  e.eac = m.eac
;


  
  select count(EAC) from (select eac from EAC_UNIT_USR_MAP union
  select eac from uh_eac_unit_map);
  

                                          
select count(*) from uh_eac_t  where eac is not null;




select b.eac, d.prmry_dept_cd as "UNIT", e.unit_name "MYGRANT_UNIT_NAME", b.description as "PEOPLE_SOFT_DEPT", 
       c.first_nm, c.last_nm, 
       a.eac as EAC_WITH_LOC, 
       b.campus, a.employee_alt_id
from uh_peoplesoft_t a, 
     uh_eac_t b, 
     krim_entity_nm_t c, 
     krim_entity_emp_info_t d, 
     unit e 
where substr(a.eac, 0, 8) = b.eac 
and a.employee_alt_id = c.entity_id 
and a.employee_alt_id = d.entity_id 
and d.prmry_dept_cd = e.unit_number 
and a.empl_record_no = 1 
and d.prmry_ind ='Y' 
order by EAC,UNIT;