DECLARE


BEGIN

DBMS_OUTPUT.PUT_LINE('Hello World !');



END;



SELECT * FROM COUNTRIES
WHERE COUNTRY_NAME = 'Canada';


DECLARE

sayi NUMBER := 10;

BEGIN
    
DBMS_OUTPUT.PUT_LINE('Hello PL/SQL !');
END;


DECLARE
  sayi NUMBER := 1;

BEGIN
  DBMS_OUTPUT.PUT_LINE(sayi);

  DECLARE
    sayi NUMBER := 5;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(sayi);
  END;

END;




DECLARE

sayim NUMBER := 1;

BEGIN

BEGIN
    sayim := 5;
    DBMS_OUTPUT.PUT_LINE(sayim);

END;
END;




DECLARE

a NUMBER(4) := 5;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Dış bloktaki a degeri ' || a);

DECLARE

a NUMBER(4) := 10;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('İç bloktaki a degeri ' || a);
END;
END;







<< dis_blok >>
DECLARE

a NUMBER(4) := 5;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Dış bloktaki a degeri ' || a);

DECLARE

a NUMBER(4) := 10;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('İç bloktaki a degeri ' || a);
    DBMS_OUTPUT.PUT_LINE('Dış bloktaki a degeri ' || dis_blok.a);
END;
END;



DECLARE

sayi1 NUMBER;
sayi2 NUMBER;

BEGIN
    sayi1 := &sayi1;
    sayi2 := &sayi2;
    DBMS_OUTPUT.PUT_LINE('Toplam : ' || (sayi1+sayi2));
END;


DECLARE
ders VARCHAR2(10) := 'PL/SQL';
sayi NUMBER(5,2) :=  125.33;
birth_date DATE := '17-Jan-2004'; 
varMi BOOLEAN := TRUE AND NULL; 
  BEGIN
    DBMS_OUTPUT.PUT_LINE(sayi || ' '  || ders  || ' '|| birth_date);
    --DBMS_OUTPUT.PUT_LINE(varMi);

    if (not varMi =TRUE) THEN
    DBMS_OUTPUT.PUT_LINE('OLUMSUZ');
    ELSIF(varMi = NULL) THEN
    DBMS_OUTPUT.PUT_LINE('OLUMLU');
    ELSIF(varMi =FALSE) THEN
    dbms_output.put_line('OLUMLU');
    ELSE
    dbms_output.put_line('OLUMLU');
    END if;

  END;

DECLARE
v_first_name VARCHAR2(20);
BEGIN
  select first_name
  into v_first_name
  from EMPLOYEES
where last_name = 'Vargas';
DBMS_OUTPUT.PUT_LINE(v_first_name);
END;


/*

INSERT COMMAND SYNTAX

INSERT INTO TABLE_NAME {column(s)} VALUES {values}


COMMIT;
*/


/*

Add a row to JOBS table given values

JOB_ID = ST_MIS
JOB_TITLE = MIS_STUDENT
MIN_SALARY = 1000
MAX_SALARY = 5000



DELETE FROM TABLE_NAME;

UPDATE TABLE_NAME
SET column
WHERE column_id = x

*/


INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES ('ST_MIS', 'MIS_STUDENT', 1000, 5000);



INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES ('TEC_MIS', 'MIS_TEC', 5000, 15000);

INSERT INTO JOBS (JOB_ID)
VALUES ('TC_MIS');



SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY FROM JOBS;
COMMIT;

DELETE FROM JOBS2;
COMMIT;


UPDATE JOBS
SET JOB_ID = 'ZE_KI'
WHERE JOB_ID = 'AD_VP';

COMMIT;

UPDATE HR_JOBS
SET JOB_ID = 'ZE_KI';


SELECT * FROM JOBS;


UPDATE JOBS
SET JOBS.JOB_TITLE = 'ZE_KI_HOCA'
WHERE JOB_TITLE = 'MIS_TEC';
ROLLBACK;
SELECT * FROM JOBS;
COMMIT;


UPDATE JOBS
SET MIN_SALARY = 25000,
    MAX_SALARY = 100000
WHERE JOB_TITLE = 'ZE_KI_HOCA';

SELECT * FROM JOBS;
DROP TABLE bonuses;
CREATE TABLE bonuses
(employee_id NUMBER(6,0) NOT NULL, bonus NUMBER(8,2) DEFAULT 0);

SELECT * FROM bonuses;
DROP TABLE bonuses;

INSERT INTO bonuses(employee_id)
(SELECT employee_id FROM employees WHERE salary < 10000);

SELECT * FROM bonuses;

MERGE INTO bonuses b
USING employees e
ON(b.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET b.bonus=e.salary*.05;

SELECT * FROM bonuses;