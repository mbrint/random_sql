select count(*) 
from eps_proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and d.doc_hdr_stat_cd = 'S';
  
create table eps_prop_ynq_bk as select * 
from eps_prop_ynq 
where proposal_number in (select p.proposal_number
from eps_proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and d.doc_hdr_stat_cd = 'S');
  
select count(*) from eps_prop_ynq_bk;

delete from eps_prop_ynq 
where proposal_number in (select p.proposal_number
from eps_proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and d.doc_hdr_stat_cd = 'S');

