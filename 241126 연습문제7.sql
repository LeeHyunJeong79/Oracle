CREATE TABLE TBL_PROJECT(
    CODE CHAR(5) NOT NULL PRIMARY KEY,
    PJNM CHAR(40),
    COST NUMBER(10),
    SDAY DATE,
    CDAY DATE,
    EXPECTED NUMBER(2));
drop table TBL_PROJECT;
INSERT INTO TBL_PROJECT VALUES('E2544','해양 정화 캠페인',417000,'2024-02-13','2025-05-25',2);
INSERT INTO TBL_PROJECT VALUES('E3671','신재생에너지 발전 사업',694000,'2024-04-19','2025-03-18',3);
INSERT INTO TBL_PROJECT VALUES('E4226','탄소배출 감축 프로젝트',458700,'2024-03-08','2025-10-31',2);
INSERT INTO TBL_PROJECT VALUES('E5239','도시 녹지 공간 조성',348100,'2024-01-30','2025-07-10',3);
INSERT INTO TBL_PROJECT VALUES('G3392','지속가능경영 교육 프로그램',245400,'2024-05-22','2025-04-01',1);
INSERT INTO TBL_PROJECT VALUES('G4575','스마트 시티 구축',757900,'2024-07-08','2025-12-21',2);
INSERT INTO TBL_PROJECT VALUES('S1735','기업 내부 윤리 교육',160500,'2024-06-26','2025-10-02',1);
INSERT INTO TBL_PROJECT VALUES('S7460','장애인 고용 촉진 프로젝트',598300,'2024-03-23','2025-12-10',2);
INSERT INTO TBL_PROJECT VALUES('S8059','다문화 가정 지원 사업',356600,'2024-06-20','2025-10-25',3);
INSERT INTO TBL_PROJECT VALUES('S8061','사회적 기업 지원 프로젝트',542000,'2024-04-17','2025-02-07',1);

CREATE TABLE TBL_COMPANY(
    CODE CHAR(5) NOT NULL,
    CPNM CHAR(25),
    ESG NUMBER(5),
    MANAGER CHAR(10),
    PHONE CHAR(15));
    
DROP TABLE  TBL_COMPANY;

INSERT INTO TBL_COMPANY VALUES('E3671', '대한전력', 23, '김보검', '010-1?34-5678');
INSERT INTO TBL_COMPANY VALUES('E4226', '하나화학', 11, '이영희', '010-9?76-5432');
INSERT INTO TBL_COMPANY VALUES('E2544', '연오바이오제약', 47, '배우림', '010-2?68-1357');
INSERT INTO TBL_COMPANY VALUES('E5239', '샛별전자', 39, '최은우', '010-3?98-1472');
INSERT INTO TBL_COMPANY VALUES('S8059', '오스코', 48, '정지훈', '010-7?54-1236');
INSERT INTO TBL_COMPANY VALUES('S8061', 'YA화학', 34, '채연아', '010-1?96-3574');
INSERT INTO TBL_COMPANY VALUES('S1735', 'HS텔레콤', 31, '장희생', '010-2?87-3691');
INSERT INTO TBL_COMPANY VALUES('S7460', '단미약품', 19, '고민규', '010-9?74-5632');
INSERT INTO TBL_COMPANY VALUES('G3392', 'GREEN통신', 34, '조형호', '010-1?78-3692');
INSERT INTO TBL_COMPANY VALUES('G4575', '운암바이오로직스', 13, '강두훈', '010-3?92-8745');

SELECT * FROM  TBL_COMPANY;

1.
SELECT;

2.
SELECT C.CODE AS 코드, PJNM AS 프로젝트명, CPNM AS 회사명, MANAGER AS 담당자, PHONE AS 연락처 
   FROM TBL_PROJECT P, TBL_COMPANY C
   WHERE COST>=500000 AND P.CODE=C.CODE;

3.
SELECT C.CODE AS 회사코드, CPNM AS 회사명, PJNM AS 프로젝트명, COST AS 사업비
    FROM TBL_PROJECT P, TBL_COMPANY C
    WHERE P.CODE=C.CODE AND ESG>=25 AND C.CODE LIKE 'S%';

4.
SELECT CPNM AS 회사명, ESG AS ESG점수, PJNM AS 프로젝트명,
   DECODE('EXPECTED','1','양호','2','우수','3','탁월') AS 예상결과
   FROM TBL_PROJECT P, TBL_COMPANY C
   WHERE P.CODE=C.CODE AND C.CPNM LIKE '%화학%';
   
5.
