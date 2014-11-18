select count(*) from krew_doc_hdr_cntnt_t;

--create table krew_doc_hdr_cntnt_t_bk
--as
select rownum, doc_hdr_id from krew_doc_hdr_cntnt_t
where rownum >=5
  and rownum <=10;
  
select rownum, doc_hdr_id 
from krew_doc_hdr_cntnt_t
where rownum >= 4 
   and rownum <= 7;

drop table krew_doc_hdr_cntnt_t_bk;
select count(*) from krew_doc_hdr_cntnt_t_bk;

select max(rownum) from krew_doc_hdr_cntnt_t;


select * from krew_doc_hdr_cntnt_t
where doc_hdr_id = '26283';

delete from krew_doc_hdr_cntnt_t
where doc_hdr_id = '26283';