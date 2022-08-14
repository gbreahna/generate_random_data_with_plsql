SET SERVEROUTPUT ON FORMAT WRAPPED
SET VERIFY OFF
SET FEEDBACK OFF
SET TERMOUT OFF
SET PAGESIZE 0

spool ./check_tables_count.sql;

select 'PROMPT '||table_name||chr(13)||chr(10)||'select count(1) from '||table_name||';' cmd from user_tables;

spool off;

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET PAGESIZE 10000

@'./check_tables_count.sql'

