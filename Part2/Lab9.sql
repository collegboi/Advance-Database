/* Golf DB 1 and DB 2*/
drop table results1;
drop table results2;
drop table players1;
drop table players2;
drop table team1;
drop table team2;
drop table tournament1;
drop table tournament2;


Create Table Team1(
Team_id integer primary key,
Team_name varchar(100)
);

Create Table Team2(
Team_id integer primary key,
Team_name varchar(100)
);

Create Table Players1(
p_id integer primary key,
p_name varchar(50),
p_sname varchar(50),
team_id integer,
constraint fk_team_1 foreign key (team_id) references team1
);

Create Table Players2(
p_id integer primary key,
p_name varchar(50),
p_sname varchar(50),
team_id integer,
constraint fk_team_2 foreign key (team_id) references team2
);

Create Table Tournament1(
T_id integer primary key,
t_descriprion varchar(100),
t_date date,
Total_price float
);

Create Table Tournament2(
T_id integer primary key,
t_descriprion varchar(100),
t_date date,
Total_price float
);

Create Table Results1(
t_id integer,
p_id integer,
rank integer,
price float,
CONSTRAINT  FK_player1 FOREIGN KEY (p_id) REFERENCES players1,
CONSTRAINT  FK_tournament1 FOREIGN KEY (t_id) REFERENCES tournament1,
CONSTRAINT PK_Results1 PRIMARY KEY (t_id,p_id)
);

Create Table Results2(
t_id integer,
p_id integer,
rank integer,
price float,
CONSTRAINT  FK_player2 FOREIGN KEY (p_id) REFERENCES players2,
CONSTRAINT  FK_tournament2 FOREIGN KEY (t_id) REFERENCES tournament2,
CONSTRAINT PK_Results2 PRIMARY KEY (t_id,p_id)
);

/* END ER DIAGRAM */


/* data */
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES (1, 'USA');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES (2, 'AUSTRALIA');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES (3, 'UK');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES (4, 'IRELAND');

INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES (1, 'UK');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES (2, 'IRELAND');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES (3, 'USA');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES (4, 'ITALY');



INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (1, 'Tiger', 'Woods', 1);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (2, 'Mary', 'Smith', 2);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (3, 'Mark', 'Deegan', 2);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (4, 'James', 'Bryan', 3);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (5, 'John', 'McDonald', 1);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (6, 'Mario', 'Baggio', 1);

INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (2, 'Tiger', 'Woods', 3);
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (1, 'John', 'McDonald', 3);
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (3, 'Jim', 'Burke', 3);
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (4, 'Paul', 'Bin', 3);
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (5, 'Peter', 'Flynn', 3);
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (6, 'Martha', 'Ross', 4);


INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (1, 'US open', 1700000,'01-jan-2014');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (2, 'British Open', 7000000,'01-apr-2014');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (3, 'Italian Open', 2000000,'11-mar-2014');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (4, 'Irish Open', 300000,'21-jul-2014');

INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (1, 'Dutch open', 1700000,'22-nov-2014');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (2, 'French Open', 7000000,'17-dec-2014');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (3, 'Spanish Open', 2000000,'03-mar-2014');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (4, 'Chiinese Open', 300000,'15-jul-2014');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (5, 'Dubai Open', 600000,'10-aug-2014');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE,t_date) VALUES (6, 'US Master', 1000000,'10-jul-2014');


INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (1, 1, 1, 10000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (1, 2, 2, 20000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (2, 2, 4, 1000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (3, 2, 3, 10000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (3, 1, 2, 1100);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (4, 6, 3, 6000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (4, 2, 2, 9000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (4, 1, 1, 10000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (3, 5, 2, 9500);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (4, 5, 4, 10000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (2, 5, 7, 100);

INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (1, 1, 1, 1000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (1, 2, 3, 2000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (2, 2, 1, 6000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (3, 2, 3, 17000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (3, 1, 12, 1100);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (4, 6, 10, 8000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (4, 2, 2, 12000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (4, 1, 3, 10000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (3, 5, 1, 9000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (4, 5, 5, 1000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (2, 5, 3, 1000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (5, 5, 3, 8000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (5, 2, 2, 16000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (5, 1, 1, 20000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (6, 1, 3, 2000);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (6, 5, 2, 9400);
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES (6, 4, 1, 12000);

--Middle Stage

/* INITIAL ETL */
/* Load Dimension Customers */
/* Staging Area */

drop table teams_stage;
drop table players_stage;
drop table tournaments_stage;
drop table fact_stage;

/* Teams */

create table teams_stage(
t_sk integer,
sourceDB integer,
t_id integer,
t_name varchar(100)
);

create sequence t_stage_seq 
start with 1 
increment by 1 
nomaxvalue; 

drop trigger t_stage_trigger;

create trigger t_stage_trigger
before insert on teams_stage
for each row
begin
  select t_stage_seq.nextval into :new.t_sk from dual;
end;


insert into teams_stage (sourcedb,t_id,t_name) 
select 1,Team_id,Team_name from Team1;

insert into teams_stage (sourcedb,t_id,t_name) 
select 2,Team_id,Team_name from Team2;

/* Player */
drop table players_stage;
create table players_stage(
p_sk integer,
sourceDB integer,
p_id integer,
t_id integer,
p_name varchar(100),
ps_name varchar(100)
);

create sequence p_stage_seq 
start with 1 
increment by 1 
nomaxvalue; 

drop trigger p_stage_trigger;

create trigger p_stage_trigger
before insert on players_stage
for each row
begin
  select p_stage_seq.nextval into :new.p_sk from dual;
end;

insert into PLAYERS_STAGE (sourcedb,p_id,p_name, ps_name,t_id) 
select 1,p_id,p_name,p_sname,team_id from PLAYERS1;

insert into PLAYERS_STAGE (sourcedb,p_id,p_name,ps_name, t_id) 
select 2,p_id,p_name, p_sname,team_id from PLAYERS2;

select * from PLAYERS_STAGE;

/* Tournaments */
drop table tournaments_stage;
create table tournaments_stage(
to_sk integer,
sourceDB integer,
to_id integer,
to_descriprion varchar(100),
to_total_price float
);

create sequence to_stage_seq 
start with 1 
increment by 1 
nomaxvalue; 

drop trigger to_stage_trigger;

create trigger to_stage_trigger
before insert on tournaments_stage
for each row
begin
  select to_stage_seq.nextval into :new.to_sk from dual;
end;

insert into tournaments_stage (sourcedb,to_id,to_descriprion, to_total_price) 
select 1,T_id,t_descriprion,Total_price from TOURNAMENT1;

insert into tournaments_stage (sourcedb,to_id,to_descriprion,to_total_price) 
select 2,T_id,t_descriprion, Total_price from TOURNAMENT2;

select * from TOURNAMENTS_STAGE;

/* Stage Date */
drop table date_stage;
Create table date_stage(
date_sk integer primary key,
day_value integer,
month_value integer,
year_value integer,
week_value integer,
querter_value integer,
week_day_value integer,
complete_date date
);

create sequence date_stage_seq 
start with 1 
increment by 1 
nomaxvalue; 

drop trigger date_stage_trigger;

create trigger date_stage_trigger
before insert on date_stage
for each row
begin
select date_stage_seq.nextval into :new.date_sk from dual;
end;

--------------------------------------------------

BEGIN
   FOR tournament_rec IN (
        SELECT *
          FROM TOURNAMENT1)
   LOOP
      INSERT_DATE_STAGE( tournament_rec.t_date ); 
   END LOOP;
END;

BEGIN
   FOR tournament_rec IN (
        SELECT *
          FROM TOURNAMENT2)
   LOOP
      INSERT_DATE_STAGE( tournament_rec.t_date ); 
   END LOOP;
END;

select * from date_stage;

----------------------------------------------------

CREATE OR REPLACE PROCEDURE INSERT_DATE_STAGE (
  DATEPARAM IN DATE 
) AS 
BEGIN
  INSERT INTO DATE_STAGE (DAY_VALUE, MONTH_VALUE, YEAR_VALUE, QUERTER_VALUE, WEEK_DAY_VALUE ) VALUES (
  cast(to_char(DATEPARAM,'DD') as integer), cast(to_char(DATEPARAM,'MM') as integer),cast(to_char(DATEPARAM,'YYYY') as integer),
  cast(to_char(DATEPARAM,'Q') as integer), cast(to_char(DATEPARAM,'D') as integer)
  );
END INSERT_DATE_STAGE;

/* facts */
DROP TABLE FACT_STAGE;
Create table fact_stage(
t_sk integer,
p_sk integer,
to_sk integer,
date_sk integer,
t_id integer,
p_id integer,
to_id integer,
t_date Date,
rank integer,
price float,
sourcedb integer
);

select * from teams_stage;
select * from fact_stage;
select * from TOURNAMENTS_STAGE;

SELECT * FROM TOURNAMENTS_STAGE TS JOIN FACT_STAGE FT ON TS.TO_ID = FT.to_id AND TS.sourcedb = FT.sourcedb ;

INSERT INTO FACT_STAGE( RANK, PRICE, to_id, p_id, sourcedb,t_date, t_id ) SELECT R.RANK, ( R.PRICE * 1.3), R.t_id, R.p_id, 1, T.T_DATE, P.TEAM_ID FROM Results1 R 
                            JOIN TOURNAMENT1 T ON R.T_ID = T.T_ID JOIN PLAYERS1 P ON R.P_ID = P.P_ID;
            
INSERT INTO FACT_STAGE( RANK, PRICE, to_id, p_id, sourcedb,t_date, t_id ) SELECT R.RANK, ( R.PRICE * 1.3), R.t_id, R.p_id, 2, T.T_DATE, P.TEAM_ID FROM Results2 R 
                            JOIN TOURNAMENT2 T ON R.T_ID = T.T_ID JOIN PLAYERS2 P ON R.P_ID = P.P_ID;

UPDATE FACT_STAGE FT SET T_SK = ( SELECT T_SK FROM teams_stage WHERE T_ID = FT.T_ID  
                                    AND sourcedb = FT.sourcedb );

UPDATE FACT_STAGE FT SET p_sk = ( SELECT p_sk FROM PLAYERS_stage WHERE P_ID = FT.P_ID  
                                    AND sourcedb = FT.sourcedb );
                                    
UPDATE FACT_STAGE FT SET to_sk = ( SELECT to_sk FROM TOURNAMENTS_STAGE
                                    WHERE TO_ID = FT.to_id AND sourcedb = FT.sourcedb );
                                    
UPDATE FACT_STAGE FT SET date_sk = ( SELECT date_sk FROM DATE_stage WHERE complete_date = FT.t_date  ) ;
                                    
select sourcedb, T_ID, P_ID from FACT_STAGE;                                 

COMMIT;

/*  Dimensional Model Stage */

/* DIMENSIONAL MODEL */
drop table fact_results;

drop table DimPlayer;
create Table DimPlayer(
p_sk integer primary key,
p_name varchar(100),
ps_name varchar(100)
);

create table DimTeam(
t_sk integer primary key,
t_name varchar(100)
);

create table DimTournament(
to_sk integer primary key,
to_descriprion varchar(100),
to_total_price float
);

create table DimDate(
date_sk integer primary key,
day_value integer,
month_value integer,
year_value integer,
quarter_value integer,
day_of_week_value integer
);

create table fact_results(
p_sk integer,
t_sk integer,
to_sk integer,
date_sk integer,
rank integer,
price float,
CONSTRAINT  FK_dimplayer FOREIGN KEY (p_sk) REFERENCES DimPlayer,
CONSTRAINT  FK_dimteam FOREIGN KEY (t_sk) REFERENCES DimTeam,
CONSTRAINT  FK_dimtournament FOREIGN KEY (to_sk) REFERENCES DimTournament,
CONSTRAINT  FK_dimdate FOREIGN KEY (date_sk) REFERENCES DimDate,
CONSTRAINT PK_factresults PRIMARY KEY (p_sk,t_sk,to_sk,date_sk)
);

insert into fact_results select p_sk,t_sk,to_sk,date_sk, rank, price from fact_stage where
NOT EXISTS (SELECT * FROM fact_results fs
              WHERE  fact_stage.p_sk= fs.p_sk and fact_stage.t_sk= fs.t_sk 
              and fact_stage.to_sk= fs.to_sk and fact_stage.to_sk= fs.date_sk
              and fact_stage.rank= fs.rank and fact_stage.price= fs.price);  /* updating only new entities */
              
insert into DimPlayer select p_sk, p_name, ps_name from PLAYERS_STAGE PS WHERE NOT EXIST (
SELECT * FROM DimPlayer DP WHERE PS.p_name = DP.p_name and PS.ps_name = DP.ps_name);

insert into DimTeam select t_sk, t_name from TEAMS_STAGE;

insert into DimTournament select to_sk, TO_DESCRIPRION, to_total_price from TOURNAMENTS_STAGE;

insert into DimDate select date_sk, day_value, month_value,year_value,querter_value, week_day_value from DATE_STAGE;
              
select * from fact_results;

--Part 2

INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (7, 'Alan', 'Parker', 1); 
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (8, 'Martha', 'Bag', 2);

INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES (5, 'Saudi Open', 500000);

INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (5, 1, 1, 60000); 
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (5, 7, 5, 20000); 
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (2, 8, 3, 1000);



