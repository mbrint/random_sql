select n.ASSOCIATED_DOCUMENT_ID, to_char(last_modified_date,'YY:MM:DD:HH24:MI:SS'),to_char(a.update_timestamp,'YY:MM:DD:HH24:MI:SS')
from negotiation_activity a,
     negotiation n
where n.negotiation_id = a.negotiation_id
order by n.ASSOCIATED_DOCUMENT_ID;