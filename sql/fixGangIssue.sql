Select 'mgneg'                as source
         , a.award_id                   as awawrd_id
         , n.associated_document_id     as award_number
         , ac.description               as contract_status   
         , na.create_date               as csl_created_date 
         , na.start_date                as csl_posted_date
         , na.description               as status_log  
    from mgprod.negotiation                  n
       , mgprod.negotiation_activity         na
       , mgprod.negotiation_activity_type   ac
       , mgprod.award                        a
    Where n.negotiation_id = na.negotiation_id 
      and na.activity_type_id = ac.negotiation_activity_type_id
      and n.associated_document_id = a.award_number
      --include award(4) negotiations only
      and n.negotiation_assc_type_id = 4    
      -- get award_id from active version of award  
      and a.award_sequence_status = 'ACTIVE'
      -- exclude "inactive" awards which is status code 2
      and a.status_code <> 2
      -- exclude notification activities configured for internal use only
      and activity_type_id  in ( select  activity_type_id
                                 from mgprod.negotiation_activity_type n,
                                      mgprod.krcr_parm_t p
                                 where p.parm_nm = 'uh_restricted_negotiation_activity_types'
                                   and p.val like '%[' || n.description || ']%'
                                )
      ;
      
select award_number from mgprod.award where AWARD_SEQUENCE_STATUS = 'CANCELED';

select * from rpt_award_contract_status where award_number = '001232-00002';

select * from mgprod.award where award_number = '001232-00002';