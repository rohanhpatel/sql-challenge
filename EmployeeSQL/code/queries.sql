-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT (YEAR FROM e.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_managers as m
INNER JOIN departments as d
ON d.dept_no = m.dept_no
INNER JOIN employees as e
ON m.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT p.dept_no, p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees as p
INNER JOIN employees as e
ON p.emp_no = e.emp_no
INNER JOIN departments as d
ON p.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE employees.first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_employees
    WHERE dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
    )
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT p.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_employees as p
ON p.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = p.dept_no AND (d.dept_name = 'Sales' OR d.dept_name = 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;