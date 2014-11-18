Select 'mgneg'               as source
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
      and a.award_sequence_status = 'PENDING'
      -- exclude "inactive" awards which is status code 2
      and a.status_code <> 2
      -- exclude notification activities configured for internal use only
      and activity_type_id  in ( select  activity_type_id
                                 from mgprod.negotiation_activity_type n,
                                      mgprod.krcr_parm_t p
                                 where p.parm_nm = 'uh_restricted_negotiation_activity_types'
                                   and p.val like '%[' || n.description || ']%'
                                )
and award_number not in (
select award_number from (
                                
Select 'mgneg'               as source
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
                                )));
                                
Select 'mgneg'               as source
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
      and a.award_sequence_status = 'PENDING'
      -- exclude "inactive" awards which is status code 2
      and a.status_code <> 2
      -- exclude notification activities configured for internal use only
      and activity_type_id  in ( select  activity_type_id
                                 from mgprod.negotiation_activity_type n,
                                      mgprod.krcr_parm_t p
                                 where p.parm_nm = 'uh_restricted_negotiation_activity_types'
                                   and p.val like '%[' || n.description || ']%'
                                )
and award_number not in ( select award_number from rpt_award_contract_status where source = 'mgneg');