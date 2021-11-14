USe Company;
-- list of Employees for a specific Department
select * from Employee where DeptNo=10;
-- Analyze the QUery
-- Since the DeptNO is already mentioned in QUery, then why to choose the DeptNo column
-- Avoid using * in the query 
select EmpNo, EmpName, Salary from Employee where DeptNo=10;
-- Generating a Computed Column using Select Query 
select EMpNo, EmpName, Salary, Salary*0.8 as Tax from Employee;

-- REad the Max salary from the EMployees table
select Max(Salary) from EMployee;
-- Count of Employees
select Count(*) from EMployee;
-- Count of Employees for a specific Department
select DeptNo, Count(*) from EMployee where DeptNo=10;
-- Count of Employees Per Department
select DeptNo, Count(*) from EMployee group by DeptNo;
-- MAx Salary Per DeptNo
select DeptNo, max(Salary) as MAX_SALARY from Employee Group by DeptNo;
-- Calculatind Second Max Salary
select max(Salary) from Employee
 where Salary <(Select Max(Salary) from Employee);
-- Second Max Salary per Depatment
select DeptNo, max(Salary) from Employee
 where Salary <(Select Max(Salary) from Employee)  group by DeptNo;
 -- Sum of Salary per department
select DeptNo, sum(Salary) from Employee group by DeptNo; 
   
select DeptNo, avg (Salary) from Employee group by DeptNo;  

-- Printing all EMployees by Salary
select EmpName, Salary, DeptNo from Employee Order by Salary;

-- Use Multiple Tables in a select query to Read data
-- Always note that, using multiple tables in Select Query must be done when they have atlease one common COlumn 

select * from Department, EMployee;  -- will provide 100 rows 

-- will provide 20 rows, the Department's DeptNo will be read for each matching record from the EMployee Table
select * from Department, EMployee
 where Department.DEptNo = Employee.DeptNo;    -- Skip DEptNo=50 because there are no Employee records for it

select EmpNo, EmpName, DeptName,Designation,Salary, Location
From Department, Employee
Where Department.DeptNo = Employee.DeptNo;

-- When there are Select queries those are involving using multiple tables with conditions then consider 
-- using Joins 
-- Simple Join aka Inner Join, the data is read only having match
 
select EmpNo, EmpName, DeptName,Designation,Salary, Location
From Department Inner Join Employee
Where Department.DeptNo = Employee.DeptNo;

-- Read all data from Departments that match and  does not match with Employees
select EmpNo, Department.DeptNo, EmpName, DeptName,Designation,Salary, Location
From Department Left Join Employee
on Department.DeptNo = Employee.DeptNo;

-- Right Join, Opposite of  Left Join
select EmpNo, Department.DeptNo, EmpName, DeptName,Designation,Salary, Location
From Department right Join Employee
on Department.DeptNo = Employee.DeptNo;