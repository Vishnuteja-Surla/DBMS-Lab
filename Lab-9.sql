SET SERVEROUTPUT ON
SET LINESIZE 150;
SET PAGESIZE 20;

-- Question 1
DECLARE
    a real;
    b real;
    c real;
    maximum real;
BEGIN
    a := &a;
    dbms_output.put_line(a);
    b := &b;
    dbms_output.put_line(b);
    c := &c;
    dbms_output.put_line(c);
    IF a > b THEN
        IF a > c THEN
            maximum := a;
        ELSE
            maximum := c;
        END IF;
    ELSE
        IF b > c THEN
            maximum := b;
        ELSE
            maximum := c;
        END IF;
    END IF;
    dbms_output.put_line('Maximum Value is : ' || maximum);
END;
/

-- Question 2
DECLARE
    num integer;
    remainder integer;
BEGIN
    num := &num;
    dbms_output.put_line(num);
    remainder := num MOD 55;
    IF remainder = 0 THEN
        dbms_output.put_line('Number is Divisble by 5 and 11');
    ELSE
        dbms_output.put_line('Not Divisible by 5 and 11');
    END IF;
END;
/

-- Question 3
DECLARE
    length integer;
    breadth integer;
    side integer;
    base integer;
    height integer;
    area real;
BEGIN
    dbms_output.put_line('Enter the length and breadth of the rectangle :- ');
    length := &length;
    dbms_output.put_line(length);
    breadth := &breadth;
    dbms_output.put_line(breadth);
    area := length * breadth;
    dbms_output.put_line('Area of the rectangle is : ' || area);
    dbms_output.put_line('Enter the side of the square :- ');
    side := &side;
    dbms_output.put_line(side);
    area := side * side;
    dbms_output.put_line('Area of the square is : ' || area);
    dbms_output.put_line('Enter the Base of the Triangle :- ');
    base := &base;
    dbms_output.put_line(base);
    dbms_output.put_line('Enter the Height of the Triangle :- ');
    height := &height;
    dbms_output.put_line(height);
    area := 0.5 * base * height;
    dbms_output.put_line('Area of the Triangle is : ' || area);
END;
/

-- Question 4
DECLARE
    phy integer;
    chem integer;
    bio integer;
    math integer;
    computer integer;
    total integer;
    percentage real;
BEGIN
    dbms_output.put_line('Enter the marks of Physics, Chemistry, Biology, Mathematics and Computer :- ');
    phy := &phy;
    dbms_output.put_line(phy);
    chem := &chem;
    dbms_output.put_line(chem);
    bio := &bio;
    dbms_output.put_line(bio);
    math := &math;
    dbms_output.put_line(math);
    computer := &computer;
    dbms_output.put_line(computer);
    total := phy + chem + bio + math + computer;
    percentage := total / 5;
    dbms_output.put_line('Student Percentage : ' || percentage);
    IF percentage >= 90 THEN
        dbms_output.put_line('Grade A');
    ELSIF percentage >= 80 THEN
        dbms_output.put_line('Grade B');
    ELSIF percentage >= 70 THEN
        dbms_output.put_line('Grade C');
    ELSIF percentage >= 60 THEN
        dbms_output.put_line('Grade D');
    ELSIF percentage >= 40 THEN
        dbms_output.put_line('Grade E');
    ELSE
        dbms_output.put_line('Grade F');
    END IF;
END;
/

-- Question 5
DECLARE
    s integer := 0;
    i integer := 1;
BEGIN
    WHILE i <= 100 LOOP
        s := s + i;
        i := i + 1;
    END LOOP;
    dbms_output.put_line('Sum of First 100 natural numbers is : ' || s);
END;
/

-- Question 6
CREATE TABLE Empinfo(id number(5), name varchar2(20), age number(3), address varchar2(20), salary number(10));
INSERT ALL
    INTO Empinfo(id, name, age, address, salary) VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000)
    INTO Empinfo(id, name, age, address, salary) VALUES (2, 'Khilan', 25, 'Delhi', 1500)
    INTO Empinfo(id, name, age, address, salary) VALUES (3, 'Kaushik', 23, 'Kota', 2000)
    INTO Empinfo(id, name, age, address, salary) VALUES (4, 'Chaital', 25, 'Mumbai', 6500)
    INTO Empinfo(id, name, age, address, salary) VALUES (5, 'Hardik', 27, 'Bhopal', 8500)
    INTO Empinfo(id, name, age, address, salary) VALUES (6, 'Komal', 22, 'MP', 4500)
SELECT * FROM dual;
DECLARE
    c_id Empinfo.id%TYPE;
    c_name Empinfo.name%TYPE;
    c_age Empinfo.age%TYPE;
    c_salary Empinfo.salary%TYPE;
BEGIN
    SELECT id, name INTO c_id, c_name
    FROM Empinfo WHERE id=1;
    dbms_output.put_line('The name of person having id=1 is ' || c_name);
    SELECT name, age, salary INTO c_name, c_age, c_salary
    FROM Empinfo WHERE address='Kota';
    dbms_output.put_line('The name,age, and salary lives in Kota is ' || c_name || ', ' || c_age || ',and ' || c_salary || '.');
END;
/
DROP TABLE Empinfo;