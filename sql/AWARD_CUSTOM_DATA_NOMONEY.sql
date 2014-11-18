    Select  a.Award_ID, a.Award_Number, a.Sequence_Number
      , a.Lead_Unit_Number
      , a.Sponsor_Code
      , a.Update_Timestamp
  From  Award  a
 Where  a.Award_id in
     ( Select  aa.Award_ID
         From  Award  aa
        Where  aa.Award_id in (Select  ac.Award_ID 
                         from  Award_Custom_Data ac
                        Where  ac.Award_Number like '000000-%' 
                          and  ac.custom_attribute_id = 103 )
      )
   and a.Award_id not in 
     ( Select  t.Award_ID
         From  Award_Transaction_Summ_View t
        Where  t.Award_id in (Select  acc.Award_ID 
                         from  Award_Custom_Data acc
                        Where  acc.Award_Number like '000000-%' 
                          and  acc.custom_attribute_id = 103 )
          AND  t.Obligated_Change <> 0
      )
                           
Order by 6, 2, 1, 3 ;
