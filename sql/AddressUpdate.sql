-- select before and after
select * from organization where address like '% (LAUHALA) %';

-- select before
select * from rolodex
where address_line_2 like '%(LAUHALA)%';

--select after
select * from rolodex
where address_line_2 like 'Lauhala Building %';

--select after second
select * from rolodex
where address_line_2 like 'Suite %';

update organization
   set address=replace(address,'677 Ala Moana Blvd, CANCER CENTER OF HAWAII (LAUHALA)','1236 Lauhala Street, CANCER CENTER OF HAWAII (LAUHALA)')
where address like '677 Ala Moana Blvd, CANCER CENTER OF HAWAII (LAUHALA) %';

update rolodex
    set address_line_1 = '1236 Lauhala Street',
        address_line_2 = replace(address_line_2,'CANCER CENTER OF HAWAII (LAUHALA)','Lauhala Building'),
        postal_code = '96813-2417'
where address_line_2 like '%(LAUHALA)%';

update organization
   set address=replace(address,'1236 Lauhala Street, CANCER CENTER OF HAWAII (LAUHALA)','1236 Lauhala Street, UH Cancer Center (LAUHALA)')
where address like '1236 Lauhala Street, CANCER CENTER OF HAWAII (LAUHALA) %';

update rolodex
        set address_line_2 = replace(address_line_2,'Lauhala Building','Suite')
where address_line_2 like 'Lauhala Building %';


-- select before and after
select * from organization where address like '%MEDICAL RESEARCH BLDG%';

-- select before
select * from rolodex
where address_line_2 like '%MEDICAL RESEARCH BUILDING%';

update organization
   set address=replace(address,'JABSOM MEDICAL RESEARCH BLDG','Biosciences Bldg')
where address like '%MEDICAL RESEARCH BLDG%';

update rolodex
        set address_line_2 = replace(address_line_2,'JABSOM KAKAAKO MEDICAL RESEARCH BUILDING','Biosciences Bldg')
where address_line_2 like '%MEDICAL RESEARCH BUILDING%';

-- select before and after
select * from organization where address like '%Biosciences Bldg%';

-- select before
select * from rolodex
where address_line_2 like '%Biosciences Bldg%';

---- Done on 01/10/2013
select count(*) from rolodex
where address_line_1 like '%Donagho%';

select count(*) from rolodex
where address_line_1 like '%Donaghho%';

update rolodex
        set address_line_1 = replace(address_line_1,'Donagho','Donaghho')
where address_line_1 like '%Donagho%';



