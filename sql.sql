-- Create Database
Create Database Company;
-- USe the database for Operations
Use Company;
-- Create a Table
Create Table Department(
  DeptNo int Primary Key,
  DeptName varchar(100) not Null,
  Location varchar(100) not Null
);

-- Add a new Column in the table

Alter Table Department Add Column Capcity int not null; 

-- Modify the Column Name
Alter Table Department Change Capcity Capacity int not null;

Insert into Department Values (10, 'IT', 'Pune', 1000);
Insert into Department Values (20, 'HR', 'Pune', 20);
Insert into Department Values (30, 'SL', 'Pune', 60);
Insert into Department Values (40, 'TR', 'Pune', 10);
Insert into Department Values (50, 'AD', 'Pune', 20);

select * from Department;

-- Update Query
Update Department Set Capacity=22 where DeptNo =50; 
-- One Employee is belong to one DeptNo, this is one-to-one relationship
-- One Depratment Can contains multiple employees, this is One-to-many relationship 
Create Table Employee(
 EmpNo int Primary Key,
 EmpName varchar(300) not null,
 Designation varchar(300) not Null,
 Salary int not null,
 DeptNo int not null,
 constraint FK_DEPTNO -- COnstraint NAme
			-- (Foreign key column from current table) Parent Table name (ColumnName from Parent Table)
 foreign key (DeptNo) References Department(DeptNo)	
);
insert into employee Value (101, 'Mahesh', 'Director', 123333, 10);
insert into Employee Values(102, 'Vivek', 'Manager', 220000, 20);
insert into Employee Values(103, 'Mukesh', 'Manager', 140000, 30);
insert into Employee Values(104, 'Satish', 'Manager', 150000, 40);
insert into Employee Values(105, 'Vinay', 'Lead', 370000, 10);
insert into Employee Values(106, 'Tejas', 'Lead', 120000, 20);
insert into Employee Values(107, 'Tushar', 'Lead', 340000,30);
insert into Employee Values(108, 'Kaushubh', 'Lead', 450000, 40);
insert into Employee Values(109, 'Nainish', 'Staff', 12090000, 10);
insert into Employee Values(110, 'AArav', 'Staff', 230000, 20);
insert into Employee Values(111, 'Krushna', 'Staff', 340000, 30);
insert into Employee Values(112, 'Sujay', 'Staff', 430000, 40);
insert into Employee Values(113, 'Amit', 'Assistant', 450000, 10);
insert into Employee Values(114, 'Abhijit', 'Assistant', 670000, 20);
insert into Employee Values(115, 'Ajit', 'Assistant', 340000, 30);
insert into Employee Values(116, 'Krutanjay', 'Assistant', 170000, 40);
insert into Employee Values(117, 'Nandu', 'Operator', 980000, 10);
insert into Employee Values(118, 'Anil', 'Operator', 360000, 20);
insert into Employee Values(119, 'Abhay', 'Operator', 760000, 30);
insert into Employee Values(120, 'Sanjay', 'Operator', 330000, 40);
