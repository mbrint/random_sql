Select  a.award_id, a.award_number, a.Document_Number, a.Sequence_Number
      , a.Update_Timestamp, a.Update_User, t.Crte_DT as Create_Date 
--      , fp.proposal_id
from award a
    ,krew_doc_hdr_t   doc
    ,krew_actn_rqst_t t
--    ,award_funding_proposals fp
where a.document_number = doc.doc_hdr_id
  and a.award_number not in (select award_number
                             from award_custom_data
                            where award_number like '%-00001') 
            and a.award_number like '%-00001'
--            and doc.doc_hdr_stat_cd = 'F'
            and a.document_number = t.doc_hdr_id
--            and fp.award_id (+)= a.award_id
Order by create_date desc;


