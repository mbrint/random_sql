select r.prncpl_id , actn_cd, to_char(actn_dt,'YYYY-MM-DD HH:MM:SS')
from krew_actn_rqst_t r
    ,krew_actn_tkn_t t
where r.doc_hdr_id = t.doc_hdr_id
  and r.prncpl_id = t.prncpl_id
  and actn_cd = 'A'
  and qual_role_nm = 'UH-L7-Approval-REQ'
  and r.doc_hdr_id = 68472;