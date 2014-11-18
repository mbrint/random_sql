select count(*) from attachment_file;

select 
   segment_name           table_name,    
   sum(bytes)/(1024*1024) table_size_meg 
from   
   user_extents 
where segment_type='TABLE' 
  --and segment_name = 'attachment_file' 
  group by segment_name
  order by table_size_meg desc;
 