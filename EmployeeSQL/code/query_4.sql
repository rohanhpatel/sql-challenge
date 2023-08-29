-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT p.dept_no, p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees as p
INNER JOIN employees as e
ON p.emp_no = e.emp_no
INNER JOIN departments as d
ON p.dept_no = d.dept_no;