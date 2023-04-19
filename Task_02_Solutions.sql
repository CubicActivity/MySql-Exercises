
-- 2.1 Select the last name of all employees.
select LastName from Employees;

-- 2.2 Select the last name of all employees, without duplicates
select distinct LastName from Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
select * from Employees where LastName = 'Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where LastName = 'Smith' OR LastName = 'Doe';

-- 2.5 Select all the data of employees that work in department 14.
select * from Employees where Department = 14;
-- 2.6 Select all the data of employees that work in department 37 or department 77.
select * from Employees where Department = 37 OR Department= 77;

-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from Employees where LastName like 'S%';

-- 2.8 Select the sum of all the departments' budgets.
select Name, sum(Budget) from Departments group by Name;
select sum(Budget) from Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select Department, count(SSN) as CountOfEmployees from Employees group by Department;

-- 2.10 Select all the data of employees, including each employee's department's data.
select * from Employees inner join Departments on Departments.Code=Employees.Department;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select Employees.Name,Employees.LastName,Departments.Name,Departments.Budget from Employees inner join Departments on Departments.Code=Employees.Department;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select Employees.Name,Employees.LastName from Employees inner join Departments on Departments.Code=Employees.Department where Departments.Budget>=90000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select * from Departments where budget > (select avg(budget) from departments);

-- 2.14 Select the names of departments with more than two employees.
SELECT Name FROM Departments WHERE Code IN (SELECT Department FROM Employees GROUP BY Department HAVING COUNT(*) > 2);


-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
select top 2 name, lastname from employees where department =(select top 2 temp.code from (select * from departments) );
 
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into Departments values (11, 'Quality Assurance', 40000);
insert into Employees values(847219811, 'Mary' , 'Moore', 11);

-- 2.17 Reduce the budget of all departments by 10%.
update Departments set Budget= (Budget*0.9);

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update Employees set Department = 14 where Department=77;

-- 2.19 Delete from the table all employees in the IT department (code 14).
delete from Employees where Department=14;

-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from Employees where Department in (select Code from Departments where Budget>=60000);

-- 2.21 Delete from the table all employees.
delete from Employees;