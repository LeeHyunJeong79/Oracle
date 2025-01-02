--81p and, or
select * from tb_customer where total_point not between 10000 and 20000;

select * from tb_customer where total_point<10000 or total_point>=20000;

select * from tb_customer;
select * from tb_customer where mw_flg<>'W' and total_point<=10000;

--86p like
select * from tb_customer where customer_cd like '2018%'; --����1
select * from tb_customer where customer_cd like '2017%' or customer_cd like '2019%'; 
select * from tb_customer where (customer_cd like '2017%' or customer_cd like '2019%') and mw_flg='W'; --����2

--88P ����3 NOT LIKE
SELECT * FROM TB_CUSTOMER WHERE PHONE_NUMBER NOT LIKE '___-____-____';
SELECT * FROM TB_CUSTOMER WHERE PHONE_NUMBER LIKE '___-____-____';

--89P IN
SELECT * FROM TB_CUSTOMER;
SELECT * FROM TB_CUSTOMER WHERE CUSTOMER_NM IN ('�����','������','����ö','���ѱ�','������','�̾Ƹ�');
SELECT * FROM TB_CUSTOMER WHERE CUSTOMER_NM NOT IN ('�����','������','����ö','���ѱ�','������','�̾Ƹ�');

--�����̺��� ��������� 20�����ϴ� �������� ã���ּ���.
SELECT * FROM TB_CUSTOMER WHERE BIRTH_DAY LIKE '20%' AND MW_FLG='M';

--�����̺��� �̸����� m���� ������ ����Ʈ 10000�� �̻��� ��
SELECT * FROM TB_CUSTOMER WHERE EMAIL LIKE '%m';

--91P ORDER BY
SELECT * FROM TB_CUSTOMER ORDER BY MW_FLG DESC, CUSTOMER_NM; --����1
SELECT * FROM TB_CUSTOMER WHERE MW_FLG='M' ORDER BY TOTAL_POINT DESC; --����2

--�����̺��� �����߿��� ������ ���� ��������� ����ϼ���.
SELECT * FROM TB_CUSTOMER WHERE MW_FLG='W' ORDER BY BIRTH_DAY DESC; 

--100p distinct
select * from tb_customer;

select distinct sales_dt, product_nm from tb_sales order by sales_dt, product_nm; --����1

select sales_dt, product_nm from tb_sales order by sales_dt, product_nm;

select distinct product_nm from tb_sales order by product_nm;

--104 join
select * from tb_grade;
select * from tb_class_info;

select class_nm, student_no, student_nm, kor,eng,mat, tot, avg from tb_grade a, tb_class_info b
where a.class_cd=b.class_cd; --104 ����1

select class_nm, student_no, student_nm, kor,eng,mat, tot, avg from tb_grade a join tb_class_info b
on a.class_cd=b.class_cd; --104 ����1

--106p JOIN ����2
SELECT * FROM TB_GRADE_08;
SELECT * FROM TB_GRADE_09;

SELECT A.TEST_CD AS "08_TEST_CD" ,A.KOR, A.ENG, A.MAT , B.TEST_CD AS "09_TEST_CD" , B.KOR, B.ENG, B.MAT 
FROM TB_GRADE_08 A, TB_GRADE_09 B 
WHERE A.TEST_CD=B.TEST_CD; --����2

