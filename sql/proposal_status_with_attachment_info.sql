select proposal_number,file_name from narrative where file_name like '%&%';

select p.proposal_number,d.doc_hdr_id,n.file_name,d.doc_hdr_stat_cd
from eps_proposal p
    ,krew_doc_hdr_t d
    ,narrative n
where d.doc_hdr_id = p.document_number
  and n.proposal_number = p.proposal_number
  and d.doc_hdr_stat_cd not in  ('F','X')
  and n.file_name like '%&%'
  order by doc_hdr_stat_cd;



-- Doc_HRD_STAT_CD
-- R=Enroute
-- P=PROCESSED
-- I=Initiated (seems these docs are stuck in this status.....)
-- D=Disapproved
-- X=Canceled
-- E=Exception
-- F=Final
-- S=Saved

select unique doc_hdr_stat_cd from krew_doc_hdr_t;
select * from krew_doc_hdr_t where doc_hdr_stat_cd = 'D';