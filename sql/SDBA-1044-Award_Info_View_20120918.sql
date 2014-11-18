drop view Award_Info_View;

Create View Award_Info_View  as
-- Create this view to get the latest award information for Shell and Children Award.
Select  a.Award_ID
      , a.Award_Number
      , a.Sequence_Number
      , mv.Max_UnitNo          as Lead_Unit_Number
      , mv.Max_Sqn_CD          as Sponsor_Code     
      , mv.Max_Spon_Awd_No     as Sponsor_Award_Number
      , mv.Max_Act_Tp_Code     as Activity_Type_Code
      --Add Award_Type_Code requested by Mike on 09/18/2012, which is Instrum in InfoED.
      , mv.Max_Awd_Tp_Code     as Award_Type_Code
      , mv.Max_Notice_Date     as Notice_Date
      , mv.Max_Updt_Tstamp     as Update_Timestamp
      , mv.Max_Awd_Efft_Date   as Award_Effective_Date
      --, mv.Max_Status_Code     as Status_Code
      --Remove the Status_Code from the view because it causes duplicates on InfoEd side.
      , mv.Max_Title           as Title
  From  Award  a
      , (Select  am.Award_Number
               , am.Sponsor_Code           as Max_Sqn_CD
               , am.Lead_Unit_Number       as Max_UnitNo
               , am.Activity_Type_Code     as Max_Act_Tp_Code
               , am.Award_Type_Code        as Max_Awd_Tp_Code
               , am.Sponsor_Code           as Max_Spon_Code
               , am.Sponsor_Award_Number   as Max_Spon_Awd_No
               , am.Notice_Date            as Max_Notice_Date
               , am.Update_Timestamp       as Max_Updt_Tstamp
               , am.Award_Effective_Date   as Max_Awd_Efft_Date
               --, am.Status_Code            as Max_Status_Code
               , am.Title                  as Max_Title           
           From Award am
               , (Select  aa.Award_Number, max(aa.Sequence_Number) as max_SqnNo
                    From  Award  aa
                  Group by aa.Award_Number ) ms
          Where am.Award_Number = ms.Award_Number
            and am.Sequence_Number = ms.max_SqnNo ) mv
 Where  a.Award_Number = mv.Award_Number ;
 
 grant select on Award_Info_View to mg_report;