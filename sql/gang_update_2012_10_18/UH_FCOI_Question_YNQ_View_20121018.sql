Drop View UH_FCOI_Question_YNQ_View ;

Create View UH_FCOI_Question_YNQ_View as     
Select p.Proposal_ID
     , p.Proposal_Number                      --as Inst_Prop_Number
     , pp.Proposal_Number                     as PD_Prop_Number
     , pp.Prop_Person_Number
     , pp.Person_ID
     , pp.Full_Name
     , pp.Prop_person_Role_ID
     , qah.Questionnaire_Answer_Header_ID
     --, qa.Question_Ref_ID_FK
     , qa.Answer                              as FCOI_1_Understand
     , a2.FCOI_2_Answer                       as FCOI_2_Have_any
     , a3.FCOI_3_Answer                       as FCOI_3_PHS_training
     , a4.FCOI_4_Answer                       as FCOI_4_NSF
  From Proposal                               p
     , (Select pad.inst_proposal_ID   
              , max(pad.Dev_Proposal_Number)  as Dev_Proposal_Number
           From Proposal_Admin_Details        pad   
         Group by pad.inst_proposal_ID)       pa
     , eps_Prop_Person                        pp
     , Questionnaire_Answer_Header            qah
     , Questionnaire_Answer                   qa
     , Question                               q
     , Questionnaire_Questions                qq
     , (Select p.Proposal_ID
             , pp.Person_ID
             , qa.Answer                      as FCOI_2_Answer
          From Proposal                                   p
              , (Select pad.inst_proposal_ID   
                      , max(pad.Dev_Proposal_Number)      as Dev_Proposal_Number
                   From Proposal_Admin_Details            pad   
                 Group by pad.inst_proposal_ID)           pa
              , eps_Prop_Person                           pp
              , Questionnaire_Answer_Header               qah
              , Questionnaire_Answer                      qa
              , Question                                  q
              , Questionnaire_Questions                   qq
          Where p.sequence_number = 1
            And p.proposal_ID = pa.inst_proposal_ID    
            And pp.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
            --and pp.Proposal_Number = substr(qah.Module_Item_Key, 1,4)
            --and pp.Prop_Person_Number = substr(qah.Module_Item_Key, 6,7)
            and pp.Proposal_Number = substr(qah.Module_Item_Key, 1, instr(qah.Module_Item_Key, '|', 1)-1)
            and pp.Prop_Person_Number = substr(qah.Module_Item_Key, instr(qah.Module_Item_Key, '|', 1)+1
                                                                   , instr(qah.Module_Item_Key, '|', 1)+2)
            and qah.Questionnaire_Answer_Header_ID = qa.Questionnaire_AH_ID_FK
            and qah.Questionnaire_Ref_ID_FK in (1000, 38665, 49435)
            and qq.questionnaire_Ref_ID_FK = qah.Questionnaire_Ref_ID_FK
            AND qq.Question_Number = qa.Question_Number
            and qa.Question_Ref_ID_FK = 49417
            AND qa.Answer is not NULL
            and q.Question_Ref_ID = qa.Question_Ref_ID_FK) a2 
     , (Select p.Proposal_ID
             , pp.Person_ID
             , qa.Answer               as FCOI_3_Answer
          From Proposal                                    p
              , (Select pad.inst_proposal_ID   
                      , max(pad.Dev_Proposal_Number)       as Dev_Proposal_Number
                   From Proposal_Admin_Details             pad   
                 Group by pad.inst_proposal_ID)            pa
              , eps_Prop_Person                            pp
              , Questionnaire_Answer_Header                qah
              , Questionnaire_Answer                       qa
              , Question                                   q
              , Questionnaire_Questions                    qq
          Where p.sequence_number = 1
            And p.proposal_ID = pa.inst_proposal_ID    
            And pp.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
            --and pp.Proposal_Number = substr(qah.Module_Item_Key, 1,4)
            --and pp.Prop_Person_Number = substr(qah.Module_Item_Key, 6,7)
            and pp.Proposal_Number = substr(qah.Module_Item_Key, 1, instr(qah.Module_Item_Key, '|', 1)-1)
            and pp.Prop_Person_Number = substr(qah.Module_Item_Key, instr(qah.Module_Item_Key, '|', 1)+1
                                                                   , instr(qah.Module_Item_Key, '|', 1)+2)
            and qah.Questionnaire_Answer_Header_ID = qa.Questionnaire_AH_ID_FK
            and qah.Questionnaire_Ref_ID_FK in (1000, 38665, 49435)
            and qq.questionnaire_Ref_ID_FK = qah.Questionnaire_Ref_ID_FK
            AND qq.Question_Number = qa.Question_Number
            and qa.Question_Ref_ID_FK = 49423
            AND qa.Answer is not NULL
            and q.Question_Ref_ID = qa.Question_Ref_ID_FK) a3 
     , (Select p.Proposal_ID
             , pp.Person_ID
             , qa.Answer               as FCOI_4_Answer
          From Proposal                                    p
              , (Select pad.inst_proposal_ID   
                      , max(pad.Dev_Proposal_Number)       as Dev_Proposal_Number
                   From Proposal_Admin_Details             pad   
                 Group by pad.inst_proposal_ID)            pa
              , eps_Prop_Person                            pp
              , Questionnaire_Answer_Header                qah
              , Questionnaire_Answer                       qa
              , Question                                   q
              , Questionnaire_Questions                    qq
          Where p.sequence_number = 1
            And p.proposal_ID = pa.inst_proposal_ID    
            And pp.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
            --and pp.Proposal_Number = substr(qah.Module_Item_Key, 1,4)
            --and pp.Prop_Person_Number = substr(qah.Module_Item_Key, 6,7)
            and pp.Proposal_Number = substr(qah.Module_Item_Key, 1, instr(qah.Module_Item_Key, '|', 1)-1)
            and pp.Prop_Person_Number = substr(qah.Module_Item_Key, instr(qah.Module_Item_Key, '|', 1)+1
                                                                   , instr(qah.Module_Item_Key, '|', 1)+2)
            and qah.Questionnaire_Answer_Header_ID = qa.Questionnaire_AH_ID_FK
            and qah.Questionnaire_Ref_ID_FK in (1000, 38665, 49435)
            and qq.questionnaire_Ref_ID_FK = qah.Questionnaire_Ref_ID_FK
            AND qq.Question_Number = qa.Question_Number
            and qa.Question_Ref_ID_FK = 49429
            AND qa.Answer is not NULL
            and q.Question_Ref_ID = qa.Question_Ref_ID_FK) a4 
 Where p.sequence_number = 1
   And p.proposal_ID = pa.inst_proposal_ID    
   And pp.PROPOSAL_NUMBER = pa.Dev_Proposal_Number
   --and pp.Proposal_Number = substr(qah.Module_Item_Key, 1,4)
   --and pp.Prop_Person_Number = substr(qah.Module_Item_Key, 6,7)
   --Current DP_Proposal_Number is a 4-digit figure, it envetruely become 5-digit number,
   --so that it is better to use the instr function to find the "|" postion to seperate
   --the Proposal_Number and Prop_Person_Number, 10/18/2012
   and pp.Proposal_Number = substr(qah.Module_Item_Key, 1, instr(qah.Module_Item_Key, '|', 1)-1)
   and pp.Prop_Person_Number = substr(qah.Module_Item_Key, instr(qah.Module_Item_Key, '|', 1)+1
                                                          , instr(qah.Module_Item_Key, '|', 1)+2)
   and qah.Questionnaire_Answer_Header_ID = qa.Questionnaire_AH_ID_FK
   and qah.Questionnaire_Ref_ID_FK in (1000, 38665, 49435)
   and qq.questionnaire_Ref_ID_FK = qah.Questionnaire_Ref_ID_FK
   AND qq.Question_Number = qa.Question_Number
   --and qa.Question_Ref_ID_FK in (11082, 49417, 49423, 49429)
   and qa.Question_Ref_ID_FK = 11082
   --Add qa.Answer is not NULL to remove duplicates caused by All Answers are NULL 
   --like Proposal_Number='3168', 10/18/2012.
   AND qa.Answer is not NULL
   and q.Question_Ref_ID = qa.Question_Ref_ID_FK 
   AND p.Proposal_ID = a2.Proposal_ID
   AND pp.Person_ID =  a2.Person_ID
   AND p.Proposal_ID = a3.Proposal_ID
   AND pp.Person_ID =  a3.Person_ID
   AND p.Proposal_ID = a4.Proposal_ID
   AND pp.Person_ID =  a4.Person_ID ;
 
Grant select on UH_FCOI_Question_YNQ_View to mg_report ;    