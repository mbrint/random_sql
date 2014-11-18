select document_type "Document Type", 
       to_char(totalChars,'999,999,999,999') "Character Total", 
       to_char(numDocs,'999,999') "Number of Documents", 
       to_char(size__pct_dec*100,99.9) "Size Percent",
       to_char(count_pct_dec*100,99.9) "Count Percent"
from
(
select document_type,totalChars,ratio_to_report(totalChars) over () as size__pct_dec,numDocs,ratio_to_report(numDocs) over () as count_pct_dec
from
(
select typ.doc_typ_nm document_type, count(*) numDocs, sum(dbms_lob.getlength(cnt.serialzd_doc_frm)) totalChars
from krns_sesn_doc_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
group by typ.doc_typ_nm
order by totalChars desc
)
)
;