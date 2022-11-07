
use Day6;

CREATE TABLE sales(
s_id INT PRIMARY KEY,
s_name varchar(20),
amount BIGINT,
city varchar(20)
)

insert into sales values (1,'Kishore',5000,'Hyderabad')
insert into sales values (2,'Yaswanth',4000,'Delhi')
insert into sales values (3,'Lalith',2000,'Chennai')
insert into sales values (4,'Yogesh',5500,'Bangalore')
insert into sales values (5,'Mohan',7000,'Chennai')

insert into sales values (6,'Bharath',4000,'Bangalore')
insert into sales values (7,'Pream',3500,'Delhi')
insert into sales values (8,'Hari',3000,'Delhi')
insert into sales values (9,'Vijay',6000,'Hyderabad')
insert into sales values (10,'Siva',4500,'Hyderabad')



CREATE OR ALTER FUNCTION sales_values(@val varchar(20))
RETURNS TABLE AS
RETURN
select city ,amount   from sales group by city,amount having city = @val


CREATE OR ALTER FUNCTION maxValue(@city_name varchar(20))
RETURNS @ans TABLE (amount BIGINT) AS
BEGIN

DECLARE @res TABLE (city varchar(20),Amount BIGINT)
insert into @res SELECT * FROM sales_values(@city_name)

insert into @ans SELECT AVG(Amount) from @res

 return 

END

SELECT* from maxValue('Delhi')