DROP TABLE departments; 

CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL 
);

SELECT *
FROM departments

DROP TABLE dep_emp;

CREATE TABLE dep_emp(
	emp_no INT,
	dept_no VARCHAR(30),
	from_date DATE, 
	to_date DATE
);

SELECT *
FROM dep_emp

DROP TABLE dept_managers; 

CREATE TABLE dept_managers(
	dept_no VARCHAR(30), 
	emp_no INT, 
	from_date DATE,
	to_date DATE
);

SELECT*
FROM dept_managers

DROP TABLE employees; 

CREATE TABLE employees(
	emp_no INT PRIMARY KEY, 
	birth_date DATE, 
	first_name VARCHAR (30),
	last_name VARCHAR (30), 
	gender VARCHAR(1), 
	hire_date VARCHAR(30)
);

SELECT *
FROM employees

DROP TABLE salaries; 

CREATE TABLE salaries(
	emp_no INT, 
	salary INT, 
	from_date DATE, 
	to_date DATE
);

SELECT *
FROM salaries

DROP TABLE titles; 

CREATE TABLE titles(
	emp_no INT, 
	title VARCHAR(30),
	from_date DATE, 
	to_date DATE
);

SELECT *
FROM titles

--DATA ANALYSIS 

-- #1: List employee details employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON 
employees.emp_no = salaries.emp_no;

-- #2: List employees who were hired in 1986
SELECT *
FROM employees 
WHERE hire_date LIKE '1986%';

-- #3 List department manager with - dept num, dept name, emp num, last name, first name, employment dates
SELECT dept_managers.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, dept_managers.from_date, dept_managers.to_date
FROM employees 
JOIN dept_managers
ON (employees.emp_no = dept_managers.emp_no)
JOIN departments
ON (dept_managers.dept_no = departments.dept_no);

-- #4 employee number, last name, first name, and department name
CREATE VIEW employee_dept AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dep_emp
ON (employees.emp_no = dep_emp.emp_no)
JOIN departments
ON (dep_emp.dept_no = departments.dept_no);

-- #5 all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name 
FROM employees 
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- #6 all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT *
FROM employee_dept
WHERE dept_name = 'Sales';

-- #7 all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT *
FROM employee_dept
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development'
ORDER BY dept_name; 

-- #8 descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT (last_name) AS LastnameCount
FROM employees
GROUP BY last_name
ORDER BY 2 desc;


-- April Fool's Day! emp_no 499942
SELECT *
FROM employees 
WHERE emp_no = 499942

