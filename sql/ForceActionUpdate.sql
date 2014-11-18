update krim_role_rsp_actn_t set frc_actn = 'N' 
--select frc_actn from krim_role_rsp_actn_t 
where role_rsp_actn_id in
(select rra.role_rsp_actn_id
from krim_role_rsp_t rr,
     krim_rsp_t  rsp,
     krim_role_rsp_actn_t rra
where rsp.rsp_id = rr.rsp_id
  and rra.role_rsp_id = rr.role_rsp_id
  and rsp.rsp_id = 10002);

select * from krim_attr_defn_t;

select * from krim_role_t where role_id in ('10035','10036','10039');

