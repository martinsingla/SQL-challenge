--QUERYING DATABASE

--Employee details: employee number, last name, first name, sex, and salary.
--We have limited the query to just 20 entries to speed computation.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no
LIMIT 20;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '1986-01-01' AND  hire_date <= '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments AS d
LEFT JOIN dept_manager AS m ON d.dept_no = m.dept_no
LEFT JOIN employees AS e ON m.emp_no = e.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--We have limited the query to just 20 entries to speed computation.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no
LIMIT 20;
--We can see that there are a lot of employees assigned to multiple departments.

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name= 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;




