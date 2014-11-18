select * from unit where substr(unit_number,0,2) = 'MA';

select count(*) from unit;

-- Main Query
--select * from unit where unit_number not in (
--select un2--,role_name, assigned_to

select un2,role_name, assigned_to
from (
      -- Table X
      select unit_number, role_nm, count(*) as assigned_to
               from krim_role_mbr_attr_data_t,  
                    krim_role_mbr_t,
                    krim_role_t,
                    unit
               where krim_role_t.role_id = krim_role_mbr_t.role_id
                 and krim_role_mbr_t.role_mbr_id = krim_role_mbr_attr_data_t.role_mbr_id
                 and role_nm like 'UH%Approver'
                 and kim_attr_defn_id = '10000'
                 and unit.unit_number = attr_val
                 and krim_role_mbr_t.actv_to_dt is null
              group by unit_number, role_nm) x,
      -- Table Z
      (select unit_number un2,role_nm as role_name
       from krim_role_t,
            unit
       where ((substr(unit_number,0,2) in ('HA','HO','KA','KU','LE','WI') 
               and role_nm like 'UH%CC%Approver') 
          or
              (substr(unit_number,0,2) in ('MA','WO','SW','DU')
               and role_nm like 'UH%UH-%Approver') 
          or
              (substr(unit_number,0,2) = 'MU'
               and role_nm like 'UH%UHMC-%Approver')
          or
              (substr(unit_number,0,2) = 'HI'
               and role_nm like 'UH%Hilo%Approver'))
       ) z
where x.role_nm(+) = z.role_name
  and x.unit_number(+) = z.un2
  --and (role_name like 'UHL4%Approver' or role_name like 'UHL5%Approver' or role_name like 'UHL7%Approver')
  --and (role_name like 'UHL2%Approver')
  -- and z.un2 like 'MA1398'
  -- and (role_name like 'UH%Final%Approver')
  --and (substr(z.un2,0,2) = 'MA') 
  --and z.un2 not in ('MA1412','MA1413','MA1585','MA1586','MA1587','MA1588','MA1589','MA1598','MA1599','MA1600','MA1601','MA1602','MA1603','MA1604')
  -- uncomment ; to run without "not in" sub query
  --;
  
  --is null check does not work in oracle....not sure why  "is not null" does work so use not in below to invert from is not null
  --and assigned_to is null
and (un2,role_name) not in (

-- Same Query for Invert of result
select un2,role_name
from (select unit_number, role_nm, count(*) as assigned_to
               from krim_role_mbr_attr_data_t,  
                    krim_role_mbr_t,
                    krim_role_t,
                    unit
               where krim_role_t.role_id = krim_role_mbr_t.role_id
                 and krim_role_mbr_t.role_mbr_id = krim_role_mbr_attr_data_t.role_mbr_id
                 and role_nm like 'UH%Approver'
                 and kim_attr_defn_id = '10000'
                 and unit.unit_number = attr_val
                 and krim_role_mbr_t.actv_to_dt is null
              group by unit_number, role_nm) x,
      (select unit_number un2,role_nm as role_name
       from krim_role_t,
            unit
       where ((substr(unit_number,0,2) in ('HA','HO','KA','KU','LE','WI') 
               and role_nm like 'UH%CC%Approver') 
          or
              (substr(unit_number,0,2) in ('MA','WO','SW','DU')
               and role_nm like 'UH%UH-%Approver') 
          or
              (substr(unit_number,0,2) = 'MU'
               and role_nm like 'UH%UHMC-%Approver')
          or
              (substr(unit_number,0,2) = 'HI'
               and role_nm like 'UH%Hilo%Approver'))
          --and unit_number in ('HA1004','HA1019')
       ) z
where x.role_nm(+) = z.role_name
  and x.unit_number(+) = z.un2
  and role_name like 'UH%Approver'
  and assigned_to is not null
)
  and role_name not like 'UHL2%' -- since optional
  and role_name not like 'UHL3%' -- since optional
  and role_name not like 'UHL6%' -- since optional
  and role_name not like 'UH-%-Central%' -- since we used descends
order by un2,role_name
;

-- Test query to pull only roles for the correct departments.
select unit_number un2,role_nm as role_name
               from krim_role_t,
                    unit
               where ((substr(unit_number,0,2) in ('HA','HO','KA','KU','LE','WI') 
                       and role_nm like 'UH%CC%Approver') 
                  or
                      (substr(unit_number,0,2) in ('MA','WO','SW')
                       and role_nm like 'UH%UH-%Approver') 
                  or
                      (substr(unit_number,0,2) = 'MU'
                       and role_nm like 'UH%UHMC-%Approver')
                  or
                      (substr(unit_number,0,2) = 'HI'
                       and role_nm like 'UH%Hilo%Approver'))
      and unit_number like 'MA%'
;


select role_nm,attr.attr_val
from krim_role_t rt,
     krim_role_mbr_t mt,
     krim_role_mbr_attr_data_t attr
where rt.role_nm like 'UH%Approver'
  and rt.role_id = mt.role_id
  and attr.role_mbr_id = mt.role_mbr_id
  --and kim_attr_defn_id = '10000'
  --and attr.attr_val like 'WO%'
  and (attr_val like 'DUN%' or role_nm like 'UHL2%Approver' or role_nm like 'UH%Final%Approver');

select * from krim_grp_t where grp_nm = 'RCUH HILO' and nmspc_cd = 'KC-WKFLW'; 
select * from krim_role_t where role_nm = 'UHL2-Hilo-RCUH-Initial-Approver';
