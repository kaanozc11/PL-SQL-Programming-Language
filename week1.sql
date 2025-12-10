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



SELECT * FROM LOCATIONS l
INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
WHERE r.REGION_ID = 30;


SELECT STREET_ADDRESS, POSTAL_CODE, INITCAP(CITY) AS CITY FROM LOCATIONS l
INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
WHERE r.REGION_NAME = 'Asia' AND CITY = 'tokyo';


SELECT STREET_ADDRESS, POSTAL_CODE,INITCAP(CITY) AS CITY FROM LOCATIONS l
INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
WHERE UPPER(r.REGION_NAME) = 'ASIA' AND UPPER(CITY) = 'TOKYO';


SET SERVEROUTPUT ON;

DECLARE
    v_street_address  LOCATIONS.STREET_ADDRESS%TYPE;
    v_postal_code     LOCATIONS.POSTAL_CODE%TYPE;
    v_city LOCATIONS.CITY%TYPE;

    r_location LOCATIONS%ROWTYPE;
BEGIN
    SELECT STREET_ADDRESS, POSTAL_CODE, INITCAP(CITY) INTO v_street_address, v_postal_code, v_city FROM LOCATIONS l
    INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
    INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
    WHERE UPPER(r.REGION_NAME) = 'ASIA'
      AND UPPER(CITY) = 'TOKYO';

    DBMS_OUTPUT.PUT_LINE(v_street_address);
    DBMS_OUTPUT.PUT_LINE(v_postal_code);
    DBMS_OUTPUT.PUT_LINE(v_city);
END;


DECLARE
  
    r_location LOCATIONS%ROWTYPE;
BEGIN
    SELECT l.* ınto r_location FROM LOCATIONS l 
    INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
    INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
    WHERE UPPER(r.REGION_NAME) = 'ASIA'
      AND UPPER(CITY) = 'TOKYO';

    DBMS_OUTPUT.PUT_LINE(r_location.STREET_ADDRESS);
    DBMS_OUTPUT.PUT_LINE(r_location.POSTAL_CODE);
    DBMS_OUTPUT.PUT_LINE(r_location.CITY);
    
END;




DECLARE
  
    TYPE record_adi IS RECORD(

      region_name REGIONS.REGION_NAME%TYPE,
      city LOCATIONS.CITY%TYPE,
      postal_code LOCATIONS.POSTAL_CODE%TYPE,
      street_address LOCATIONS.STREET_ADDRESS%TYPE



    );

    kaan record_adi;


BEGIN
    SELECT l.*, region_name ınto r_location FROM LOCATIONS l 
    INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
    INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
    WHERE UPPER(r.REGION_NAME) = 'ASIA'
      AND UPPER(CITY) = 'TOKYO';

    DBMS_OUTPUT.PUT_LINE(r_location.STREET_ADDRESS);
    DBMS_OUTPUT.PUT_LINE(r_location.POSTAL_CODE);
    DBMS_OUTPUT.PUT_LINE(r_location.CITY);
    
END;

DECLARE
  
    TYPE record_adi IS RECORD(

      region_name REGIONS.REGION_NAME%TYPE,
      city LOCATIONS.CITY%TYPE,
      postal_code LOCATIONS.POSTAL_CODE%TYPE,
      street_address LOCATIONS.STREET_ADDRESS%TYPE,
      country_name COUNTRIES.COUNTRY_NAME%TYPE


    );

    r_kaan record_adi;


BEGIN
    SELECT  r.REGION_NAME, l.CITY, l.POSTAL_CODE, l.STREET_ADDRESS, c.COUNTRY_NAME INTO r_kaan FROM LOCATIONS l
    INNER JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
    INNER JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
    WHERE UPPER(r.REGION_NAME) = 'ASIA'
      AND UPPER(CITY) = 'TOKYO';

    DBMS_OUTPUT.PUT_LINE(r_kaan.STREET_ADDRESS);
    DBMS_OUTPUT.PUT_LINE(r_kaan.POSTAL_CODE);
    DBMS_OUTPUT.PUT_LINE(r_kaan.CITY);
    DBMS_OUTPUT.PUT_LINE(r_kaan.REGION_NAME);
    DBMS_OUTPUT.PUT_LINE(r_kaan.COUNTRY_NAME);
END;
  

DECLARE
num1 NUMBER;
num2 NUMBER;

BEGIN
  num1 := &num1;
  num2 := &num2;

  IF (num1 > num2) THEN
  DBMS_OUTPUT.PUT_LINE('Sayı 1 büyüktür');
  ELSIF(num2 > num1) THEN
  DBMS_OUTPUT.PUT_LINE('Sayı 2 sayı 1 den büyüktür');
  ELSE
  DBMS_OUTPUT.PUT_LINE('İki sayi birbiine eşittir');
  END IF;

  END;


DECLARE


state1 BOOLEAN := NULL;
state2 BOOLEAN := NULL;

BEGIN


  
  IF (state1 = state2) THEN
  DBMS_OUTPUT.PUT_LINE('Her iki durum da eşittir');
  ELSE
  DBMS_OUTPUT.PUT_LINE('Eşit değildir');

END IF;


END;


DECLARE

v_harf VARCHAR2(2);

BEGIN
v_harf := '&v_harf';

CASE v_harf
WHEN 'a' THEN DBMS_OUTPUT.PUT_LINE(v_harf);
WHEN 'b' THEN DBMS_OUTPUT.PUT_LINE(v_harf);
WHEN 'c' THEN DBMS_OUTPUT.PUT_LINE(v_harf);
ELSE
DBMS_OUTPUT.PUT_LINE('Invalid');
END CASE;
END;


DECLARE

v_num NUMBER;

BEGIN
  v_num := &v_num;

  CASE
    WHEN MOD(v_num,2) = 0 THEN DBMS_OUTPUT.PUT_LINE('Sayı çifttir');
    WHEN MOD(v_num,2) = 1 THEN DBMS_OUTPUT.PUT_LINE('Sayı tektir');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Invalid');
    END CASE;
    END;


DECLARE
v_counter NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Loop Execution ' || v_counter);
    v_counter := v_counter +1;
    EXIT WHEN v_counter >5;
    END LOOP;
    END;

DECLARE
v_counter NUMBER := 10;
BEGIN
  LOOP
    IF MOD(v_counter,2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Loop Execution ' || v_counter);
    END IF;
    v_counter := v_counter -1;

    EXIT WHEN v_counter =0;
    END LOOP;
    END;


    DECLARE
  v_counter NUMBER := 10;
BEGIN
  LOOP 
    EXIT WHEN v_counter = 0;
    IF MOD(v_counter, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Loop Execution ' || v_counter);
    END IF;
    v_counter := v_counter - 1;
  END LOOP;
END;

DECLARE
v_counter NUMBER := 10;
BEGIN
  LOOP
    IF MOD(v_counter,2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Loop Execution ' || v_counter);
    END IF;
    v_counter := v_counter -1;

    IF (v_counter = 0) THEN
    EXIT;
    END IF;

    END LOOP;
    END;



DECLARE
sayac PLS_INTEGER := 10;
kita VARCHAR(20);
BEGIN
  LOOP
  SELECT  region_name INTO kita FROM REGIONS
  WHERE region_id = sayac;
  DBMS_OUTPUT.PUT_LINE(kita);
  
  sayac := sayac +10;
  EXIT WHEN sayac > 50;
  
  END LOOP;
 END;
    

DECLARE
sayac PLS_INTEGER := 10;
kita VARCHAR(20);
BEGIN
  WHILE sayac < 51 LOOP
  SELECT  region_name INTO kita FROM REGIONS
  WHERE region_id = sayac;
  DBMS_OUTPUT.PUT_LINE(kita);
  
  sayac := sayac +10;
 
  
  END LOOP;
 END;

BEGIN 
FOR sayac IN 1..10 LOOP

DBMS_OUTPUT.PUT_LINE(sayac);

END LOOP;

 END;



DECLARE
sayac PLS_INTEGER := 10;
kita VARCHAR(20);
BEGIN
  FOR sayac IN 10..60 LOOP
  SELECT  region_name INTO kita FROM REGIONS
  WHERE region_id = sayac;
  DBMS_OUTPUT.PUT_LINE(kita);
  
  END LOOP;
 END;



 DECLARE
 v_salary employees.salary%TYPE;
 BEGIN
  SELECT salary INTO v_salary FROM employees;
  DBMS_OUTPUT.PUT_LINE('Salary is ' || v_salary);
  END;


   DECLARE
CURSOR ilk_kursor IS
SELECT salary  FROM employees;
v_salary employees.SALARY%TYPE;
 
 BEGIN
  OPEN ilk_kursor;
 LOOP 
  FETCH ilk_kursor INTO v_salary;
  EXIT WHEN ilk_kursor%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE('Salary is ' || v_salary);
  END LOOP;
  CLOSE ilk_kursor;
  END;


--------------------------------------------------------
--  File created - Çarşamba-Aralık-03-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BONUSES
--------------------------------------------------------
 
  CREATE TABLE "HR"."BONUSES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"BONUS" NUMBER(8,2) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.BONUSES
SET DEFINE OFF;
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('103','450');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('104','300');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('105','240');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('106','240');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('107','210');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('109','450');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('110','410');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('111','385');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('112','390');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('113','345');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('115','155');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('116','145');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('117','140');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('118','130');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('119','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('120','400');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('121','410');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('122','395');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('123','325');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('124','290');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('125','160');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('126','135');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('127','120');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('128','110');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('129','165');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('130','140');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('131','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('132','105');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('133','165');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('134','145');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('135','120');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('136','110');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('137','180');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('138','160');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('139','135');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('140','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('141','175');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('142','155');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('143','130');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('144','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('151','475');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('152','450');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('153','400');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('154','375');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('155','350');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('157','475');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('158','450');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('159','400');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('160','375');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('161','350');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('163','475');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('164','360');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('165','340');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('166','320');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('167','310');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('170','480');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('171','370');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('172','365');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('173','305');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('175','440');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('176','430');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('177','420');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('178','350');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('179','310');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('180','160');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('181','155');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('182','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('183','140');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('184','210');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('185','205');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('186','170');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('187','150');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('188','190');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('189','180');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('190','145');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('191','125');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('192','200');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('193','195');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('194','160');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('195','140');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('196','155');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('197','150');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('198','130');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('199','130');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('200','220');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('202','300');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('203','325');
Insert into HR.BONUSES (EMPLOYEE_ID,BONUS) values ('206','415');
--------------------------------------------------------
--  Constraints for Table BONUSES
--------------------------------------------------------
 
  ALTER TABLE "HR"."BONUSES" MODIFY ("EMPLOYEE_ID" NOT NULL ENABLE);
COMMIT;


DECLARE
CURSOR bonuslar IS
SELECT BONUS, BONUSES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME,EMPLOYEES.LAST_NAME FROM BONUSES,
FULL OUTER JOIN EMPLOYEES ON EMPLOYEES.EMPLOYEE_ID = BONUSES.EMPLOYEE_ID; 
v_bonus BONUSES.BONUS%TYPE;
v_bonus_id BONUSES.EMPLOYEE_ID%TYPE;
v_first_name EMPLOYEES.FIRST_NAME%TYPE;
v_last_name EMPLOYEES.LAST_NAME%TYPE;
BEGIN
  OPEN bonuslar;
  LOOP 
    
    FETCH bonuslar INTO v_bonus,v_bonus_id, v_first_name, v_last_name;
    EXIT WHEN bonuslar%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE('Bonus is ' || v_bonus || ', Name: ' || v_first_name || ' ' || v_last_name);
  CLOSE bonuslar;
  END LOOP;
  END;

SELECT *
FROM (
  SELECT *
  FROM employees
  ORDER BY salary DESC
)
WHERE ROWNUM <= 5;



DECLARE

  CURSOR kaan IS
    SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= 5;

  v_employee_id      employees.employee_id%TYPE;
  v_first_name       employees.first_name%TYPE;
  v_last_name        employees.last_name%TYPE;
  v_salary           employees.salary%TYPE;
  v_department_name  departments.department_name%TYPE;
BEGIN
  OPEN kaan;
  LOOP
    FETCH kaan INTO  v_employee_id,v_first_name, v_last_name ,v_salary,v_department_name;
  EXIT WHEN kaan%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(
    'En çok maaş alan 5 kişi: ' ||
    v_employee_id || ' - ' ||
    v_first_name || ' ' ||
    v_last_name || ' - ' ||
    v_salary || ' - ' ||
    v_department_name
);

END LOOP;
CLOSE kaan;

END;

--Recordlu hâli
DECLARE

  CURSOR kaan IS
    SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= 5;

  enyuksekmaaslilar kaan%ROWTYPE;
BEGIN
  OPEN kaan;
  LOOP
    FETCH kaan INTO  enyuksekmaaslilar;
  EXIT WHEN kaan%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(
      'En çok maaş alan 5 kişi: ' ||
      enyuksekmaaslilar.employee_id || ' - ' ||
      enyuksekmaaslilar.first_name || ' ' ||
      enyuksekmaaslilar.last_name || ' - ' ||
      enyuksekmaaslilar.salary || ' - ' ||
      enyuksekmaaslilar.department_name
    );
  

END LOOP;
DBMS_OUTPUT.PUT_LINE(kaan%ROWCOUNT);

IF not kaan%ISOPEN THEN
OPEN kaan;
END IF;

OPEN kaan;
  LOOP
    FETCH kaan INTO  enyuksekmaaslilar;
  EXIT WHEN kaan%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(
      'En çok maaş alan 5 kişi: ' ||
      enyuksekmaaslilar.employee_id || ' - ' ||
      enyuksekmaaslilar.first_name || ' ' ||
      enyuksekmaaslilar.last_name || ' - ' ||
      enyuksekmaaslilar.salary || ' - ' ||
      enyuksekmaaslilar.department_name
    );
  

END LOOP;
DBMS_OUTPUT.PUT_LINE(kaan%ROWCOUNT);
CLOSE kaan;

END;

DECLARE
CURSOR kaan IS
SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= 5;

    BEGIN
      FOR REC_ENYUKSEK_MAASLILAR IN kaan LOOP
dbms_output.put_line(REC_ENYUKSEK_MAASLILAR.first_name);
END LOOP;
END;





    BEGIN
      FOR REC_ENYUKSEK_MAASLILAR IN (

SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= 5) LOOP
dbms_output.put_line(REC_ENYUKSEK_MAASLILAR.first_name);
END LOOP;
END;



DECLARE
p_limit_sayisi number;

CURSOR kaan(p_limit_sayisi NUMBER) IS
SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= p_limit_sayisi;

    BEGIN
      p_limit_sayisi := &p_limit_sayisi;
      FOR REC_ENYUKSEK_MAASLILAR IN kaan(p_limit_sayisi) LOOP
dbms_output.put_line(REC_ENYUKSEK_MAASLILAR.first_name);
END LOOP;
END;

DECLARE
p_limit_sayisi number := &p_limit_sayisi;
  CURSOR kaan IS
    SELECT *
    FROM (
      SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
      FROM employees e
       JOIN departments d
      ON d.department_id = e.department_id
      ORDER BY salary DESC
    ) 
    
    WHERE ROWNUM <= p_limit_sayisi;

  enyuksekmaaslilar kaan%ROWTYPE;
BEGIN
  OPEN kaan;
  LOOP
    FETCH kaan INTO  enyuksekmaaslilar;
  EXIT WHEN kaan%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(
      'En çok maaş alan 5 kişi: ' ||
      enyuksekmaaslilar.employee_id || ' - ' ||
      enyuksekmaaslilar.first_name || ' ' ||
      enyuksekmaaslilar.last_name || ' - ' ||
      enyuksekmaaslilar.salary || ' - ' ||
      enyuksekmaaslilar.department_name
    );
  

END LOOP;
CLOSE kaan;
DBMS_OUTPUT.PUT_LINE(kaan%ROWCOUNT);
END;


DECLARE
CURSOR our_emps IS
SELECT employee_id, salary FROM EMPLOYEES
WHERE salary <= 20000 FOR UPDATE NOWAIT;
v_emp_rec our_emps%ROWTYPE;
BEGIN
  OPEN our_emps;
  LOOP
    FETCH our_emps INTO v_emp_rec;
    EXIT WHEN our_emps%NOTFOUND;
    UPDATE EMPLOYEES
    SET salary = v_emp_rec.salary*1.1
    WHERE CURRENT OF our_emps;
    END LOOP;
    CLOSE our_emps;
    END;