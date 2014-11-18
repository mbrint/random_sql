-- P=processed
-- R=Enroute 
-- I=
-- D=Disapproved
-- X=Canceled
-- E=Exception
-- F=Final
-- S=Saved
select p.document_number, b.underrecovery_amount, p.deadline_date
from eps_proposal p,
     krew_doc_hdr_t d,
     budget_document bd,
     budget b
where p.document_number = d.doc_hdr_id
  and bd.parent_document_key = p.document_number
  and bd.document_number = b.document_number
  and d.doc_hdr_stat_cd = 'R'
  and b.underrecovery_amount !=0
  and p.deadline_date >= sysdate
  order by deadline_date
  ;
  

