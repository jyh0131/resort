
use resort;

select * from member;
select * from room;
select * from reservation;

insert into member values ('liz1002', '12345678', '권민지', '01012345678', 'abc@abc.mail', '1997-10-02', 0, 0);
insert into member values ('alalalal', '12345678', '나아님', '01012345678', 'abc@abc.mail', '1997-10-02', 0, 0);

/* =============================== */

select * from question;
select * from answer;

insert into question values (null, '객실 예약 질문', '부대시설관련' ,'객실 예약 확인 부탁드립니다.', 'hahahah.jpg', now(), 'liz1002');
insert into answer values (null, '예약 완료되셨습니다. 축하드리네요~ 예약 완료되셨습니다. 축하드리네요~ 예약 완료되셨습니다. 축하드리네요~ 예약 완료되셨습니다. 축하드리네요~ 예약 완료되셨습니다. 축하드리네요~', now(), 22, 'liz1002');

select * from question where m_id='liz1002';
select * from question where q_type='패키지관련';

update question set q_title='수정 테스트', q_type='부대시설관련', q_content='수정 테스트입니다', q_file='file.jpg' where q_no='2';
delete from question where q_no=20;

select * from answer where q_no=2;

select q_no from answer;
