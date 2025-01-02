create table tb_student(
 sno number(10) not null,
 sname varchar(10),
 year number(5),
 dept varchar(20));

insert into tb_student values (100, '������', 4, '��ǻ��');
insert into tb_student values (200, '������', 3, '����');
insert into tb_student values (300, '������', 1, '��ǻ��');
insert into tb_student values (400, '�ۺ���', 4, '��ǻ��');
insert into tb_student values (500, '����ȭ', 2, '���');
 
 
create table tb_course (
    cno varchar(30) not null,
    cname varchar(30),
    credit number(5),
    dept varchar(20), 
    prname varchar(10));

insert into tb_course values('c123', '���α׷���', 3, '��ǻ��', '�輺��');
insert into tb_course values('c312','�ڷᱸ��', 3, '��ǻ��', 'Ȳ����');
insert into tb_course values('c324', '���ϱ���', 3, '��ǻ��', '�̱���');
insert into tb_course values('c413', '�����ͺ��̽�', 3, '��ǻ��', '���Ϸ�');
insert into tb_course values('e412', '�ݵ�ü', 3, '����', 'ȫ����');


create table tb_enrol(
    sno number(10) not null,
    cno varchar(30) not null,
    grade varchar(10),
    midterm number(10),
    final number(10));
    
insert into tb_enrol values (100,'c413', 'A', 90,95);
insert into tb_enrol values (100, 'e412', 'A', 95, 95);
insert into tb_enrol values (200, 'c123', 'B', 85, 80);
insert into tb_enrol values (300, 'c312', 'A', 90, 95);
insert into tb_enrol values (300, 'c324', 'C', 75, 75);
insert into tb_enrol values (300, 'c413', 'A', 95, 90);
insert into tb_enrol values (400, 'c312', 'A', 90, 95);
insert into tb_enrol values (400, 'c324', 'A', 95, 90);
insert into tb_enrol values (400, 'c413', 'B', 80, 85);
insert into tb_enrol values (400, 'e412', 'C', 65, 75);
insert into tb_enrol values (500, 'c312', 'B', 85, 80);

1.
select e.sno,sname,cno,grade from tb_enrol e, tb_student s
where e.sno=s.sno and dept='��ǻ��' and year=4;

2.
select s.sno, sname,cno from tb_student s, tb_enrol e 
where s.sno=e.sno and midterm>=90
order by s.sno desc, e.cno asc;

3. 
select s.sno,sname,midterm,midterm+3 as ���� from tb_student s, tb_enrol e, dual
where s.sno=e.sno and e.cno='c312';

4.
select sname,dept,grade from tb_student s, tb_enrol e, dual
where s.sno=e.sno and cno='c413';

5.
select s1.sno, s2.sno from tb_student s1, tb_student s2
where s1.dept=s2.dept and s1.sno<s2.sno;

6.
select count(*) as �л��� from tb_student where year=4;

7.
select sno, cno, cname from tb_student s, tb_course c
where s.dept=c.dept and sno=300;

8.
select round(avg(midterm),1) from tb_course c, tb_enrol e
where c.cno=e.cno and cname='�����ͺ��̽�';

9.
select cname, avg(final) from tb_course c, tb_enrol e
where c.cno=e.cno group by cname;

10.
select cno, avg(final) as �⸻���,count(cno) from tb_enrol
group by cno having count(cno)>=3;

11. not in Ȱ��
select sname from tb_student 
where sno not in (select sno from tb_enrol where cno='c413');

12.not in Ȱ��
select sname, dept from tb_student
where dept in (select dept from tb_student where sname='������');

select sname, dept from tb_student
where dept =(select dept from tb_student where sname='������');

13.
select s.sno, year from tb_student s, tb_enrol e
where s.sno=e.sno and (year=3 or cno='c324');

14.
select cno, grade from tb_student s, tb_enrol e
where s.sno=e.sno and (year=1 or year=2);

15.
select cname, sno, grade from tb_course c, tb_enrol e
where c.cno=e.cno and prname='�̱���';