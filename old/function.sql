create or replace procedure testTable(tab_name varchar(100)) as
  cou int;
  v_sql varchar(100);
begin
  select count(*) into cou from user_tables where table_name=tab_name;
  if cou=1 then
      v_sql:='drop table '||tab_name;
      execute immediate v_sql;
  end if;
end;