Select  a.award_id, a.award_number, a.Document_Number, a.Sequence_Number
      , a.Update_Timestamp, a.Update_User, t.Crte_DT as Create_Date
      , fp.proposal_id
           from mgprod.award a
               ,mgprod.krew_doc_hdr_t   doc
               ,mgprod.krew_actn_rqst_t t
               ,award_funding_proposals fp
          where a.document_number = doc.doc_hdr_id
            and doc.doc_hdr_stat_cd = 'F'
            and a.document_number = t.doc_hdr_id
            and t.Crte_DT >= '18-APR-2012'
            and t.Crte_DT <  '19-APR-2012'
            and fp.award_id (+)= a.award_id;
group by fp.award_number;
            
Select  a.award_id, a.award_number, a.Document_Number, a.Sequence_Number
      , a.Update_Timestamp, a.Update_User, t.Crte_DT as Create_Date
      , trim(f.lastname) || ', ' ||  trim(f.firstname) as Initiator
      , u.Unit_Name as Department, uu.Unit_Name as College
                
           from mgprod.award a
               ,mgprod.krew_doc_hdr_t   doc
               ,mgprod.UNIT             u
               ,mgprod.UH_UNIT_COLLEGE  uc
               ,mgprod.UNIT             uu
               ,mgprod.krew_actn_rqst_t t
               ,kim_info                f
          where a.document_number = doc.doc_hdr_id
            /*and a.award_number not in 
            (select award_number
               from mgprod.award_custom_data
              where award_number like '%-00001') */
            --and a.award_number like '%-00001'
            and doc.doc_hdr_stat_cd = 'F'
            and a.Lead_Unit_Number = u.Unit_Number
            and u.Unit_Number = uc.Unit_Number
            and uc.College_Number = uu.Unit_Number
            and a.document_number = t.doc_hdr_id
            and t.prncpl_id = f.UHUUID
            and t.Crte_DT >= '18-APR-2012'
            and t.Crte_DT <  '19-APR-2012'
Order by 7 desc, 8, 2, 1, 5
