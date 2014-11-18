
-- Note if you need to swap with a new document you can double click the data in SQL-Developer and upload new attachment.
-- Then if others need same modification the update below can be used to alter the rest.

--In this case we wanted all the attachments to be replaced with the third attachment which was the executive summary in this case. 
update narrative_attachment
set narrative_data = (select narrative_data  from narrative_attachment where proposal_number = 2274 and module_number = 3)
where proposal_number = 2274 
and module_number not in (3);