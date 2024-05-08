--  List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, first_name, last_name, sex, salary 
FROM public."Employees" emp
INNER JOIN public."Salaries" sal 
ON emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM public."Employees" emp where
extract (year from hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept.dept_no, dept.dept_name, emp.emp_no, 
emp.first_name, emp.last_name
from 
public."Department_managers" dept_mgrs
INNER JOIN public."Employees" emp
ON dept_mgrs.emp_no = emp.emp_no
INNER JOIN public."Departments" dept
ON dept_mgrs.dept_no = dept.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept.dept_no, emp.emp_no, dept.dept_name,
emp.first_name, emp.last_name
from 
public."Department_employees" dept_emps
INNER JOIN public."Employees" emp
ON dept_emps.emp_no = emp.emp_no
INNER JOIN public."Departments" dept
ON dept_emps.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM public."Employees" emp where
first_name = 'Hercules' and
last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, dept.dept_name,
emp.first_name, emp.last_name
from 
public."Department_employees" dept_emps
INNER JOIN public."Employees" emp
ON dept_emps.emp_no = emp.emp_no
INNER JOIN public."Departments" dept
ON dept_emps.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, dept.dept_name,
emp.first_name, emp.last_name
from 
public."Department_employees" dept_emps
INNER JOIN public."Employees" emp
ON dept_emps.emp_no = emp.emp_no
INNER JOIN public."Departments" dept
ON dept_emps.dept_no = dept.dept_no
WHERE dept.dept_name in ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(*) as last_name_count from 
public."Employees" emp
group by last_name
order by last_name_count desc;




