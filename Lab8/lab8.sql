-- 1.
use employee;
drop trigger to_upper;
DELIMITER $$
CREATE TRIGGER to_upper BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	SET NEW.firstname = UPPER(NEW.firstname), NEW.lastname = UPPER(NEW.lastname);
END $$
DELIMITER ;

drop trigger to_upper_update;
DELIMITER $$
CREATE TRIGGER to_upper_update BEFORE UPDATE ON employees
FOR EACH ROW
	BEGIN
		SET NEW.firstname = UPPER(NEW.firstname), NEW.lastname = UPPER(NEW.lastname);
	END $$
DELIMITER ;

-- 2.
DROP TRIGGER update_salary;
DELIMITER $$
CREATE TRIGGER update_salary BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
	IF NEW.salary > 50000 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;