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
select typ.doc_typ_nm document_type, count(*) numDocs, sum(dbms_lob.getlength(cnt.doc_cntnt)) totalChars
from krns_maint_doc_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
group by typ.doc_typ_nm
order by totalChars desc
)
)
;

select * from krew_doc_hdr_t where doc_hdr_id = '53199';
select * from krew_doc_typ_t where doc_typ_id = 2997;

select * 
from krns_maint_doc_t;

select typ.doc_typ_nm document_type, count(*) numDocs, sum(dbms_lob.getlength(cnt.doc_cntnt)) totalChars
from krns_maint_doc_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
group by typ.doc_typ_nm
order by totalChars desc;

select cnt.doc_hdr_id, typ.doc_typ_nm document_type, dbms_lob.getlength(cnt.doc_cntnt) totalChars,cnt.obj_id,cnt.doc_cntnt
from krns_maint_doc_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
--and cnt.doc_hdr_id = '10139'
order by totalChars desc;
