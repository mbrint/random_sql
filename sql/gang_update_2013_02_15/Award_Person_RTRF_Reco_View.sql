Drop View Award_Person_RTRF_Reco_View ;

Create View Award_Person_RTRF_Reco_View as

Select c.Award_Person_ID, c.Credit as RTRF_Percentage
     , r.Credit  as Recognition
     , c.Update_Timestamp
  From award_person_credit_splits c
     , award_person_credit_splits r
 Where c.Award_Person_ID = r.Award_Person_ID
   And c.Inv_Credit_Type_Code = 5
   And r.inv_credit_type_code = 6 ;
   
Grant select on Award_Person_RTRF_Reco_View to mg_report ;