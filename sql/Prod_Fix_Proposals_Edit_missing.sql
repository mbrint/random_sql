-- Proposal found which was missing edit button but was current version
-- Query discovered proposal_sequece_status of PENDING for final document which is incorrect
-- should be either ACTIVE or ARCHIVED
select * from proposal where proposal_number = '00002332';

select unique proposal_sequence_status  from proposal;

select * from krew_doc_hdr_t where doc_hdr_id = 14861;

-- This query discovers the possible states of proposal_sequence_status in comparison to doc_hdr_stat_cd
-- It found several (11) proposals with the weird PENDING-Final status combo
select proposal_sequence_status,DOC_HDR_STAT_CD, count(*)
from proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
group by proposal_sequence_status,DOC_HDR_STAT_CD;

--  Targeted query for this strange state which should not exist.
select  proposal_sequence_status,DOC_HDR_STAT_CD,proposal_number,doc_hdr_id
from proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and doc_hdr_stat_cd = 'F'
  and proposal_sequence_status = 'PENDING';
  
-- update statement for one of the bad status values.  This fixed the missing edit issue  
update proposal set proposal_sequence_status = 'ACTIVE' where document_number = '14861';

-- Query to confirm that the other proposals with this condition are in fact the only
-- final version which should be "ACTIVE"
select  proposal_sequence_status,DOC_HDR_STAT_CD,proposal_number,doc_hdr_id
from proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and proposal_number in (select  proposal_number
                          from proposal p,
                               krew_doc_hdr_t d
                          where p.document_number = d.doc_hdr_id
                            and doc_hdr_stat_cd = 'F'
                            and proposal_sequence_status = 'PENDING')
order by proposal_number;

update proposal set proposal_sequence_status = 'ACTIVE' where document_number in (
select  p.document_number
from proposal p,
     krew_doc_hdr_t d
where p.document_number = d.doc_hdr_id
  and proposal_number in (select  proposal_number
                          from proposal p,
                               krew_doc_hdr_t d
                          where p.document_number = d.doc_hdr_id
                            and doc_hdr_stat_cd = 'F'
                            and proposal_sequence_status = 'PENDING'));
