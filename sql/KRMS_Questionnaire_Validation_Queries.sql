select * from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD';
select * from KRMS_TERM_SPEC_T where term_spec_id = 'KC1016';


select * from KRMS_TERM_T where term_spec_id = 'KC1016';

select * from KRMS_FUNC_T where ;

select * from KRMS_FUNC_PARM_T where ; 

select * from KRMS_CNTXT_VLD_TERM_SPEC_T where term_spec_id in (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD');

select * from KRMS_TERM_SPEC_CTGRY_T where term_spec_id in (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD');

select * from KRMS_TERM_RSLVR_T where OUTPUT_TERM_SPEC_ID in
                                     (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD');

select * from krms_term_rslvr_parm_spec_t where term_rslvr_id in (select term_rslvr_id from KRMS_TERM_RSLVR_T where OUTPUT_TERM_SPEC_ID in
                                     (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD'));


SELECT * FROM krms_typ_t where typ_id = (select typ_id from KRMS_TERM_RSLVR_T where OUTPUT_TERM_SPEC_ID in
                                     (select term_spec_id from KRMS_TERM_SPEC_T where DESC_TXT like 'The answer%' and nmspc_cd = 'KC-PD'));
                                     
select * from krms_rule_t where nm like 'FCOI%';
select * from krms_rule_attr_t where rule_id = (select rule_id from krms_rule_t where nm like 'FCOI%');

select * from krms_rule_t where nm like 'Bunny%';
select * from krms_rule_attr_t where rule_id = (select rule_id from krms_rule_t where nm like 'Bunny%');

select * from krms_term_t where term_spec_id = 'KC1016';
select * from krms_term_t where desc_txt = 'FCOI Attachment Term';
select * from krms_term_parm_t where term_id = (select term_id from krms_term_t where desc_txt = 'FCOI Attachment Term');
                                    