create database trig;
use trig;
delete from Student;
select * from Student;
create table Student(Name Varchar(35), age INT, Score INT);

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

insert into Student values ("Rahul Khanna", 20, 10);
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

-- Create a trigger that fires after inserting a new customer.
DELIMITER //

CREATE TRIGGER after_customer_insert
AFTER INSERT ON customer
FOR EACH ROW
BEGIN
    INSERT INTO mini_statement (acc_no, avail_balance)
    VALUES (NEW.acc_no, NEW.avail_balance);
END;
//

DELIMITER ;

select * from customer;
select * from mini_statement;
