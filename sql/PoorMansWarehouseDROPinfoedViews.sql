--Run as DM_INFOED_ADMINISTRTOR
BEGIN
    FOR i IN (SELECT view_name FROM user_views where view_name like 'DW_%') 
    LOOP 
      EXECUTE IMMEDIATE('DROP VIEW ' || i.view_name); 
    END LOOP; 
END;
