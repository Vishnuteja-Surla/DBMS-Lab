SET LINESIZE 200;
SET PAGESIZE 20;

-- Question 1

CREATE TABLE Course_Taken(student_name varchar2(10), course varchar2(25));
CREATE TABLE Course_Required(course varchar2(25));
INSERT ALL
    INTO Course_Taken(student_name, course) VALUES ('Robert', 'Databases')
    INTO Course_Taken(student_name, course) VALUES ('Robert', 'Programming Languages')
    INTO Course_Taken(student_name, course) VALUES ('David', 'Databases')
    INTO Course_Taken(student_name, course) VALUES ('Hannah', 'Programming Languages')
    INTO Course_Taken(student_name, course) VALUES ('Hannah', 'Programming Languages')
    INTO Course_Taken(student_name, course) VALUES ('Tom', 'Operating Systems')
    INTO Course_Taken(student_name, course) VALUES ('David', 'Operating Systems')
SELECT * FROM dual;
INSERT ALL
    INTO Course_Required(course) VALUES ('Databases')
    INTO Course_Required(course) VALUES ('Programming Languages')
SELECT * FROM dual;

SELECT * FROM Course_Taken;
SELECT * FROM Course_Required;

CREATE TABLE T1 AS (SELECT DISTINCT(student_name) FROM Course_Taken);
SELECT * FROM T1;

CREATE TABLE ST1 AS
(SELECT * FROM T1, Course_Required);
SELECT * FROM ST1;

CREATE TABLE T2_0 AS
(SELECT * FROM ST1
MINUS 
SELECT * FROM Course_Taken);
SELECT * FROM T2_0;

CREATE TABLE T2 AS (SELECT DISTINCT(student_name) FROM T2_0);
SELECT * FROM T2;

SELECT * FROM T1
MINUS
SELECT * FROM T2;



-- Question 2

SELECT DISTINCT(student_name) FROM (SELECT * FROM
(SELECT DISTINCT(student_name) FROM Course_Taken),
(SELECT course FROM Course_Required)
MINUS
SELECT student_name, course FROM Course_Taken);

CREATE TABLE Dummy AS (SELECT * FROM Course_Taken WHERE course = ANY(SELECT course FROM Course_Required));
CREATE TABLE Non_Graduate AS SELECT DISTINCT(student_name) FROM (SELECT * FROM ST1 MINUS SELECT * FROM Dummy);
SELECT * FROM Non_Graduate;

SELECT * FROM T1 INTERSECT SELECT DISTINCT(student_name) FROM T2_0;

DROP TABLE T1;
DROP TABLE ST1;
DROP TABLE T2_0;
DROP TABLE T2;
DROP TABLE Dummy;
DROP TABLE Non_Graduate;
DROP TABLE Course_Taken;
DROP TABLE Course_Required;

-- Question 3

CREATE TABLE Bank(Bank_name varchar2(5), State varchar2(15));
CREATE TABLE Account_Holder(Account_Name varchar2(10), Bank_name varchar2(5), State varchar2(15));
INSERT ALL
    INTO Bank(Bank_name, State) VALUES ('SBI', 'ANDHRA PRADESH')
    INTO Bank(Bank_name, State) VALUES ('SBI', 'TAMILNADU')
    INTO Bank(Bank_name, State) VALUES ('SBI', 'KARNATAKA')
    INTO Bank(Bank_name, State) VALUES ('ICICI', 'TAMILNADU')
    INTO Bank(Bank_name, State) VALUES ('ICICI', 'KARNATAKA')
SELECT * FROM dual;
INSERT ALL
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('RAMESH', 'ICICI', 'TAMILNADU')
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('DINESH', 'SBI', 'ANDHRA PRADESH')
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('ROBERT', 'SBI', 'TAMILNADU')
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('ROBERT', 'ICICI', 'KARNATAKA')
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('ROBERT', 'SBI', 'ANDHRA PRADESH')
    INTO Account_Holder(Account_Name, Bank_name, State) VALUES ('KARTHIK', 'SBI', 'ANDHRA PRADESH')
SELECT * FROM dual;

SELECT * FROM Bank;
SELECT * FROM Account_Holder;


CREATE TABLE T1 AS (SELECT DISTINCT(Account_Name) FROM Account_Holder);
SELECT * FROM T1;
CREATE TABLE ST1 AS
(SELECT * FROM T1, Bank);
CREATE TABLE T2_0 AS
(SELECT * FROM ST1
MINUS 
SELECT * FROM Account_Holder);
CREATE TABLE T2 AS (SELECT DISTINCT(Account_Name) FROM T2_0);
SELECT * FROM T1
MINUS
SELECT * FROM T2;

DROP TABLE T1;
DROP TABLE ST1;
DROP TABLE T2_0;
DROP TABLE T2;


CREATE TABLE States AS (SELECT DISTINCT(State) FROM Bank);

CREATE TABLE T1 AS (SELECT DISTINCT(Bank_name) FROM Bank);
SELECT * FROM T1;
CREATE TABLE ST1 AS
(SELECT * FROM T1, States);
CREATE TABLE T2_0 AS
(SELECT * FROM ST1
MINUS 
SELECT * FROM Bank);
CREATE TABLE T2 AS (SELECT DISTINCT(Bank_name) FROM T2_0);
SELECT * FROM T1
MINUS
SELECT * FROM T2;
SELECT * FROM T2;

DROP TABLE T1;
DROP TABLE ST1;
DROP TABLE T2_0;
DROP TABLE T2;

CREATE TABLE Account_State AS (SELECT Account_Name, State FROM Account_Holder);

CREATE TABLE T1 AS (SELECT DISTINCT(Account_Name) FROM Account_State);
SELECT * FROM T1;
CREATE TABLE ST1 AS
(SELECT * FROM T1, States);
CREATE TABLE T2_0 AS
(SELECT * FROM ST1
MINUS 
SELECT * FROM Account_State);
CREATE TABLE T2 AS (SELECT DISTINCT(Account_Name) FROM T2_0);
SELECT * FROM T1
MINUS
SELECT * FROM T2;

DROP TABLE T1;
DROP TABLE ST1;
DROP TABLE T2_0;
DROP TABLE T2;
DROP TABLE States;
DROP TABLE Account_State;


DROP TABLE Bank;
DROP TABLE Account_Holder;
