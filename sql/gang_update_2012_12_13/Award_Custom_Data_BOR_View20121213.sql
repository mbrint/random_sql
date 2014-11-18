
Drop View  AWARD_CUSTOM_DATA_BOR_VIEW ;
  
Create View AWARD_CUSTOM_DATA_BOR_VIEW as
  
Select  ac.Award_ID        as Award_ID
      , ac.Award_Number    as Award_Number
      --, ms.Max_SqnNo       as Sqnc_Num
      , ms.BOR_Flg         as Excl_BOR_Flag
  From  Award_Custom_Data  ac
      , ( Select  acd.award_Number   as Award_Num
        , Max(acd.Sequence_Number)   as Max_SqnNo
        , Max(acd.Value)             as BOR_Flg
          From  award_custom_data       acd
          Where acd.Custom_Attribute_ID = 103
          Group by acd.award_Number  )ms
  Where  ac.Custom_Attribute_ID = 103
    And  ac.Award_Number = ms.Award_Num ;

Grant select on AWARD_CUSTOM_DATA_BOR_VIEW to mg_report ;