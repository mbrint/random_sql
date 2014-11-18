Drop View Prop_To_Budget_Periods_VIEW ;

Create View Prop_To_Budget_Periods_VIEW as    
Select 
       pac.Proposal_ID
     , p.Proposal_Number
     , p.Proposal_ID          as InAct_Prop_ID
     , ep.Proposal_Number     as PD_Prop_Num
     , bp.Budget_ID
     , bp.BUDGET_PERIOD
     , bp.START_DATE
     , bp.END_DATE
     , bp.TOTAL_DIRECT_COST
     , bp.TOTAL_INDIRECT_COST
     , bp.TOTAL_COST
     , p.create_timestamp     as update_timestamp
  From Proposal               p
     --, Proposal_Admin_Details pa
     --Below subquery to select the latest Dev_Porposal_Number if there are multiple DPs 11/05/2012.
     , (Select pad.inst_proposal_ID   
             , max(pad.Dev_Proposal_Number)  as Dev_Proposal_Number
          From Proposal_Admin_Details        pad   
         Group by pad.inst_proposal_ID)  pa
     , eps_proposal           ep
     , budget_document        bd
     , budget                 b
     , budget_Periods         bp
     --To select the current version (ACTIVE) of the Proposal Number.
     , (Select pp.Proposal_ID, pp.Proposal_Number
          From Proposal               pp
         Where pp.Proposal_Sequence_Status = 'ACTIVE'
       )                      pac
 Where p.proposal_ID = pa.inst_proposal_ID 
   AND p.sequence_number = 1
   And ep.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
   And bd.PARENT_DOCUMENT_KEY = ep.DOCUMENT_NUMBER 
   And b.DOCUMENT_NUMBER = bd.DOCUMENT_NUMBER 
   And b.BUDGET_ID = bp.BUDGET_ID 
   And b.FINAL_VERSION_FLAG = 'Y' 
   --Remove the Post Award Action proposal from report 11/08/2012
   AND p.Proposal_Type_Code <> '9'
   And pac.Proposal_Number = p.Proposal_Number ;

Grant Select on Prop_To_Budget_Periods_VIEW to mg_report ;