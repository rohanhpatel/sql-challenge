CREATE TABLE titles (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_employees (
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_managers (
    dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);