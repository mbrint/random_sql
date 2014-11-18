Create View Award_End_Dates_Info_View as
Select  ai.Award_ID
      , ai.Award_Number
      , ai.Sequence_Number
      , max(ai.Final_Expiration_Date)      as Project_End_Date
      , max(ai.Obligation_Expiration_Date) as Obligation_End_Date
      --, ai.Update_Timestamp           as Last_Update_Date
  From  Award_Amount_Info                  ai
      , ( Select aai.Award_Number 
               , Max(aai.Sequence_Number)  as Max_SqnNo
           From  Award_Amount_Info         aai
          Group by aai.Award_Number )      msq  
 Where  ai.Award_Number = msq.Award_Number
   and  ai.Sequence_Number = msq.Max_SqnNo
Group by ai.Award_ID, ai.Award_Number, ai.Sequence_Number
;

Grant select on Award_End_Dates_Info_View to mg_report ;