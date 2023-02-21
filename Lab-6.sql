-- QuestiON 1
SELECT name FROM (SELECT * FROM professor WHERE empId IN (SELECT hod FROM department)) 
MINUS
SELECT name FROM (SELECT * FROM professor WHERE empId IN (SELECT hod FROM department)) 
WHERE startYear > ANY(SELECT startYear FROM professor WHERE empId IN (SELECT hod FROM department));

-- QuestiON 2
SELECT cname FROM
(SELECT * FROM course WHERE courseId IN 
(SELECT courseId FROM teaching WHERE empId IN
(SELECT empId FROM 
(SELECT * FROM professor WHERE deptNo IN (SELECT deptId FROM department WHERE name = 'Biology')))))
MINUS
SELECT cname FROM
(SELECT * FROM course WHERE courseId IN
(SELECT courseId FROM teaching WHERE empId IN
(SELECT empId FROM
(SELECT * FROM professor WHERE deptNo IN (SELECT deptId FROM department WHERE name = 'Biology')) WHERE startYear > ANY
(SELECT startYear FROM professor WHERE deptNo IN (SELECT deptId FROM department WHERE name = 'Biology')))));

-- QuestiON 3
CREATE TABLE  course_temp AS
SELECT * FROM course INNER JOIN  department ON course.deptNo = department.deptId;
SELECT Cname,name FROM course_temp WHERE courseId in
(SELECT courseId FROM (SELECT courseId, count(prereqcourse) AS abc FROM prerequisite WHERE courseId in
 (SELECT courseId FROM course WHERE deptNo in (SELECT deptNo FROM course GROUP by deptNo)) group by courseId) WHERE abc in (SELECT max(abc) 
FROM(SELECT courseId, count(prereqcourse) AS abc FROM prerequisite WHERE courseId in
 (SELECT courseId FROM course WHERE deptNo = 2) group by courseId) ));

 -- QuestiON 4
 SELECT empId,avg(cnt) FROM teaching INNER JOIN
(SELECT courseId AS cId,count(rollNo) AS cnt FROM (
SELECT teaching.courseId, teaching.empId, enrollment.rollNo, teaching.YEAR FROM teaching INNER JOIN enrollment ON teaching.courseId =enrollment.courseId  WHERE teaching.year = any(2002,2003,2004)) group by courseId) ON teaching.courseId=cId
group by empId;

-- QuestiON 5
SELECT courseId,count(rollNo) FROM enrollment WHERE YEAR=2004 and sem ='even' and courseId in 
(SELECT courseId FROM course WHERE deptNo in (SELECT deptId FROM department WHERE name='Comp. Sci.') ) group by courseId;