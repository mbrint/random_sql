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
group by a.award_number, doc.doc_hdr_stat_cd
order by "Document Status" desc, award_number
;

select * from award_transaction_summ_view
where award_number = '002266-00001';



