create table tbl_insa_201905(
   empno char(4) not null primary key,
   empname varchar2(20),
   jumin1 char(6),
   jumin2 char(7),
   deptcode number(2),
   poscode char(1),
   hiredate date);
   
   select * from tbl_insa_201905;
   drop table tbl_insa_201905;
   
insert into  tbl_insa_201905 values('S001', '������','990101','1000001', 10, '1',' 20150101');
insert into  tbl_insa_201905 values('S002', '������','990101','1000002', 20, '2',' 20150101');
insert into  tbl_insa_201905 values('S003', '������','990101','1000003', 30, '3',' 20150101');
insert into  tbl_insa_201905 values('S004', '������','990101','2000004', 10, '1',' 20150101');
insert into  tbl_insa_201905 values('S005', 'Ȳ����','990101','2000005', 20, '2',' 20150101');
insert into  tbl_insa_201905 values('S006', '������','990101','1000006', 30, '3',' 20150101');
insert into  tbl_insa_201905 values('S007', '������','990101','1000007', 10, '4',' 20150101');
insert into  tbl_insa_201905 values('S008', '������','990101','2000008', 20, '2',' 20150101');
insert into  tbl_insa_201905 values('S009', '������','990101','1000009', 30, '1',' 20150101');
insert into  tbl_insa_201905 values('S010', '������','990101','2000010', 40, '1',' 20150101');

DROP table tbl_dept_201905;
select * from tbl_dept_201905;
create table tbl_dept_201905(
    deptcode number(2) not null primary key,
    deptname varchar2(30),
    phone char(4));
    
create table tbl_salary_201905 (
     empdate char(6) not null,
     empno char(4) not null,
     salary number(8),
     bonus number(8),
     primary key(empdate, empno));

drop table tbl_salary_201905;
select * from tbl_salary_201905;

insert into tbl_salary_201905 values('201908', 'S001', 2500000,200000);
insert into tbl_salary_201905 values('201908', 'S002', 2800000,150000);
insert into tbl_salary_201905 values('201908', 'S003', 3000000,50000);
insert into tbl_salary_201905 values('201908', 'S004', 2500000,200000);
insert into tbl_salary_201905 values('201908', 'S005', 2800000,150000);
insert into tbl_salary_201905 values('201908', 'S006', 3000000,50000);
insert into tbl_salary_201905 values('201908', 'S007', 3500000,0);
insert into tbl_salary_201905 values('201908', 'S008', 2800000,150000);
insert into tbl_salary_201905 values('201908', 'S009', 2500000,200000);
insert into tbl_salary_201905 values('201908', 'S010', 2500000,200000);

����5
  select * from tbl_insa_201905 order by empno;
  
����6
select to_char(TO_DATE(empdate, 'yyyy-mm'),'yyyy"��"mm"��"') as �޿����, i.empno as �����ȣ, i.empname as �������, salary as ����, to_char(bonus,'9,999,999') as �󿩱�, 
     to_char(salary+bonus,'9,999,999,999') as ���ɾ� 
     from tbl_insa_201905 i,  tbl_dept_201905 d, tbl_salary_201905 s
     where i.deptcode=d.deptcode and i.empno=s.empno;
     
select empdate as �޿����, i.empno as �����ȣ, i.empname as �������, salary as ����, to_char(bonus,'9,999,999') as �󿩱�, 
     to_char(salary+bonus,'9,999,999,999') as ���ɾ� 
     from tbl_insa_201905 i,  tbl_dept_201905 d, tbl_salary_201905 s
     where i.deptcode=d.deptcode and i.empno=s.empno;
     
����7
select deptname as �μ���, sum(salary) as �����Ѿ�, sum(bonus) as �󿩱��Ѿ� 
   from tbl_insa_201905 i,  tbl_dept_201905 d, tbl_salary_201905 s
   where i.deptcode=d.deptcode and i.empno=s.empno
   group by deptname;
     

     