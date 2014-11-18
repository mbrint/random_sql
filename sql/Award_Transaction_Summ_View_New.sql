--Create View Award_Transaction_Summ_View as
Select   a.award_id             as Award_Id
      , a.award_number                  as Award_Number
      , Case 
           When NVL(p.Proposal_Number, 'INF')='INF' then 'INF' || ad.ORG_DOC_HDR_ID
           Else p.Proposal_Number
           End	                        as Proposal_Number
      , at.transaction_id               as Transaction_ID     
      , aa.current_fund_effective_date  as Obligation_Start_date
      , aa.obligation_expiration_date   as Obligation_End_date
      , aa.obligated_change             as Obligated_Change
      , at.notice_date                  as Notice_date     
      , at.update_timestamp             as Update_Timestamp
      , at.transaction_type_code        as Transaction_Type_Code 
  From  Award                           a
      , Award_Funding_Proposals         af
      , Proposal 		        p
      , Award_Amount_Info               aa
      , Award_Amount_Transaction        at
      , KRNS_DOC_HDR_T                  ad
 Where  a.award_id = aa.award_id
   And  a.Award_ID = af.Award_ID (+)
   And  af.Proposal_ID = p.Proposal_ID (+)
   and  a.Document_Number = ad.Doc_HDR_ID
   And  aa.award_number = a.award_number
   And  aa.award_number = at.award_number
   AND  a.award_number like '%-00001'
   And  aa.tnm_document_number = at.transaction_ID
   and  aa.OBLIGATED_CHANGE is not NULL 
   and  a.award_number like '001030-%';
