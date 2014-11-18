create view uh_unit_routing_order as
select unit_number, 
       case 
           when UNIT_PATH like '%MA1503%' then 'JABSOM'
           when UNIT_PATH like '%MA1548%' then 'JABSOM'
           when UNIT_PATH like '%HI1618%' then 'HILO'
           when UNIT_PATH like '%MU1293%' then 'UHMC'
           when UNIT_PATH like '%SW1003%' then 'CC'
           when UNIT_PATH like '%WO1685%' then 'WO'
           else 'UHMANOA'
      end  BRANCH,
      case 
           when UNIT_PATH like '%MA1503%' then '1:GDO,2:Chair,3:Dean,4:FA'  -- JABSOM
           when UNIT_PATH like '%MA1548%' then '1:GDO,2:Chair,3:Dean,4:FA'      -- JABSOM
           when UNIT_PATH like '%HI1618%' then '1:RAPD,2:FA,3:Chair,4:Dean,5:Chancellor'        -- HILO
           when UNIT_PATH like '%MU1293%' then '1:UHMC Personnel Approver,2:FA,3:Chair,4:Vice Chancellor,5:Chancellor'        -- UHMC
           when UNIT_PATH like '%SW1003%' then '1:FA,2:Dean,3:Chancellor'          -- CC
           when UNIT_PATH like '%WO1685%' then '1:FA,2:Chair,3:Vice Chancellor|Chancellor'          -- WO
           else '1:FA,2:Chair,3:Dean'             -- UHMANOA
      end  ROUTING_ORDER
from
(
select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path
from unit 
start with unit_number = '000001'
connect by prior unit_number = parent_unit_number
);
