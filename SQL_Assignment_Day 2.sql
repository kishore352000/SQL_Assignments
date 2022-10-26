--Q1 : Create an orders/ product /customer table with the following schema. 

create database restaurant;
use restaurant;


create table customer(
cust_id int NOT NULL,
cust_name varchar(50),
cust_address varchar(50),
cust_tel varchar(10),
cust_email varchar(40)
primary key(cust_id)
);

insert into customer values(1,'kishore','gnt','924892','kis1232@gmail.com')
insert into customer values(2,'sai','vja','13482','sai456@gmail.com')
insert into customer values(3,'kiran','pkl','495435','kiran123@gmail.com')
insert into customer values(4,'sri','gkd','72222','sri@gmail.com')


create table item(
item_id int NOT NULL, 
item_name varchar(50),
item_price int,
customer_id int NOT NULL,
primary key (item_id),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

insert into item values(1,'pizza',120,1)
insert into item values(2,'burger',100,3)
insert into item values(3,'sandwich',80,4)
insert into item values(4,'noodles',100,2)
insert into item values(5,'paneer roll',60,1)
insert into item values(6,'icecream',70,3)


create table orders(
orders_id int NOT NULL Primary key,
customer_id int NOT NULL,
orders_datetime datetime,
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

insert into orders values(1,2,'2022/10/15 12:07:21')
insert into orders values(2,3,'2022/09/21 11:08:35')
insert into orders values(3,4,'2022/08/25 14:08:25')
insert into orders values(4,1,'2022/09/11 18:10:25')
insert into orders values(5,2,'2022/10/26 23:08:15')


create table order_item(
ord_item_id int NOT NULL Primary key,
order_id int NOT NULL,
item_id int NOT NULL,
customer_id int NOT NULL,
product_quantity varchar(50),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);



insert into order_item values(1,3,6,1,'good')
insert into order_item values(2,2,4,4,'not good')
insert into order_item values(3,5,1,3,'bad')
insert into order_item values(4,1,5,3,'too good')
insert into order_item values(5,4,2,2,'bad')


--Q2 : Create a student table which has information about Students, their marks, courses, etc. Display on screen the maximum marks, each student has obtained in each course, order it by course.

use student_details;
CREATE TABLE student1 (student_id int NOT NULL primary key, student_name varchar(20), course varchar(20),marks int )

insert into student1 values (123,'kishore','maths',40)
insert into student1 values (456,'sai','chemistry',55)
insert into student1 values (789,'kiran','physics',75)
insert into student1 values (101,'lakkireddy','maths',90)
insert into student1 values (105,'ravi','chemistry',77)
insert into student1 values (110,'deepu','chemistry',89)
insert into student1 values (100,'lokesh','physics',85)
insert into student1 values (80,'yasin','maths',90)

SELECT * FROM student1  WHERE marks IN (SELECT MAX(marks) FROM student1 GROUP BY course)  ORDER BY course


--Q3 : Create a telephone_directory table for atleast 20 citizens. It should have id, name, tel number, address, profession. Query the table to check how many citizens are working professionals, students, etc. 
create database assignments;
use assignments

CREATE TABLE Telephone_Directory (id int , name varchar(20),tel_no bigint,address varchar(30),profession varchar(20))


insert into Telephone_Directory values (1,'kishore',876971349,'hyd','Engineer')
insert into Telephone_Directory values (2,'lakkireddy',8769713412,'vja','Engineer')
insert into Telephone_Directory values (3,'sai',8736483822,'vja','doctor')
insert into Telephone_Directory values (4,'yaswanth',8769713414,'bangalore','doctor')
insert into Telephone_Directory values (5,'yogesh',848981532,'vskp','student')
insert into Telephone_Directory values (6,'sai kiran',8769713416,'chennai','IAS')
insert into Telephone_Directory values (7,'bharath',8739847417,'mumbai','student')
insert into Telephone_Directory values (8,'vijay',92749713418,'banglore','Engineer')
insert into Telephone_Directory values (9,'mohan',9472713419,'hyd','Lawyer')
insert into Telephone_Directory values (10,'sumith',8769713410,'vskp','Lawyer')
insert into Telephone_Directory values (11,'jaswanth',9769713401,'kolkata','Engineer')
insert into Telephone_Directory values (12,'deepu',87394713402,'delhi','doctor')
insert into Telephone_Directory values (13,'harish',82437893403,'pune','Engineer')
insert into Telephone_Directory values (14,'piyush',8769713404,'mumbai','Engineer')
insert into Telephone_Directory values (15,'charan',7382713405,'hyd','business')
insert into Telephone_Directory values (16,'manohar',8769713406,'vskp','bussiness')
insert into Telephone_Directory values (17,'shubam',89279713407,'bangalore','bussiness')
insert into Telephone_Directory values (18,'abhishekh',8389713408,'chennai','Engineer')
insert into Telephone_Directory values (19,'bhanu',8769713409,'chennai','IAS')
insert into Telephone_Directory values (20,'raju',82648713101,'bangalore','IAS')
insert into Telephone_Directory values (21,'satish',872478203,'vskp','doctor')

SELECT  profession,count(*) as count_profession from Telephone_Directory group by profession