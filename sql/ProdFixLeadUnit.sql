-- select to see if user has a table_entry
select *
from krim_entity_emp_info_t 
where entity_id = '10264467';

-- If they have a record confirm the department is wrong and update if necessary
update krim_entity_emp_info_t
set prmry_dept_cd = 'MA1423'
where entity_id = '10264467'; 

-- If the user does not have a row in this table you need to enter two rows.
-- one row in krim_entity_t just set the correct entity_id below
insert into krim_entity_t
(obj_id,     ver_nbr,actv_ind,last_updt_dt,entity_id)
values
(sys_guid() ,1,      'Y',     sysdate,    '10264467');

-- then one row in krim_entity_emp_info_t setting the correct entity_id and prmry_dept_cd
insert into krim_entity_emp_info_t 
(entity_emp_id,                obj_id,    ver_nbr,prmry_ind,actv_ind,last_updt_dt,entity_id, prmry_dept_cd)
values 
 (KRIM_ENTITY_EMP_ID_S.nextval , sys_guid() ,1,      'Y',      'Y',     sysdate,       '10264467','MA1423');

-- This checks for duplicate entries which I found at one time.
select *
from krim_entity_emp_info_t e1,
     krim_entity_emp_info_t e2
where e1.entity_id = e2.entity_id 
  and e1.entity_emp_id != e1.entity_emp_id;
  


  

