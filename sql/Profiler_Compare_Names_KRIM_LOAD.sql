select ki.uhuuid
      ,ki.firstname profile_first
      ,en.first_nm uhims_first
      ,case upper(ki.firstname)
          WHEN upper(en.first_nm) then 'Y'
          ELSE 'N' 
        end FIRST_OK
      , ki.lastname profile_last
      , en.last_nm uhims_last
      , case upper(ki.lastname)
          WHEN upper(en.last_nm) then 'Y'
          ELSE 'N' 
        end LAST_OK
      , ki.middlename profile_middle
      , en.middle_nm uhims_middle
      , case 
          when ki.middlename is null then case
                                          when en.middle_nm is null then 'Y'
                                          else 'N'
                                          END
          WHEN upper(ki.middlename) = upper(en.middle_nm) then 'Y' 
          ELSE 'N' 
        end MIDDLE_OK
      , en.suffix_nm uhims_suffix
from kim_info ki,
     krim_entity_nm_t en
where ki.uhuuid = en.entity_id
  and (upper(ki.firstname) != upper(en.first_nm)
       or upper(ki.lastname) != upper(en.last_nm)
       or upper(ki.middlename) != upper(en.middle_nm)
       or en.suffix_nm is not null)
order by FIRST_OK,LAST_OK,MIDDLE_OK;

select ki.uhuuid
      ,ki.firstname profile_first
      ,en.first_nm uhims_first
      ,case upper(ki.firstname)
          WHEN upper(en.first_nm) then 'Y'
          ELSE 'N' 
        end FIRST_OK
      , ki.lastname profile_last
      , en.last_nm uhims_last
      , case upper(ki.lastname)
          WHEN upper(en.last_nm) then 'Y'
          ELSE 'N' 
        end LAST_OK
      , ki.middlename profile_middle
      , en.middle_nm uhims_middle
      , case 
          when ki.middlename is null then case
                                          when en.middle_nm is null then 'Y'
                                          else 'N'
                                          END
          WHEN upper(ki.middlename) = upper(en.middle_nm) then 'Y' 
          ELSE 'N' 
        end MIDDLE_OK
      , en.suffix_nm uhims_suffix
from kim_info ki,
     krim_entity_nm_t en
where ki.uhuuid = en.entity_id
  and (upper(ki.firstname) != upper(en.first_nm)
       or upper(ki.lastname) != upper(en.last_nm)
       or upper(ki.middlename) != upper(en.middle_nm)
       or en.suffix_nm is not null)
       and en.entity_id in ( select person_id from proposal_persons
                             union
                             select pi_id from proposal_log
                             union
                             select person_id from award_persons
                             union
                             select person_id from eps_prop_person
                             union
                             select unique person_id from budget_persons
                             union
                             select initr_prncpl_id from krew_doc_hdr_t
                             union
                             select RTE_PRNCPL_ID from krew_doc_hdr_t
                             union
                             select prncpl_id from KREW_ACTN_RQST_T
                             union
                             select prncpl_id from KREW_ACTN_ITM_T
                             union
                             select prncpl_id from krew_actn_tkn_t
                          )
order by FIRST_OK,LAST_OK,MIDDLE_OK;

select * from krim_entity_nm_t where last_nm = 'Gouldner';