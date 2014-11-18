select * from eps_proposal where deadline_date is null or deadline_type is null;

update EPS_PROPOSAL set deadline_date = '01-JAN-1800', 
                        deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                          and EPS_PROPOSAL.deadline_date is null
                          and (   -- Cancelled Records
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'X' 
                                  and EPS_PROPOSAL.status_code = '10')
                                or
                                 -- UPDATE APPROVED POST-SUBMISSION FINAL RECORDS status_code=8
                                 -- UPDATE APPROVED AND SUBMITTED FINAL RECORDS   status_code=6
                                 -- DON'T update status_code=3 approval granted because we don't want fake date
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'F' 
                                  and EPS_PROPOSAL.status_code in ('8','6'))
                                or
                                 -- UPDATE APPROVED AND SUBMITTED PROCESSED RECORDS
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'P' 
                                  and EPS_PROPOSAL.status_code = '6')
                              )
                         )
;

update EPS_PROPOSAL set deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                            and EPS_PROPOSAL.deadline_date is not null 
                            and EPS_PROPOSAL.deadline_type is null 
                            and (   -- Cancelled Records
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'X' 
                                  and EPS_PROPOSAL.status_code = '10')
                                or
                                 -- UPDATE APPROVED POST-SUBMISSION FINAL RECORDS status_code=8
                                 -- UPDATE APPROVED AND SUBMITTED FINAL RECORDS   status_code=6
                                 -- UPDATE APPROVAL GRANTED RECORDS - TYPE ONLY   status_code=3
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'F' 
                                  and EPS_PROPOSAL.status_code in ('8','6','3'))
                                or
                                 -- UPDATE APPROVED AND SUBMITTED PROCESSED RECORDS
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'P' 
                                  and EPS_PROPOSAL.status_code = '6')
                              )
                         )
;


