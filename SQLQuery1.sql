--DDL--
create database dbHospital
use dbHospital
--create a table--
create table tblPatient
(id int primary key,
name varchar(20),
phone varchar(15))

--view the table--
select * from tblPatient

--drop the table
drop table tblPatient

sp_help tblPatient

--modification--
alter table tblPatient
add age int

alter table tblPatient add age int
--alter the datatype and set not nullable column--
alter table tblPatient
alter column  age float not null
--mdoification inside the column
alter table tblPatient alter column age float not null

--change the length--
alter table tblPatient
alter column  name varchar(50)
--delete the column--
alter table tblPatient
drop column age
--delete particular column
alter table tblPatient drop column age
--create new employee table--
create table tblEmployee
(employeeId char(4) constraint pk_eid primary key,
name varchar(20),area varchar(10))
--pk_id is refference of the primary key.it user defined--
select * from tblEmployee
sp_help tblEmployee
alter table tblEmployee
alter column area varchar(20)

--drop the primarykey--
alter table tblPatient
drop constraint pk_eid

--sp_help tblEmployee

--create new employee table--
create table tblArea
(areaName varchar(20) ,
zip_code varchar)

alter table tblArea
alter column areaName varchar(20) not null

--sp_help tblEmployee


alter table tblArea
add constraint pk_areaName primary key(areaName)

sp_help tblEmployee

alter table tblEmployee
add constraint fk_area foreign key(area)
references tblArea(areaName)

create table tblSkills
(name varchar(20) primary key,
skilldesc varchar(200))

create table tblEmployeeSkill
(emp_id char(4) references tblEmployee(employeeId) ,
skill_name varchar(20) constraint fk_skill foreign key references tblSkills(name),
skillLevel int,
primary key(emp_id,skill_name))

sp_help tblArea

--DML-------------------
insert into tblArea(areaName,zip_code) values ('ABC','1')
insert into tblArea(areaName,zip_code) values ('RTY','2')
insert into tblArea(areaName,zip_code) values ('YUI','2')

select * from tblArea

insert into tblSkills(name,skilldesc) values('','')

insert into tblEmployee values('E001','Ramu','ABC')
--###################################################################################

create database dbTraining
use dbTraining

create table Product
(id int constraint pk_id primary key,
name varchar(20),price float,
DOM date)

--sp_help Product

select * from Product

alter table Product 
add Quantity int

alter table Product
alter column name varchar(20) not null

insert into Product(id,name ,price,DOM, Quantity) values(101,'colgate','20.5','08-10-2019',20)
insert into Product(id,name ,price,DOM, Quantity) values(102,'closeup','22.5','07-10-2019',22)
insert into Product(id,name ,price,DOM, Quantity) values(103,'pepsodent','21.5','08-10-2019',23)
insert into Product(id,name ,price,DOM, Quantity) values(104,'myntra','23.5','07-10-2019',20)

select * from Product

--selection for deletion--
delete from Product where name='closeup'

delete from 

--update the price :you can either update price and quantity in the single code using set price,quantity
update Product set price=23.5
where name='closeup'

select * from Product
--task1
create table My_constraints(id int not null,name varchar(10) constraint pk_name primary key,salary float check(salary>1000),cityName varchar(10) unique)
--insert the values
insert into My_constraints values(102,'hi',500,'colachel')
select * from My_constraints
create table F_example(ex_name varchar(10) constraint fk_name foreign key references My_constraints(name))
insert into F_example values('deril')
select * from F_example
-- Feedback
-- Default 
-- IDENTITY (Seed, increment)

ALTER TABLE My_constraints ADD  Area VARCHAR(10) CONSTRAINT Area_default DEFAULT('KODIMUNAI')
select * from My_constraints
SP_HELP My_constraints
insert into My_constraints (name, salary, cityname) values ('PRI',4000,'PCHERY')

INSERT INTO My_constraints (id) VALUES (NULL)

CREATE TABLE Employee
(
	Id INT IDENTITY(5, 5) NOT NULL, 
	[name] VARCHAR(10)
)
-- SELECT GETDATE(), LEFT,  RIGHT, INDEX

-- SELECT name, * FROM sys.objects

--RESERVED WORDS
--[DESCRIPTION]
--KEYWORDS
insert into Employee values('siva')
select * from Employee

Create Table My_Table1  
(  
   IId int default(1500),  
   Name Nvarchar(50)Constraint Name_Default Default('Pankaj'),  
   Age Int,  
   Salary Int Default(100)  
)

INSERT INTO My_Table1 VALUES (23)

alter proc COUNT_STRING(@value varchar(100))
as
begin
DECLARE @count As Int=0
DECLARE @iterator As Int=0
while(@iterator<len(@value))
begin
if(select SUBSTRING(@value,@iterator,1))='A'
begin
set @count+=1
end
set @iterator+=1
end
select @count as occurance
end

exec COUNT_STRING 'priyaarvind'


exec COUNT_STRING 'ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT'
select len('ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT')
SELECT  Substring('ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT',4,1)

DECLARE @count As Int=0
DECLARE @iterator As Int=0
DECLARE @value As varchar(70)
SET @value='ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT'
while(@iterator<len(@value))
begin
if(select SUBSTRING(@value,@iterator,1))='A'
begin
set @count+=1
end
set @iterator+=1
end
select @count

Declare @TestValue  varchar(100)
Set @TestValue = 'ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT'
Declare @CharToFind varchar(max);
Set @CharToFind = 'A'
select 
(len(@TestValue ) - len(replace(@TestValue ,@CharToFind, '')))/len(@CharToFind) as repeatedWords


DECLARE @TestValue AS VARCHAR (100) ='ADKJFDJJFIRAIJFGIJRIOJOAJDFOJAEROWEAJVOJOERUKYUJTJAFBGFBFVFRBRT'
DECLARE @CharToFind CHAR (1) = 'A'
SELECT LEN(@TestValue )-LEN(REPLACE(@TestValue ,@CharToFind,'')) as Occurrences

