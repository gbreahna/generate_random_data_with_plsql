set serveroutput on
set pages 0
set lines 300
set heading off
spool ./create_auto_increment.sql;
select 'CREATE SEQUENCE '||L.table_name||'_'||l.column_name||'_SEQ START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER '||L.table_name||'_'||l.column_name||'_TRG BEFORE
    INSERT ON '||l.table_name||'
    FOR EACH ROW
    WHEN ( new.'||l.column_name||' IS NULL )
BEGIN
    :new.'||l.column_name||' := '||L.table_name||'_'||l.column_name||'_SEQ.nextval;
END;
/
' cmd
from USER_CONSTRAINTS c
INNER JOIN USER_CONS_COLUMNS l on l.CONSTRAINT_NAME=c.CONSTRAINT_NAME
where c.CONSTRAINT_TYPE='P' 
and not exists(select 1 from user_sequences s where s.sequence_name=L.table_name||'_'||l.column_name||'_SEQ');
spool off;
@create_auto_increment
PROMPT Count of Objects =
select count(*) cnt from user_sequences where sequence_name like '%_SEQ';


