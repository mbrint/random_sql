-- find proposal budget document by searching for budget_document where parent_document_key = document # of the PD
select * from budget_document where parent_document_key = '90327';

-- To fix the name too long bug change FDOC_DESC in KRNS_DOC_HDR_T
-- using the document # from budget_document table search above
select * from krns_doc_hdr_t where doc_hdr_id = '90331';