show tables;

create table schedule (
	idx		int	not null auto_increment primary key,
	mid		varchar(20) not null,
	sDate	datetime not null,		/* 일정 등록 날짜 */
	part	varchar(10) not null,	/* 1.모임, 2.업무, 3.학습, 4.여행, 0.기타 */
	content text not null			/* 일정 상세 내역 */
);

desc schedule;

insert into schedule values (default, 'hkd1234', '2022-05-22', '여행', '남해 꽃구경');
insert into schedule values (default, 'hkd1234', '2022-05-23', '학습', '초기메뉴 완성');
insert into schedule values (default, 'hkd1234', '2022-05-26', '업무', '업체 선정회의 13시30분 회의실');
insert into schedule values (default, 'hkd1234', '2022-05-26', '업무', '결과 발표 18시 각 부서별');
insert into schedule values (default, 'hkd1234', '2022-05-26', '기타', '체육관 알아보기');
insert into schedule values (default, 'hkd1234', '2022-05-28', '모임', '초등학교 동창회, 장소:모이자회관 18시');
insert into schedule values (default, 'hkd1234', '2022-05-29', '기타', '체육관 등록');
insert into schedule values (default, 'hkd1234', '2022-06-01', '기타', '지방 단체장 선거');
insert into schedule values (default, 'kms1234', '2022-05-27', '기타', '지방 단체장 사전투표');
insert into schedule values (default, 'kms1234', '2022-06-01', '여행', '제주도 한라산 철쭉산행');

select * from schedule order by sDate desc;
select * from schedule where mid='hkd1234' order by sDate desc;
select * from schedule where mid='hkd1234' and sDate='2022-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2022-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' group by part order by sDate desc;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' group by part order by sDate desc;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2022-05' group by part order by sDate desc;