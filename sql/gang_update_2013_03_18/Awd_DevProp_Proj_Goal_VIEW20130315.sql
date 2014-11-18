Drop View Awd_DevProp_Proj_Goal_VIEW ;

Create  View Awd_DevProp_Proj_Goal_VIEW as
Select  a.award_id             as Award_Id
      , a.award_number         as Award_Number
      , cast(Substr(epa.Abstract_Details, 1, 2000) as Varchar2(2000)) as Proj_Goals
  From  Award                                                 a
      , Proposal                                              p
      --Select the Maximum Proposal_Number when the Award is funded by multiple Inst proposals. 03/15/2013
      , (Select  aff.Award_ID, Max(pp.proposal_number)        as Max_Prop_No
           from  proposal                                     pp
               , Award_Funding_Proposals                      aff
          Where  pp.Proposal_id = aff.PROPOSAL_ID (+)
            And  (aff.Active = 'Y' or aff.Active is null)
        Group by aff.Award_ID )                               pn
--Below subquery to select the latest Dev_Porposal_Number if there are multiple DPs.
      , (Select pad.inst_proposal_ID   
              , max(pad.Dev_Proposal_Number)  as Dev_Proposal_Number
           From Proposal_Admin_Details        pad   
         Group by pad.inst_proposal_ID)  pa
      , eps_proposal                     ep
      , eps_Prop_Abstract                epa
 Where  a.Award_ID = pn.Award_ID
   AND  p.proposal_number = pn.Max_Prop_No     --use Max_Prop_No 03/15/2013
   AND  p.sequence_number = 1
   And  p.proposal_ID = pa.inst_proposal_ID    
   And  ep.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
   And  ep.Submit_Flag = 'Y'
   And  epa.Proposal_Number = ep.Proposal_Number
   --Project Summary
   And  epa.ABSTRACT_TYPE_CODE = 1  ;

Grant select on Awd_DevProp_Proj_Goal_VIEW to mg_report ;
