select * from KRMS_FUNC_T where nm like 'UHsponsorGroupRule';

select * from KRMS_FUNC_PARM_T where  func_id in (select func_id from KRMS_FUNC_T where nm like '%sponsor%Rule') ;

select * from KRMS_TERM_SPEC_T where nm in (select func_id from KRMS_FUNC_T where nm like 'UHsponsor%Rule') ;

select * from KRMS_CNTXT_VLD_TERM_SPEC_T where term_spec_id in (select TERM_SPEC_ID from KRMS_TERM_SPEC_T where NMSPC_CD='KC-PD' and 
					NM in (select FUNC_ID from KRMS_FUNC_T where  NM like 'UHsponsorGroupRule' and NMSPC_CD='KC-PD'));

s from KRMS_TERM_SPEC_CTGRY_T where term_spec_id in (select TERM_SPEC_ID from KRMS_TERM_SPEC_T where NMSPC_CD='KC-PD' and 
					NM in (select FUNC_ID from KRMS_FUNC_T where  NM like 'UHsponsorGroupRule' and NMSPC_CD='KC-PD'));

select * from KRMS_TERM_RSLVR_T where output_term_spec_id in (select TERM_SPEC_ID from KRMS_TERM_SPEC_T where NMSPC_CD='KC-PD' and 
					NM in (select FUNC_ID from KRMS_FUNC_T where  NM like '%sponsor%Rule%' and NMSPC_CD='KC-PD'));

select * from krms_term_rslvr_parm_spec_t where term_rslvr_id in (select term_rslvr_id from KRMS_TERM_RSLVR_T where output_term_spec_id in (select TERM_SPEC_ID from KRMS_TERM_SPEC_T where NMSPC_CD='KC-PD' and 
					NM in (select FUNC_ID from KRMS_FUNC_T where  NM like '%sponsor%Rule' and NMSPC_CD='KC-PD')));
          
update krms_term_rslvr_parm_spec_t set nm = 'Sponsor Group Name' where  term_rslvr_parm_spec_id = 'KC2002';

update krms_term_parm_t set nm = 'Sponsor Group Name' where nm = 'Sponsor Code' and val = 'NIH';

select * from krms_term_parm_t where nm = 'Sponsor Group Name';
select * from krms_term_parm_t where nm = 'Sponsor Code';

