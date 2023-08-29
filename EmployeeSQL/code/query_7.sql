-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT p.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_employees as p
ON p.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = p.dept_no AND (d.dept_name = 'Sales' OR d.dept_name = 'Development');
