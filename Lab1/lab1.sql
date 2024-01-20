use university;

-- Task 1.a
SELECT course_id,title,dept_name from course WHERE credits=3 and dept_name="Comp. Sci.";

-- Task 1.b
SELECT Distinct ID from takes WHERE course_id IN(select course_id FROM teaches Where ID=(select ID from instructor where name="dale"));

-- Task 1.c
SELECT MAX(instructor.salary) FROM instructor;

-- Task 1.d
SELECT ID,name,salary,dept_name from instructor where salary=(SELECT MAX(instructor.salary) FROM instructor);

-- Task 2.a
Select salary from instructor where dept_name="Comp. Sci.";
Update instructor SET salary=salary*1.1 where dept_name="Comp. Sci.";
Select salary from instructor where dept_name="Comp. Sci.";

-- Task 2.b
insert into instructor (ID,name,dept_name,salary) select ID,name,dept_name,30000 from student where tot_cred>100;