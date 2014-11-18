drop table award_cd_err_no_money;

create table award_cd_err_no_money as 
(Select a.award_number 
      , doc.doc_hdr_stat_cd "Document Status"
      , sum(asv.obligated_change) "Award Money Total"
from award a
    ,krew_doc_hdr_t   doc
    ,award_transaction_summ_view asv
where a.document_number = doc.doc_hdr_id
  and a.award_number not in (select award_number
                             from award_custom_data
                             )
  and doc.doc_hdr_stat_cd = 'F'
  and a.award_id =  asv.award_id (+)
group by a.award_number, doc.doc_hdr_stat_cd
having sum(asv.obligated_change) is null or sum(asv.obligated_change) = 0
union
Select a.award_number 
      , doc.doc_hdr_stat_cd "Document Status"
      , sum(asv.obligated_change) "Award Money Total"
from award a
    ,krew_doc_hdr_t   doc
    ,award_transaction_summ_view asv
where a.document_number = doc.doc_hdr_id
  and a.award_number not in (select award_number
                             from award_custom_data
                             )
  and doc.doc_hdr_stat_cd in ('X','C')
  and a.award_id =  asv.award_id (+)
group by a.award_number, doc.doc_hdr_stat_cd)
;

update award_custom_data a 
SET award_number = (SELECT award_number FROM award B WHERE A.award_id = B.award_id)
where award_id in (select award_id from award a where a.award_number in (select award_number from award_cd_err_no_money));

select a.award_id,a.award_number, b.award_number
from award_custom_data a,
     award B
where A.award_id = B.award_id
  and a.award_id in (select award_id from award a where a.award_number in (select award_number from award_cd_err_no_money));
  
select a.award_id,a.award_number
from award_custom_data a
where a.award_id in (select award_id from award a where a.award_number in ('001069-00001','001070-00001','001295-00001'));


