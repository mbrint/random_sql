select * from KRNS_PESSIMISTIC_LOCK_T ;
select * from KRNS_MAINT_LOCK_T;

select d.doc_hdr_id,p.prncpl_nm
from negotiation n,
     krew_doc_hdr_t d,
     krim_prncpl_t p
where n.document_number = d.doc_hdr_id
  and d.initr_prncpl_id = p.prncpl_id
  and d.doc_hdr_stat_cd = 'S';