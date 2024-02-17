use employee;
-- 1
select firstname,lastname from employees where deptcode = (select code from departments where name = "Consulting");

-- 2
select firstname,lastname from employees where deptcode = 
(select code from departments where name = "Consulting") and employeeid IN
(select employeeid from workson where projectid = "ADT4MFIA" and assignedtime > 0.2);

-- 3
select (select sum(assignedtime) from workson where employeeid = (select employeeid from employees where firstname = "Abe"))
/
(select sum(assignedtime) from workson)*100 as Percent;

-- 4
select name from departments where not exists (select * from projects where departments.code = projects.deptcode);

-- 5
select firstname, lastname from employees where salary > (select avg(salary) from employees where deptcode = (select code from departments where name = "Accounting") group by deptcode);

-- 6
select description from projects where projectid IN (select projectid from workson where assignedtime > 0.7);

-- 7
select firstname, lastname from employees where salary > ANY (select salary from employees where deptcode = (select code from departments where name = "Accounting"));

-- 8
select min(salary) from employees where salary > ALL (select salary from employees where deptcode = (select code from departments where name = "Accounting"));

-- 9
select firstname, lastname, salary from employees where salary = (select max(salary) from employees where deptcode = (select code from departments where name = "Accounting"));

-- 10
select employeeid, assignedtime from workson where assignedtime > 0.5 and projectid NOT IN (select projectid from projects where deptcode = "ACCNT") and employeeid in (select employeeid from employees where deptcode = "ACCNT") order by assignedtime asc;

-- 11
select code from departments where code IN (select deptcode from employees where employeeid IN (select employeeid from workson where projectid = ALL (select projectid from projects where deptcode = code)));

-- 12.a
select firstname, lastname from employees where deptcode = (select code from departments where name = "Information Technology");

-- 12.b
select firstname, lastname from employees where deptcode = (select code from departments where name = "Information Technology") and employeeid IN (select employeeid from workson where assignedtime > 0.2 and projectid IN (select projectid from projects where description = "health"));

-- 12.c
select firstname, lastname from employees where salary > (select avg(salary) from employees where deptcode = (select code from departments where name = "Accounting") group by deptcode);

-- 12.d
select description from projects where projectid IN (select projectid from workson where assignedtime > 0.5);

-- 12.e
select name from departments where not exists (select * from projects where departments.code = projects.deptcode);

-- 12.f
select firstname, lastname from employees where salary > ANY (select salary from employees where deptcode = (select code from departments where name = "Information Technology"));

-- 12.g
select firstname, lastname from employees where salary >(select max(salary) from employees where deptcode = (select code from departments where name = "Information Technology"));

-- 12.h
select firstname, lastname from employees where salary = (select max(salary) from employees where deptcode = (select code from departments where name = "Information Technology")) and deptcode = (select code from departments where name = "Information Technology");