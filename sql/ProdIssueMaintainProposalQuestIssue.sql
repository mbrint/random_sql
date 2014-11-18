select r.role_nm,r.role_id,rm.mbr_id,at.nm,ra.attr_val,rm.actv_to_dt
from mgprod.krim_role_t r,
     mgprod.krim_role_mbr_t rm,
     mgprod.krim_role_mbr_attr_data_t ra,
     mgprod.krim_attr_defn_t at
where r.role_id = rm.role_id
  and rm.role_mbr_id = ra.role_mbr_id
  and ra.kim_attr_defn_id = at.kim_attr_defn_id
  and r.role_nm like 'Maintain Proposal Quest%'
  order by mbr_id;


select * from krim_role_mbr_attr_data_t where role_mbr_id in (select role_mbr_id 
                                                              from krim_role_mbr_t rmt,
                                                                   krim_role_t r
                                                              where r.role_id = rmt.role_id 
                                                              and  r.role_nm like 'Maintain Proposal Quest%');
                                                              
select * from krim_role_mbr_attr_data_t where role_mbr_id in (select role_mbr_id 
                                                              from krim_role_mbr_t rmt,
                                                                   krim_role_t r
                                                              where r.role_id = rmt.role_id 
                                                              and  r.role_nm like 'Maintain Proposal Quest%');
                                                              
select * from krim_role_mbr_t where role_id in (select role_id from krim_role_t r where  r.role_nm like 'Maintain Proposal Quest%');

select * from krim_role_t where role_nm like 'Maintain Proposal Quest%';

delete from krim_role_mbr_attr_data_t where role_mbr_id in (select role_mbr_id 
                                                              from krim_role_mbr_t rmt,
                                                                  krim_role_t r
                                                              where r.role_id = rmt.role_id 
                                                              and  r.role_nm like 'Maintain Proposal Quest%');
                                                              
delete from krim_role_mbr_t where role_id in (select role_id from krim_role_t r where  r.role_nm like 'Maintain Proposal Quest%');

delete from krim_role_t where role_nm like 'Maintain Proposal Quest%';
                                                              