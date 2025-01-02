--24.5.30
CREATE TABLE student(
    sno number(10) not null,
    sname varchar(10),
    year number(10),
    dept varchar(10));
drop table student;    
select * from student;

insert into student values(100,'나수영',4,'컴퓨터');
insert into student values(300,'정기태',1,'컴퓨터');
insert into student values(400,'송병길',4,'컴퓨터');
insert into student values(500,'박종화',2,'산공');

CREATE TABLE course(
    cno varchar(10) not null,
    cname varchar(20),
    credit number(10),
    dept varchar(10),
    prname varchar(10));
drop table student_02; 
select * from course;

insert into course values('c123','프로그래밍',3,'컴퓨터','김성국');
insert into course values('c312','자료구조',3,'컴퓨터','황수관');
insert into course values('c324','화일구조',3,'컴퓨터','이규찬');
insert into course values('c123','프로그래밍',3,'컴퓨터','김성국');


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
select sno,sname from student where dept='컴퓨터' and year=4;

--4
select sno, cno from enrol where midtem<=90 order by sno desc, cno asc;

--5 
select sno as 학번, '중간성적=' as 시험,midtem+3 as 점수 from enrol where cno='c312';

--6 과목번호(cno) 'c413'에 등록한 학생의 이름(sname), 학과(dept), 성적(grade)을 검색하라.
select sname,dept, grade from student, enrol where student.sno=enrol.sno and cno='c413';

--7 같은 학과 학생들의 학번을 쌍으로 검색하라. 단, 첫 번째 학번은 두 번째 학번보다 작게 하라.
select s1.sno, s2.sno from student s1, student s2 
where s1.dept=s2.dept and s1.sno<s2.sno;

--8 학생 테이블에 학생 수가 얼마인가를 검색하라.
select count(*) as 학생수 from student;

--9. 과목 'c413'에 대한 중간 성적의 평균을 검색하라.
select avg(midtem) from enrol where cno='c413';

--10. 과목별 기말 성적(final)의 평균을 검색하라.
select cno, avg(fianl) from enrol group by cno;

--11. 3명 이상 등록한 과목의 기말 평균 성적을 검색하라.
select cno,avg(fianl) from enrol group by cno having count(*)>=3;

--12.과목번호 cno 가 c413을 등록한 학생이름(sname)을 검색하라.
select student.sname from student, enrol 
where enrol.cno='c413' and student.sno=enrol.sno;

--13. 과목번호cno
select student.sname from student, enrol 
where student.sno=enrol.sno and student.sname not in 
(select student.sname from student, enrol 
where enrol.cno='c413' and student.sno=enrol.sno);

select distinct sname from student where sno not in 
(select sno from enrol where cno='c413');

--14.학생 정기태와 같은 학과에 속하는 학생의 이름과 학과를 검색하시오.
select sname, dept from student where dept=(select dept from student where sname='정기태');

--15.
select sno, cno from enrol where fianl>all (select fianl from enrol where sno=500);

--16
select cno, cname from course where cno like 'c%';


--17
select sname from student, enrol where student.sno=enrol.sno and enrol.cno='c413';

--18
select student.sno from student, enrol where  student.sno=enrol.sno and (student.year=3 or enrol.cno='c324');
select sno from student where year=3  union select sno from enrol where cno='c324';

