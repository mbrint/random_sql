select un2,role_name,assignes,substr(role_name,6) dummy
from (select unit_number, role_nm, count(*) as assignes
               from krim_role_mbr_attr_data_t,  
                    krim_role_mbr_t,
                    krim_role_t,
                    unit
               where krim_role_t.role_id = krim_role_mbr_t.role_id
                 and krim_role_mbr_t.role_mbr_id = krim_role_mbr_attr_data_t.role_mbr_id
                 and (role_nm like 'UHL4%Approver' 
                           or role_nm like 'UHL5%Approver' 
                           or role_nm like 'UHL6%Approver')
                 and kim_attr_defn_id = '10000'
                 and unit.unit_number = attr_val
                 --and unit_number in ('HA1004','HA1019')
              group by unit_number, role_nm) x,
              (select unit_number un2,role_nm as role_name
               from krim_role_t,
                    unit
               where (role_nm like 'UHL4%Approver' 
                  or role_nm like 'UHL5%Approver' 
                  or role_nm like 'UHL6%Approver')
                  --and unit_number in ('HA1004','HA1019')
              ) z
where x.role_nm(+) = z.role_name
  and x.unit_number(+) = z.un2
order by un2,dummy;

select * from krim_role_t where role_nm like 'UHL4%Approver' or role_nm like 'UHL5%Approver' or role_nm like 'UHL6%Approver';

select unit_number, role_nm,count(*)
  from unit,
       krim_role_t,
       krim_role_mbr_t ormt
  where unit_number = 'HA1004' 
  and (role_nm like 'UHL4%Approver' or role_nm like 'UHL5%Approver' or role_nm like 'UHL6%Approver')
  and krim_role_t.role_id = ormt.role_id
  and unit_number in (select attr_val from krim_role_mbr_attr_data_t,
                                           krim_role_mbr_t irmt
                                     where irmt.role_mbr_id = krim_role_mbr_attr_data_t.role_mbr_id
                                     and irmt.role_id = ormt.role_id)
group by unit_number, role_nm;

select *
from krim_role_t
where role_nm like 'UHL7_UHM!_%Approver' escape '!';
   or role_nm like 'UHL7%Approver';

select * from unit;

select *
from krim_role_t
where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver';

select *
from krim_role_mbr_t
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver');
     
select * from krim_role_mbr_attr_data_t
where role_mbr_id in (select role_mbr_id
                      from krim_role_mbr_t
                      where role_id in (select role_id 
                                        from krim_role_t 
                                        where role_nm like 'UHL%Approver'
                                           or role_nm like 'UH%Final%Approver'));
                  
select * from krim_rsp_t
where nm like 'UH%';

select * from krim_role_rsp_t
where rsp_id in (select rsp_id from krim_rsp_t
where nm like 'UH%');


delete from krim_role_rsp_t where rsp_id in (select rsp_id from krim_rsp_t
                                             where nm like 'UH%');
                                              
delete from krim_rsp_t where nm like 'UH%'; 

delete from krim_role_mbr_attr_data_t
where role_mbr_id in (select role_mbr_id
                      from krim_role_mbr_t
                      where role_id in (select role_id 
                                        from krim_role_t 
                                        where role_nm like 'UHL%Approver'
                                           or role_nm like 'UH%Final%Approver'));
delete from krim_role_mbr_t
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver');
                                          
delete from krim_role_t
where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver';


