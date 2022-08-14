CREATE OR REPLACE PACKAGE generate_data_pkg AS

  FUNCTION get_words(p_string_min NUMBER,
                     p_string_max NUMBER,
                     p_word_min   NUMBER,
                     p_word_max   NUMBER,
                     p_char_type  VARCHAR2 DEFAULT 'a') RETURN VARCHAR2;
  FUNCTION get_string(p_string_min NUMBER,
                      p_string_max NUMBER,
                      p_char_type  VARCHAR2 DEFAULT 'a') RETURN VARCHAR2;
  --dbms_crypto.hash(utl_i18n.string_to_raw('test', 'AL32UTF8'), dbms_crypto.HASH_SH256);
  FUNCTION get_number(p_value_min NUMBER,
                      p_value_max NUMBER,
                      p_decimals  NUMBER DEFAULT 0) RETURN NUMBER;
  FUNCTION get_date(p_value_min DATE,
                    p_value_max DATE) RETURN DATE;
  FUNCTION get_lov(p_lov VARCHAR2) RETURN VARCHAR2;
  FUNCTION get_fk(p_table  VARCHAR2,
                  p_column VARCHAR2) RETURN VARCHAR2;
  PROCEDURE set_nulls(p_table         VARCHAR2,
                      p_nulls_percent NUMBER);
  FUNCTION get_email RETURN VARCHAR2;
  FUNCTION get_url RETURN VARCHAR2;

END generate_data_pkg;
/

CREATE OR REPLACE PACKAGE BODY generate_data_pkg AS

  FUNCTION get_words(p_string_min NUMBER,
                     p_string_max NUMBER,
                     p_word_min   NUMBER,
                     p_word_max   NUMBER,
                     p_char_type  VARCHAR2 DEFAULT 'a') RETURN VARCHAR2 AS
    l_seed       VARCHAR2(100);
    l_len_string NUMBER;
    l_len_word   NUMBER;
    l_words      VARCHAR2(4000);
    l_word       VARCHAR2(4000);
    /*
    'u', 'U' - uppercase alpha characters
    'l', 'L' - lowercase alpha characters
    'a', 'A' - mixed case alpha characters
    'x', 'X' - uppercase alpha-numeric characters
    'p', 'P' - any printable characters
    */
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
    --generate a number between p_length_min and p_length_max
    l_len_string := round(dbms_random.value(p_string_min, p_string_max));
    WHILE TRUE
    LOOP
      l_len_word := round(dbms_random.value(p_word_min, p_word_max));
      l_word     := dbms_random.string(p_char_type, l_len_word);
      l_words    := l_words || ' ' || l_word;
      IF length(l_words) > l_len_string
      THEN
        l_words := substr(l_words, 1, l_len_string);
        IF substr(l_words, -1, 1) = ' '
        THEN
          l_words := substr(l_words, 1, length(l_words) - 1) || substr(l_words, 1, 1);
        END IF;
      
        EXIT;
      END IF;
    
    END LOOP;
    RETURN l_words;
  END get_words;
  -----------------------------------------------------------------------------
  FUNCTION get_string(p_string_min NUMBER,
                      p_string_max NUMBER,
                      p_char_type  VARCHAR2 DEFAULT 'a') RETURN VARCHAR2 AS
    l_seed       VARCHAR2(100);
    l_len_string NUMBER;
    l_string     VARCHAR2(4000);
  
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
    --generate a number between p_length_min and p_length_max
    l_len_string := round(dbms_random.value(p_string_min, p_string_max));
    l_string     := dbms_random.string(p_char_type, l_len_string);
    RETURN l_string;
  END get_string;
  -----------------------------------------------------------------------------
  FUNCTION get_number(p_value_min NUMBER,
                      p_value_max NUMBER,
                      p_decimals  NUMBER DEFAULT 0) RETURN NUMBER AS
    l_seed   VARCHAR2(100);
    l_number NUMBER;
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
    l_number := round(dbms_random.value(p_value_min, p_value_max), p_decimals);
  
    RETURN l_number;
  END get_number;
  -----------------------------------------------------------------------------
  FUNCTION get_date(p_value_min DATE,
                    p_value_max DATE) RETURN DATE AS
    l_data_span NUMBER;
    l_data_gen  DATE;
  BEGIN
    l_data_span := p_value_max - p_value_min;
    l_data_gen  := trunc(p_value_min + dbms_random.value(0, l_data_span));
    RETURN l_data_gen;
  END get_date;

  -----------------------------------------------------------------------------
  FUNCTION get_lov(p_lov VARCHAR2) RETURN VARCHAR2 AS
    l_seed  VARCHAR2(100);
    l_count NUMBER;
    l_index NUMBER;
    l_value VARCHAR2(100);
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
    SELECT COUNT(1)
    INTO l_count
    FROM (WITH rws AS (SELECT p_lov str FROM dual)
           SELECT regexp_substr(str, '[^;]+', 1, LEVEL) VALUE
           FROM rws
           CONNECT BY LEVEL <= length(str) - length(REPLACE(str, ';')) + 1);
  
  
    l_index := round(dbms_random.value(1, l_count), 0);
  
    SELECT VALUE
    INTO l_value
    FROM (WITH rws AS (SELECT p_lov str FROM dual)
           SELECT regexp_substr(str, '[^;]+', 1, LEVEL) VALUE
           FROM rws
           CONNECT BY LEVEL <= length(str) - length(REPLACE(str, ';')) + 1)
           ORDER BY VALUE offset l_index - 1 rows
           FETCH NEXT 1 rows ONLY;
  
  
    RETURN l_value;
  END get_lov;

  -----------------------------------------------------------------------------

  FUNCTION get_fk(p_table  VARCHAR2,
                  p_column VARCHAR2) RETURN VARCHAR2 AS
    l_seed   VARCHAR2(100);
    l_count  NUMBER;
    sql_stmt VARCHAR2(4000);
    l_index  NUMBER;
    l_value  VARCHAR2(100);
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
    --count number of rows from the table
    sql_stmt := 'select count(1) from ' || p_table;
    EXECUTE IMMEDIATE sql_stmt
      INTO l_count;
  
    l_index := round(dbms_random.value(1, l_count), 0) - 1;
  
    sql_stmt := 'select ' || p_column || ' from ' || p_table || ' offset ' || l_index || ' rows fetch next 1 rows only';
    --offset 49 rows fetch next 1 rows only
    EXECUTE IMMEDIATE sql_stmt
      INTO l_value;
  
    RETURN l_value;
  END get_fk;
  -----------------------------------------------------------------------------
  PROCEDURE set_nulls(p_table         VARCHAR2,
                      p_nulls_percent NUMBER) AS
    l_seed         VARCHAR2(100);
    sql_stmt       VARCHAR2(4000);
    l_nulls_set    VARCHAR2(4000);
    l_count        NUMBER;
    l_nulls_target NUMBER;
    l_nulls_crt    NUMBER;
    l_index        NUMBER;
    l_rowid        VARCHAR2(100);
    l_rows_updated NUMBER;
  
  BEGIN
    l_seed := to_char(systimestamp, 'YYYYDDMMHH24MISSFFFF');
    dbms_random.seed(val => l_seed);
  
    SELECT listagg(c.column_name || '=null', ',')
    INTO l_nulls_set
    FROM user_tab_columns c
    WHERE c.table_name = upper(p_table) AND
          c.nullable = 'Y';
  
    IF l_nulls_set IS NOT NULL
    THEN
    
      -- set nulls for all available columns till p_nulls_percent
      -- count number of rows from the table
      sql_stmt := 'select count(1) from ' || p_table;
      EXECUTE IMMEDIATE sql_stmt
        INTO l_count;
    
      l_nulls_target := floor(l_count * p_nulls_percent / 100);
      l_nulls_crt    := 0;
    
      WHILE l_nulls_crt < l_nulls_target
      LOOP
        l_index := round(dbms_random.value(1, l_count), 0) - 1;
        --find rowid from the index position
        sql_stmt := 'select rowid from ' || p_table || ' offset ' || l_index || ' rows fetch next 1 rows only';
        EXECUTE IMMEDIATE sql_stmt
          INTO l_rowid;
        --update with null
        sql_stmt := 'update ' || p_table || ' set ' || l_nulls_set || ' where rowid=''' || l_rowid || '''';
        EXECUTE IMMEDIATE sql_stmt;
        l_rows_updated := SQL%ROWCOUNT;
        --update contor
        l_nulls_crt := l_nulls_crt + l_rows_updated;
      
      END LOOP; -- WHILE l_nulls_crt < l_nulls_target
    END IF; -- IF l_nulls_set IS NOT NULL
  
  END set_nulls;
  -----------------------------------------------------------------------------
  FUNCTION get_email RETURN VARCHAR2 AS
    l_email VARCHAR2(254);
  BEGIN
    l_email := get_string(6, 12, 'L') || '.' || get_string(8, 16, 'L') || '@' || get_string(6, 12, 'L') || '.' ||
               get_lov('com;co.uk;ca;mx;de;ro;fr;it;es');
    RETURN l_email;
  END get_email;
  -----------------------------------------------------------------------------
  FUNCTION get_url RETURN VARCHAR2 AS
    l_url VARCHAR2(1000);
  BEGIN
    l_url := 'https://'||get_string(6, 12, 'L') || '.' ||get_string(6, 12, 'L') || '.' ||get_lov('com;co.uk;ca;mx;de;ro;fr;it;es')||'/'||get_string(8, 16, 'L');
    RETURN l_url;
  END get_url;
END generate_data_pkg;
/
