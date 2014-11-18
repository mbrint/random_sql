select * from institute_rates where rate = 41.49;
select * from institute_rates where rate = 44.21;

update institute_rates 
   set rate = 44.21,
       update_timestamp = current_date
where rate = 41.49;