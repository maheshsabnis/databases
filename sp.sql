USe Company;
-- STored Proc to return all Employees
-- This will not accept any input parameter

DELIMITER //
Create Procedure getEmployees()
BEGIN
	select * from Employee;
END //
DELIMITER ;
-- Execute the STored Proc
Call getEmployees();

-- STored Proc with Parameters
-- Use 'IN' for input Parameter
-- Use InOut for input and output parameter

 DELIMITER //
Create Procedure getEmployeesByDesignation(
  IN desig varchar(200)
)
BEGIN
	select * from Employee 
    where Designation=desig;
END //
DELIMITER ;

Call getEmployeesByDesignation('Manager');

-- Create a Stored Proc for Insert
DELIMITER //
Create Procedure InsertEmployee(
  IN eno int,
  IN ename varchar(200),
  IN desig varchar(200),
  IN sal int,
  IN dno int
)
BEGIN
   -- While using Insert Stastement in Stored Proc, always provide
   -- columns in which Insert will takes place
   insert into Employee (EmpNo, EmpName,Designation,Salary,DeptNo) 
   values 
   (eno,ename,desig, sal, dno);
END // 
DELIMITER ;

CALL InsertEmployee(201, 'Neeta', 'Manager', 12300, 10);	

select * from Employee;

-- Stored Proc with implict return using Scala function

DELIMITER //
Create Procedure getSumSalaryByDeptNo(
IN dno int
)
BEGIN
		select sum(salary) from Employee where DeptNo=dno;
END //
DELIMITER ;

-- implicit returhned result
CALL getSumSalaryByDeptNo(20);

-- Define an explicit return parameter

DELIMITER //
Create Procedure getSumSalaryByDeptNoOutPatameter(
IN dno int,
INOUT sumsal int -- input and output parameter
)
BEGIN
		select sum(salary) into sumsal from Employee where DeptNo=dno;
END //
DELIMITER ;

-- Call STored Proc and pass the SQL Parameter as input Parameter
-- SQL Parameter is prefixed with the @ sign
Call getSumSalaryByDeptNoOutPatameter(20, @SumSalary); 
Select @SumSalary;

-- Can we have  Logical Conditions with Stored Procs

DELIMITER $$
Create Procedure  getCountOfEmployeesByDeptNo(
 IN pDeptNo int,
 OUT pCount int
)
Begin
	IF pDeptNo > 0 THEN
		Select Count(*) as pCount from Employee
        where
        DeptNo = pDeptNo;
    ELSE
		set pCount =0;
    END IF;    
End $$
DELIMITER ;

CALL getCountOfEmployeesByDeptNo(10, @pCount);


-- CReating Views
-- a view that will show only EmpName, Designation and Salary

Create View EmpDesigSal
As
Select EmpName, Designation,Salary 
From Employee;

select * from empdesigsal;

Insert into Employee Values (202, 'Sameer', 'Manager', 230000, 20);

Create View DeptEmp AS
Select EmpNo, EmpName, Designation, DeptName, Location
From Department, Employee
Where Department.DeptNo = Employee.DeptNo;



Select * from Department; 
insert into Employee Values (203, 'Shreyas', 'Manager', 340000, 50);
 
Select * from DeptEmp;
