SET SERVEROUTPUT ON FORMAT WRAPPED
SET VERIFY OFF
SET FEEDBACK OFF
SET TERMOUT OFF
SET PAGESIZE 0

spool ./drop_schema_objects.sql;

select 'drop table '||table_name||' cascade constraints purge;'
from dba_tables
where owner = 'WEBSHOP'
union all
select 'drop '||object_type||' '||object_name||';'
from dba_objects
where object_type not in ('TABLE','INDEX','PACKAGE BODY','TRIGGER','LOB')
and object_type not like '%LINK%'
and object_type not like '%PARTITION%'
and object_name not like 'ISEQ$$%'
and owner = 'WEBSHOP'
order by 1;

spool off;

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET PAGESIZE 10000

@'./drop_schema_objects.sql'

PROMPT Count of Objects =
select object_type,count(*) from dba_objects where owner = 'WEBSHOP' group by object_type;


