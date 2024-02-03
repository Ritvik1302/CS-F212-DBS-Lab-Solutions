use university;

-- 1.a
Select distinct name from student inner join (takes inner join course on takes.course_id = course.course_id) on student.ID = takes.ID where course.dept_name = "Comp. Sci." order by name;

-- 1.b
Select student.id, name, min(takes.year) as minyear from student inner join (takes inner join course on takes.course_id = course.course_id) on student.ID = takes.ID group by student.id having minyear > 2009 order by student.id ;

-- 1.c
select dept_name, min(maxSal) from (select instructor.dept_name, max(salary)as maxSal from instructor inner join department on department.dept_name = instructor.dept_name group by instructor.dept_name);

-- 1.d
select ID,name,salary from instructor order by salary desc offset 2 limit 3;