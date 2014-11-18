-- Term Spec is needed
select * from KRMS_TERM_SPEC_T where DESC_TXT in  ('Sponsor Rule','Has Prime Sponsor');

select * from KRMS_TERM_SPEC_T where term_spec_id = 'KC2002';

select * from KRMS_TERM_T where term_spec_id in (select term_spec_id from KRMS_TERM_SPEC_T where  DESC_TXT in  ('Sponsor Rule','Has Prime Sponsor')); 

select * from KRMS_FUNC_T where nm in ('sponsor','hasPrimeSponsor') or desc_txt = 'Sponsor Group Rule';
select * from KRMS_FUNC_T where desc_txt = 'Sponsor Group Rule';

select * from KRMS_FUNC_PARM_T where func_id in (select func_id from KRMS_FUNC_T where nm in ('sponsorGroupRule','sponsor','hasPrimeSponsor')); 

select * from KRMS_CNTXT_VLD_TERM_SPEC_T where term_spec_id in (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT in  ('Sponsor Rule','Has Prime Sponsor'));

select * from KRMS_TERM_SPEC_CTGRY_T where term_spec_id in (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT in  ('Sponsor Rule','Has Prime Sponsor'));

select * from KRMS_TERM_RSLVR_T where OUTPUT_TERM_SPEC_ID in (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT in  ('Sponsor Group Rule','Sponsor Rule','Has Prime Sponsor'));

select * from krms_term_rslvr_parm_spec_t where term_rslvr_id in (select term_rslvr_id from KRMS_TERM_RSLVR_T where OUTPUT_TERM_SPEC_ID in
                                     (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT in  ('Sponsor Group Rule','Has Prime Sponsor')));

select * from krms_term_t where term_spec_id = 'KC1020';

SELECT * FROM krms_typ_t where nm = 'UH ProposalDevelopment Java Function Term Service';

select * from sponsor where sponsor_code = '107930';
