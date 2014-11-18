-- ==================================================================================
--                           UPADATE CANCELLED RECORDS 
-- ==================================================================================
-- If Cancelled and missing deadline date then populate deadline date 
-- and set deadline_type to target regardless of it being null or other value

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
                                 (KREW_DOC_HDR_T.doc_hdr_stat_cd = 'F' 
                                  and EPS_PROPOSAL.status_code in ('8','6'))
                                or
                                 -- UPDATE APPROVED AND SUBMITTED PROCESSED RECORDS
                              )
                         );

-- If Cancelled and missing deadline_type but has date then just set deadline type to target
update EPS_PROPOSAL set deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                            and EPS_PROPOSAL.deadline_date is not null 
                            and EPS_PROPOSAL.deadline_type is null 
                            and KREW_DOC_HDR_T.doc_hdr_stat_cd = 'X' 
                            and EPS_PROPOSAL.status_code = '10');

-- ==================================================================================
--             UPDATE APPROVED POST-SUBMISSION FINAL RECORDS status_code=8
--             UPDATE APPROVED AND SUBMITTED FINAL RECORDS   status_code=6
--             UPDATE APPROVAL GRANTED RECORDS - TYPE ONLY   status_code=3
-- ==================================================================================
update EPS_PROPOSAL set deadline_date = '01-JAN-1800', 
                        deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL 
                              ,KREW_DOC_HDR_T  
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                            and EPS_PROPOSAL.deadline_date is null 
                            and KREW_DOC_HDR_T.doc_hdr_stat_cd = 'F' 
                            and EPS_PROPOSAL.status_code in ('8','6'); -- status 3 not included intentionally

update EPS_PROPOSAL set deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T 
                          where document_number = doc_hdr_id 
                          and EPS_PROPOSAL.deadline_date is not null 
                          and EPS_PROPOSAL.deadline_type is null 
                          and doc_hdr_stat_cd = 'F' 
                          and  EPS_PROPOSAL.status_code = ('8','6','3');

==================================================================================
-- UPDATE APPROVED AND SUBMITTED PROCESSED RECORDS
==================================================================================
update EPS_PROPOSAL set deadline_date = '01-JAN-1800', 
                        deadline_type = 'T'
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T 
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                            and EPS_PROPOSAL.deadline_date is null 
                            and KREW_DOC_HDR_T.doc_hdr_stat_cd = 'P' 
                            and EPS_PROPOSAL.status_code = '6');


update EPS_PROPOSAL set deadline_type = 'T' 
where proposal_number in (select EPS_PROPOSAL.proposal_number 
                          from EPS_PROPOSAL
                              ,KREW_DOC_HDR_T  
                          where EPS_PROPOSAL.document_number = KREW_DOC_HDR_T.doc_hdr_id 
                            and EPS_PROPOSAL.deadline_date is not null 
                            and EPS_PROPOSAL.deadline_type is null 
                            and KREW_DOC_HDR_T.doc_hdr_stat_cd = 'P' 
                            and EPS_PROPOSAL.status_code = '6');


