Drop view Award_Trans_Summ4Child_View ;

Create View Award_Trans_Summ4Child_View as
Select  a.award_id             as Award_Id
      , a.award_number                  as Award_Number
      , Case 
           --When NVL(stragg(p.Proposal_Number), 'INF')='INF' then 'INF' || stragg(kd.App_DOC_ID)
           --Else stragg(p.Proposal_Number)
           When NVL(listagg(p.Proposal_Number, '/') within group (Order by p.Proposal_Number), 'INF')='INF' then 'INF' || listagg(kd.App_DOC_ID, '/') within group (Order by kd.App_DOC_ID)
           Else listagg(p.Proposal_Number, '/') within group (Order by p.Proposal_Number)
           End	                        as Proposal_Number
      --Change Transaction_ID in Awd_Amnt_Trans into TnM_Document_Number in Awd_Amnt_Info, 
      --and add Transaction_ID into the view on 09/19/2012.
      , at.transaction_id               as TnM_Document_Number
      , aa.Transaction_ID               as Transaction_ID
      , aa.current_fund_effective_date  as Obligation_Start_date
      , aa.obligation_expiration_date   as Obligation_End_date
      , aa.obligated_change             as Obligated_Change
      --, aa.anticipated_change           as Anticipated_Change
      , at.notice_date                  as Notice_date    
      , at.update_timestamp             as Update_Timestamp
      , at.transaction_type_code        as Transaction_Type_Code      
  From  Award                           a
      , Award_Funding_Proposals         af
      , Proposal 		        p
      , Award_Amount_Info               aa
      , Award_Amount_Transaction        at
      , KREW_DOC_HDR_T                  kd
      , Transaction_Details             td
 Where  a.award_id = aa.award_id
   And  a.Award_ID = af.Award_ID (+)
   And  af.Proposal_ID = p.Proposal_ID (+)
   AND  (af.Active = 'Y' or af.Active is null)
   AND  (p.Proposal_Sequence_Status ='ACTIVE'
         or p.Proposal_Sequence_Status is null)
   and  a.Document_Number = kd.Doc_HDR_ID
   And  aa.award_number = a.award_number
   And  aa.award_number = at.award_number
   AND  aa.transaction_ID is not NULL
   AND  a.award_number not like '%-00001'
   And  aa.tnm_document_number = at.transaction_ID
   and  aa.OBLIGATED_CHANGE is not NULL 
   And  aa.TnM_Document_Number = td.TnM_Document_Number
   And  aa.Transaction_ID = td.Transaction_ID
   --Check the Source and Destination Award_Number have to be either External
   -- Source to remove/elemilate the transaction betwenn two child awards, 10/10/2012.
   And (td.Source_Award_Number = '000000-00000'
    Or  td.Destination_Award_Number = '000000-00000' )
   And  td.Transaction_Detail_Type = 'PRIMARY' 
   And  (aa.Award_Number = td.Destination_Award_Number
    OR   aa.Award_Number = td.Source_Award_Number      )
   AND aa.OBLIGATED_CHANGE <> 0
Group by a.award_id
      ,  a.award_number
      ,  at.transaction_id     
      ,  aa.Transaction_ID       
      ,  aa.current_fund_effective_date
      ,  aa.obligation_expiration_date
      ,  aa.obligated_change 
      ,  at.notice_date
      ,  at.update_timestamp
      ,  at.transaction_type_code  ;

Grant select on Award_Trans_Summ4Child_View to mg_report ;
