create or replace trigger BOOK_AUDIT_trg
    before insert or update on BOOK
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_CATEGORY_AUDIT_trg
    before insert or update on BOOK_CATEGORY
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_CATEGORY_TL_AUDIT_trg
    before insert or update on BOOK_CATEGORY_TL
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_INVENTORY_AUDIT_trg
    before insert or update on BOOK_INVENTORY
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_PRICE_AUDIT_trg
    before insert or update on BOOK_PRICE
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_REVIEW_AUDIT_trg
    before insert or update on BOOK_REVIEW
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger BOOK_TL_AUDIT_trg
    before insert or update on BOOK_TL
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CART_AUDIT_trg
    before insert or update on CART
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CART_LINE_AUDIT_trg
    before insert or update on CART_LINE
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CONFIG_AUDIT_trg
    before insert or update on CONFIG
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger COUNTRY_AUDIT_trg
    before insert or update on COUNTRY
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CUSTOMER_AUDIT_trg
    before insert or update on CUSTOMER
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CUSTOMER_ADDRESS_AUDIT_trg
    before insert or update on CUSTOMER_ADDRESS
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger CUSTOMER_PAYMENT_AUDIT_trg
    before insert or update on CUSTOMER_PAYMENT
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger INVOICE_AUDIT_trg
    before insert or update on INVOICE
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger INVOICE_LINE_AUDIT_trg
    before insert or update on INVOICE_LINE
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger INVOICE_PAYMENT_AUDIT_trg
    before insert or update on INVOICE_PAYMENT
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger LANGUAGE_AUDIT_trg
    before insert or update on LANGUAGE
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
create or replace trigger LOG_AUDIT_trg
    before insert or update on LOG
    for each row
declare
    l_client_info varchar2(200) := sys_context('userenv', 'client_info');
    l_session_user varchar2(200) := sys_context('userenv', 'session_user');
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
