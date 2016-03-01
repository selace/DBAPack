COL NAME   FORMAT A20 HEAD "Par�metro"
COL VALUE  FORMAT A30 HEAD "Valor"
COL PLAN_TABLE_OUTPUT FORMAT A169 HEAD "Plano de Execu��o"

SELECT NAME, UPPER(VALUE) VALUE
FROM V$PARAMETER
WHERE NAME IN ( 'cursor_sharing', 'optimizer_mode', 'hash_join_enabled' )
UNION ALL
SELECT 'arquivo', upper('explain.&1..sql') FROM DUAL
/

SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('SYS.PLAN_TABLE$', '&1.', 'TYPICAL'  )) 
--FROM TABLE(DBMS_XPLAN.DISPLAY('SYS.PLAN_TABLE$', '&1.', 'ALL'  )) -- ALL -PROJECTION -ALIAS 
/

COL NAME   clear
COL VALUE  clear
COL PLAN_TABLE_OUTPUT clear
