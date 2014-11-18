select * from uh_message_queue_t where process_status = 'E';

select count(*) from uh_message_queue_t where processed_date > sysdate-1;

select * from uh_message_queue_t where process_status = 'E'
and processed_date > sysdate-1;
