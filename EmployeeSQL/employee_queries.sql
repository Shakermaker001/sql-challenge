--List the employee number, last name, first name, sex, and salary of each employee

select e.first_name, e.last_name, e.sex, s.salary
from salaries as s
inner join employees as e on
e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986

select first_name, last_name, hire_date
from employees
where hire_date::text like '1986%';

--List the manager of each department along with their
--department number, department name, employee number, last name, and first name

select dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
from departments as d
inner join department_manager as dm on
d.dept_no=dm.dept_no
inner join employees as e on
dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name

select de.dept_no, de.emp_no, d.dept_name, e.last_name, e.first_name
from departments as d
inner join department_employee as de on
d.dept_no=de.dept_no
inner join employees as e on
de.emp_no = e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%'
	
--List each employee in the Sales department, including their employee number, last name, and first name

select de.dept_no, de.emp_no, d.dept_name, e.last_name, e.first_name
from departments as d
inner join department_employee as de on
d.dept_no=de.dept_no
inner join employees as e on
de.emp_no = e.emp_no
where d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name

select de.dept_no, de.emp_no, d.dept_name, e.last_name, e.first_name
from departments as d
inner join department_employee as de on
d.dept_no=de.dept_no
inner join employees as e on
de.emp_no = e.emp_no
where d.dept_name = 'Sales'
	or d.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)

select last_name, count(last_name) as last_name_count
from employees
where last_name is NOT NULL
group by last_name
order by last_name_count desc;