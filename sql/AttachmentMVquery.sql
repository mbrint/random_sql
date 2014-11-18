select 'mkdir -p ' || substr(att.att_id,1,1)
       || '/' || substr(att.att_id,2,1)
       || '/' || substr(att.att_id,3,1)
       || '/' || substr(att.att_id,4,1)
       || '/' || substr(att.att_id,5,1)
       || '/' || substr(att.att_id,6,1)
       || '/' || att.att_id
       || '; mv ' || substr(nte.rmt_obj_id,1,1)
       || '/' || substr(nte.rmt_obj_id,2,1)
       || '/' || substr(nte.rmt_obj_id,3,1)
       || '/' || substr(nte.rmt_obj_id,4,1)
       || '/' || substr(nte.rmt_obj_id,5,1)
       || '/' || substr(nte.rmt_obj_id,6,1)
       || '/' || nte.rmt_obj_id 
       || '/' || att.att_id 
       || ' ' ||
                 substr(att.att_id,1,1)
       || '/' || substr(att.att_id,2,1)
       || '/' || substr(att.att_id,3,1)
       || '/' || substr(att.att_id,4,1)
       || '/' || substr(att.att_id,5,1)
       || '/' || substr(att.att_id,6,1)
       || '/' || att.att_id
       || '/' || att.att_id as newfile
       ,
       att.att_id as filebase
from proposal_notepad np
    ,krns_nte_t nte
    ,krns_att_t att
where nte.rmt_obj_id = np.obj_id
  and att.nte_id = nte.nte_id
  and np.proposal_number = '1113';
