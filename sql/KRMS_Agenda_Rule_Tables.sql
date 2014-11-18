-- ??
select * from KRMS_FUNC_T;
select * from KRMS_FUNC_PARM_T;

select * from KRMS_TERM_T where desc_txt like '%Oppor%';

-- Lookup the Term Name that you see in the drop down in Rule Edit in KC (found in Agenda)
select * from krms_TERM_SPEC_T where term_spec_id like 'KC1008';

select * from krms_term_rslvr_t; where nm like '%progr%';

-- Use the TERM_SPEC_ID from last query to find the term resolver
select * from krms_term_rslvr_t where nm like '%GG%';

-- use the typ_id to find the code which will resolve this term  
-- NOTE : SRVC_NM column tells you the service name bean which leads to the code to be called.  Grep for that service name
-- This example ./src/main/resources/org/kuali/kra/CoreSpringBeans.xml:    <bean id="javaFunctionTermResolverTypeService" class="org.kuali.kra.krms.service.impl.JavaFunctionTermResolverTypeServiceImpl"
select * from krms_typ_t where typ_id = 'KC1001';


-- Use the Output term speck id to find the term resolver parm name and grep for the spring bean with this name
select * from krms_term_rslvr_parm_spec_t where term_rslvr_id =  'KC2000';

