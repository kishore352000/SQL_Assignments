use Day5;

CREATE TABLE student(
s_id INT PRIMARY KEY,
s_name varchar(20),
Course_name varchar(50),
marks INT)

insert into student values(1001,'Kishore','Phys',80)
insert into student values(1002,'Kishore','Chem',70)
insert into student values(1004,'Kishore','Maths',60)
insert into student values(1005,'Kishore','Eng',55)


insert into student values(1006,'yaswanth','Phys',60)
insert into student values(1007,'yaswanth','Chem',80)
insert into student values(1008,'yaswanth','Maths',90)
insert into student values(1009,'yaswanth','Eng',65)

insert into student values(1010,'lalith','Phys',78)
insert into student values(1011,'lalith','Chem',85)
insert into student values(1012,'lalith','Maths',90)
insert into student values(1013,'lalith','Eng',60)


insert into student values(1014,'pream','Phys',68)
insert into student values(1015,'pream','Chem',75)
insert into student values(1016,'pream','Maths',95)
insert into student values(1017,'pream','Eng',65)

CREATE OR ALTER PROCEDURE p1 @t_mark INT AS 
BEGIN
SELECT s_name, SUM(marks) AS s_total from student group by s_name having  SUM(marks) <@t_mark
END



CREATE OR ALTER PROCEDURE p2 @d_s_name varchar(20) AS
BEGIN
DECLARE @total_marks AS INT
SELECT  s_name, SUM(marks)  from student group by s_name having s_name =@d_s_name;

END