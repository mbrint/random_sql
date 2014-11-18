--  If final PD is stuck in "Approval Pending - Submitted" status and the document is finalized
--  then the IP can't be attached to an award.
--  In this case we need to switch the status to 8 = "Approved Post Submission"
select * from eps_proposal where document_number = '98917';

update eps_proposal set status_code = 8 where  document_number = '98917';

select proposal_number,document_number,p.update_timestamp,p.update_user
                           from eps_proposal p,
                           krew_doc_hdr_t h
                           where h.doc_hdr_id = p.document_number 
                           and p.status_code = 5 
                          and h.doc_hdr_stat_cd = 'F';


update eps_proposal 
set status_code = 8 
where document_number in ( select document_number
                           from eps_proposal p,
                           krew_doc_hdr_t h
                           where h.doc_hdr_id = p.document_number 
                           and p.status_code = 5 
                          and h.doc_hdr_stat_cd = 'F');