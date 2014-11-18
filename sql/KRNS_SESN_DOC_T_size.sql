select count(*) from krns_sesn_doc_t;
select * from krns_sesn_doc_t;

select doc_hdr_id,count(*) 
from krns_sesn_doc_t
group by doc_hdr_id
having count(*) > 1;

delete from KRNS_SESN_DOC_T;

alter table krns_sesn_doc_t modify lob (serialzd_doc_frm) (SHRINK SPACE);