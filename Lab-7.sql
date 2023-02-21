SET LINESIZE 200;
SET PAGESIZE 20;

-- Question 1

CREATE TABLE Agent(agent_code varchar2(5), agent_name varchar2(10), working_area varchar2(15), commision number(2,2), phone_no varchar2(10), country varchar2(10),
CONSTRAINT Agent_pk PRIMARY KEY(agent_code));
CREATE TABLE Orders(ord_num varchar2(3), ord_amount number, advance_amount number, ord_date date, cust_code varchar(4), agent_code varchar(5), description varchar(20),
CONSTRAINT Orders_fk FOREIGN KEY(agent_code) REFERENCES Agent(agent_code), CONSTRAINT Orders_pk PRIMARY KEY(ord_num));
INSERT ALL
    INTO Agent(agent_code, agent_name, working_area, commision, phone_no, country) VALUES ('Ac001','Ramesh','Bangalore',.15,'0331234567','India')
    INTO Agent(agent_code, agent_name, working_area, commision, phone_no, country) VALUES ('Ac002','Dinesh','Bangalore',.25,'0331234568','India')
    INTO Agent(agent_code, agent_name, working_area, commision, phone_no, country) VALUES ('Ac003','Suresh','Mumbai',.35,'0331234569','London')
    INTO Agent(agent_code, agent_name, working_area, commision, phone_no, country) VALUES ('Ac004','Kamlesh','New Jersey',.68,'0331234564','London')
    INTO Agent(agent_code, agent_name, working_area, commision, phone_no, country) VALUES ('Ac005','Kartik','Chennai',.73,'0331234563','India')
SELECT * FROM dual;
INSERT ALL
    INTO Orders(ord_num, ord_amount, advance_amount, ord_date, cust_code, agent_code, description) VALUES ('004', 200, 3000, '15-aug-2020', 'C004', 'Ac001', 'Masala Kulcha')
    INTO Orders(ord_num, ord_amount, advance_amount, ord_date, cust_code, agent_code, description) VALUES ('007', 600, 5000, '17-sep-2020', 'C006', 'Ac003', 'Biriyani')
    INTO Orders(ord_num, ord_amount, advance_amount, ord_date, cust_code, agent_code, description) VALUES ('008', 700, 100, '19-feb-2019', 'C007', 'Ac005', NULL)
    INTO Orders(ord_num, ord_amount, advance_amount, ord_date, cust_code, agent_code, description) VALUES ('009', 10000, 600, '21-mar-2010', 'C009', 'Ac004', 'Masala Dosa')
    INTO Orders(ord_num, ord_amount, advance_amount, ord_date, cust_code, agent_code, description) VALUES ('010', 20, 600, '21-apr-2012', 'C006', 'Ac005', NULL)
SELECT * FROM dual; 

SELECT * FROM Agent;
SELECT * FROM Orders;

SELECT ord_num, ord_amount, ord_date, cust_code, agent_code FROM Orders WHERE agent_code IN 
(SELECT agent_code FROM Agent WHERE 
country IN (SELECT country FROM Agent GROUP BY country HAVING count(country)>1) 
OR 
working_area IN (SELECT working_area FROM Agent GROUP BY working_area HAVING count(working_area)>1));

SELECT ord_num, ord_amount, cust_code, agent_code FROM orders WHERE 
agent_code IN (SELECT agent_code FROM agent WHERE agent_code IN 
(SELECT agent_code FROM agent WHERE agent.agent_code=orders.agent_code and agent_name like '%a%') 
and 
working_area not in(SELECT working_area FROM agent group by working_area having count(working_area)>1));

DROP TABLE Orders;
DROP TABLE Agent;

-- Question 2

CREATE TABLE employees(employee_id number(3,0), first_name varchar(10), last_name varchar(10), email varchar(15), phone_number varchar(10), hire_date date, job_id varchar(5), salary number, manager_id number, department_id number,
CONSTRAINT Employee_pk PRIMARY KEY(employee_id));

INSERT ALL
    INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES (700, 'Hasmukh', 'Patel', 'hp@gmail.com', '7003216160','15-aug-2020','Hp003', 7000, NULL, 90)
    INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES (800, 'Kamlesh', 'Paul', 'kp@gmail.com', '7003216170','17-feb-2020','Kp004', 8000, 506, 90)
    INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES (900, 'Dinesh', 'Gandhi', 'dp@yahoo', '9136278563','19-mar-2101','Dg006', 20000, 508, 80)
    INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES (701, 'Suresh', 'Modi', 'sm@dg.com', '9187653294','20-apr-2015','Sm009', 15000, NULL, 80)
SELECT 1 from dual;

SELECT * FROM employees;

SELECT employee_id, manager_id, first_name, last_name FROM employees WHERE
manager_id is NULL 
AND 
salary<(SELECT avg(salary) FROM employees WHERE last_name LIKE 'P%');

DROP TABLE employees;

-- Question 3

CREATE TABLE salesman(salesman_id varchar(8), name varchar(15),city varchar(15),commission float,
CONSTRAINT salesman_pk PRIMARY KEY(salesman_id));
CREATE TABLE Orders(ord_no number, purch_amt number, ord_date date, customer_id varchar(5), salesman_id varchar(8),
CONSTRAINT Orders_fk FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL, CONSTRAINT Orders_pk PRIMARY KEY(ord_no));
INSERT ALL
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@06', 'Lakshmi', 'Kolkata', .5)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@09', 'Ganesh', 'London', .6)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@90', 'Dinesh', 'London', .3)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@10', 'Joseph', 'Chennai', .6)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@19', 'Mahesh', 'Chennai', .65)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@26', 'Paul Adam', 'London', .1)
    INTO salesman(salesman_id, name ,city ,commission ) VALUES ('si123@67', 'Rahul', 'Kolkata', .4)
SELECT 1 FROM dual;
INSERT ALL
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (123, 600, '20-aug-2010', '003cd', 'si123@19')
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (576, 750, '20-feb-2018', '004cd', 'si123@19')
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (579, 800, '20-may-2012', '004cd', 'si123@26')
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (600, 60000, '20-jan-2021', '006cd', 'si123@10')
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (700, 745, '26-jan-2021', '007cd', 'si123@09')
    INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (800, 860, '29-jan-2019', '007cd', 'si123@26')
SELECT 1 FROM dual;

SELECT * FROM salesman;
SELECT * FROM Orders;

SELECT ord_no, purch_amt, ord_date, customer_id FROM Orders WHERE
salesman_id in 
(SELECT a.salesman_id FROM salesman a WHERE a.commission > (SELECT avg(b.commission) FROM salesman b WHERE a.city=b.city GROUP BY city));

DELETE FROM salesman WHERE commission > 0.2;

ALTER TABLE Orders
DISABLE CONSTRAINT Orders_fk;

UPDATE Orders SET salesman_id = 'NA' WHERE salesman_id is NULL;

ALTER TABLE Orders
ENABLE CONSTRAINT Orders_fk;

SELECT * FROM salesman;
SELECT * FROM Orders;

DROP TABLE Orders;
DROP TABLE salesman;