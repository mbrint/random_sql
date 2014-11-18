CREATE OR REPLACE VIEW AWARD_PROJ_SUMMARY_VIEW AS 

Select  a.award_id             as Award_Id
      , a.award_number         as Award_Number
      , cast(epa.Abstract_Details as Varchar2(2000)) as Project_Summary
  From  Award                           a
      , Award_Funding_Proposals         af
      , Proposal                        p
      , Proposal_Admin_Details          pa
      , eps_proposal                    ep
      , eps_Prop_Abstract               epa
Where  a.Award_ID = af.Award_ID
  And  af.Proposal_ID = p.Proposal_ID
  And  af.proposal_ID = pa.inst_proposal_ID 
  -- This view can pick-up some Project Summary after myGRANT upgrated to 511,
  -- it used to pick up nothing for 311. So that this caused some awards have
  -- duplicates for Project Summary. To remove those duplicates set the 
  -- p.sequence_number = 99 to temporaryly put this view out of work.
  -- We will remove this view out from the Database View of the Framework 
  -- Manager only keep the Award_Custom_Data_Goal_View in the model. 1/4/2014.
  AND  p.sequence_number = 99
  And  ep.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
  And  ep.Submit_Flag = 'Y'
  And  epa.Proposal_Number = ep.Proposal_Number
  And  epa.ABSTRACT_TYPE_CODE = 1;


grant select on AWARD_PROJ_SUMMARY_VIEW to mg_report;
