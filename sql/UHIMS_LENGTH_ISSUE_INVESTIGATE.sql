select max(length(DBMS_LOB.SUBSTR(to_clob(xml),4000,1))) page1
from uh_message_queue_t;

-- This query takes FOREVER.....
select processed_date, 
      length(substr(xmlserialize(content xml as clob), 1, 4000)) msg_len_part1, 
      length(substr(xmlserialize(content xml as clob), 4001, 4000)) msg_len_part2, 
      substr(xmlserialize(content xml as clob), 1, 4000) part1, 
      substr(xmlserialize(content xml as clob), 4001, 4000) part2
from uh_message_queue_t
order by msg_len_part1 desc, msg_len_part2 desc; 


--where like '%retrofitContactInfo%';

select max(length(xml)) from uh_message_queue_t;

select * from uh_message_queue_t;