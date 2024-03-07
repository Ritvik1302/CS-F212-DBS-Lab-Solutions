-- 1.
USE university;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE
`list_semester`(IN sem_name VARCHAR(10))
 READS SQL DATA
 DETERMINISTIC
 SQL SECURITY INVOKER
 COMMENT 'Semester wise list of student, Input -
Semester name and Output – Student count'
BEGIN
SELECT student.name FROM university.student
WHERE student.ID IN
(SELECT takes.id FROM university.takes
WHERE takes.semester = sem_name);
END$$
DELIMITER ;

CALL list_semester('Spring');

-- 2.
USE sakila;
DROP PROCEDURE list_customer_with_staffid;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE
`list_customer_with_staffid`(IN Staff_Id VARCHAR(10))
 READS SQL DATA
 DETERMINISTIC
 SQL SECURITY INVOKER
 COMMENT 'List of customers with payment with Given Staff ID'
BEGIN
SELECT customer.first_name,customer.last_name FROM sakila.customer
WHERE customer.customer_id IN
(SELECT payment.customer_id FROM sakila.payment
WHERE payment.staff_id= Staff_Id);
END$$
DELIMITER ;

CALL list_customer_with_staffid('1');

-- 3.
USE university;
DROP PROCEDURE list_instructor_with_salary;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE
`list_instructor_with_salary`(IN amount decimal(9,2))
 READS SQL DATA
 DETERMINISTIC
 SQL SECURITY INVOKER
 COMMENT 'List of employees with difference in salary from average salary greater or less than amount'
BEGIN
SELECT instructor.name FROM university.instructor
WHERE instructor.salary - (SELECT AVG(salary) FROM university.instructor) >=amount OR instructor.salary - (SELECT AVG(salary) FROM university.instructor) <=amount ;
END$$
DELIMITER ;

CALL list_instructor_with_salary(10);

-- 4.
USE employee;
DROP PROCEDURE list_ingredients_of_vendor;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE
`list_ingredients_of_vendor`(IN vendorid char(5))
 READS SQL DATA
 DETERMINISTIC
 SQL SECURITY INVOKER
 COMMENT 'List of Ingredients with Given Vendor ID'
BEGIN
SELECT ingredients.name FROM employee.ingredients
WHERE ingredients.vendorid = vendorid ;
END$$
DELIMITER ;

CALL list_ingredients_of_vendor("DNDRY");