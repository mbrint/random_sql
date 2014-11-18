--create table award_cd_error_money
--as
Select a.award_number 
      , doc.doc_hdr_stat_cd "Document Status"
      , sum(asv.obligated_change) "Money"
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
having sum(asv.obligated_change) is not null and sum(asv.obligated_change) != 0
order by sum(asv.obligated_change) desc
;





