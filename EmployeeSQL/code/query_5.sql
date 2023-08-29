-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE employees.first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';