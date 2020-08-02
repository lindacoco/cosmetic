
use cosmetic;
select user(), database();

desc employee;
select * from employee;

insert into employee values
(1,'장현서','1988-12-01','010-4334-4321','서울시 송파구 방이동','A','manager',password('manager'),0),
(2,'장유리','1988-12-01','010-4334-4321','서울시 송파구 방이동','B','emp1',password('employee'),0),
(3,'장초코','1988-12-01','010-4334-4321','서울시 송파구 방이동','B','emp2',password('employee'),0);
