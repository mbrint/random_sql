-- Test case from mgprod(odb80 copy), has three sequences
select * from award_custom_data where Custom_Attribute_ID = 103 and award_Number = '001030-00001';

-- change the test case to make the second sequence have a y.
-- this causes original query to return "y" which is incorrect.
update  award_custom_data
set value = 'y'
where Custom_Attribute_ID = 103
and award_Number = '001030-00001'
and Sequence_Number = 2;

-- After the update run the same query to see the actual data
select award_id,award_number,sequence_number,value
from award_custom_data 
where Custom_Attribute_ID = 103 
  and award_Number = '001030-00001';

--  Note that in the real data query above sequence 1=n 2=y 3=n 
--  also note each sequence has an award_id which is unique

-- The Production Query in cognos returns
-- the wrong answer.   For my test case it
-- returns three reward id's for the same sequence number
-- so in the prodcution query award_id and value don't match the correct 
-- pair of award_number and sequence
Select  ac.Award_ID        as Award_ID
      , ac.Award_Number    as Award_Number
      , ms.Max_SqnNo       as Sqnc_Num
      , ms.BOR_Flg         as Excl_BOR_Flag
  From  Award_Custom_Data ac
      , ( Select  acd.award_Number   as Award_Num
        , Max(acd.Sequence_Number)   as Max_SqnNo 
        , Max(acd.Value)             as BOR_Flg
          From  award_custom_data   acd
          Where acd.Custom_Attribute_ID = 103
          Group by acd.award_Number  )ms
  Where  ac.Custom_Attribute_ID = 103
    And  ac.Award_Number = ms.Award_Num 
    and  ac.award_Number = '001030-00001'
;

-- Right Answer the award number with just one row returned for 
-- the higest in the sequence.   This is what reporting should be 
-- using, the last entered value for a given award_number.
Select  ac.Award_ID        as Award_ID
      , ac.Award_Number    as Award_Number
      , ms.Max_SqnNo       as Sqnc_Num
      , ac.value         as Excl_BOR_Flag    -- Changed from ms.BOR_Flg
From  Award_Custom_Data ac
     ,( Select   acd.award_Number           as Award_Num
               , Max(acd.Sequence_Number)   as Max_SqnNo 
               -- Removed gets wrong value , Max(acd.Value)             as BOR_Flg
        From  award_custom_data   acd
       Where acd.Custom_Attribute_ID = 103
       Group by acd.award_Number  )    ms
Where  ac.Custom_Attribute_ID = 103
  And  ac.Award_Number = ms.Award_Num 
  and  ac.sequence_number = ms.Max_SqnNo -- Added so the correct sequence row is selected
  and ac.award_number != '000000-00000'          -- Added because this data is garbage and will be removed soon just helps my testing shouldn't be in final version
--  and  ac.award_Number = '001030-00001'          -- Testing restriction to look at one multi row award
order by award_number -- used when testing
;

-- WARNING : This version returns n for '000000-00000' now so don't put 
--in production until we fix all the data
Select  ac.Award_ID        as Award_ID
      , ac.Award_Number    as Award_Number
      , ms.Max_SqnNo       as Sqnc_Num
      , ac.value         as Excl_BOR_Flag    -- Changed from ms.BOR_Flg
From  Award_Custom_Data ac
     ,( Select   acd.award_Number           as Award_Num
               , Max(acd.Sequence_Number)   as Max_SqnNo 
               -- Removed gets wrong value , Max(acd.Value)             as BOR_Flg
        From  award_custom_data   acd
       Where acd.Custom_Attribute_ID = 103
       Group by acd.award_Number  )    ms
Where  ac.Custom_Attribute_ID = 103
  And  ac.Award_Number = ms.Award_Num 
  and  ac.sequence_number = ms.Max_SqnNo -- Added so the correct sequence row is selected
  and ac.award_number = '000000-00000'          -- Added because this data is garbage and will be removed soon just helps my testing shouldn't be in final version
--  and  ac.award_Number = '001030-00001'          -- Testing restriction to look at one multi row award
--  order by award_number -- used when testing
;

-- Check against Gang's view to see what will change in past data
select old_data.award_id,old_data.award_number,old_data.Excl_BOR_Flag,new_data.Excl_BOR_Flag
from ( select * from 
         award_custom_data_BOR_view) old_data
         , (
Select  ac.Award_ID        as Award_ID
      , ac.Award_Number    as Award_Number
      , ms.Max_SqnNo       as Sqnc_Num
      , ac.value         as Excl_BOR_Flag    -- Changed from ms.BOR_Flg
From  Award_Custom_Data ac
     ,( Select   acd.award_Number           as Award_Num
               , Max(acd.Sequence_Number)   as Max_SqnNo 
               -- Removed gets wrong value , Max(acd.Value)             as BOR_Flg
        From  award_custom_data   acd
       Where acd.Custom_Attribute_ID = 103
       Group by acd.award_Number  )    ms
Where  ac.Custom_Attribute_ID = 103
  And  ac.Award_Number = ms.Award_Num 
  and  ac.sequence_number = ms.Max_SqnNo -- Added so the correct sequence row is selected
  and ac.award_number != '000000-00000'          -- Added because this data is garbage and will be removed soon just helps my testing shouldn't be in final version
--  and  ac.award_Number = '001030-00001'          -- Testing restriction to look at one multi row award
--order by award_number -- used when testing
) new_data
where old_data.award_id = new_data.award_id
  --and old_data.award_number = new_data.award_number
  and old_data.EXCL_BOR_FLAG != new_data.EXCL_BOR_FLAG
;


