select * from tb_grade_08;
select * from tb_grade_09;
--106p
select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a join tb_grade_09 b on a.test_cd=b.test_cd;

select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a , tb_grade_09 b where a.test_cd=b.test_cd;

--107p
select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a left join tb_grade_09 b on a.test_cd=b.test_cd;

select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a , tb_grade_09 b where a.test_cd=b.test_cd(+);

--108p
select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a right join tb_grade_09 b on a.test_cd=b.test_cd;

select a.test_cd,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a , tb_grade_09 b where a.test_cd(+)=b.test_cd;

--110p
select a.test_cd test_cd_a,b.test_cd test_cd_b ,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a full outer join tb_grade_09 b on a.test_cd=b.test_cd;

select distinct a.test_cd test_cd_a,a.kor kor_08 ,a.eng eng_08, b.mat mat_08 ,b.kor kor_09 ,b.eng eng_09, b.mat mat_09
from tb_grade_08 a , tb_grade_09 b;

--112p
select class_cd,student_no,student_nm,
case when kor>=90 and kor<=100 then '  '
    when kor>=80 and kor<=89 then '  '
    when kor>=70 and kor<=79 then '  '
    when kor>=60 and kor<=69 then '  '
    else '  '
end as eng,
case when eng>=90 and eng<=100 then '  '
    when eng>=80 and eng<=89 then '  '
    when eng>=70 and eng<=79 then '  '
    when eng>=60 and eng<=69 then '  '
    else '  '
end as mat,
case when mat>=90 and mat<=100 then '  '
    when mat>=80 and mat<=89 then '  '
    when mat>=70 and mat<=79 then '  '
    when mat>=60 and mat<=69 then '  '
    else '  '
end as eng
from tb_grade;

--114
select 
case class_cd when 'A' then '     Խù '
              when 'B' then ' ܰ   '
              when 'C' then '       Թ '
              when 'D' then ' Ϲ  ι '
              end as    ̸  , STUDENT_NO, STUDENT_NM 
FROM TB_GRADE;

--115P
SELECT ROWNUM, A.* FROM TB_CUSTOMER A;
SELECT ROWNUM, CUSTOMER_NM, CUSTOMER_NM,MW_FLG,BIRTH_DAY, PHONE_NUMBER FROM TB_CUSTOMER;

--116P
SELECT ROWNUM, A.* FROM TB_CUSTOMER A;
SELECT ROWNUM, A.* FROM TB_CUSTOMER A WHERE MW_FLG='M' ORDER BY CUSTOMER_NM;
SELECT ROWNUM, A.* FROM TB_CUSTOMER A WHERE MW_FLG='M';

--118P
SELECT * FROM TB_CUSTOMER;
SELECT * FROM TB_CUSTOMER WHERE PHONE_NUMBER IS NULL OR EMAIL IS NULL;

--119P
SELECT * FROM TB_CUSTOMER WHERE
(MW_FLG='M' AND EMAIL IS NULL) OR (MW_FLG='W' AND EMAIL IS NOT NULL)
ORDER BY MW_FLG DESC;

--120P
SELECT * FROM TB_CUSTOMER WHERE CUSTOMER_NM IN('      ',' ڽ´ ','      ','   üҸ ','      ') AND PHONE_NUMBER IS NOT NULL;

--121P-DUAL  ý           1                 ̺ 
SELECT 20*3 FROM DUAL; 
SELECT 30*3 FROM DUAL CONNECT BY LEVEL<=2;
SELECT 123*45, SYSDATE+30,'1DAY SQL'||' ǽ ',SUBSTR('20190820',1,4) FROM DUAL;
SELECT '     :'||' ų    SQL' FROM DUAL;

--122P
SELECT '2019-1'||ROWNUM FROM DUAL CONNECT BY LEVEL<5;

--124
select * from TB_GRADE;
update TB_GRADE set tot=kor+eng+mat , avg=ROUND(tot/3,1) where class_cd in('A','B');

--126P
SELECT * FROM TB_GRADE;

--127
UPDATE TB_GRADE SET tot=kor+eng+mat , avg=ROUND(tot/3,1);

--Ŀ ԿϷ 
COMMIT;