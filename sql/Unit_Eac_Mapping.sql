drop table uh_eac_unit_map;
create table uh_eac_unit_map as
select m.campus_cd,
       m.unit_number,
       m.unit_name,
       x.eac,
       x.description
  from campus_college_unit_view m,
       (select u.campus_cd,
               u.unit_number,
               u.unit_name,
               e.eac,
               e.description
        from campus_college_unit_view u,
             MGRCUAT.uh_eac_t e
        where u.campus_cd = e.campus
          and (upper(u.unit_name) = upper(e.DESCRIPTION)
               or upper(u.unit_name) like upper(e.DESCRIPTION) || '%(%)%')) x
where m.unit_number =  x.unit_number (+)
order by campus_cd,unit_number
;

select * 
from uh_eac_unit_map
order by EAC,campus_cd,unit_number;

select * 
from MGRCUAT.uh_eac_t e
where e.eac not in (select eac from uh_eac_unit_map where eac is not null)
order by campus,eac;

select count(*)
from uh_eac_unit_map where eac is not null;