select document_number, proposal_number, deadline_date, deadline_type, doc_hdr_stat_cd from EPS_PROPOSAL, KREW_DOC_HDR_T where document_number = doc_hdr_id and deadline_date is null and doc_hdr_stat_cd = 'S';