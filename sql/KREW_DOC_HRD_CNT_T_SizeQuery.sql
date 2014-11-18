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
select typ.doc_typ_nm document_type, count(*) numDocs, sum(dbms_lob.getlength(cnt.doc_cntnt_txt)) totalChars
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
group by typ.doc_typ_nm
order by totalChars desc
)
)
;

select typ.doc_typ_nm document_type, doc.doc_hdr_id, dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars, aat.update_timestamp
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
    ,award_amount_transaction aat
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
   and aat.transaction_id = doc.doc_hdr_id
   and doc.doc_hdr_id = '34845';
   
select doc.doc_hdr_id,dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars,typ.doc_typ_nm
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
order by totalChars desc;

--select doc_id, totalChars, doc_typ_nm from (
select doc.doc_hdr_id doc_id, dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars,typ.doc_typ_nm, doc.doc_hdr_stat_cd
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
   --and doc.doc_hdr_stat_cd = 'S'
   and doc.doc_hdr_stat_cd = 'F'
   --and doc_typ_nm = 'TimeAndMoneyDocument'
   and doc_typ_nm = 'InstitutionalProposalDocument'
order by totalChars desc;
--where rownum between 1 and 5;

select name, stat,  count(*) from (
select doc.doc_hdr_id doc_id, dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars,typ.doc_typ_nm name, doc.doc_hdr_stat_cd stat
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
  -- and doc.doc_hdr_stat_cd in ('F')
   and (doc_typ_nm = 'TimeAndMoneyDocument'
   or doc_typ_nm = 'InstitutionalProposalDocument')
   and dbms_lob.getlength(cnt.doc_cntnt_txt)   > 100000
order by totalChars desc)
group by name,stat;

select count(*) from (
select doc.doc_hdr_id doc_id, dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars,typ.doc_typ_nm, doc.doc_hdr_stat_cd
from krew_doc_hdr_cntnt_bk cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
   and doc.doc_hdr_stat_cd in ('F')
   and (doc_typ_nm = 'TimeAndMoneyDocument'
   or doc_typ_nm = 'InstitutionalProposalDocument')
   and dbms_lob.getlength(cnt.doc_cntnt_txt)   > 100000
order by totalChars desc);

create table krew_doc_hdr_cntnt_bk as
select cnt.*
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
   and doc.doc_hdr_stat_cd in ('F')
   and (doc_typ_nm = 'TimeAndMoneyDocument'
   or doc_typ_nm = 'InstitutionalProposalDocument')
   and dbms_lob.getlength(cnt.doc_cntnt_txt)   > 100000;


select doc.doc_hdr_id doc_id, dbms_lob.getlength(cnt.doc_cntnt_txt) totalChars,typ.doc_typ_nm, doc.doc_hdr_stat_cd
from krew_doc_hdr_cntnt_t cnt
    ,krew_doc_hdr_t doc
    ,krew_doc_typ_t typ
where doc.doc_typ_id = typ.doc_typ_id
   and cnt.doc_hdr_id = doc.doc_hdr_id
   and doc.doc_hdr_stat_cd in ('F')
   --and doc_typ_nm = 'TimeAndMoneyDocument'
   and doc_typ_nm = 'InstitutionalProposalDocument'
   and doc.doc_hdr_id = '11113';
   
  

