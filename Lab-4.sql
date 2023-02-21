-- Question-1
CREATE TABLE committees(committee_id varchar2(6), name varchar2(20), age number);
CREATE TABLE member(member_id varchar2(6), name varchar2(20));
INSERT ALL
    INTO committees(committee_id, name, age) VALUES('101','Ramesh',20)
    INTO committees(committee_id, name, age) VALUES('102','Suresh',20)
    INTO committees(committee_id, name, age) VALUES('103','Hritik',30)
SELECT 1 FROM dual;
INSERT ALL
    INTO member(member_id, name) VALUES('m101','Ramesh')
    INTO member(member_id, name) VALUES('m102','Suresh')
    INTO member(member_id, name) VALUES('m103','Rakesh')
SELECT 1 FROM dual;
SELECT * FROM committees;
SELECT * FROM member;
SELECT committees.name FROM committees
LEFT JOIN member ON committees.name = member.name
MINUS
SELECT committees.name FROM committees
INNER JOIN member ON committees.name = member.name;
SELECT member.name FROM member
LEFT JOIN committees ON member.name = committees.name
MINUS
SELECT member.name FROM member
INNER JOIN committees ON member.name = committees.name;
SELECT A.* ,B.* FROM committees A, committees B;
SELECT DISTINCT(A.name) AS name
FROM committees A, committees B
WHERE A.age = B.age and A.name != B.name;

-- Question-2
SELECT DISTINCT student.name, student.rollNo FROM student
INNER JOIN teaching ON student.advisor = teaching.empId
INNER JOIN enrollment ON student.rollNo = enrollment.rollNo and teaching.courseId = enrollment.courseId;

-- Question-3
SELECT * FROM (SELECT preReqCourse FROM prerequisite WHERE courseId in
(SELECT preReqCourse FROM prerequisite WHERE courseId='608')
union
SELECT preReqCourse FROM prerequisite WHERE courseId='608') INNER JOIN course ON course.courseId=preReqCourse;

-- Question-4
CREATE TABLE L4_4 as
SELECT teaching.* FROM teaching
WHERE courseId = '319';

CREATE TABLE L4_4_1 as
SELECT teaching.* FROM teaching
INNER JOIN L4_4 ON teaching.empId = L4_4.empId;
SELECT DISTINCT student.name, student.rollNo FROM student
LEFT JOIN enrollment ON student.rollNo = enrollment.rollNo
LEFT JOIN teaching ON enrollment.courseId = teaching.courseId
MINUS
SELECT DISTINCT student.name, student.rollNo FROM student
INNER JOIN enrollment ON student.rollNo = enrollment.rollNo
INNER JOIN L4_4_1 ON enrollment.courseId = L4_4_1.courseId;

DROP TABLE L4_4_1;
DROP TABLE L4_4;

-- Question-5
SELECT student.rollNo, student.name FROM student
INNER JOIN enrollment ON student.rollNo = enrollment.rollNo
INNER JOIN prerequisite On enrollment.courseId = prerequisite.preReqCourse
AND prerequisite.courseId = '760' and enrollment.grade='S';

-- Question-6
SELECT A.*,B.* FROM enrollment A, enrollment B;
SELECT DISTINCT(A.rollNo) FROM enrollment A, enrollment B WHERE A.rollNo=B.rollNo AND A.courseId=B.courseId AND A.year!=B.year;