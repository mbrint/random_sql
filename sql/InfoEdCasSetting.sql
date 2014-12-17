select * from localvariables where setting like '%hawaii%' ;

update localvariables set setting = 'https://authn.hawaii.edu/cas/' where attribute = 'LOCALSECURITY';

update localvariables set setting = 'https://login.its.hawaii.edu/cas/' where attribute = 'LOCALSECURITY';

select * from localvariables where attribute like '%SS%';