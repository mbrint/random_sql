select * from institute_rates 
where start_date > '31-DEC 2010' and rate_class_code = 5;

select * from institute_rates 
where rate_class_code = 1;

select * from institute_rates where unit_number in ('MA1466','000001') order by fiscal_year,rate_class_code,rate_type_code,activity_type_code,on_off_campus_flag;

update institute_rates set active_flag = 'Y' where unit_number = 'MA1466';

select * from institute_rates where fiscal_year = '2014' and rate_class_code = 1;

select count(*) from institute_rates where fiscal_year in ('2014','2015','2016','2017') and rate_class_code = 1;

select count(*) from institute_rates where update_timestamp > '13-Jun-13';

delete from institute_rates where fiscal_year in ('2013','2014','2015','2016','2017') and rate_class_code = 1;


