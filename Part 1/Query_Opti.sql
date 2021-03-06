drop table persons;
create table persons(
person_id integer,
person_name varchar(20),
person_surname varchar(20),
person_age integer not null,
person_wealth integer,
person_weight float
);

drop table jobs_person;
create table jobs_person(
jobs_id integer,
person_id integer,
start_date date,
end_date date);

drop table jobs;
create table jobs(
jobs_id integer,
job_description varchar(200),
salary integer
);

/* populate table persons */
declare v_p_id number;
 v_p_name varchar2(20);
 v_p_surname varchar2(20);
 v_p_age integer;
 p_wealth float;
 p_weight float;
BEGIN
  FOR i IN 1..10000 LOOP 
   select DBMS_RANDOM.STRING('a', 20) into v_p_name from dual;
   select DBMS_RANDOM.STRING('a', 20) into v_p_surname from dual;
   SELECT TRUNC(DBMS_RANDOM.VALUE(18, 100)) into v_p_age FROM DUAL;
   SELECT TRUNC(DBMS_RANDOM.VALUE(0,10000000)) into p_wealth FROM DUAL;
   SELECT trunc(DBMS_RANDOM.VALUE(40, 120),2) into p_weight FROM DUAL;
   insert into persons values(i,v_p_name,v_p_surname,v_p_age,p_wealth,p_weight);
  END LOOP;
end;

/* EXECUTE THE COMMAND ONE BY ONE !!!! */

/* populate table jobs */
declare j_id number;
 j_description varchar2(100);
 j_salary float;
BEGIN
  FOR i IN 1..10000 LOOP 
   select DBMS_RANDOM.STRING('a', 100) into j_description from dual;
   SELECT TRUNC(DBMS_RANDOM.VALUE(0,100000)) into j_salary FROM DUAL;
   insert into jobs values(i,j_description,j_salary);
  END LOOP;
end;

/* populate table jobs-persons */
declare j_id number;
 p_id integer;
 start_date date;
 end_date date;
 st integer;
 en integer;
BEGIN
  FOR i IN 1..10000 LOOP 
   FOR j in 1..15 LOOP
   SELECT TRUNC(DBMS_RANDOM.VALUE(0,1000000)) into p_id FROM DUAL;
   SELECT TRUNC(DBMS_RANDOM.VALUE(0, 1000)) into st FROM DUAL;
   SELECT TRUNC(DBMS_RANDOM.VALUE(0, 2000)) into en FROM DUAL;
   SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641,2452641+st)),'J') into start_date FROM DUAL;
   SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641+st,2452641+st+en)),'J') into end_date FROM DUAL;
   insert into jobs_person values(i,j,start_date,end_date);
    END LOOP;
  END LOOP;
end;

SELECT p.person_name, j.salary, j.job_description
FROM persons p INNER JOIN jobs_person jp ON p.person_id = jp.person_id INNER JOIN jobs j ON jp.jobs_id=j.jobs_id
WHERE jp.start_date> '01-JAN-2003' and jp.end_date < '31-DEC-03';

ALTER TABLE persons ADD CONSTRAINT PK_persons PRIMARY KEY (person_id);
ALTER TABLE jobs ADD CONSTRAINT PK_jobs PRIMARY KEY (jobs_id);
ALTER TABLE jobs_person ADD CONSTRAINT PK_jobs_person PRIMARY KEY (jobs_id,person_id);

DELETE FROM JOBS_PERSON WHERE PERSON_ID IN ( 
    SELECT PERSON_ID FROM JOBS_PERSON GROUP BY PERSON_ID HAVING COUNT(*) > 1 
);

SELECT p.person_name, j.salary, j.job_description
FROM persons p INNER JOIN jobs_person jp ON p.person_id = jp.person_id INNER JOIN jobs j ON jp.jobs_id=j.jobs_id
WHERE jp.start_date> TO_DATE('01-JAN-2003', 'DD-MM-YYYY') and jp.end_date < TO_DATE('31-DEC-03','DD-MM-YY');

