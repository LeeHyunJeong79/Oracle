
select * from emp;
drop table emp;
1.
create table emp(
	empid varchar(10) not null primary key,
	ename varchar(20),
	deptid varchar(10),
	job varchar(20),
	salary number(10));
    
2.
insert into emp values('1001','ȫ����','100','Ư������','350');
insert into emp values('1002','������','100','��������','400');
insert into emp values('1003','�赿��','200','ǰ������','300');
insert into emp values('1004','�����','300','�޿�','450');
insert into emp values('1005','�ڼ���','200','��������','320');

3. 
select * from emp where job='��������';

4.
select max(salary)-min(salary) as �޿������� from emp;

select * from tb_grade;
select * from tb_class_info;
5.
SELECT CI.CLASS_NM, G.STUDENT_NO, G.STUDENT_NM, G.KOR, G.ENG, G.MAT
FROM TB_CLASS_INFO CI, TB_GRADE G
WHERE CI.CLASS_CD = G.CLASS_CD;

6.
SELECT CI.CLASS_NM
FROM TB_CLASS_INFO CI, TB_GRADE G
WHERE CI.CLASS_CD = G.CLASS_CD 
AND G.STUDENT_NM = '������';

7.
SELECT G.STUDENT_NM, G.KOR
FROM TB_CLASS_INFO CI, TB_GRADE G
WHERE CI.CLASS_CD = G.CLASS_CD
AND CI.CLASS_NM='�Ϲ��ι�'
AND G.KOR>=90;

8.
SELECT CLASS_CD,SUM(KOR), SUM(ENG), SUM(MAT), 
ROUND(AVG(KOR),1), ROUND(AVG(ENG),1), ROUND(AVG(MAT),1)
FROM TB_GRADE
GROUP BY CLASS_CD
HAVING AVG(KOR)>=80;

9.
SELECT CI.CLASS_NM, G.STUDENT_NM, G.MAT
FROM TB_CLASS_INFO CI, TB_GRADE G
WHERE CI.CLASS_CD = G.CLASS_CD
AND (CI.CLASS_NM='�����Խù�' and G.MAT>=80);

10.
SELECT G.STUDENT_NM, G.KOR, G.ENG, G.MAT
FROM TB_CLASS_INFO CI, TB_GRADE G
WHERE CI.CLASS_CD = G.CLASS_CD
AND CI.CLASS_NM='�ܰ���';

11. SELECT G.STUDENT_NM, G.KOR+G.ENG+G.MAT
FROM TB_CLASS_INFO CI, TB_GRADE G,dual
WHERE CI.CLASS_CD = G.CLASS_CD
AND CI.CLASS_NM='�ܰ���';

select * from tb_customer;
