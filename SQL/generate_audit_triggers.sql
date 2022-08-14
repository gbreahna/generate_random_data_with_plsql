SET SERVEROUTPUT ON FORMAT WRAPPED
SET VERIFY OFF
SET FEEDBACK OFF
SET TERMOUT OFF
SET PAGESIZE 0

spool ./create_audit_triggers.sql;

select 
'create or replace trigger '||t.table_name||'_AUDIT_trg
    before insert or update on '||t.table_name||'
    for each row
declare
    l_client_info varchar2(200) := sys_context(''userenv'', ''client_info'');
    l_session_user varchar2(200) := sys_context(''userenv'', ''session_user'');
    l_trigger_user varchar2(200) := nvl(l_client_info, l_session_user);
begin
    if inserting
    then
        :new.created_on := sysdate;
        :new.created_by := l_trigger_user;
    end if;
    :new.modified_on := sysdate;
    :new.modified_by := l_trigger_user;
end;
/
' cmd

from user_tables t
where not exists (select 1 from user_triggers r where r.table_name=t.table_name and r.trigger_name like '%AUDIT_TRG');

spool off;

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET PAGESIZE 10000

@'./create_audit_triggers.sql'
PROMPT Count of Objects =
select count(*) cnt from user_triggers where trigger_name like '%AUDIT_TRG';

