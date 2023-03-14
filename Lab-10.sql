SET LINESIZE 200;
SET PAGESIZE 20;

conn system/tiger
Grant create view to scott;

CREATE TABLE Student(RollNo varchar2(8), SName varchar2(20), Gender varchar2(1), City varchar2(20), 
CONSTRAINT Student_pk PRIMARY KEY(RollNo));
CREATE TABLE Course(CCode varchar2(5), CName varchar2(20), Credit number, 
CONSTRAINT Course_pk PRIMARY KEY(CCode));
CREATE TABLE Enrolled(RollNo varchar2(8), CCode varchar2(5), YoE number, 
CONSTRAINT Enrolled_fk_1 FOREIGN KEY(RollNo) REFERENCES Student(RollNo), 
CONSTRAINT Enrolled_fk_2 FOREIGN KEY(CCode) REFERENCES Course(CCode));

INSERT ALL
    INTO Student(RollNo, SName, Gender, City) VALUES ('1901CS99', 'Anand', 'M', 'Hyderabad')
    INTO Student(RollNo, SName, Gender, City) VALUES ('1901CS98', 'Priya', 'F', 'Delhi')
    INTO Student(RollNo, SName, Gender, City) VALUES ('1901EC97', 'Shreya', 'F', 'Delhi')
    INTO Student(RollNo, SName, Gender, City) VALUES ('1901EC96', 'Abhi', 'M', 'Mumbai')
    INTO Student(RollNo, SName, Gender, City) VALUES ('1901ME95', 'Mrunal', 'F', 'Mumbai')
SELECT * FROM dual;

INSERT ALL
    INTO Course (CCode, CName, Credit) VALUES ('CS500', 'DBMS', 4)
    INTO Course (CCode, CName, Credit) VALUES ('CS555', 'ML', 3)
    INTO Course (CCode, CName, Credit) VALUES ('EC300', 'COA', 4)
    INTO Course (CCode, CName, Credit) VALUES ('EC696', 'DSD', 3)
    INTO Course (CCode, CName, Credit) VALUES ('ME969', 'MFE', 2)
    INTO Course (CCode, CName, Credit) VALUES ('ME900', 'MOM', 4)
SELECT * FROM dual;

INSERT ALL
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'CS500', 2020)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'CS555', 2020)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'EC300', 2020)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'EC696', 2020)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'ME969', 2020)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS99', 'ME900', 2021)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901EC96', 'CS500', 2021)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901EC96', 'EC300', 2022)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901EC96', 'EC696', 2021)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901CS98', 'CS555', 2019)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901EC97', 'CS555', 2021)
    INTO Enrolled (RollNo, CCode, YoE) VALUES ('1901ME95', 'ME900', 2021)
SELECT * FROM dual;

SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrolled;

-- Question A
ALTER TABLE Course ADD CType varchar(20);
ALTER TABLE Student ADD Email varchar(30);
UPDATE Course 
SET CType = CASE CCode
    WHEN 'CS500' THEN 'Elective'
    WHEN 'CS555' THEN 'Core'
    WHEN 'EC300' THEN 'Core'
    WHEN 'EC696' THEN 'Elective'
    WHEN 'ME969' THEN 'Open-Elective'
    WHEN 'ME900' THEN 'Core'
END;
UPDATE Student 
SET Email = CASE SName
    WHEN 'Anand' THEN 'anand@gmail'
    WHEN 'Priya' THEN 'priya@yahoo'
    WHEN 'Shreya' THEN 'shreya@outlook'
    WHEN 'Abhi' THEN 'abhi@gmail'
    WHEN 'Mrunal' THEN 'mrunal@yahoo'
END;

CREATE OR REPLACE VIEW StudentEmail AS
SELECT RollNo, SName, Email FROM Student; 
CREATE VIEW CourseType AS
SELECT CCode, CType FROM Course;

SELECT * FROM StudentEmail;
SELECT * FROM CourseType;

-- Question B
CREATE OR REPLACE VIEW CSCourses AS
SELECT CName FROM Course WHERE CCode LIKE 'CS%';
SELECT * FROM CSCourses;

-- Question C
CREATE OR REPLACE VIEW MaleStudentWithTwoAs AS
SELECT SName FROM Student WHERE SName LIKE '%A%a%';
SELECT * FROM MaleStudentWithTwoAs;

-- Question D
CREATE OR REPLACE VIEW StudentnotIn_1819 AS
SELECT * FROM Student WHERE RollNo IN 
(SELECT RollNo FROM Enrolled WHERE YoE NOT IN (2018, 2019));
SELECT * FROM StudentnotIn_1819;

-- Question E
CREATE OR REPLACE VIEW LeastCreditCourses AS
SELECT * FROM Course WHERE Credit IN (SELECT min(Credit) FROM Course);
SELECT * FROM LeastCreditCourses;

-- Question F
CREATE OR REPLACE VIEW NotEnrolledIn2020 AS
SELECT CName FROM Course WHERE CCode IN (SELECT CCode FROM Enrolled WHERE YoE NOT IN (2020));
SELECT * FROM NotEnrolledIn2020;

-- Question G
CREATE OR REPLACE VIEW NoOfStudentsFromACity AS
SELECT City, COUNT(RollNo) AS NoOfStudents FROM Student GROUP BY City;
SELECT * FROM NoOfStudentsFromACity;

-- Question H
CREATE OR REPLACE VIEW StudentsEnrolledIn5Courses AS
SELECT RollNo FROM Enrolled GROUP BY RollNo HAVING COUNT(CCode) = 5;
SELECT * FROM StudentsEnrolledIn5Courses;

-- Question I
CREATE OR REPLACE VIEW NoOfCoursesof1901CS99 AS
SELECT COUNT(RollNo) AS NoOfCourses FROM Enrolled WHERE RollNo = '1901CS99';
SELECT * FROM NoOfCoursesof1901CS99; 

-- Question J
CREATE OR REPLACE VIEW Level5Courses AS
SELECT * FROM Course WHERE CCode LIKE '__5%';
SELECT * FROM Level5Courses;

-- Question K
CREATE OR REPLACE VIEW StudentsFromCS AS
SELECT COUNT(RollNo) AS NoOfStudents FROM Student WHERE RollNo LIKE '%CS%';
SELECT * FROM StudentsFromCS;

-- Question L
CREATE OR REPLACE VIEW MoreThan4Coursesin2020 AS
SELECT RollNo FROM Enrolled WHERE YoE = 2020 GROUP BY RollNo HAVING COUNT(CCode) > 4;
SELECT * FROM MoreThan4Coursesin2020;

-- Question M
CREATE OR REPLACE VIEW CourseTakenByFemalesFromDelhi AS
SELECT DISTINCT(CCode) 
FROM Enrolled INNER JOIN Student
ON Enrolled.RollNo = Student.RollNo AND Student.City = 'Delhi' AND Student.Gender = 'F';
SELECT * FROM CourseTakenByFemalesFromDelhi;

-- Question N
CREATE OR REPLACE VIEW DomainList AS
SELECT SName FROM Student WHERE Email LIKE '%@gmail' OR Email LIKE '%@yahoo';
SELECT * FROM DomainList;

-- Question O
CREATE OR REPLACE VIEW StudentInAllCourses AS
SELECT RollNo FROM Enrolled GROUP BY RollNo HAVING COUNT(CCode) = (SELECT COUNT(CCode) FROM Course);
SELECT * FROM StudentInAllCourses;

DROP TABLE Enrolled;
DROP TABLE Course;
DROP TABLE Student;