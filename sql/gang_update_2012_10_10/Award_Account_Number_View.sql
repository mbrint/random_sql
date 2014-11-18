Create View Award_Account_Number_View as
Select  a.Award_ID
      , a.Award_Number
      , a.Sequence_Number
      , a.ACCOUNT_NUMBER
  from  award        a
 Where  a.ACCOUNT_NUMBER is not NULL ;

Grant select on Award_Account_Number_View to mg_report ; 