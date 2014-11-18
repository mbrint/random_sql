select kdoc.doc_hdr_id
      ,eps.proposal_number
      ,eps_person.person_id
from krew_doc_hdr_t kdoc
     ,krew_doc_typ_t kdoctyp
     ,eps_proposal eps
     ,eps_prop_person eps_person
where kdoc.doc_typ_id = kdoctyp.doc_typ_id
  and kdoctyp.doc_typ_nm = 'ProposalDevelopmentDocument'
  and kdoc.doc_hdr_stat_cd = 'R' -- Enroute
  and eps.document_number = kdoc.doc_hdr_id
  and eps_person.proposal_number = eps.proposal_number
  and person_id is not null -- rolodex persons have null person_id
  ;
  
select count(*)
from krew_doc_hdr_t kdoc
     ,krew_doc_typ_t kdoctyp
     ,eps_proposal eps
     ,eps_prop_person eps_person
where kdoc.doc_typ_id = kdoctyp.doc_typ_id
  and kdoctyp.doc_typ_nm = 'ProposalDevelopmentDocument'
  and kdoc.doc_hdr_stat_cd = 'R' -- Enroute
  and eps.document_number = kdoc.doc_hdr_id
  and eps_person.proposal_number = eps.proposal_number
  and person_id is not null -- rolodex persons have null person_id
  and person_id = '&personid'
  ;