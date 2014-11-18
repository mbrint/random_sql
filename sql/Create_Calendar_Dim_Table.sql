drop table UH_DIM_CALENDAR ;

CREATE TABLE UH_DIM_CALENDAR AS 
SELECT to_char(CurrDate,'YYYYMMDD')          AS Calendar_Skey,
    CurrDate                AS Calendar_Date,
    CurrDate - 1            AS Cal_Yesterday,
    CurrDate + 1            AS Cal_Tomorrow,
    ADD_MONTHS(CurrDate,-12) as Cal_Same_Date_Previous_Year,
    to_char(CurrDate,'YYYY') as Cal_Year,
    TRUNC(CurrDate,'YEAR') as Cal_Min_Year_Date, 
    last_day(add_months(TRUNC(CurrDate,'YEAR'),11)) as Cal_Max_Year_Date,
    TO_CHAR(CurrDate,'YYYY"0"Q')     AS Cal_Quarter,
    trunc(CurrDate,'Q') Cal_Min_Quarter_Date,
    last_day(add_months(trunc(CurrDate,'Q'),2)) as Cal_Max_Quarter_Date,
    TO_CHAR(CurrDate,'YYYYMM') as Cal_Month,
    TO_Char(CurrDate,'Month') as Cal_Month_Desc,
    TO_Char(CurrDate,'Mon') as Cal_Month_Desc_Short,
    TRUNC(CurrDate,'MM') as Cal_Min_Month_Date,
    last_day(CurrDate) as Cal_Max_Month_Date,
    trunc(CurrDate,'iw') as Cal_Min_Week_Mon_Date,   
    trunc(CurrDate,'iw')+6 as Cal_Max_Week_Sun_Date,
    ADD_MONTHS(CurrDate,-12) as Cal_Same_Date_PY_Date,
    to_char(CurrDate,'YYYYWW') as Cal_Week,
    trunc(CurrDate,'iw') as Cal_Min_Week_Date,  -- Is this same as  Cal_Min_Week_Mon_Date
    trunc(CurrDate,'iw')+6 as Cal_Max_Week_Date, -- Is this same as Cal_Max_Week_Sun_Date
    TO_CHAR(CurrDate-1,'D') AS Cal_Week_Day,  -- Note Oracle is treating D as Sun=1  we want Mon=1 so I take subtract 1 day to shift
    TO_CHAR(CurrDate,'Day') AS Cal_Week_Day_Desc,
    TO_CHAR(CurrDate,'DY')  AS Cal_Week_Day_Desc_Short,
    TO_CHAR ( ADD_MONTHS (CurrDate, 6) , 'YYYY') AS fiscal_year,
    ADD_MONTHS (TRUNC(ADD_MONTHS (CurrDate, 6), 'YYYY'), -6) as Fiscal_Min_Year_Date,
    last_day(TRUNC(ADD_MONTHS(CurrDate, 6), 'YYYY')) as Fiscal_Max_Year_Date,
    TO_CHAR(ADD_MONTHS(CurrDate, 6),'YYYY"0"Q')     AS Fiscal_Quarter,
    trunc(CurrDate,'Q') Fiscal_Min_Quarter_Date,   -- Note:fiscal quarter start date is same as regular quarter start date
    last_day(add_months(trunc(CurrDate,'Q'),2)) as Fiscal_Max_Quarter_Date,  -- Note:fiscal quarter is same max date as regular qtr
    TO_CHAR(ADD_MONTHS (CurrDate, 6) , 'MM') AS Fiscal_Period,
    TRUNC(CurrDate,'MM') as Fiscal_Min_Period_Date,
    last_day(CurrDate) as Fiscal_Max_Period_Date,  
    TO_NUMBER(TRIM(leading '0'
  FROM TO_CHAR(CurrDate,'DD'))) AS Num_of_Month,
    TO_NUMBER(TRIM(leading '0'
  FROM TO_CHAR(CurrDate,'DDD'))) AS Day_Num_of_Year,
    UPPER(TO_CHAR(CurrDate,'Mon')
    || '-'
    || TO_CHAR(CurrDate,'YYYY')) AS Month_ID_Desc,
    TO_CHAR(CurrDate,'Mon')
    || ' '
    || TO_CHAR(CurrDate,'YYYY') AS Month_Short_Desc,
    RTRIM(TO_CHAR(CurrDate,'Month'))
    || ' '
    || TO_CHAR(CurrDate,'YYYY') AS Month_Long_Desc,
    TO_NUMBER(TRIM(leading '0'  FROM TO_CHAR(CurrDate,'MM'))) AS Month_Num_of_Year,
    
    TO_NUMBER(TO_CHAR(CurrDate,'Q')) AS Quarter_Num_of_Year,
    CASE
      WHEN TO_NUMBER(TO_CHAR(CurrDate,'Q')) <= 2
      THEN 1
      ELSE 2
    END AS half_num_of_year,
    CASE
      WHEN TO_NUMBER(TO_CHAR(CurrDate,'Q')) <= 2
      THEN 'H'
        || 1
        || '-'
        || TO_CHAR(CurrDate,'YYYY')
      ELSE 'H'
        || 2
        || '-'
        || TO_CHAR(CurrDate,'YYYY')
    END                      AS half_of_year_id
  FROM
    (SELECT level n,
      -- Calendar starts at the day after this date.
      TO_DATE('31/12/1989','DD/MM/YYYY') + NUMTODSINTERVAL(level,'DAY') CurrDate
    FROM dual
      -- Change for the number of days to be added to the table.
      CONNECT BY level <= ((365*40)+(40/4))  -- 40/4 accounts for leap years
    )
;

select min(calendar_skey),max(calendar_skey) from UH_DIM_CALENDAR;