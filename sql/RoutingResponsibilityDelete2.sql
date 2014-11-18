--Query all approval roles
select *
from krim_role_t
where role_nm like 'UH%Approver' or role_nm like 'UH%Final%Approver'
order by role_nm;

--Query role members for all approval roles
select *
from krim_role_mbr_t
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver');
                  
-- Special query for members of final approval only (should be two groups ORS and RCUH)                  
select *
from krim_role_mbr_t
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'UH%Final%Approver');
     
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


delete from krim_role_mbr_attr_data_t;
where role_mbr_id in (select role_mbr_id
                      from krim_role_mbr_t
                      where role_id in (select role_id 
                                        from krim_role_t 
                                        where role_nm like 'UHL%Approver'
                                           or role_nm like 'UH%Final%Approver'));
                                           
delete from krim_role_mbr_t;
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver');
         
delete from krim_role_rsp_t where rsp_id in (select rsp_id from krim_rsp_t
                                             where nm like 'UH%');
                                              
delete from krim_rsp_t where nm like 'UH%';          
                                          
delete from krim_role_t
where role_nm like 'UHL%Approver' or role_nm like 'UH%Final%Approver';


select *
from krim_role_mbr_t
where role_id in (select role_id 
                  from krim_role_t 
                  where role_nm like 'Proposal Creator');

select * from krim_grp_t where grp_nm = 'RCUH HILO';             
                  
delete  from krim_role_mbr_t
where mbr_typ_cd = 'G'
and mbr_id = '11008'
and role_id in (select role_id from krim_role_t where role_nm in ('UH Department Aggregator','Proposal Submission','Institutional Proposal Maintainer','OSP Administrator','Create Proposal Log'));

delete from krim_role_mbr_attr_data_t
where role_mbr_id in (select role_mbr_id from krim_role_mbr_t
where mbr_typ_cd = 'G'
and mbr_id = '11008'
and role_id in (select role_id from krim_role_t where role_nm in ('UH Department Aggregator','Proposal Submission','Institutional Proposal Maintainer','OSP Administrator','Create Proposal Log')))
