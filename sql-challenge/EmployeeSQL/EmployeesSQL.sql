DROP TABLE departments; 

CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL 
);

SELECT *
FROM departments

DROP TABLE employees; 

CREATE TABLE employees(
	emp_no INT PRIMARY KEY, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL, 
	gender VARCHAR(1) NOT NULL, 
	hire_date VARCHAR(30) NOT NULL 
);

SELECT *
FROM employees

DROP TABLE dep_emp;

CREATE TABLE dep_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL
);

SELECT *
FROM dep_emp

DROP TABLE dept_managers; 

CREATE TABLE dept_managers(
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

SELECT*
FROM dept_managers


DROP TABLE salaries; 

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL
);

SELECT *
FROM salaries

DROP TABLE titles; 

CREATE TABLE titles(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL 
);

SELECT *
FROM titles



