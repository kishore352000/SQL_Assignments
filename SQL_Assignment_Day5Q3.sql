use Day5;

CREATE TABLE Movies(
movies_id INT PRIMARY KEY,
Horror_movies varchar(50),
Kids_movies varchar(50))


insert into Movies values(1001,'Raaz','Charlotte Web')
insert into Movies values(1002,'The Burning','Finding Nemo')
insert into Movies values(1003,'They Look Like People','Frozen')
insert into Movies values(1004,'In Fabric','Lilo and Stitch')
insert into Movies values(1005,'Sator','Mary Poppins')
insert into Movies values(1006,'Paranormal Activity','Toy Story')
insert into Movies values(1007,'Creepshow','Wall-E')
insert into Movies values(1008,'Black Christmas','Beauty and the Beast')
insert into Movies values(1009,'The Stuff','Inside Out')


CREATE FUNCTION Dis_Movies()
RETURNS TABLE AS
RETURN
select Horror_movies,Kids_movies from Movies 