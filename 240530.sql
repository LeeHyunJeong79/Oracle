--24.5.30
CREATE TABLE student(
    sno number(10) not null,
    sname varchar(10),
    year number(10),
    dept varchar(10));
drop table student;    
select * from student;

insert into student values(100,'������',4,'��ǻ��');
insert into student values(300,'������',1,'��ǻ��');
insert into student values(400,'�ۺ���',4,'��ǻ��');
insert into student values(500,'����ȭ',2,'���');

CREATE TABLE course(
    cno varchar(10) not null,
    cname varchar(20),
    credit number(10),
    dept varchar(10),
    prname varchar(10));
drop table student_02; 
select * from course;

insert into course values('c123','���α׷���',3,'��ǻ��','�輺��');
insert into course values('c312','�ڷᱸ��',3,'��ǻ��','Ȳ����');
insert into course values('c324','ȭ�ϱ���',3,'��ǻ��','�̱���');
insert into course values('c123','���α׷���',3,'��ǻ��','�輺��');


CREATE TABLE enrol(
    sno number(10) not null,
    cno varchar(10),
    grade varchar(10),
    midtem number(10),
    fianl number(10));

drop table enrol;     
select * from enrol;

insert into enrol values(100,'c413','a',90,95);
insert into enrol values(100,'e412','a',95,95);
insert into enrol values(200,'c123','b',85,80);
insert into enrol values(300,'c312','a',90,95);
insert into enrol values(300,'c324','c',75,75);
insert into enrol values(300,'c413','a',95,90);
insert into enrol values(400,'c312','a',90,95);
insert into enrol values(400,'c324','a',90,95);
insert into enrol values(400,'c413','b',80,85);
insert into enrol values(400,'c412','c',65,75);
insert into enrol values(500,'c312','b',85,80);


commit;
--1
select distinct dept from student;
--2
select * from student;

--3
select sno,sname from student where dept='��ǻ��' and year=4;

--4
select sno, cno from enrol where midtem<=90 order by sno desc, cno asc;

--5 
select sno as �й�, '�߰�����=' as ����,midtem+3 as ���� from enrol where cno='c312';

--6 �����ȣ(cno) 'c413'�� ����� �л��� �̸�(sname), �а�(dept), ����(grade)�� �˻��϶�.
select sname,dept, grade from student, enrol where student.sno=enrol.sno and cno='c413';

--7 ���� �а� �л����� �й��� ������ �˻��϶�. ��, ù ��° �й��� �� ��° �й����� �۰� �϶�.
select s1.sno, s2.sno from student s1, student s2 
where s1.dept=s2.dept and s1.sno<s2.sno;

--8 �л� ���̺� �л� ���� ���ΰ��� �˻��϶�.
select count(*) as �л��� from student;

--9. ���� 'c413'�� ���� �߰� ������ ����� �˻��϶�.
select avg(midtem) from enrol where cno='c413';

--10. ���� �⸻ ����(final)�� ����� �˻��϶�.
select cno, avg(fianl) from enrol group by cno;

--11. 3�� �̻� ����� ������ �⸻ ��� ������ �˻��϶�.
select cno,avg(fianl) from enrol group by cno having count(*)>=3;

--12.�����ȣ cno �� c413�� ����� �л��̸�(sname)�� �˻��϶�.
select student.sname from student, enrol 
where enrol.cno='c413' and student.sno=enrol.sno;

--13. �����ȣcno
select student.sname from student, enrol 
where student.sno=enrol.sno and student.sname not in 
(select student.sname from student, enrol 
where enrol.cno='c413' and student.sno=enrol.sno);

select distinct sname from student where sno not in 
(select sno from enrol where cno='c413');

--14.�л� �����¿� ���� �а��� ���ϴ� �л��� �̸��� �а��� �˻��Ͻÿ�.
select sname, dept from student where dept=(select dept from student where sname='������');

--15.
select sno, cno from enrol where fianl>all (select fianl from enrol where sno=500);

--16
select cno, cname from course where cno like 'c%';


--17
select sname from student, enrol where student.sno=enrol.sno and enrol.cno='c413';

--18
select student.sno from student, enrol where  student.sno=enrol.sno and (student.year=3 or enrol.cno='c324');
select sno from student where year=3  union select sno from enrol where cno='c324';

