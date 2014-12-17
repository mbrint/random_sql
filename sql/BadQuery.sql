Select
       cast (p.Proposal_ID as varchar2(20)) as PROPOSAL_ID
     , p.Proposal_Number
     , cast (p.Proposal_ID as varchar2(20))   as InAct_Prop_ID
     , ep.Proposal_Number     as PD_Prop_Num
     , cast (bp.Budget_ID as varchar2(20))    as BUDGET_ID
     , bp.BUDGET_PERIOD
     , bp.START_DATE
     , bp.END_DATE
     , Trunc(bp.TOTAL_DIRECT_COST, 0)         as TOTAL_DIRECT_COST
     , Trunc(bp.TOTAL_INDIRECT_COST, 0)       as TOTAL_INDIRECT_COST
     , Trunc(bp.TOTAL_COST, 0)                as TOTAL_COST
     , p.create_timestamp                     as update_timestamp
From Proposal                                 p -- Joined wtih pac
     --, Proposal_Admin_Details pa
     --Below subquery to select the latest Dev_Porposal_Number if there are multiple DPs 11/05/2012.
     , (Select pad.inst_proposal_ID
             , max(pad.Dev_Proposal_Number)   as Dev_Proposal_Number
          From Proposal_Admin_Details         pad
         Group by pad.inst_proposal_ID)       pa -- joined with ep
     , eps_proposal                           ep -- joined with bd
     , budget_document                        bd -- joined with ep
     , budget                                 b  -- joined with bd, and bp
     , budget_Periods                         bp -- joined with b
     --To select the current version (ACTIVE) of the Proposal Number.
     , (Select pp.Proposal_ID, pp.Proposal_Number
          From Proposal                       pp
         Where pp.Proposal_Sequence_Status = 'ACTIVE'
       )                                      pac
Where p.proposal_ID = pa.inst_proposal_ID         -- Join P with PA
  AND p.sequence_number = 1
  And ep.PROPOSAL_NUMBER = pa.Dev_Proposal_Number -- Join EP and PA
  And bd.PARENT_DOCUMENT_KEY = ep.DOCUMENT_NUMBER -- Join bd with ep
  And b.DOCUMENT_NUMBER = bd.DOCUMENT_NUMBER      -- Join b with bd
  And b.BUDGET_ID = bp.BUDGET_ID                  -- Join b with bp
  And b.FINAL_VERSION_FLAG = 'Y'
  --Remove the Post Award Action proposal from report 11/08/2012
  AND p.Proposal_Type_Code <> '9'
  And pac.Proposal_Number = p.Proposal_Number     -- Join p with pac (active proposals)
  AND p.create_timestamp is not NULL ;