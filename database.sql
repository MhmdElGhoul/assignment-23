1> CREATE DATABASE company_db;

2> CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    city VARCHAR(100)
)

3> INSERT INTO employees VALUES
    (NULL, 'Noor', 'HR', 50000, 3, 'Beirut'),
    (NULL, 'Hassan', 'IT', 60000, 4, 'Baalback'),
    (NULL, 'Hady', 'HR', 70000, NULL, 'Beirut'),
    (NULL, 'Ali', 'IT', 80000, NULL, 'Tripoli'),
    (NULL, 'Mouhammad', 'Sales', 45000, 6, 'Saida'),
    (NULL, 'Zayn', 'Sales', 65000, NULL, 'Beqaa');

a> SELECT DISTINCT department FROM employees;

b> SELECT emp_name, salary From employees
    WHERE salary > 50000 AND department= 'IT' OR department='HR';

c> SELECT emp_name FROM employees WHERE emp_name LIKE 'H%';

d> SELECT * FROM employees
    ORDER BY salary DESC LIMIT 3;

e> SELECT department, SUM(salary) AS 'Total Salaries' 
    FROM employees 
    GROUP BY department; 

f> SELECT IFNULL(department, 'Grand Total') AS department, 
    SUM(salary) AS 'Total Salaries'
    FROM employees 
    GROUP BY department WITH ROLLUP; 

g> SELECT * FROM employees
    WHERE city = 'Beirut'
    UNION ALL
    SELECT * FROM employees
    WHERE city ='Beqaa';

h> -- I didn't understand how!!!

j> CREATE VIEW IT_employee AS 
    SELECT emp_name, department, salary
    FROM employees
    WHERE department = 'IT';

k> SELECT * FROM it_employee;

l> DELIMITER $$
    CREATE PROCEDURE GetAllEmployees()
    BEGIN
    SELECT * FROM employees;
    END $$
    DELIMITER ;
m> DELIMITER $$
    CREATE PROCEDURE GetEmployeesByDepartment (IN department VARCHAR(50))
    BEGIN
    SELECT * FROM employees 
    WHERE employees.department = department;
    END $$
    DELIMITER ;

n> DELIMITER $$
    CREATE PROCEDURE GetEmployeesBySalary (IN salary_amount INT)
    BEGIN
    SELECT * FROM employees
    WHERE employees.salary > salary_amount;
    END $$
    DELIMITER ;

    
