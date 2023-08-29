-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_managers as m
INNER JOIN departments as d
ON d.dept_no = m.dept_no
INNER JOIN employees as e
ON m.emp_no = e.emp_no;