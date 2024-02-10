-- 1.
use university;
create view st (year, num_credits) as select year, sum(credits) from (Select year, credits from takes inner join course on course.course_id = takes.course_id) as new group by year order by year;
select * from st;

-- 2.a
select dept_name, title, count(sec_id), DENSE_RANK() OVER (partition by dept_name ORDER BY count(sec_id) DESC) AS dense_rnk from course inner join section on section.course_id = course.course_id group by course.course_id;

-- 2.b
select ID, name, dept_name, salary , PERCENT_RANK() OVER (Partition by dept_name ORDER By salary) from instructor;

-- 2.c
use sakila;
select payment_id, amount, sum(amount) over (order by payment_id) from payment;

-- 2.d
select payment_id, amount, avg(amount) over (order by payment_id) from payment;

-- 2.e
use university;
select dept_name, count(course_id), dense_rank() over (order by count(course_id) desc) from course group by dept_name;

