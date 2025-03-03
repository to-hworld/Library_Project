--도서관 회원
create table MEMBER(
    ID VARCHAR2(10) PRIMARY KEY,
    PASS VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE NOT NULL,
    PHONE_NO NUMBER(11) NOT NULL,
    EMAIL VARCHAR2(30) DEFAULT NULL,
    REG_LIB VARCHAR2(10) NOT NULL,
    AGREE CHAR(1) DEFAULT 'Y',
    CONSTRAINT MEMBER_REQ_LIB_FK FOREIGN  KEY (REQ_LIB) 
    REFERENCES LIBRARY(LIB_NAME),
    CONSTRAINT MEMBER_PHONE_NO_CHECK CHECK (LENGTH(PHONE_NO) <= 11),
    CONSTRAINT MEMBER_AGREE_CHECK CHECK (AGREE IN ('Y','N')),
    CONSTRAINT MEMBER_ID_CHECK CHECK (REGEXP_LIKE(ID,'^([^[:punct:][:space:]]|\w)+')),
    CONSTRAINT MEMBER_PASS_CHECK CHECK (REGEXP_LIKE(PASS,'^([^[:punct:][:space:]]|\S)+')),
    CONSTRAINT MEMBER_EMAIL_CHECK
    CHECK (REGEXP_LIKE(EMAIL,'^([^[:punct:][:space:]]|\w)+@([^[:punct:][:space:]]|\w)+\.\w+(\.\w+)*'))
);

--정규식 확인 문장
select REGEXP_SUBSTR('*-+','^([^[:punct:][:space:]]|\S)+') from DUAL;
--테이블 기본값 확인 문장
create table member(
    ID VARCHAR2(10) PRIMARY KEY,
    REG_DATE DATE DEFAULT SYSDATE NOT NULL
);
insert into member(id) values('a');
select * from member;
drop table member;

--도서관
create table LIBRARY(
    LIB_NAME VARCHAR2(10) PRIMARY KEY,
    CLOSED DATE NOT NULL,
    CON_NUMBER NUMBER(11) NOT NULL
);

--소장 도서
create table LIBRARY_BOOK(
    ISBN NUMBER(15) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,
    PUBLISHER VARCHAR2(10) NOT NULL,
    PUB_DATE DATE NOT NULL,
    AUTHOR VARCHAR2(10) NOT NULL,
    CHECK_OUT CHAR(1) DEFAULT 'N',
    DUE_DATE DATE,
    HOLDING_LIB VARCHAR2(10) NOT NULL,
    CATE VARCHAR2(10) NOT NULL,
    LOC NUMBER(10) NOT NULL,
    CONSTRAINT LIBRARY_BOOK_HOLDING_LIB_FK FOREIGN  KEY (HOLDING_LIB) 
    REFERENCES LIBRARY(LIB_NAME),
    CONSTRAINT LIBRARY_BOOK_CATE_FK FOREIGN  KEY (CATE) 
    REFERENCES CATEGORY(CATE_NO),
    CONSTRAINT LIBRARY_BOOK_LOC_FK FOREIGN  KEY (LOC) 
    REFERENCES BOOK_LOC(LOC_NO),
    CONSTRAINT LIBRARY_BOOK_CHECK_OUT_CHECK CHECK (CHECK_OUT IN ('Y','N'))
);

--도서 위치
create table BOOK_LOC(
    LOC_NO NUMBER(10) PRIMARY KEY,
    LIBRARY VARCHAR2(10) NOT NULL,
    SUPER_LOC VARCHAR2(10) NOT NULL,
    SUB_LOC VARCHAR2(10) NOT NULL,
    CONSTRAINT BOOK_LOC_LIBRARY_FK FOREIGN  KEY (LIBRARY) 
    REFERENCES LIBRARY(LIB_NAME)
);

--카테고리
create table CATEGORY(
    CATE_NO NUMBER(10) PRIMARY KEY,
    SUPER_CATE VARCHAR2(10) NOT NULL,
    SUB_CATE VARCHAR2(10) NOT NULL
);

--도서 예약
create table BOOK_RESERVATION(
    ID VARCHAR2(10),
    ISBN VARCHAR2(15),
    TITLE VARCHAR2(20) NOT NULL,
    HOLDING_LIB VARCHAR2(10) NOT NULL,
    BOOKING DATE DEFAULT SYSDATE NOT NULL,
    RECEIPT_DATE DATE DEFAULT NULL NOT NULL,
    CONSTRAINT BOOK_RESERVATION_PK PRIMARY KEY(ID, ISBN),
    CONSTRAINT BOOK_RESERVATION_ID_FK FOREIGN  KEY (ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT BOOK_RESERVATION_ISBN_FK FOREIGN  KEY (ISBN) 
    REFERENCES LIBRARY_BOOK(ISBN),
    CONSTRAINT BOOK_RESERVATION_TITLE_FK FOREIGN  KEY (TITLE) 
    REFERENCES LIBRARY_BOOK(TITLE),
    CONSTRAINT BOOK_RESERVATION_HOLDING_LIB_FK FOREIGN  KEY (HOLDING_LIB) 
    REFERENCES LIBRARY(LIB_NAME)
);

--도서 대출
create table BOOK_RENT(
    ID VARCHAR2(10),
    ISBN VARCHAR2(15),
    TITLE VARCHAR2(20) NOT NULL,
    HOLDING_LIB VARCHAR2(10) NOT NULL,
    RECEIPT_DATE DATE NOT NULL,
    CONSTRAINT BOOK_RENT_PK PRIMARY KEY(ID, ISBN),
    CONSTRAINT BOOK_RENT_ID_FK FOREIGN  KEY (ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT BOOK_RENT_ISBN_FK FOREIGN  KEY (ISBN) 
    REFERENCES LIBRARY_BOOK(ISBN),
    CONSTRAINT BOOK_RENT_TITLE_FK FOREIGN  KEY (TITLE) 
    REFERENCES LIBRARY_BOOK(TITLE),
    CONSTRAINT BOOK_RENT_HOLDING_LIB_FK FOREIGN  KEY (HOLDING_LIB) 
    REFERENCES LIBRARY(LIB_NAME)
);

--희망 도서
create table REQUESTED_BOOK(
    REQ_ID VARCHAR2(10),
    ISBN VARCHAR2(15),
    REQ_BOOK VARCHAR2(20) NOT NULL,
    REQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT REQUESTED_BOOK_PK PRIMARY KEY(REQ_ID, ISBN),
    CONSTRAINT REQUESTED_BOOK_REQ_ID_FK FOREIGN  KEY (REQ_ID) 
    REFERENCES MEMBER(ID)
);
--관심 도서
create table INTEREST_BOOK(
    MEM_ID VARCHAR2(10) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,
    ISBN VARCHAR2(15) NOT NULL,
    CONSTRAINT INTEREST_BOOK_MEM_ID_FK FOREIGN  KEY (MEM_ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT INTEREST_BOOK_TITLE_FK FOREIGN  KEY (TITLE) 
    REFERENCES LIBRARY_BOOK(TITLE),
    CONSTRAINT INTEREST_BOOK_ISBN_FK FOREIGN  KEY (ISBN) 
    REFERENCES LIBRARY_BOOK(ISBN)
);

--상호대차 신청
create table INTERLIBRARY(
    ID VARCHAR2(10) PRIMARY KEY,
    ISBN VARCHAR2(15) NOT NULL,
    TITLE VARCHAR2(20) NOT NULL,
    HOLDING_LIB VARCHAR2(10) NOT NULL,
    REQ_LIB VARCHAR2(10) NOT NULL,
    REQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT INTERLIBRARY_ID_FK FOREIGN  KEY (ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT INTERLIBRARY_ISBN_FK FOREIGN  KEY (ISBN) 
    REFERENCES LIBRARY_BOOK(ISBN),
    CONSTRAINT INTERLIBRARY_TITLE_FK FOREIGN  KEY (TITLE) 
    REFERENCES LIBRARY_BOOK(TITLE),
    CONSTRAINT INTERLIBRARY_HOLDING_LIB_FK FOREIGN  KEY (HOLDING_LIB) 
    REFERENCES LIBRARY(LIB_NAME),
    CONSTRAINT INTERLIBRARY_REQ_LIB_FK FOREIGN  KEY (REQ_LIB) 
    REFERENCES LIBRARY(LIB_NAME)
);

--도서 이용내역
create table RENTAL_LIST(
    ID VARCHAR2(10),
    ISBN VARCHAR2(15),
    TITLE VARCHAR2(20) NOT NULL,
    RECEIPT_DATE DATE NOT NULL,
    RETURN_DATE DATE,
    CONSTRAINT RENTAL_LIST_PK PRIMARY KEY(ID, ISBN),
    CONSTRAINT RENTAL_LIST_ID_FK FOREIGN  KEY (ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT RENTAL_LIST_ISBN_FK FOREIGN  KEY (ISBN) 
    REFERENCES LIBRARY_BOOK(ISBN),
    CONSTRAINT RENTAL_LIST_TITLE_FK FOREIGN  KEY (TITLE) 
    REFERENCES LIBRARY_BOOK(TITLE)
);

--도서관 주소
create table ADDRESS(
    LIB_NAME VARCHAR2(10) PRIMARY KEY,
    CITY VARCHAR2(10) NOT NULL,
    BOROUGH VARCHAR2(10) NOT NULL,
    DISTRICT VARCHAR2(10) NOT NULL,
    CONSTRAINT ADDRESS_LIB_NAME_FK FOREIGN  KEY (LIB_NAME) 
    REFERENCES LIBRARY(LIB_NAME)
);

--자료현황
create table HOLDING(
    LIB_NAME VARCHAR2(10) PRIMARY KEY,
    GENERAL NUMBER(5) DEFAULT 0,
    NONBOOK NUMBER(5) DEFAULT 0,
    CONSTRAINT HOLDING_LIB_NAME_FK FOREIGN  KEY (LIB_NAME) 
    REFERENCES LIBRARY(LIB_NAME),
    CONSTRAINT HOLDING_GENERAL_CHECK CHECK (GENERAL >= 0),
    CONSTRAINT HOLDING_NONBOOK_CHECK CHECK (NONBOOK >= 0)
);

--게시판
create table BOARD(
    BOARD_NO NUMBER(28) PRIMARY KEY,
    BOARD_TITLE VARCHAR2(10) NOT NULL,
    WRITER_ID VARCHAR2(10) NOT NULL,
    WRITE_DATE DATE DEFAULT SYSDATE NOT NULL,
    REPLY CHAR(1) DEFAULT 'N',
    OPEN CHAR(1) DEFAULT 'N',
    CONSTRAINT BOARD_WRITER_ID_FK FOREIGN  KEY (WRITER_ID) 
    REFERENCES MEMBER(ID),
    CONSTRAINT BOARD_REPLY_CHECK CHECK (REPLY IN ('Y','N')),
    CONSTRAINT BOARD_OPEN_CHECK CHECK (OPEN IN ('Y','N'))
);

--게시물내용
create table BOARD_CONTENT(
    CONTENT_NO NUMBER(28) PRIMARY KEY,
    CONTENT VARCHAR2(100) NOT NULL,
    REPLY_CONTENT VARCHAR2(100) DEFAULT NULL,
    CONSTRAINT HOLDING_CONTENT_NO_FK FOREIGN  KEY (CONTENT_NO) 
    REFERENCES BOARD(BOARD_NO)
);

