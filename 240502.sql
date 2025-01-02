--128p
select * from tb_point_2017;
select * from tb_point_2018;
select * from tb_point_2019;

SELECT * FROM TB_POINT;
insert all
when substr(reg_dttm,1,4)='2017' then into tb_point_2017
when substr(reg_dttm,1,4)='2018' then into tb_point_2018
when substr(reg_dttm,1,4)='2019' then into tb_point_2019
else into tb_point_2019
SELECT CUSTOMER_CD, SEQ_NO, POINT_MEMO, POINT,REG_DTTM FROM TB_POINT WHERE REG_DTTM>='20170101000000';
--131p
select * from tb_point;
select * from tb_grade;
insert into tb_grade (CLASS_CD,STUDENT_NO, STUDENT_NM, KOR,ENG, MAT) VALUES('A',3,'독고승재',97,88,95);
INSERT INTO TB_GRADE VALUES('B',4,'이도희',86,92,90,0,0);
SELECT * FROM TB_GRADE;

--134P
INSERT ALL
   when substr(reg_dttm,1,4)='2017' then into tb_point_2017
   when substr(reg_dttm,1,4)='2018' then into tb_point_2018
   when substr(reg_dttm,1,4)='2019' then into tb_point_2019
   else into tb_point_2019
   select customer_cd, seq_no, point_memo, point, reg_dttm
   from tb_point
   where reg_dttm>='20170101000000';
WHEN SUB;

select * from tb_point_2017;

--139
select * from tb_point;
--tb_point테이블에서 point값을 1000씩 증가시키시오.
update tb_point set point=point+1000;
COMMIT;


SELECT * FROM TB_POINT_2019;