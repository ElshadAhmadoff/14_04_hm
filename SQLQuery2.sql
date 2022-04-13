create database Company
use Company
create table Workers(
Id int
Name nvarchar(50),
Surname nvarchar(50),
Position nvarchar(50),
Salary int)

create table Directors(
Id int
Name nvarchar(50),
Surname nvarchar(50),
Salary int
WorkerId int references Workers(Id))

create table Departaments(
Id int
WorkerId int references Workers(Id),
DirectorId int References Directors(Id),
Name nvarchar(50),
WorkersCount int,
CreatingTime datetime
)
insert into Workers (Id,Name,surname,position,salary) values (1,'Ershad','Teymurov','Web deweloper',5000.0000)

insert into Directors (Id,Name,surname,salary,WorkerId) values (1,'Elshad','Ahmadof',50000.0000,2)

insert into Departaments (Id,WorkerId,DirectorId,name,WoerkerCount,CreatingTime) values (1,2,1,'web',2,1999-09-09)



select name,surname,salary from Workers where Id = (select WorkersId from Departaments where name = 'Tesla')
alter table Directors 
add WorkerId int
select name , surname, salary from Workers where Id =  (select WorkerId from Directors where name = 'Elshad')
select name,surname,salary from Workers where (select AVG(Salary) < Salary from Workers)