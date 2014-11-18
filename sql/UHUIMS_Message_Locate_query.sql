--Fast Method
select y.* 
from 
(
select extractValue(x.xml, '/*/messageData/uhUuid') uhuuid, x.*
from uh_message_queue_t x
) y
where y.uhuuid = '15736882';

-- Slow method
select * 
from uh_message_queue_t x
where x.xml.getClobVal() like '%15736882%';