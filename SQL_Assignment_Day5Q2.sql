use Day5;

CREATE TABLE cus_Information(
cus_name varchar(20),
cus_age INT,
cus_Aadhar_no BIGINT PRIMARY KEY
)

insert into cus_Information values('kishore',23,439439292312)
insert into cus_Information values('lakkireddy',24,129439292123)
insert into cus_Information values('yaswanth',20,3494392928909)
insert into cus_Information values('yogesh',25,679439292657)
insert into cus_Information values('lalith',23,899439292234)


CREATE TABLE Account_Details(
Acc_no BIGINT PRIMARY KEY,
balance BIGINT,
cus_Aadhar_no BIGINT ,
Acc_opened_date date,
Last_transaction_date date,
FOREIGN KEY(cus_Aadhar_no) references cus_Information(cus_Aadhar_no))


insert into Account_Details values(123456789234,200000,439439292312,'01-05-2022','05-08-2022')
insert into Account_Details values(223456789235,100000,129439292123,'05-08-2022','02-10-2022')
insert into Account_Details values(323456789236,210000,3494392928909,'02-05-2022','03-07-2022')
insert into Account_Details values(423456789237,250000,679439292657,'04-07-2022','07-09-2022')
insert into Account_Details values(523456789238,300000,899439292234,'02-04-2022','02-06-2022')


CREATE OR ALTER FUNCTION print_disp(@bal BIGINT)
RETURNS TABLE AS

  RETURN 
  select Acc_no,cus_name,balance,Account_Details.cus_Aadhar_no,Acc_opened_date,Last_transaction_date
  from Account_Details
  INNER JOIN cus_Information
  ON Account_Details.cus_Aadhar_no = cus_Information.cus_Aadhar_no
  WHERE Account_Details.balance>@bal


  select * from print_disp(200000)