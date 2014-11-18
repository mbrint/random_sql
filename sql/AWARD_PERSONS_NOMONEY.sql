Select  a.Award_ID, a.Award_Number, a.Sequence_Number
      , a.Lead_Unit_Number
      , a.Sponsor_Code
      , a.Update_Timestamp
  From  Award  a
 Where  a.Award_id in
     ( Select  aa.Award_ID
         From  Award  aa
        Where  aa.Award_id in (Select  ap.Award_ID 
                                              from  Award_persons ap
                                          Where  ap.Award_Number like '000000-%')
      )
   and a.Award_id not in 
     ( Select  t.Award_ID
         From  Award_Transaction_Summ_View t
        Where  t.Award_id in (Select  app.Award_ID 
                                           from  Award_persons app
                                        Where  app.Award_Number like '000000-%') 
          AND  t.Obligated_Change <> 0
      )
                           
Order by 6, 2, 1, 3 ;
