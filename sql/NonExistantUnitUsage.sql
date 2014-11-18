select prop.proposal_id,prop.proposal_number,prop.lead_unit_number,prop.document_number  
from proposal prop 
where lead_unit_number in ('MA1537','MA1545','MA1546','MA1547','MA1544');

select prop.proposal_number,prop.owned_by_unit,prop.document_number 
from eps_proposal prop 
where owned_by_unit in ('MA1537','MA1545','MA1546','MA1547','MA1544');

select a.award_id,a.award_number,a.document_number,a.lead_unit_number from award a where lead_unit_number in ('MA1537','MA1545','MA1546','MA1547','MA1544');

select prop.proposal_id,prop.proposal_number,prop.lead_unit_number,u.unit_number person_unit,prop.document_number 
from proposal_person_units u,
     proposal_persons p,
     proposal prop
where p.proposal_id = prop.proposal_id
  and p.proposal_person_id = u.proposal_person_id
  and unit_number in ('MA1537','MA1545','MA1546','MA1547','MA1544')
  and prop.lead_unit_number != u.unit_number;
 ;
 
select prop.proposal_number,prop.owned_by_unit,u.unit_number person_unit,prop.document_number 
from eps_prop_person_units u,
     eps_prop_person p,
     eps_proposal prop
where p.proposal_number = prop.proposal_number
  and p.proposal_number = u.proposal_number
  and unit_number in ('MA1537','MA1545','MA1546','MA1547','MA1544')
  and prop.owned_by_unit != u.unit_number;
  
select a.award_id,a.award_number,a.document_number,a.lead_unit_number , u.unit_number person_unit
from award a,
     award_persons p,
     award_person_units u
where a.award_id = p.award_id
  and p.person_id = u.award_person_id
  and u.unit_number in ('MA1537','MA1545','MA1546','MA1547','MA1544')
  and a.lead_unit_number != u.unit_number;

  
select entity_id,e.entity_id,firstname,lastname,uhusername
from krim_entity_emp_info_t e
    ,kim_info k
where e.prmry_dept_cd in ('MA1537','MA1545','MA1546','MA1547','MA1544')
  and k.uhuuid = e.entity_id
;

select r.role_nm,r.role_id,rm.mbr_id,ki.uhusername,ki.firstname,ki.lastname,ki.middlename,at.nm,ra.attr_val,rm.actv_to_dt,
       rm.role_mbr_id
--select unique(      rm.mbr_id  ), r.role_nm
from mgprod.krim_role_t r,
     mgprod.krim_role_mbr_t rm,
     mgprod.kim_info ki,
     mgprod.krim_role_mbr_attr_data_t ra,
     mgprod.krim_attr_defn_t at
where r.role_id = rm.role_id
  and rm.mbr_id = ki.uhuuid (+)
  and rm.role_mbr_id = ra.role_mbr_id
  and ra.kim_attr_defn_id = at.kim_attr_defn_id
  --and firstname is null and lastname is null -- search for missing from kim_info (profiler)
  --and rm.actv_to_dt is not null
  --and uhusername = 'rubys'   -- search for user by userid
  --and rm.role_id = '10010'   
  --and uhuuid = '11483987'    -- search for user by uhid
  --and r.role_nm like 'UHL7%' -- search for level 7 example
  and ra.attr_val in ('MA1537','MA1545','MA1546','MA1547','MA1544') -- search for unit
  order by 1
  ;
