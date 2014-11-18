-- UPADATE CANCELLED RECORDS

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'X' and  EPS_PROPOSAL.status_code = '10');

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is not null and doc_hdr_stat_cd = 'X' and  EPS_PROPOSAL.status_code = '10');

update EPS_PROPOSAL set deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is not null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'X' and  EPS_PROPOSAL.status_code = '10');





-- UPDATE APPROVED POST-SUBMISSION FINAL RECORDS

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '8');

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is not null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '8');

update EPS_PROPOSAL set deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is not null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '8');




-- UPDATE APPROVED AND SUBMITTED FINAL RECORDS

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '6');

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is not null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '6');

update EPS_PROPOSAL set deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is not null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '6');





-- UPDATE APPROVED AND SUBMITTED PROCESSED RECORDS

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'P' and  EPS_PROPOSAL.status_code = '6');

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is null and EPS_PROPOSAL.deadline_type is not null and doc_hdr_stat_cd = 'P' and  EPS_PROPOSAL.status_code = '6');

update EPS_PROPOSAL set deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is not null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'P' and  EPS_PROPOSAL.status_code = '6');



-- UPDATE APPROVAL GRANTED RECORDS - TYPE ONLY

update EPS_PROPOSAL set deadline_type = 'T' where proposal_number in (select EPS_PROPOSAL.proposal_number from EPS_PROPOSAL, KREW_DOC_HDR_T, SPONSOR, PROPOSAL_STATE where document_number = doc_hdr_id and EPS_PROPOSAL.sponsor_code = SPONSOR.sponsor_code and EPS_PROPOSAL.status_code = PROPOSAL_STATE.state_type_code and EPS_PROPOSAL.deadline_date is not null and EPS_PROPOSAL.deadline_type is null and doc_hdr_stat_cd = 'F' and  EPS_PROPOSAL.status_code = '3');


