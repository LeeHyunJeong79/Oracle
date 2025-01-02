SELECT * FROM TB_CUSTOMER;
SELECT * FROM TB_POINT;
--152P 1번
SELECT * FROM TB_CUSTOMER WHERE CUSTOMER_CD='2017042';
--152P 2번
SELECT * FROM TB_POINT WHERE CUSTOMER_CD='2017042';

--3번
INSERT INTO TB_POINT VALUES('2017042',5,'드라이기 구매 포인트 적립',3200,'20190801234530');

--4번
UPDATE TB_CUSTOMER CU SET CU.TOTAL_POINT=(
    SELECT SUM(CP.POINT) FROM TB_POINT CP WHERE CP.CUSTOMER_CD=CU.CUSTOMER_CD
    GROUP BY CP.CUSTOMER_CD)
    WHERE CU.CUSTOMER_CD='2017042';

ROLLBACK;

COMMIT;

UPDATE TB_POINT SET POINT=71540 WHERE POINT_MEMO='에어컨 구매 포인트 적립';

--159P 서브쿼리
SELECT S2.CUSTOMER_CD, 
(SELECT CT.CUSTOMER_NM FROM TB_CUSTOMER CT WHERE CT.CUSTOMER_CD=S2.CUSTOMER_CD) AS CUSTOMER_NM,
    S2.TOT_POINT
    FROM ( 
            SELECT S1.CUSTOMER_CD, S1.TOT_POINT FROM
               (SELECT CUSTOMER_CD,SUM(POINT) AS TOT_POINT FROM TB_POINT WHERE CUSTOMER_CD>='2019000' GROUP BY CUSTOMER_CD) S1
                     WHERE S1.TOT_POINT>10000)S2
                WHERE S2.CUSTOMER_CD IN(
                            SELECT CUSTOMER_CD FROM TB_CUSTOMER WHERE MW_FLG='W');
                            
--S1

--S2
SELECT CT.CUSTOMER_NM FROM TB_CUSTOMER CT WHERE CT.CUSTOMER_CD=S2.CUSTOMER_CD) AS CUSTOMER_NM,
    S2.TOT_POINT
    FROM ( 
            SELECT S1.CUSTOMER_CD, S1.TOT_POINT FROM
               (SELECT CUSTOMER_CD,SUM(POINT) AS TOT_POINT FROM TB_POINT WHERE CUSTOMER_CD>='2019000' GROUP BY CUSTOMER_CD) S1
                     WHERE S1.TOT_POINT>10000);
                            