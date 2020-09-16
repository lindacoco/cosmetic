
use cosmetic;
select user(), database();

desc employee;
select * from employee;

insert into employee values
(1,'장현서','1988-12-01','010-4334-4321','서울시 송파구 방이동','A','manager',password('manager'),0),
(2,'장유리','1988-12-01','010-4334-4321','서울시 송파구 방이동','B','emp1',password('employee'),0),
(3,'장초코','1988-12-01','010-4334-4321','서울시 송파구 방이동','B','emp2',password('employee'),0);


INSERT INTO product VALUES
(1,'nars skincare lotion','로션',now(),38000,NULL,'A',0,10,0),
(2,'MAC makeup pencil','아이라이너',now(),22000,NULL,'B',0,20,0);

INSERT INTO USER VALUES
(1,'nana jang','1990-02-11','010-010-1111','서울시 송파구','apple',password('apple'),0,0),
(2,'didi jang','1990-02-11','010-010-1111','서울시 송파구','apple2',password('apple2'),0,0),
(3,'soso jang','1990-02-11','010-010-1111','서울시 송파구','apple3',password('apple3'),0,0),
(4,'chch jang','1990-02-11','010-010-1111','서울시 송파구','apple',password('apple'),0,1);
