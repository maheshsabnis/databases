DELIMITER //
Create Procedure sp_TableTransaction()
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
 START TRANSACTION;
	Insert into Department (DeptNo,DeptName,Location,Capacity)
    Values (60, 'System', 'Pune', 800);
    Insert into Employee (EmpNo, EmpName, Designation,Salary,DeptNo)
    Values (204, 'Neeta', 'Manager', 12000, 10);
    
 COMMIT;
END; //

Call sp_TableTransaction();