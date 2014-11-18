BEGIN 
  FOR i IN (SELECT owner,view_name FROM all_views where owner = 'MGPROD' and view_name like 'DW_%') 
    LOOP 
      EXECUTE IMMEDIATE('DROP VIEW ' || i.owner || '.' || i.view_name); 
    END LOOP; 
END;
