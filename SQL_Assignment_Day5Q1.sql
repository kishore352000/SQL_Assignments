create database Day5;

use Day5;

create table passport_information(
passport_no bigint primary key,
candidate_name varchar(20) not null,
expiry_date date not null,
years_of_validity int,
application_channel varchar(20)
)


create or alter procedure passport @p_no bigint,@c_name varchar(20),@exp_date date,@years_val int,
@channel varchar(20)
as
insert into passport_information values(@p_no,@c_name,@exp_date,@years_val,@channel);