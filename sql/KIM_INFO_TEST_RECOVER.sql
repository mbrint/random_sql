grant select on KIM_INFO_TEST to MGDEV311;

create table KIM_INFO_TEST as (select * from MGPROD.KIM_INFO_TEST);

grant select on KIM_INFO_TEST to MGPROD;

create table KIM_INFO_TEST as (select * from MGDEV311.KIM_INFO_TEST);