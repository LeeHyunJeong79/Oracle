//SQL연습3
CREATE TABLE EMP1(empid varchar(10) not null primary key,
     ename varchar(20) ,
     deptid varchar(10),
     job varchar(20),
     salary number(10));
     
select * from emp1;
insert into emp1 values(1001,'홍성길',100,'특수영업',350);
insert into emp1 values(1002,'곽희준',100,'영업관리',400);
insert into emp1 values(1003,'김동준',300,'품질관리',300);
insert into emp1 values(1004,'성재규',400,'급여',450);
insert into emp1 values(1005,'박성범',500,'수입자재',320);

create table dept1(deptid varchar(10) not null primary key,
     dname varchar(20) );
     
insert into dept1 values(100, '영업부');
insert into dept1 values(200, '관리부');
insert into dept1 values(300, '구매부');
insert into dept1 values(400, '생산부');

select * from dept1;
//1
select * from emp1 where job='영업관리';

//2
select ename, dname from dept1 d, emp1 e where salary>=400 and e.deptid=d.deptid;

//3 
select sum(e.salary) as 급여합계 from emp1 e, dept1 d
   where e.deptid=d.deptid and (d.dname='영업부'or d.dname='구매부');
   
//4
select max(salary)-min(salary) as 급여액차이 from emp1;

//5
update emp   //곽희준 부서 수정 100으로 수정;

select ename as 사원명, job 담당업무, salary as 급여액 from emp1 e, dept1 d
  where salary>=380 and dname='영업부' and e.deptid=d.deptid;
  
//6
select dname from emp1 e, dept1 d
   where e.deptid=d.deptid and e.ename='성재규';
   
//7
selelct e.empid, e.ename, d.dname, e.salary from emp1 e, dept1 d
   where e.deptid=d.deptid and d.dname<>'구매부';

create view myemp1 as
selelct empid, ename, dname, salary from emp1 e, dept1 d
   where e.deptid=d.deptid and d.dname<>'구매부';
