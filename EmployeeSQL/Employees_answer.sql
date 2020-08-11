--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no as "EMP_ID",e.last_name as "Last Name",e.first_name as "First Name",e.sex as "Gender",s.salary as "SALARY"
FROM employees e
JOIN salary s
ON e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "FIRST NAME", last_name as "LAST NAME", hire_date as "HIRE DATE" 
FROM employees 
WHERE date_part('year', hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT D.DEPT_NO AS "DEPARTMENT NO",D.DEPT_NAME AS "DEPARTMENT NAME",E.EMP_NO "MANAGER EMP_NO",E.FIRST_NAME AS "FIRST NAME",E.LAST_NAME AS "LAST NAME"
FROM DEPT_MANAGER DM
JOIN DEPARTMENTS D
ON DM.DEPT_NO = D.DEPT_NO
JOIN EMPLOYEES E
ON DM.EMP_NO = E.EMP_NO
JOIN TITLE T
ON T.TITLE_ID = E.EMP_TITLE_ID
WHERE T.TITLE = 'Manager';
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT E.EMP_NO "EMPLOYEE NO", E.LAST_NAME "LAST NAME", E.FIRST_NAME "FIRST NAME", D.DEPT_NAME "DEPARTMENT NAME"
FROM DEPT_EMP DE
JOIN EMPLOYEES E
ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D
ON DE.DEPT_NO = D.DEPT_NO

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME "FIRST NAME",LAST_NAME "LAST NAME",SEX "GENDER"
FROM EMPLOYEES 
WHERE FIRST_NAME = 'Hercules'
AND LAST_NAME LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT E.EMP_NO "EMPLOYEE NO", E.LAST_NAME "LAST NAME", E.FIRST_NAME "FIRST NAME", D.DEPT_NAME "DEPARTMENT NAME"
FROM DEPT_EMP DE
JOIN EMPLOYEES E
ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D
ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME = 'Sales';
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.EMP_NO "EMPLOYEE NO", E.LAST_NAME "LAST NAME", E.FIRST_NAME "FIRST NAME", D.DEPT_NAME "DEPARTMENT NAME"
FROM DEPT_EMP DE
JOIN EMPLOYEES E
ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D
ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME IN('Sales','Development');
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(LAST_NAME) "NO OF EMP SHARE LAST NAME", LAST_NAME "LAST NAME" FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY LAST_NAME desc;