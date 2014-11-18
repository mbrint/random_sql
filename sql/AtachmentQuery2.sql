select *
from proposal_notepad
where proposal_number = '1468';

select np.proposal_id, 
       np.proposal_notepad_id, 
       substr(nte.rmt_obj_id,1,1) 
       || '/' || substr(nte.rmt_obj_id,2,1) 
       || '/' || substr(nte.rmt_obj_id,3,1) 
       || '/' || substr(nte.rmt_obj_id,4,1) 
       || '/' || substr(nte.rmt_obj_id,5,1) 
       || '/' || substr(nte.rmt_obj_id,6,1) 
       || '/' || nte.rmt_obj_id as folder, 
       np.ver_nbr, 
       att.att_id as filename
from proposal_notepad np
    ,krns_nte_t nte
    ,krns_att_t att
where nte.rmt_obj_id = np.obj_id
  and att.nte_id = nte.nte_id;
  
  select count(*)
from proposal_notepad np
    ,krns_nte_t nte
    ,krns_att_t att
where nte.rmt_obj_id = np.obj_id
  and att.nte_id = nte.nte_id;

select *
from krns_att_t where file_nm like '1468%';

select *
from krns_att_t;

select * 
from krns_nte_t;


