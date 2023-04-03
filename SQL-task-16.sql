create database task16

use task16
--TABLE
Create table students(sid int identity(1,1),sname varchar(20),department varchar(20), yearofcompletion int) 
--INSERT TABLE
insert into students 
values('Harshan','IT',2023),
('vasanth','CT',2024),
('vikram','CT',2024),
('karthi','IT',2023)
--SELECT QUERY
select * from students
--TRUNCATE TABLE
truncate table students
--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.
CREATE TRIGGER rest
ON students
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE())=1 or DATEPART(DW,GETDATE())=7
  BEGIN
    PRINT 'DML OPERATIONS ARE RESTRICTED ON SATURDAY AND SUNDAY'
    ROLLBACK TRANSACTION
  END
END
--DROP TRIGGER
drop trigger rest;
--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
CREATE TRIGGER rest_dele
ON students
FOR DELETE
AS
BEGIN
  IF DATEPART(HH,GETDATE()) > 11 and  DATEPART(HH,GETDATE()) < 15
  BEGIN
    PRINT 'CANNOT PERFORM DELETE OPERATION BETWEEN 11AM AND 15PM'
    ROLLBACK TRANSACTION
  END 
END

DELETE FROM STUDENTS WHERE sid = 1
--DROP TRIGGER
drop trigger rest_dele;
--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.
CREATE TRIGGER DDLTRIGERED
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE,RENAME
AS
BEGIN
    PRINT 'YOU PERFORMED DDL STATEMENT';
END
CREATE TABLE EMP (EMPID INT,EMPNAME VARCHAR(20))
EXEC sp_rename 'STUDENTS','STU';
DROP TABLE EMP;
select * from students

