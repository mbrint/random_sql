select * from unit where unit_name like 'Research%';

select * from krns_campus_t;

select distinct c.campus_cd id, c.campus_nm name from krns_campus_t c;

select distinct c.campus_cd id, c.campus_nm name from krns_campus_t c 
where campus_cd in (select campus_cd from campus_college_unit_view) order by c.campus_nm;

select distinct ccuv.college_number id, ccuv.college_name name from campus_college_unit_view ccuv
where ccuv.campus_cd = ;