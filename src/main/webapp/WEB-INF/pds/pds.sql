/* pds.sql */
show tables;

create table pds (
	idx 		int not null auto_increment,	/* 자료실 고유번호 */
	mid			varchar(20) not null,			/* 올린이 아이디 */
	midIdx		int not null,
	nickName 	varchar(20) not null,			/* 올린이 닉네임 */
	fName		varchar(200) not null,			/* 처음 업로드할때의 파일명 */
	fSName		varchar(200) not null,			/* 파일서버에 저장되는 실제파일명 */
	fSize		int,							/* 총 파일 사이즈 */
	title		varchar(100) not null,			/* 파일 제목 */
	part		varchar(20) not null,			/* 파일 분류 */
	pwd			varchar(100) not null,			/* 비밀번호(암호화-SHA256 암호화 처리) */
	fDate		datetime default now(),			/* 파일 업로드한 날짜 */
	downNum		int default 0,					/* 파일 다운로드 횟수 */
	openSw		char(6) default '공개',			/* 파일 공개(비공개)여부 */
	content		text,							/* 파일 상세설명 */
	primary key (idx),							/* 기본키 : 자료파일의 고유번호 */
	foreign key (midIdx) references member(idx) /* 외래키 : member테이블의 idx */
	on update cascade on delete restrict
);

desc pds;

select * from pds order by idx desc;

select count(*) as cnt from pds where date_sub(now(), interval 1 day) < fDate";