-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Master Title Table
CREATE TABLE Title (
    Title_ID Varchar(10)   NOT NULL,
    Title Varchar(50)   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (Title_ID)
);

-- Master Department Table
CREATE TABLE Departments (
    dept_no varchar(10)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(10)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex varchar(5)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Dept_Emp(
    emp_no int   NOT NULL,
    dept_no varchar(10)   NOT NULL
);

CREATE TABLE Dept_Manager (
    dept_no varchar(10)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Title (Title_ID);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_DeptEmployees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_DeptEmployees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_DeptManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_DeptManager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salary_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

