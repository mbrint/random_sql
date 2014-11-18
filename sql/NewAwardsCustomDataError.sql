select unique award_id 
from award_custom_data
where award_number = '000000-00000';

-- Award_Trans_missingSeqn1_inCustData...
Select  t.*
From  Award_Transaction_Summ_View t
Where  Award_Number not in (Select ac.Award_Number from Award_Custom_Data ac
                             Where ac.Sequence_Number = 1)
AND Obligated_Change <> 0
Order by 9, 2, 1, 7

-- 
Select  a.Award_ID, a.Award_Number, a.Sequence_Number, a.Lead_Unit_Number, a.Sponsor_Code, a.Update_Timestamp
From  Award  a
Where  Award_Number not in (Select ac.Award_Number from Award_Custom_Data ac
                            Where ac.Sequence_Number = 1)
And Sequence_Number = 1      
Order by 6, 2, 1, 3;

select t.award_number,t.transaction_id,i.award_id,i.award_number,i.obligated_change,a.sequence_number
from award_amount_transaction t,
     award_amount_info i,
     award a
where i.award_number = t.award_number
  and a.award_id = i.award_id
  and t.award_number = '001864-00001';

Select  Distinct a.award_id             as Award_Id
      , a.award_number                  as Award_Number
      , p.Proposal_Number 	        as Proposal_Number
      , at.transaction_id               as Transaction_ID     
      , aa.current_fund_effective_date  as Obligation_Start_date
      , aa.obligation_expiration_date   as Obligation_End_date
      --, aa.anticipated_change           as Anticipated_Change
      , aa.obligated_change             as Obligated_Change
      , at.notice_date                  as Notice_date
      , at.update_timestamp             as Update_Timestamp
      , at.transaction_type_code        as Transaction_Type_Code 
      --, att.description                 as Award_Transaction_Type
  From  Award                           a
      , Award_Funding_Proposals         af
      , Proposal 		        p
      , Award_Amount_Info               aa
      , Award_Amount_Transaction        at
      --, Award_Transaction_Type          att
 Where  a.award_id = aa.award_id
   And  a.Award_ID = af.Award_ID
   And  af.Proposal_ID = p.Proposal_ID
   And  aa.award_number = a.award_number
   And  aa.award_number = at.award_number
   And  aa.tnm_document_number = at.transaction_ID
   --And  aa.OBLIGATED_CHANGE <> 0 
   and  aa.OBLIGATED_CHANGE is not NULL
   --And  a.award_number like '001192-0000%'
   And  a.award_number like '001864-00001'   
Order By 1,2,3,4;

