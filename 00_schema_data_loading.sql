-- Drop tables if exist
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

--Create tables & set table relationships. 
--Assign values to tables (tables have been stored in the PUBLIC user to be accessible for PostgreSQL server user)

CREATE TABLE titles(
	title_id CHARACTER VARYING(5) NOT NULL PRIMARY KEY,
	title CHARACTER (100) NOT NULL
);
COPY titles(title_id, title) 
FROM '/Users/Guest/Public/Employee-SQL/titles.csv'
DELIMITER ',' CSV HEADER; 

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id CHARACTER VARYING(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name CHARACTER(100) NOT NULL,
	last_name CHARACTER(100) NOT NULL,
	sex CHARACTER(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM '/Users/Guest/Public/Employee-SQL/employees.csv'
DELIMITER ',' CSV HEADER; 

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary MONEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY salaries(emp_no, salary) 
FROM '/Users/Guest/Public/Employee-SQL/salaries.csv'
DELIMITER ',' CSV HEADER; 

CREATE TABLE departments(
	dept_no CHARACTER VARYING(4) PRIMARY KEY,
	dept_name CHARACTER VARYING(100) NOT NULL
);
COPY departments(dept_no, dept_name) 
FROM '/Users/Guest/Public/Employee-SQL/departments.csv'
DELIMITER ',' CSV HEADER; 

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no CHARACTER VARYING(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
COPY dept_emp(emp_no, dept_no) 
FROM '/Users/Guest/Public/Employee-SQL/dept_emp.csv'
DELIMITER ',' CSV HEADER; 

CREATE TABLE dept_manager(
	dept_no CHARACTER VARYING(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY dept_manager(dept_no, emp_no) 
FROM '/Users/Guest/Public/Employee-SQL/dept_manager.csv'
DELIMITER ',' CSV HEADER; 

--VERIFY IF EVERY TABLE LODADED OK.
SELECT * FROM salaries LIMIT 10;

