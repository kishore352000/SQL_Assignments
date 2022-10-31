 -- Q1 : Write a query to fetch the first name and last name of a person from a table and display it together as "FULL NAME"
 create database Day3;
use Day3;

create table person
(
 FirstName         VARCHAR(50) NOT NULL,
 LastName          VARCHAR(50)NOT NULL,
)

insert into person values ('Kishore','Lakkireddy');
insert into person values('Sai','Kiran');
insert into person values('Yasin','Syed');

SELECT FirstName, LastName, Firstname + ' '  + LastName AS FullName FROM person

--Q2:Write a query to find all the people from a given country. (Say, If 5 people are from Delhi, 3 are from Mumbai, it should list all the 8 people) . The city, country information should be in a different table, use joins.
create table country(
    country_id int primary key,
    country_name nvarchar(30)
)

insert into country values(10,'India')
insert into country values(20,'Sri Lanka')


create table city_table(
    person_name nvarchar(25),
    city_name nvarchar(30),
    country_id int,
    foreign key (country_id) references country(country_id)
)


insert into city_table values('	Kishore','Hyderabad',10)
insert into city_table values('Lokesh','Bangalore',10)
insert into city_table values('Yasin','Chennai',10)
insert into city_table values('Mohan','Seoul',20)
insert into city_table values('Bharath','Mumbai',10)
insert into city_table values('Vijay','Bangalore',10)
insert into city_table values('Lalith','Kolkata',10)

select a.person_name, b.country_name
from country b , city_table a where b.country_id = a.country_id
and country_name = 'India'

-- Q3: Write a sql query to fetch only the first 3 letters of the city from the city table

create table city(city_name varchar(50) Not Null Primary key)

insert into city values('vijayawada')
insert into city values('hyderabad')
insert into city values('delhi')
insert into city values ('mumbai')
insert into city values ('chennai')

select city_name ,substring(city_name,1,3)  as city_shortcut from city;--by deafult alphabetical order


--Q4 : Write a query to print the names of the employees and departments from the employee table with name ascending and department descending.

create table employee(emp_name varchar(50) not null, dept_name varchar(50) not null);

insert into employee values ('Kishore','CSE');
insert into employee values ('Vijay','Physics');
insert into employee values ('Lokesh','ECE');
insert into employee values ('Lalith','ECE');
insert into employee values ('Hari' ,'Chemistry');

select * from employee  ORDER BY emp_name ASC, dept_name DESC ;

-- Q5: Write a query to fetch the employee names who have salaries more than 50000 and less than 80000

create table emp1(emp_id int not null primary key , emp_name varchar(50) not null, salary int not null);

insert into emp1 values (1,'Sai',55000);
insert into emp1 values (2,'Mohan',30000);
insert into emp1 values(3,'Bharath',75000);
insert into emp1 values(4,'Vijay',60000);
insert into emp1 values(5,'Pream',40000);

select * from emp1 where salary>50000 and  salary<80000;

-- Q6: Write a sql query to fetch the list of employees who draw the same salary.

insert into emp1 values(6,'Kishore',30000);
insert into emp1 values(7,'Lakkireddy',40000);
insert into emp1 values(8,'Jayanth',78000);
insert into emp1 values(9,'Hari',60000);

SELECT e1.emp_name, e1.salary
FROM emp1 e1,emp1 e2
WHERE e1.Salary = e2.Salary AND e1.emp_name <> e2.emp_name

-- Q7:Write a query to fetch all students from the student table who do not study Maths and Physics

create table student(id int primary key,st_name varchar(50),course varchar(20));

insert into student values(1,'kishore','Maths');
insert into student values(2,'Yaswanth','English');
insert into student values(3,'Mohan','Physics');
insert into student values(4,'Bharath','Chemistry');
insert into student values(5,'Lalith','Physics');

select * from student where course!='Maths' and course!='Physics';

-- Q8: Write a query to fetch all students who joined after Feb 2020

create table student_details(id int primary key, st_name varchar(20), DOJ date);

insert into student_details values(1,'Kishore','2021/06/23')
insert into student_details values(2,'Pream','2019/12/05')
insert into student_details values(3,'Hari','2020/01/29')
insert into student_details values(4,'Shiva','2020/04/15')
insert into student_details values(5,'Vijay','2022/07/22')

select * from student_details where DOJ > '02/29/2020';

--Q9: From an orders table, fetch the maximum purchase amount a salesman has made in the last 6 months.

create table orders(
    order_id int  primary key,
    salesman_id int,
    amount int,
    sales_date date
)


insert into orders values (1,4,40000,'10/24/2022')
insert into orders values (2,5,45000,'8/20/2022')
insert into orders values (3,2,75000,'5/12/2022')
insert into orders values (4,5,25000,'4/5/2022')
insert into orders values (5,1,30000,'5/12/2022')
insert into orders values (6,1,40000,'6/22/2022')
insert into orders values (7,3,35000,'7/10/2022')
insert into orders values (8,2,32000,'8/1/2022')

select salesman_id, amount
from orders
where sales_date > '5/1/2022'
and amount = any (select max(amount) from orders group by salesman_id)
order by salesman_id