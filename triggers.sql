use trig;
delete from Student;
select * from Student;
create table Student(Name Varchar(35), age INT, Score INT);
insert into Student values ("Rahul Khanna", 20, 10);

delimiter //
create trigger sample 
before insert on Student 
for each row
begin
	if new.score < 0 then set new.score = 0;
	end if;
end;
//
delimiter ;

insert into Student values ("Riya Kapoor", 27, -8);
insert into Student values ("Nitin Shetty", 33, 20);


create table customer (
acc_no integer primary key, 
cust_name varchar(20), 
avail_balance decimal);

create table mini_statement (
acc_no integer, 
avail_balance decimal, 
foreign key(acc_no) references customer(acc_no) on delete cascade);

insert into customer values (1000, "Fanny", 7000);
insert into customer values (1001, "Peter", 12000); 

delimiter //
create trigger update_cus
after update on customer
for each row
begin
insert into mini_statement values (old.acc_no, old.avail_balance);
end; // 
delimiter ;
update customer set avail_balance = avail_balance + 2000 where acc_no = 1000;
update customer set avail_balance = avail_balance + 2000 where acc_no = 1001;
delete from mini_statement;
delete from customer;
select * from customer;
select * from mini_statement;