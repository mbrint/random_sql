declare
    v_next_number NUMBER;
    v_command VARCHAR(500);
begin
    select max(to_number(organization_id)) + 1 into v_next_number from organization;
    select 'create sequence SEQ_UH_ORG_ID START WITH ' || v_next_number || ' INCREMENT BY 1 NOCACHE NOCYCLE' into v_command from dual;
    execute immediate (v_command);
    
    select max(to_number(rolodex_id)) + 1 into v_next_number from rolodex;
    select 'create sequence SEQ_UH_ROLODEX_ID START WITH ' || v_next_number || ' INCREMENT BY 1 NOCACHE NOCYCLE' into v_command from dual;
    execute immediate (v_command);
end;

--drop sequence SEQ_UH_ORG_ID;


