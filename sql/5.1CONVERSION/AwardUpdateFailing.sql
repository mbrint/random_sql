select unique award_sequence_status from award;

update award aw
set award_sequence_status = (select v.version_status from version_history v
  where aw.award_number = v.seq_owner_version_name_value
        and aw.sequence_number = v.seq_owner_seq_number
  and v.seq_owner_class_name = 'org.kuali.kra.award.home.Award'
  and v.version_history_id in (select max(version_history_id) from version_history group by seq_owner_version_name_value, seq_owner_seq_number))
  where award_number || ':' || sequence_number in (  
        select SEQ_OWNER_VERSION_NAME_VALUE || ':' || SEQ_OWNER_SEQ_NUMBER
        from version_history v
            ,award a
        where a.award_number = v.SEQ_OWNER_VERSION_NAME_VALUE
          and a.sequence_number = v.SEQ_OWNER_SEQ_NUMBER);
  
select award_number,sequence_number from award where award_number || ':' || sequence_number in (  
select SEQ_OWNER_VERSION_NAME_VALUE || ':' || SEQ_OWNER_SEQ_NUMBER
from version_history v
    ,award a
where a.award_number = v.SEQ_OWNER_VERSION_NAME_VALUE
  and a.sequence_number = v.SEQ_OWNER_SEQ_NUMBER);
  
update award aw
set award_sequence_status = (select v.version_status from version_history v
                             where aw.award_number = v.seq_owner_version_name_value
                               and aw.sequence_number = v.seq_owner_seq_number
                               and v.seq_owner_class_name = 'org.kuali.kra.award.home.Award'
                               and v.version_history_id in (select max(version_history_id) 
                                                            from version_history 
                                                            group by seq_owner_version_name_value, seq_owner_seq_number))
  where exists (select v.version_status from version_history v
                where aw.award_number = v.seq_owner_version_name_value
                  and aw.sequence_number = v.seq_owner_seq_number
                  and v.seq_owner_class_name = 'org.kuali.kra.award.home.Award'
                  and v.version_history_id in (select max(version_history_id) 
                                               from version_history 
                                               group by seq_owner_version_name_value, seq_owner_seq_number));
                                               
                                               update award aw
set award_sequence_status = (select v.version_status from version_history v
  where aw.award_number = v.seq_owner_version_name_value
        and aw.sequence_number = v.seq_owner_seq_number
  and v.seq_owner_class_name = 'org.kuali.kra.award.home.Award'
  and v.version_history_id in (select max(version_history_id) from version_history group by seq_owner_version_name_value, seq_owner_seq_number))
where exists (select v.version_status from version_history v
                where aw.award_number = v.seq_owner_version_name_value
                  and aw.sequence_number = v.seq_owner_seq_number
                  and v.seq_owner_class_name = 'org.kuali.kra.award.home.Award'
                  and v.version_history_id in (select max(version_history_id)
                                               from version_history
                                               group by seq_owner_version_name_value, seq_owner_seq_number))

  