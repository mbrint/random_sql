update sponsor_hierarchy
set LEVEL1_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Mainland';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Mainland' and
level2 = 'Mainland- Non-Profit Organizations';

update sponsor_hierarchy
set LEVEL2_SORTID = '2'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Mainland' and
level2 = 'Mainland- Business and Other';

update sponsor_hierarchy
set LEVEL2_SORTID = '3'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Mainland' and
level2 = 'Mainland- Health Organizations';

update sponsor_hierarchy
set LEVEL1_SORTID = '2'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Colleges and Universities';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Colleges and Universities' and
level2 = 'US Colleges and Universities';

update sponsor_hierarchy
set LEVEL1_SORTID = '3'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii' and
level2 = 'Hawaii- Health Organizations';

update sponsor_hierarchy
set LEVEL2_SORTID = '2'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii' and
level2 = 'Hawaii- Business and Other';

update sponsor_hierarchy
set LEVEL2_SORTID = '3'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii' and
level2 = 'Hawaii- Non-Profit Organizations';

update sponsor_hierarchy
set LEVEL2_SORTID = '4'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii' and
level2 = 'Hawaii- Dept of Education';

update sponsor_hierarchy
set LEVEL2_SORTID = '5'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Hawaii' and
level2 = 'Hawaii- Government Agencies';

update sponsor_hierarchy
set LEVEL1_SORTID = '4'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Foreign';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Foreign' and
level2 = 'Foreign';

update sponsor_hierarchy
set LEVEL1_SORTID = '5'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DOC-Dept of Commerce';

update sponsor_hierarchy
set LEVEL2_SORTID = '2'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'Federal Agencies';

update sponsor_hierarchy
set LEVEL2_SORTID = '3'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DOD-Department of Defense';

update sponsor_hierarchy
set LEVEL2_SORTID = '4'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DOE-Dept of Energy';

update sponsor_hierarchy
set LEVEL2_SORTID = '5'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'ED-Dept of Education';

update sponsor_hierarchy
set LEVEL2_SORTID = '6'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DA-Dept of Agriculture';

update sponsor_hierarchy
set LEVEL2_SORTID = '7'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'Dept of State';

update sponsor_hierarchy
set LEVEL2_SORTID = '8'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DOT-Dept of Transportation';

update sponsor_hierarchy
set LEVEL2_SORTID = '9'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'National Science Foundation';

update sponsor_hierarchy
set LEVEL2_SORTID = '10'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'National Aeronautics and Space Administration';

update sponsor_hierarchy
set LEVEL2_SORTID = '11'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DOI-Dept of Interior';

update sponsor_hierarchy
set LEVEL2_SORTID = '12'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Federal' and
level2 = 'DHHS-Dept of Health and Human Services';


update sponsor_hierarchy
set LEVEL1_SORTID = '6'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Miscellaneous';

update sponsor_hierarchy
set LEVEL2_SORTID = '1'
where HIERARCHY_NAME = 'REPORTING' and
level1 = 'Miscellaneous' and
level2 = 'Miscellaneous';

