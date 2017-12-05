SET SERVEROUTPUT ON;
BEGIN
        dbms_output.put_line('No. ИД сеанса    Пользователь');
        dbms_output.put_line('--- -----------  ------------');
        for row in (SELECT rownum, t1.sid, t1.USERNAME
from
v$session t1,
v$transaction t2
where
t1.saddr = t2.ses_addr)
        loop
          dbms_output.put_line(RPAD(row.rownum, 3) || ' ' || RPAD(row.sid, 12) || ' ' || RPAD(row.USERNAME, 12));
        end loop;
END;
/
