//SQL����3
CREATE TABLE EMP1(empid varchar(10) not null primary key,
     ename varchar(20) ,
     deptid varchar(10),
     job varchar(20),
     salary number(10));
     
select * from emp1;
insert into emp1 values(1001,'ȫ����',100,'Ư������',350);
insert into emp1 values(1002,'������',100,'��������',400);
insert into emp1 values(1003,'�赿��',300,'ǰ������',300);
insert into emp1 values(1004,'�����',400,'�޿�',450);
insert into emp1 values(1005,'�ڼ���',500,'��������',320);

create table dept1(deptid varchar(10) not null primary key,
     dname varchar(20) );
     
insert into dept1 values(100, '������');
insert into dept1 values(200, '������');
insert into dept1 values(300, '���ź�');
insert into dept1 values(400, '�����');

select * from dept1;
//1
select * from emp1 where job='��������';

//2
select ename, dname from dept1 d, emp1 e where salary>=400 and e.deptid=d.deptid;

//3 
select sum(e.salary) as �޿��հ� from emp1 e, dept1 d
   where e.deptid=d.deptid and (d.dname='������'or d.dname='���ź�');
   
//4
select max(salary)-min(salary) as �޿������� from emp1;

//5
update emp   //������ �μ� ���� 100���� ����;

select ename as �����, job ������, salary as �޿��� from emp1 e, dept1 d
  where salary>=380 and dname='������' and e.deptid=d.deptid;
  
//6
select dname from emp1 e, dept1 d
   where e.deptid=d.deptid and e.ename='�����';
   
//7
selelct e.empid, e.ename, d.dname, e.salary from emp1 e, dept1 d
   where e.deptid=d.deptid and d.dname<>'���ź�';

create view myemp1 as
selelct empid, ename, dname, salary from emp1 e, dept1 d
   where e.deptid=d.deptid and d.dname<>'���ź�';
