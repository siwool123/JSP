--Java에서 처음으로 JDBC 프로그래밍 해보기
--우선 system 계정으로 연결 후 새 실습계정 생성
alter session set "_ORACLE_SCRIPT"=true;
create user education identified by 1234;
grant connect, resource, unlimited tablespace to education;
create table member (
    id varchar2(30) not null,
    pass varchar2(40) not null,
    name varchar2(50) not null,
    regidate date default sysdate,
    primary key (id)    );
insert into member (id, pass, name) values ('test', 1234, '테스트');
commit;

insert into member (id, pass, name) values ('test9', 9999, '테스트9');
commit;
--HR계정연결후 다음 쿼리문 실행
select * from employees where department_id=50 order by employee_id desc;

------------------------------------------------------------------------------
--JDBC > CallableStatement 인터페이스 사용하기
--education 계정 에서 실습
select substr('hongildong', 1, 1) from dual;
select rpad('h', 10, '*') from dual;
select rpad(substr('hongildong', 1, 1), length('hongildong'), '*') from dual;

/* 예제1-1] 함수 : fillAsterik()
시나리오] 매개변수로 회원아이디(String)을 받으면 첫문자 제외한 나머지 부분을 *로 변환하는 함수를 생성하시오
예) oracle21c -> 0********    */
create or replace function fillAsterik (id varchar2)
return varchar2 
is st varchar2(30); 
begin
    st := rpad(substr(id, 1, 1), length(id), '*');
    return st;
end;
/
select fillAsterik('Nancy') from dual;
select fillAsterik(id) from member;

/* 예제2-1] 프로시저 : MyMemberInsert()
시나리오] member 테이블에 새로운 회원정보를 입력하는 프로시저를 생성하시오
    파라미터 : In => 아이디, 패스워드, 이름     Out => returnVal(성공:1, 실패:0) */
create or replace procedure MyMemberInsert 
    (id in varchar2, pw in varchar2, name in varchar2, rval out number)
is 
begin
    insert into member (id, pass, name) values (id, pw, name);
    if sql%found then --입력정상처리시 true반환
        rval := sql%rowcount; --입력성공한 행갯수 얻어와 out파라미터에 저장
        commit; --행변화생기므로 반드시 commit해야한다
    else rval := 0; --실패시 0반환
    end if;
end;
/
var res varchar2;
execute MyMemberInsert('pro02', '1234', '프로시저1', :res);
execute MyMemberInsert('pro03', '1234', '프로시저2', :res);
execute MyMemberInsert('pro04', '1234', '프로시저4', :res);
print res;

/* 예제3-1] 프로시저 : MyMemberDelete()
시나리오] member테이블에서 레코드를 삭제하는 프로시저를 생성하시오
    파라미터 : In => member_id(아이디)    Out => returnVal(SUCCESS/FAIL 반환) */
create or replace procedure MyMemberDelete (mid in varchar2, rval out varchar2)
is 
begin
    delete from member where id=mid;
    if sql%found then 
        rval := 'SUCCESS'; --회원레코드가 정삭삭제시 실행, 커밋한다. 
        commit; 
    else rval := 'FAIL'; 
    end if;
end;
/
var res2 varchar2(20);
execute MyMemberDelete('pro05', :res2);
execute MyMemberDelete('test99', :res2);
print res2;

/* 예제4-1] 프로시저 : MyMemberAuth()
시나리오] 아이디와 패스워드를 매개변수로 전달받아서 회원인지 여부를 판단하는 프로시저를 작성하시오. 
    매개변수 : In -> user_id, user_pass,    Out -> returnVal
    반환값 : 
        0 -> 회원인증실패(둘다틀림)
        1 -> 아이디는 일치하나 패스워드가 틀린경우
        2 -> 아이디/패스워드 모두 일치하여 회원인증 성공  */
create or replace procedure MyMemberAuth (uid in varchar2, upw in varchar2, rval out number)
is
    mcnt number(1) := 0; --count(*)로 반환되는값 저장
    mpw varchar2(30); --테이블에서 입력한 아이디와 일치하는 레코드중 비번 저장할 변수
begin
    select count(*) into mcnt from member where id=uid;
    if mcnt=1 then --회원아이디가 존재하는경우라면
        select pass into mpw from member where id=uid; --패스워드확인위해 두번째쿼리실행
        if mpw=upw then rval := 2; --인파라미터로 전달된 비번과 DB에서 가져온 비번 비교
        else rval := 1; --아이디만 일치한경우
        end if;
    else rval := 0; --아이디가 일치하지않는경우
    end if;
end;
/
var res_auth varchar2(1);
execute MyMemberAuth('pro07', '1234', :res_auth);
execute MyMemberAuth('pro07', '1111', :res_auth);
execute MyMemberAuth('pro08', '1111', :res_auth);
print res_auth;

---------------------------------------------------------------------
--JSP 웹프로그래밍 실습 / musthave 계정사용
---------------------------------------------------------------------
alter session set "_oracle_script"=true;
create user musthave identified by 1234;
grant connect, resource, unlimited tablespace to musthave;

select * from tab;
drop table member;
create table member(
    id varchar2(10) primary key,
    pw varchar2(10) not null,
    name varchar2(10) not null,
    regidate date default sysdate not null
);
alter table member modify (id varchar2(30), pw varchar2(30), name varchar2(30));
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcnt number(6),
    foreign key(id) references member(id)
);
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
insert into member (id, pw, name) values ('musthave', '1234', '머스트해브');
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave', sysdate, 0);
commit;
insert into member (id, pw, name) values ('siwool', '1234', '강시울');
insert into member (id, pw, name) values ('test', '1234', '테스트회원');
commit;
---------------------------------------------------------------------
--모델1 방식의 회원제 게시판 제작하기 : 회원케이블인 member와 게시판테이블인 board 사용
---------------------------------------------------------------------
--게시판목록 및 검색위한 더미데이터 추가
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 봄입니다.', '봄의왈츠', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 여름입니다.', '여름향기', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 가을입니다.', '가을동화', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 겨울입니다.', '겨울연가', 'musthave', sysdate, 0);
commit;

--게시판 목록 구현하기
--1. 게시물 갯수 카운트
select count(*) from board;
--검색기능 추가위해 where절 추가 > 검색조건 만족하는 게시물 개수 카운트
select count(*) from board where title like '%여름%' or content like '%여름%';
--2. 출력할 게시물 출력하기
--게시판 목록은 최근 작성 게시물이 상단에 출력돼야하므로 일련번호를 내림차순정렬하여 출력
select * from board where title like '%지금%' order by num desc;

--과제용 테이블 생성 및 더미데이터 추가
create table member2(
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    email varchar2(60) not null,
    emailok varchar2(20) check(emailok in ('yes', 'no')),
    add1 number(10),
    add2 varchar2(100),
    add3 varchar2(100),
    phone varchar2(30) not null,
    smsok varchar2(20) check(smsok in ('yes', 'no')),
    regidate date default sysdate not null
);
alter table member2 modify add1 varchar(10);
insert into member2 values 
('siwool', '1234', '강시울', 'siwool123@navr.com', 'no', '02452', '서울시 동대문구 이문로 37', '1421호', '01056371055', 'no', sysdate);

--게시판 글쓰기 구현하기 
/* board테이블의 id컬럼은 not null로 지정되어있어 값입력되지않으면 제약조건위배로 에러발생
  tjoeun 이란 아이디는 부모테이블의meember에 없는 레코드이므로 외래키 제약조건에 위배되어 에러발생 */
insert into board (num, title, content, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 봄입니다.', '봄의왈츠', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '지금은 봄입니다.', '봄의왈츠', 'tjoeun', sysdate, 0);
update board set id='test2' where title='제목 테스트';
insert into board (num, title, content, id, postdate, visitcnt) values 
    (seq_board_num.nextval, '나는 테스트입니다.', '나는 테스트입니다.', 'test', sysdate, 0);
    
--게시판 내용보기구현
/* 내용보기 페이지에서는 작성핮의 이름을 출력하기위해 member 테이브로가 inner join통해 쿼리문 작성 */
select * from board natural join member where num=1;
select b.*, m.name from board b, member m where b.id=m.id and num=1;

--내용보기하면 해당게시물 조회수가 1증가한다.
update board set visitcnt=visitcnt+1 where num=1;