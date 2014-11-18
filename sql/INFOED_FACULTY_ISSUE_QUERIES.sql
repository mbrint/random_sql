-- KC_PROPOSAL_PERSONS view select
select * from KC_PROPOSAL_PERSONS where full_name in ('Fay Zenigami','Ellen Spitler');

-- KC_PROPOSAL_PERSONS VIEW SQL
select * from  (
  SELECT Distinct 'INF' || pf.prop_no                    as Proposal_ID
        --, pf.unique_id                                 as Person_ID
        --Change the InfoEd PI Unique_ID to UH ID to follow Award_Persons change 08/23/2012
        , 'INF' || f.Employer_ID                       as Person_ID
        , trim(f.fname) || ' ' || f.lname              as Full_Name
        , pf.inst_code as RRG_INST_CODE
        , pf.unique_id as RRG_UNIQUE_ID
        , f.employer_id
        , decode(pf.first_pd, '1', 'PI', '0', 'COI')   as Contact_Role_CODE
 From  dm_infoed_administrator.proppds          pf
        , dm_infoed_administrator.faculty       f
        , dm_infoed_administrator.pd_grc_bgt    g
 Where pf.prop_no   = g.prop_no
   And f.inst_code  = pf.inst_code
   And pf.unique_id = f.unique_id
   And g.rec_type   = 4
  )
where full_name in ('Fay Zenigami','Ellen Spitler');

select * from faculty where unique_id = 'AABED0B4145B3CCCE044'; 

select * from faculty where employer_id is null;
