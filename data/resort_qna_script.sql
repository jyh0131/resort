
use resort;

select * from member;
select * from room;
select * from reservation;

insert into member values ('liz1002', '12345678', '�ǹ���', '01012345678', 'abc@abc.mail', '1997-10-02', 0, 0);
insert into member values ('alalalal', '12345678', '���ƴ�', '01012345678', 'abc@abc.mail', '1997-10-02', 0, 0);

/* =============================== */

select * from question;
select * from answer;

insert into question values (null, '���� ���� ����', '�δ�ü�����' ,'���� ���� Ȯ�� ��Ź�帳�ϴ�.', 'hahahah.jpg', now(), 'liz1002');
insert into answer values (null, '���� �Ϸ�Ǽ̽��ϴ�. ���ϵ帮�׿�~ ���� �Ϸ�Ǽ̽��ϴ�. ���ϵ帮�׿�~ ���� �Ϸ�Ǽ̽��ϴ�. ���ϵ帮�׿�~ ���� �Ϸ�Ǽ̽��ϴ�. ���ϵ帮�׿�~ ���� �Ϸ�Ǽ̽��ϴ�. ���ϵ帮�׿�~', now(), 22, 'liz1002');

select * from question where m_id='liz1002';
select * from question where q_type='��Ű������';

update question set q_title='���� �׽�Ʈ', q_type='�δ�ü�����', q_content='���� �׽�Ʈ�Դϴ�', q_file='file.jpg' where q_no='2';
delete from question where q_no=20;

select * from answer where q_no=2;

select q_no from answer;
