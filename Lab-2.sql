CREATE TABLE student(rollNo varchar(9), name varchar(30), degree varchar(5), year number(2,0), sex varchar(1), deptNo number(2,0),advisor varchar(30));
CREATE TABLE department(deptId varchar(9), name varchar(30), hod varchar(30), phone varchar(10));
CREATE TABLE professor(empId varchar(9), name varchar(30), sex varchar(1), startYear DATE, deptNo number(2,0), phone varchar(10));
CREATE TABLE course(courseId varchar(9), cname varchar(30), credits number(2,0), deptNo number(2,0));
CREATE TABLE enrollment(rollNo varchar(9), courseId varchar(9), sem varchar(6), year number(2,0), grade varchar(2));
CREATE TABLE teaching(empId varchar(9), courseId varchar(9), sem varchar(6), year number(2,0), classRoom varchar(10));
CREATE TABLE preRequisite(preCourseId varchar(9), courseId varchar(9));
ALTER TABLE student
MODIFY year number;
ALTER TABLE professor
MODIFY startYear number;
ALTER TABLE enrollment
MODIFY year number;
ALTER TABLE teaching
MODIFY year number;
INSERT ALL
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS21B2037','Vishnu','BTech',2021,'M',2,'Dr.R.Preet')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS22B2026','Abhiram','BTech',2022,'M',2,'Dr.R.Preet')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('CS20B1081','Sujan','BTech',2020,'M',1,'Dr.Santhana Raghavan') 
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('EC21B2030','Sai Kiran','BTech',2021,'M',3,'Dr.Ram Prasad Padhy')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('ME19B2018','Abhishek','BTech',2019,'M',4,'Dr.R.Preet')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('EC22B2019','Siddesh','BTech',2022,'M',3,'Dr.Ram Prasad Padhy')
    INTO student(rollNo, name, degree, year, sex, deptNo, advisor) VALUES('ME20B1061','Kashyap','BTech',2020,'M',4,'Dr.R.Preet')
SELECT 1 FROM dual;
INSERT ALL
    INTO department(deptId, name, hod, phone) VALUES('1','CSE', 'Dr.V.Masilamani','4204204204')
    INTO department(deptId, name, hod, phone) VALUES('2','CS-AI', 'Dr.Ram Prasad Padhy','2102102102')
    INTO department(deptId, name, hod, phone) VALUES('3','ECE', 'Dr.Santhana Raghavan','6969696969') 
    INTO department(deptId, name, hod, phone) VALUES('4','Mech', 'Dr.Timmaraju','1111111111')
    INTO department(deptId, name, hod, phone) VALUES('5','Design', 'Dr.Sudhir Varadarajan','0000000000')
    INTO department(deptId, name, hod, phone) VALUES('6','PET', 'Alagaraj','9889988998')
    INTO department(deptId, name, hod, phone) VALUES('7','English', 'Dr.Parvaty Das','8998899889')
SELECT 1 FROM dual;
INSERT ALL
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('001','Dr.V.Masilamani','M',2011,1,'4204204204')
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('002','Dr.Ram Prasad Padhy','M',2015,2,'2102102102')
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('003','Dr.Santhana Raghavan','M',2015,3,'6969696969') 
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('004','Dr.Timmaraju','M',2012,4,'1111111111')
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('005','Dr.Nachiketa Mishra','M',2018,5,'0000000000')
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('006','Dr.Jagadeesh Kakarla','M',2015,6,'9889988998')
    INTO professor(empId, name, sex, startYear, deptNo, phone) VALUES('007','Dr.R.Preeth','M',2016,7,'8998899889')
SELECT 1 FROM dual;
INSERT ALL
    INTO course(courseId, cname, credits, deptNo) VALUES('CS2008','DBMS',4,1)
    INTO course(courseId, cname, credits, deptNo) VALUES('AI1001','AI',4,2)
    INTO course(courseId, cname, credits, deptNo) VALUES('MA2000','OTML',4,1) 
    INTO course(courseId, cname, credits, deptNo) VALUES('CS2003','DSD',4,1)
    INTO course(courseId, cname, credits, deptNo) VALUES('EC2001','DIP',4,3)
    INTO course(courseId, cname, credits, deptNo) VALUES('ME1001','MECHANICS',4,4)
    INTO course(courseId, cname, credits, deptNo) VALUES('CS2002','ML',4,1)
SELECT 1 FROM dual;
INSERT ALL
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','CS2008','IV',2023,'S')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','AI1001','IV',2023,'S')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','MA2000','IV',2023,'A') 
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','CS2003','IV',2023,'S')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','EC2001','IV',2023,'B')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','ME1001','IV',2023,'A')
    INTO enrollment(rollNo, courseId, sem, year, grade) VALUES('CS21B2037','CS2002','IV',2023,'S')
SELECT 1 FROM dual;
INSERT ALL
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('001','EC2001','VI',2023,'H01')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('002','AI1001','IV',2023,'H05')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('003','CS2003','III',2023,'H12') 
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('004','ME1001','II',2023,'H03')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('005','MA2000','III',2023,'H04')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('006','CS2008','IV',2023,'H11')
    INTO teaching(empId, courseId, sem, year, classRoom) VALUES('007','CS2002','IV',2023,'H10')
SELECT 1 FROM dual;
INSERT ALL
    INTO preRequisite(preCourseId, courseId) VALUES('NONE','CS2008')
    INTO preRequisite(preCourseId, courseId) VALUES('NONE','AI1001')
    INTO preRequisite(preCourseId, courseId) VALUES('NONE','MA2000') 
    INTO preRequisite(preCourseId, courseId) VALUES('NONE','CS2003')
    INTO preRequisite(preCourseId, courseId) VALUES('CS2003','EC2001')
    INTO preRequisite(preCourseId, courseId) VALUES('NONE','ME1001')
    INTO preRequisite(preCourseId, courseId) VALUES('AI1001','CS2002')
SELECT 1 FROM dual;
SET LINESIZE 300;
SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM professor;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM teaching;
SELECT * FROM preRequisite;
SELECT * FROM student;
DELETE FROM student WHERE year=2019 OR year=2020;
SELECT * FROM student;
ALTER TABLE student ADD(emailId varchar(30));
UPDATE student SET emailId = 'cs21b2037@iiitdm.ac.in' WHERE rollNo = 'CS21B2037';
UPDATE student SET emailId = 'cs22b2026@iiitdm.ac.in' WHERE rollNo = 'CS22B2026';
UPDATE student SET emailId = 'ec21b2030@iiitdm.ac.in' WHERE rollNo = 'EC21B2030';
UPDATE student SET emailId = 'ec22b2019@iiitdm.ac.in' WHERE rollNo = 'EC22B2019';
SELECT * FROM student;
SELECT * FROM professor;
ALTER TABLE professor ADD(emailId varchar(30));
UPDATE professor SET emailId = 'masilamani@iiitdm.ac.in' WHERE empId = '001';
UPDATE professor SET emailId = 'rampadhy@iiitdm.ac.in' WHERE empId = '002';
UPDATE professor SET emailId = 'sraghavan@iiitdm.ac.in' WHERE empId = '003';
UPDATE professor SET emailId = 'timmaraju@iiitdm.ac.in' WHERE empId = '004';
UPDATE professor SET emailId = 'nmishra@iiitdm.ac.in' WHERE empId = '005';
UPDATE professor SET emailId = 'jagadeesh@iiitdm.ac.in' WHERE empId = '006';
UPDATE professor SET emailId = 'rpreet@iiitdm.ac.in' WHERE empId = '007';
SELECT * FROM professor;
SELECT * FROM department;
UPDATE department SET hod = 'Christy Thomas', phone = '2222222222' WHERE deptId = '7';
UPDATE department SET hod = 'Dr.Bingi', phone = '3333333333' WHERE deptId = '5';
UPDATE department SET hod = 'Dr.Gurunathan', phone = '4444444444' WHERE deptId = '4';
UPDATE department SET hod = 'Dr. Jagadeesh Kakarla', phone = '9999999999' WHERE deptId = '1';
SELECT * FROM department;
SELECT * FROM professor;
UPDATE professor SET phone = '5555555555' WHERE empId = '001';
UPDATE professor SET phone = '6666666666' WHERE empId = '002';
UPDATE professor SET phone = '7777777777' WHERE empId = '003';
SELECT * FROM professor;
SELECT * FROM student;
ALTER TABLE student ADD(phone varchar(10));
UPDATE student SET phone = '7878787878' WHERE rollNo = 'CS21B2037';
UPDATE student SET phone = '8585858585' WHERE rollNo = 'CS22B2026';
UPDATE student SET phone = '4545454545' WHERE rollNo = 'EC21B2030';
UPDATE student SET phone = '6767676767' WHERE rollNo = 'EC22B2019';
SELECT * FROM student;