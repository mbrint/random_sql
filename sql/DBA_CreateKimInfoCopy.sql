select count(*) from kim_info_copy;

create table kim_info_copy as select * from kim_info;

drop table kim_info_copy;