use university;

-- 1.a
Select Distinct ID, name from student where ID IN (Select ID from takes where course_id IN (Select course_id from course where dept_name = "Comp. Sci."));

-- 1.b
Select ID, name from student where ID in (Select ID from takes where year <2018 group by ID);

-- 1.c
Select dept_name, max(salary) as salary from instructor group by dept_name;

-- 1.d
Select dept_name, max(salary) as salary from instructor group by dept_name order by salary asc limit 1;

-- 2.a
insert into course (course_id,title,credits) values ("CS-001","Weekly Seminar",2);

-- 2.b
insert into section (course_id, sec_id,semester,year) values ("CS-001",1,"Fall",2017);

-- 2.c
insert into takes (ID, course_id, sec_id, semester, year)  select ID , "CS-001", 1, "Fall", 2017 from student where dept_name = "Comp. Sci.";

-- 2.d
delete from takes where course_id = "CS-001" and ID = "12345";

-- 2.e
delete from course where course_id = "CS-001";
delete from takes where course_id = "CS-001";
delete from section where course_id = "CS-001";

-- 2.f
delete from takes where course_id IN (select course_id from course where title = "%Geology%" or title = "%geology%");