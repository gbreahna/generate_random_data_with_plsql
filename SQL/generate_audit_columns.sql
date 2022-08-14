SET SERVEROUTPUT ON FORMAT WRAPPED
SET VERIFY OFF
SET FEEDBACK OFF
SET TERMOUT OFF
SET PAGESIZE 0

spool ./create_audit_columns.sql;

select 'ALTER TABLE '||t.table_name||' ADD (CREATED_BY VARCHAR2(200) NOT NULL);' cmd
from USER_TABLES t
where not exists (select 1 from USER_TAB_COLUMNS c where c.table_name=t.table_name and c.column_name='CREATED_BY')
union all
select 'ALTER TABLE '||t.table_name||' ADD (CREATED_ON DATE NOT NULL);' cmd
from USER_TABLES t
where not exists (select 1 from USER_TAB_COLUMNS c where c.table_name=t.table_name and c.column_name='CREATED_ON')
union all
select 'ALTER TABLE '||t.table_name||' ADD (MODIFIED_BY VARCHAR2(200) NOT NULL);' cmd
from USER_TABLES t
where not exists (select 1 from USER_TAB_COLUMNS c where c.table_name=t.table_name and c.column_name='MODIFIED_BY')
union all
select 'ALTER TABLE '||t.table_name||' ADD (MODIFIED_ON DATE NOT NULL);' cmd
from USER_TABLES t
where not exists (select 1 from USER_TAB_COLUMNS c where c.table_name=t.table_name and c.column_name='MODIFIED_ON');

spool off;

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET PAGESIZE 10000

@'./create_audit_columns.sql'
PROMPT Count of Objects =
select 'CREATED_BY' name, count(*) cnt from USER_TAB_COLUMNS where column_name = 'CREATED_BY'
union all
select 'CREATED_ON' name, count(*) cnt from USER_TAB_COLUMNS where column_name = 'CREATED_ON' 
union all
select 'MODIFIED_BY' name, count(*) cnt from USER_TAB_COLUMNS where column_name = 'MODIFIED_BY' 
union all
select 'MODIFIED_ON' name, count(*) cnt from USER_TAB_COLUMNS where column_name = 'MODIFIED_ON';


