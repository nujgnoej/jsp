show tables;

/*
 	프로젝트 작업순서...
 	1. 업무분석
 	2. 요구사항설계(요구사항명세서)
  	3. 데이터베이스(테이블/필드) 설계
  	4. VO 만들기
  	5. DAO 만들기
  	  : JDBC 라이브러리를 lib폴더에 복사해 넣는다.
  	  : Connection/PreparedStatement/ResultSet 객체생성
  	6. FrontController 만든다.(확장자 패턴사용)
  	   Interface 만든다.('execute'메소드로 작업에 통일시킬수 있도록 메소드명을 지정해 준다.)
  	
  	
  	7. View작업을 진행하면서 DAO와 Service객체를 활용한다.
  	
  	8. 테스팅(요구사항과 매칭되는지 체크) - 메뉴얼..
  	9. 배포
 */

create table login (
	idx		 int not null auto_increment primary key,	/* 고유번호 */
	mid		 varchar(20) not null,						/* 아이디 */
	pwd		 varchar(20) not null,						/* 비밀번호 */
	name	 varchar(20) not null,						/* 회원이름 */
	point	 int default 100,							/* 포인트(최초 가입시 100포인트 지급) */
	lastDate datetime default now(),					/* 최종 접속일자 */
	vCount	 int default 0								/* 개별 방문자의 방문카운트 누적 */
);

desc login;
drop table login;


insert into login values (default,'admin','1234','관리자',default,default,default);
insert into login values (default,'hkd1234','1234','홍길동',default,default,default);
insert into login values (default,'kms1234','1234','김말숙',default,default,default);

select * from login;

delete from login where mid='kms1234';
delete from login;