-- Awards today which have the issue still
Select  a.award_id, a.award_number, substr(a.award_number,1,6) || '-00001' AWARD_SHELL, a.Document_Number, a.Sequence_Number
      , a.Update_Timestamp, a.Update_User, t.Crte_DT as Create_Date
      , fp.proposal_id
           from mgprod.award a
               ,mgprod.krew_doc_hdr_t   doc
               ,mgprod.krew_actn_rqst_t t
               ,award_funding_proposals fp
          where a.document_number = doc.doc_hdr_id
            and doc.doc_hdr_stat_cd = 'F'
            and a.document_number = t.doc_hdr_id
            and t.Crte_DT >= '19-APR-2012'
            and t.Crte_DT <  '20-APR-2012'
            and fp.award_id (+)= a.award_id
            and substr(a.award_number,1,6) || '-00001' not in (select unique award_number from award_custom_data)
order by a.award_number;

-- Find awards modified today
-- compare against current awards with issue to see if 
-- they may be affected
select comp.AwardID, comp.AwardNumber 
from  
       (Select  a.award_id as AwardID, a.award_number as AwardNumber , a.Document_Number, a.Sequence_Number
      , a.Update_Timestamp, a.Update_User, t.Crte_DT as Create_Date
      , fp.proposal_id
           from mgprod.award a
               ,mgprod.krew_doc_hdr_t   doc
               ,mgprod.krew_actn_rqst_t t
               ,award_funding_proposals fp
          where a.document_number = doc.doc_hdr_id
            and doc.doc_hdr_stat_cd = 'F'
            and a.document_number = t.doc_hdr_id
            and t.Crte_DT >= '19-APR-2012'
            and t.Crte_DT <  '20-APR-2012'
            and fp.award_id (+)= a.award_id order by a.award_number) comp
where substr(comp.AWARDNUMBER,1,6) in (select substr(award_number,1,6) from award_cd_error_money)
or substr(comp.AWARDNUMBER,1,6) in (select substr(award_number,1,6) from award_cd_err_no_money);

-- Check sum of all awards converted today
select sum(obligated_change)
from award_transaction_summ_view,
     award_cd_error_money
where award_transaction_summ_view.award_number = award_cd_error_money.award_number
  and update_timestamp >= '19-Apr-2012'
  and update_timestamp <  '20-APR-2012'
;

-- Check sum of each award for today, has converted award number if was due to 
-- conversion
select award_transaction_summ_view.award_number
      ,award_cd_error_money.award_number CONVERTED_AWARD_NUM
      ,sum(obligated_change)
from award_transaction_summ_view,
     award_cd_error_money
where award_transaction_summ_view.award_number = award_cd_error_money.award_number (+)
  and update_timestamp >= '19-Apr-2012'
  and update_timestamp < '20-APR-2012'
group by award_transaction_summ_view.award_number,award_cd_error_money.award_number
order by CONVERTED_AWARD_NUM,AWARD_NUMBER;



select * from award_custom_data where award_number = '002035-00001';
select award_id,award_number from award where award_number = '002035-00001';
select * from award_custom_data where award_id = '39107';
select * from award_cd_err_no_money where award_number = '002035-00001';
select * from award_cd_error_money where award_number = '002035-00001';
select ti.obligated_change,t.award_number,t.update_timestamp,t.transaction_type_code,t.transaction_id
from award_amount_transaction t,
     award_amount_info ti
where t.award_number = ti.award_number
  and t.transaction_id = ti.tnm_document_number
  and t.award_number like '002035-%';
            

