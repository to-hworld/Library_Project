--3 슬라이드 로그인
select * from MEMBER where ID=:id and PASS=:pass;

--9 슬라이드 자료검색
--책 제목 선택
select * from LIBRARY_BOOK where TITLE=:title and HOLDING_LIB in (':library1');
select * from LIBRARY_BOOK where TITLE=:title and HOLDING_LIB in (':library1',':library2');
select * from LIBRARY_BOOK where TITLE=:title and HOLDING_LIB in (':library1',':library2',':library3');
--저자 선택
select * from LIBRARY_BOOK where AUTHOR=:author and HOLDING_LIB in (':library1');
select * from LIBRARY_BOOK where AUTHOR=:author and HOLDING_LIB in (':library1',':library2');
select * from LIBRARY_BOOK where AUTHOR=:author and HOLDING_LIB in (':library1',':library2',':library3');

--19 슬라이드 게시글 목록 / 기본 1페이지로 할 것
select * from BOARD where rownum >= ((7*(1-:pagenum))+1) and rownum <= (7*:pagenum);

--23 슬라이드
select * from BOARD where WRITER_ID=:id;

--25 슬라이드 조인 / 첨부 파일명은 따로 가져올 것
select * from BOARD A inner join BOARD_CONTENT B ON A.BOARD_NO=B.CONTENT_NO where WRITER_ID=:id and BOARD_NO=:num;

--27 슬라이드 조인
select * from BOARD A inner join BOARD_CONTENT B ON A.BOARD_NO=B.CONTENT_NO where WRITER_ID=:id and BOARD_NO=:num;

--31 슬라이드
--대출현황
select * from RENTAL_LIST where ID=:id;
--예약현황
select * from BOOK_RESERVATION where ID=:id;
--관심도서
select * from INTEREST_BOOK where MEM_ID=:id;
--관심도서 삭제 버튼 클릭
delete from INTEREST_BOOK where MEM_ID=:id and  TITLE=:title and ISBN=:isbn;
--희망도서
select * from REQUESTED_BOOK where REQ_ID=:id;

--33 슬라이드
select * from MEMBER where ID=:id and PASS=:pass;


