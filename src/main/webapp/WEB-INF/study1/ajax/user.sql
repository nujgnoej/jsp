show tables;

create table user(
	idx		int not null auto_increment primary key,
	mid		varchar(20) not null,
	name	varchar(20) not null,
	age		int default 20,
	address varchar(50)
);

desc user;

insert into user values (default, 'hkd1234', '홍길동', 22, '서울');
insert into user values (default, 'kms1234', '김말숙', 32, '청주');
insert into user values (default, 'lkj1234', '이기자', 25, '인천');
insert into user values (default, 'ohn1234', '오하늘', 29, '부산');
insert into user values (default, 'admin', '관리자', 30, '청주');

select * from user;
select * from user order by idx desc;