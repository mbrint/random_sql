create table tmp_uh_branch_ua_codes
(
branch varchar2(20),
ua_code varchar2(3),
stop_name varchar2(30),
stop_sequence int
);

--InitialApprover
insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'JABSOM',1,'InitialApprover','910' from dual
union all 
select 'HILO',1,'InitialApprover','911' from dual
union all
select 'UHMC',1,'InitialApprover','912' from dual
;

--InitialFA
insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'HILO',2,'InitialFA','913' from dual
union all
select 'CC',2,'InitialFA','913' from dual
union all
select 'UHMC',2,'InitialFA','913' from dual
union all
select 'WO',2,'InitialFA','913' from dual
union all
select 'UHMANOA',2,'InitialFA','913' from dual
;

--Chair
insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'JABSOM',3,'Chair','914' from dual
union all
select 'HILO',3,'Chair','914' from dual
union all
select 'UHMC',3,'Chair','914' from dual
union all
select 'WO',3,'Chair','914' from dual
union all
select 'UHMANOA',3,'Chair','914' from dual
;

--Dean/VC
insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'JABSOM',4,'Dean/VC','915' from dual
union all
select 'HILO',4,'Dean/VC','915' from dual
union all
select 'UHMC',4,'Dean/VC','916' from dual
union all
select 'CC',4,'Dean/VC','915' from dual
union all
select 'UHMANOA',4,'Dean/VC','915' from dual
;

--Final Unit Approver
insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'JABSOM',5,'Final Unit Approver','913' from dual
union all
select 'WO',5,'Final Unit Approver','916' from dual
union all
select 'WO',5,'Final Unit Approver','917' from dual
union all
select 'HILO',5,'Final Unit Approver','917' from dual
union all
select 'UHMC',5,'Final Unit Approver','917' from dual
union all
select 'CC',5,'Final Unit Approver','917' from dual
;

select * from tmp_uh_branch_ua_codes;

select stops.unit_number, stops.unit_name, stops.stop_name, stops.branch, stops.unit_path, stops.stop_sequence, stops.expected_ac,
       nvl(data.description, 'Missing ' || stops.expected_ac) admin_name, data.actv_frm_dt, data.actv_to_dt, data.person_id, data.name
from
(
-- Wrap select to make it into one table for easy outer joining with stop info
select    a.unit_number, u.unit_name, u.unit_path, u.branch, t.description, a.actv_frm_dt, a.actv_to_dt, a.person_id, n.first_nm || ' ' ||  n.last_nm name, a.unit_administrator_type_code,b.stop_name,b.stop_sequence    
from (-- unit table expanded with hierarchy path and branch name
      select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path, 
             case 
                  when sys_connect_by_path(unit_number,'/') like '%MA1503%' then 'JABSOM'
                  when sys_connect_by_path(unit_number,'/') like '%MA1548%' then 'JABSOM'
                  when sys_connect_by_path(unit_number,'/') like '%HI1618%' then 'HILO'
                  when sys_connect_by_path(unit_number,'/') like '%MU1293%' then 'UHMC'
                  when sys_connect_by_path(unit_number,'/') like '%WO1685%' then 'WO'
                  when sys_connect_by_path(unit_number,'/') like '%SW1003%' then 'CC'
                  else 'UHMANOA'
              end branch 
      from unit 
      start with unit_number = '000001'
      connect by prior unit_number = parent_unit_number
     ) u, 
     unit_administrator a,
     unit_administrator_type t,
     krim_entity_nm_t n,
     krim_prncpl_t e,
     tmp_uh_branch_ua_codes b
where
  a.unit_number = u.unit_number
  and a.unit_administrator_type_code = t.unit_administrator_type_code
  and a.unit_administrator_type_code > 900
  --and (a.actv_to_dt is null or to_char(a.actv_to_dt,'yyyyMMdd') >= to_char(sysdate,'yyyyMMdd'))
  --and (a.actv_frm_dt is null or to_char(a.actv_frm_dt,'yyyyMMdd') <= to_char(sysdate,'yyyyMMdd'))
  and a.person_id = n.entity_id
  and a.person_id = e.entity_id
  and u.branch = b.branch
  and a.unit_administrator_type_code = b.ua_code
order by u.unit_number, b.stop_sequence
) data,
(
-- Required Stops for outer join 
select unit_number, unit_name, unit_path, stop_name , b.branch, b.stop_sequence, t.description expected_ac
from
(
select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path, 
          case 
              when sys_connect_by_path(unit_number,'/') like '%MA1503%' then 'JABSOM'
              when sys_connect_by_path(unit_number,'/') like '%MA1548%' then 'JABSOM'
              when sys_connect_by_path(unit_number,'/') like '%HI1618%' then 'HILO'
              when sys_connect_by_path(unit_number,'/') like '%MU1293%' then 'UHMC'
              when sys_connect_by_path(unit_number,'/') like '%WO1685%' then 'WO'
              when sys_connect_by_path(unit_number,'/') like '%SW1003%' then 'CC'
              else 'UHMANOA'
          end branch 
      from unit 
      start with unit_number = '000001'
      connect by prior unit_number = parent_unit_number
) u,
tmp_uh_branch_ua_codes b,
unit_administrator_type t
where u.branch = b.branch
  and b.ua_code = t.unit_administrator_type_code
) stops
where stops.unit_number = data.unit_number (+)
  and stops.stop_name = data.stop_name (+)
order by stops.unit_number,stops.stop_sequence;
      


insert into tmp_uh_branch_ua_codes (branch,stop_sequence,stop_name,ua_code) 
select 'CC',1,'InitialApprover','910' from dual;

delete from tmp_uh_branch_ua_codes where branch = 'CC' and stop_sequence = 1;




