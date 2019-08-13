-- #1 Join employee data with salary

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- #2 Create employee table with date of hire & query

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1996-01-01' AND '1996-12-31'
;

-- #3 Select fields and chain joins for final table

select  dm.dept_no, d.dept_name, 
dm.emp_no, e.last_name, e.first_name, 
dm.from_date, dm.to_date
from dept_manager dm
join departments d
on dm.dept_no = d.dept_no
join employees e
on dm.emp_no = e.emp_no
;

-- #4 Repeat previous process on dept_emp instead of dept_manager

select  d.dept_name, de.dept_no,
de.emp_no, e.last_name, e.first_name
from dept_emp de
join departments d
on de.dept_no = d.dept_no
join employees e 
on de.emp_no = e.emp_no
;

-- #5 Query with a where paired with boolean 'and' & a like clause

select first_name, last_name
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- #6 rework question 4 with a where statement

select  de.dept_no, d.dept_name, 
de.emp_no, e.last_name, e.first_name
from dept_emp de
join departments d
on de.dept_no = d.dept_no
join employees e
on de.emp_no = e.emp_no
WHERE d.dept_no = 'd007'
;

-- #7 rework question 6 with a "OR" in the where statement

select  de.dept_no, d.dept_name, 
de.emp_no, e.last_name, e.first_name
from dept_emp de
join departments d
on de.dept_no = d.dept_no
join employees e
on de.emp_no = e.emp_no
where d.dept_no = 'd007' OR d.dept_no = 'd005'
;

-- #8 Groupby last_name and count

SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;