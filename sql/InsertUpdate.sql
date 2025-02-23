--7 슬라이드 회원가입
insert into MEMBER(ID,PASS,NAME,PHONE_NO,EMAIL,REG_LIB) values(:id,:pass,:name,:phone_no,:email,:library);

--11 슬라이드 관심도서 담기
insert into INTEREST_BOOK values(:id,:title,:isbn);

--13 슬라이드
--예약 버튼
insert into BOOK_RESERVATION values(:id,:isbn,:title,:library);

-- 15 슬라이드 / 상호대차
insert into INTERLIBRARY values(:id,:isbn,:title,:holding_lib,:req_lib);

--17 슬라이드 희망도서 신청
insert into REQUESTED_BOOK(REQ_ID,ISBN,REQ_BOOK) values(:id,:isbn,:title);

--21 슬라이드 글쓰기 / 작성 클릭 시 / 게시글 번호 SEQUENCE 사용 /파일 첨부는 따로 저장
--비공개 체크
insert into BOARD(BOARD_NO,BOARD_TITLE,WRITER_ID,OPEN) values(board_seq.NEXTVAL,:title,:id,:open);
--비공개 미체크
insert into BOARD(BOARD_NO,BOARD_TITLE,WRITER_ID) values(board_seq.NEXTVAL,:title,:id);
--게시물 내용
insert into BOARD_CONTENT values(board_content_seq.NEXTVAL,:content);
--답변 등록
update BOARD set REPLY='Y' where ID=:id and BOARD_NO=:num;

--35 슬라이드
update MEMBER set PASS=:PASS, PHONE_NO=:phone, EMAIL=:email where ID=:id;

