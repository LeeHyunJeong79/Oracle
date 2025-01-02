--24.7.8
--195
SELECT ABS(-42) FROM DUAL;

SELECT ABS(0), ABS(27), ABS(-13) FROM DUAL;
--196
SELECT MOD(27,3) FROM DUAL; --나머지를 구하는 함수

--197
SELECT SQRT(4) FROM DUAL;--제곱근
SELECT SQRT(2),SQRT(9),SQRT(14),SQRT(16) FROM DUAL;

--198
SELECT CEIL(5.7) FROM DUAL;--올림값
SELECT FLOOR(5.7) FROM DUAL;--내림값
SELECT ROUND(11.12345,3) FROM DUAL; --반올림
SELECT ROUND(1234.123,-1) FROM DUAL; --반올림

SELECT TRUNC(2.5467,2) FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE,'YYYY'), TRUNC(SYSDATE,'MM'),TRUNC(SYSDATE,'DD') FROM DUAL; --날짜버림

SELECT POWER(5,2) FROM DUAL;--제곱근
SELECT POWER(2,4) FROM DUAL;
SELECT POWER(2,-1) FROM DUAL;

--206 
SELECT UPPER('apple') FROM DUAL;
SELECT UPPER('Oracle SQL Developer') FROM DUAL; --알파벳 소문자를 대문자로 변환
SELECT LOWER('Oracle SQL Developer') FROM DUAL; --알파벳 대문자를 소문자로 변환

--208
SELECT CUSTOMER_CD, CUSTOMER_ENG_NM, UPPER(CUSTOMER_ENG_NM) AS UPPER_CUSTOMER_ENG_NM,ITEM_LIST 
FROM TB_ETC_INFO;
--210,211 SUBSTR() : 문자열의 일부를 가져오는 기능
SELECT SUBSTR('Oracle SQL Developer',1,6) FROM DUAL; --첫번째 문자부터 6개 문자 가져오기
SELECT SUBSTR('Oracle SQL Developer',8,3) FROM DUAL; --8번째 문자부터 3개 문자 가져오기
--20190820  -> 2019-08-20 로 표현하기
SELECT SUBSTR('20190820',1,4)||'-'||SUBSTR('20190820',5,2)||'-'||SUBSTR('20190820',7,2) AS 날짜 FROM DUAL;

SELECT LENGTH('Oracle SQL Developer') FROM DUAL;--문자열 길이구하기
SELECT LENGTH('Oracle') FROM DUAL;
SELECT LENGTH('학교') FROM DUAL; --LENGTH의 경우 한글과 영어 모두 한글자씩 계산해서 출력

SELECT LENGTHB('학교') FROM DUAL; --한글 한글자 3씩 계산, 책에는 2씩 계산으로 나옴
   --LENGTHB 함수는 시스템 문자셋 설정에 따라서 한글을 2byte 또는 3byte로 계산하므로 주의해야 한다.
SELECT LENGTHB('SCHOOL') FROM DUAL;--영문은 1씩 계산

SELECT RPAD('안녕',10,'+') FROM DUAL;  --오른쪽에 문자열 채우기

SELECT LPAD('안녕',10,'+') FROM DUAL; --왼쪽에 문자열 채우기

SELECT RTRIM('   안녕   ') FROM DUAL;--오른쪽 공백 없애기
SELECT LTRIM('   안녕   ') FROM DUAL;--오른쪽 공백 없애기
SELECT TRIM('   안녕   ') AS 여백 FROM DUAL;--오른쪽 공백 없애기

SELECT RTRIM('   ***   '), LTRIM('   ***   '), RTRIM('   ***   ') FROM DUAL;
--227p
SELECT INITCAP('update testPro') from dual; --영문 첫 글자를 대문자로 바꾸고 나머지는 소문자로 바꾸는 기능
SELECT INITCAP('shim kyung hee') from dual;

select customer_cd, customer_eng_nm, initcap(customer_eng_nm), item_list from tb_etc_info;

--230P
SELECT CONCAT('AB','영문') FROM DUAL; --CONCAT(값1, 값2)값1과 값2를 연결하는 기능
SELECT CONCAT('학교','학생'), '학교'||'학생'  FROM DUAL;
SELECT CONCAT('오늘날짜',SYSDATE) FROM DUAL;

--문자열에서 찾을 문자열의 위치를 구하는 함수
SELECT INSTR('Oracle SQL Developer','SQL') FROM DUAL;
SELECT INSTR('평촌경영고등학교','촌') FROM DUAL;
SELECT INSTRB('평촌경영고등학교','촌') FROM DUAL;



--1번째 부터 찾는데 3번째 찾는 '호'는 몇번째 인는가?
SELECT INSTR('하하호호하하호호','호',1,3) FROM DUAL; --중요
--234P
SELECT REPLACE('평촌 경영 고등학교','학교','SCHOOL') FROM DUAL;--문자열 바꾸기
SELECT REPLACE('2024-07-18','-','.') FROM DUAL;

--236 비교함수
DECODE() : 기준값과 비교값이 같은 참값을 구하고 아니면 거짓 값을 구한다.
고객테이블에서 성별이 M이면 남으로 바꾸고 W이면 여로 바꾸고 모두 해당하지 않으면 '*'출력하시오.
SELECT CUSTOMER_NM, MW_FLG, DECODE(MW_FLG,'M','남','W','여','*') AS 성별 FROM TB_CUSTOMER;
select customer_cd, customer_eng_nm, item_list,
    substr( 
        decode(instr(item_list,'S01'),0,'',',의류잡화')||
        decode(instr(item_list,'S02'),0,'',',뷰티')||
        decode(instr(item_list,'S03'),0,'',',레저자동차')||
        decode(instr(item_list,'S04'),0,'',',식품')||
        decode(instr(item_list,'S05'),0,'',',생활/건강')||
        decode(instr(item_list,'S06'),0,'',',가구/인테리어')||
        decode(instr(item_list,'S07'),0,'',',가전')||
        decode(instr(item_list,'S08'),0,'',',도서/취미')||
        decode(instr(item_list,'S09'),0,'',',컴퓨터')||
        decode(instr(item_list,'S10'),0,'',',브랜드'),2)  관심품목명
from tb_etc_info;

239
NVL() : NULL값에 특정 값을 채워주는 기능
SELECT * FROM TB_CUSTOMER;
SELECT CUSTOMER_NM, PHONE_NUMBER, NVL(PHONE_NUMBER,'XXX-XXXX-XXXX') FROM TB_CUSTOMER;

LEAST() : 여러값 중에서 최소값 구하기
SELECT LEAST(12,15,34,33,2,-5,0) FROM DUAL;
SELECT SYSDATE, SYSDATE+3, SYSDATE-100, LEAST(SYSDATE,SYSDATE+3, SYSDATE-100) FROM DUAL;

GREATEST() : 여러값 중에서 최대값 구하기
SELECT GREATEST(12,44,33,100,-99,2) FROM DUAL;

WIDTH_BUCKET() : 시작값에서 종료값까지를 분할값만큼 구간을 만들고 기준값의 위치를 찾는 기능
구간을 만들고 기준값의 위치를 찾는 기능
1~50까지 10개의 구간을 나누고...15가 어디에 들어가는 지를 찾으시오.
SELECT WIDTH_BUCKET(15,1,50,10) FROM DUAL;
