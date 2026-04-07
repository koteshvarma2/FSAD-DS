USE payment_simulation;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE employee_audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

DELIMITER $$

CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit_log (emp_id, action_type, old_salary, new_salary)
    VALUES (NEW.emp_id, 'INSERT', NULL, NEW.salary);
END$$

CREATE TRIGGER trg_employee_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit_log (emp_id, action_type, old_salary, new_salary)
    VALUES (NEW.emp_id, 'UPDATE', OLD.salary, NEW.salary);
END$$

DELIMITER ;

CREATE VIEW daily_activity_report AS
SELECT 
    DATE(action_time) AS activity_date,
    action_type,
    COUNT(*) AS total_actions
FROM employee_audit_log
GROUP BY DATE(action_time), action_type;

INSERT INTO employee VALUES (102, 'kotesh', 'cse', 70000);

UPDATE employee
SET salary = 66000
WHERE emp_id = 102;

SELECT * FROM employee_audit_log;

SELECT * FROM daily_activity_report;
