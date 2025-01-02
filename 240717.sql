--24.7.8
--195
SELECT ABS(-42) FROM DUAL;

SELECT ABS(0), ABS(27), ABS(-13) FROM DUAL;
--196
SELECT MOD(27,3) FROM DUAL; --�������� ���ϴ� �Լ�

--197
SELECT SQRT(4) FROM DUAL;--������
SELECT SQRT(2),SQRT(9),SQRT(14),SQRT(16) FROM DUAL;

--198
SELECT CEIL(5.7) FROM DUAL;--�ø���
SELECT FLOOR(5.7) FROM DUAL;--������
SELECT ROUND(11.12345,3) FROM DUAL; --�ݿø�
SELECT ROUND(1234.123,-1) FROM DUAL; --�ݿø�

SELECT TRUNC(2.5467,2) FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE,'YYYY'), TRUNC(SYSDATE,'MM'),TRUNC(SYSDATE,'DD') FROM DUAL; --��¥����

SELECT POWER(5,2) FROM DUAL;--������
SELECT POWER(2,4) FROM DUAL;
SELECT POWER(2,-1) FROM DUAL;

--206 
SELECT UPPER('apple') FROM DUAL;
SELECT UPPER('Oracle SQL Developer') FROM DUAL; --���ĺ� �ҹ��ڸ� �빮�ڷ� ��ȯ
SELECT LOWER('Oracle SQL Developer') FROM DUAL; --���ĺ� �빮�ڸ� �ҹ��ڷ� ��ȯ

--208
SELECT CUSTOMER_CD, CUSTOMER_ENG_NM, UPPER(CUSTOMER_ENG_NM) AS UPPER_CUSTOMER_ENG_NM,ITEM_LIST 
FROM TB_ETC_INFO;
--210,211 SUBSTR() : ���ڿ��� �Ϻθ� �������� ���
SELECT SUBSTR('Oracle SQL Developer',1,6) FROM DUAL; --ù��° ���ں��� 6�� ���� ��������
SELECT SUBSTR('Oracle SQL Developer',8,3) FROM DUAL; --8��° ���ں��� 3�� ���� ��������
--20190820  -> 2019-08-20 �� ǥ���ϱ�
SELECT SUBSTR('20190820',1,4)||'-'||SUBSTR('20190820',5,2)||'-'||SUBSTR('20190820',7,2) AS ��¥ FROM DUAL;

SELECT LENGTH('Oracle SQL Developer') FROM DUAL;--���ڿ� ���̱��ϱ�
SELECT LENGTH('Oracle') FROM DUAL;
SELECT LENGTH('�б�') FROM DUAL; --LENGTH�� ��� �ѱ۰� ���� ��� �ѱ��ھ� ����ؼ� ���

SELECT LENGTHB('�б�') FROM DUAL; --�ѱ� �ѱ��� 3�� ���, å���� 2�� ������� ����
   --LENGTHB �Լ��� �ý��� ���ڼ� ������ ���� �ѱ��� 2byte �Ǵ� 3byte�� ����ϹǷ� �����ؾ� �Ѵ�.
SELECT LENGTHB('SCHOOL') FROM DUAL;--������ 1�� ���

SELECT RPAD('�ȳ�',10,'+') FROM DUAL;  --�����ʿ� ���ڿ� ä���

SELECT LPAD('�ȳ�',10,'+') FROM DUAL; --���ʿ� ���ڿ� ä���

SELECT RTRIM('   �ȳ�   ') FROM DUAL;--������ ���� ���ֱ�
SELECT LTRIM('   �ȳ�   ') FROM DUAL;--������ ���� ���ֱ�
SELECT TRIM('   �ȳ�   ') AS ���� FROM DUAL;--������ ���� ���ֱ�

SELECT RTRIM('   ***   '), LTRIM('   ***   '), RTRIM('   ***   ') FROM DUAL;
--227p
SELECT INITCAP('update testPro') from dual; --���� ù ���ڸ� �빮�ڷ� �ٲٰ� �������� �ҹ��ڷ� �ٲٴ� ���
SELECT INITCAP('shim kyung hee') from dual;

select customer_cd, customer_eng_nm, initcap(customer_eng_nm), item_list from tb_etc_info;

--230P
SELECT CONCAT('AB','����') FROM DUAL; --CONCAT(��1, ��2)��1�� ��2�� �����ϴ� ���
SELECT CONCAT('�б�','�л�'), '�б�'||'�л�'  FROM DUAL;
SELECT CONCAT('���ó�¥',SYSDATE) FROM DUAL;

--���ڿ����� ã�� ���ڿ��� ��ġ�� ���ϴ� �Լ�
SELECT INSTR('Oracle SQL Developer','SQL') FROM DUAL;
SELECT INSTR('���̰濵����б�','��') FROM DUAL;
SELECT INSTRB('���̰濵����б�','��') FROM DUAL;



--1��° ���� ã�µ� 3��° ã�� 'ȣ'�� ���° �δ°�?
SELECT INSTR('����ȣȣ����ȣȣ','ȣ',1,3) FROM DUAL; --�߿�
--234P
SELECT REPLACE('���� �濵 ����б�','�б�','SCHOOL') FROM DUAL;--���ڿ� �ٲٱ�
SELECT REPLACE('2024-07-18','-','.') FROM DUAL;

--236 ���Լ�
DECODE() : ���ذ��� �񱳰��� ���� ������ ���ϰ� �ƴϸ� ���� ���� ���Ѵ�.
�����̺��� ������ M�̸� ������ �ٲٰ� W�̸� ���� �ٲٰ� ��� �ش����� ������ '*'����Ͻÿ�.
SELECT CUSTOMER_NM, MW_FLG, DECODE(MW_FLG,'M','��','W','��','*') AS ���� FROM TB_CUSTOMER;
select customer_cd, customer_eng_nm, item_list,
    substr( 
        decode(instr(item_list,'S01'),0,'',',�Ƿ���ȭ')||
        decode(instr(item_list,'S02'),0,'',',��Ƽ')||
        decode(instr(item_list,'S03'),0,'',',�����ڵ���')||
        decode(instr(item_list,'S04'),0,'',',��ǰ')||
        decode(instr(item_list,'S05'),0,'',',��Ȱ/�ǰ�')||
        decode(instr(item_list,'S06'),0,'',',����/���׸���')||
        decode(instr(item_list,'S07'),0,'',',����')||
        decode(instr(item_list,'S08'),0,'',',����/���')||
        decode(instr(item_list,'S09'),0,'',',��ǻ��')||
        decode(instr(item_list,'S10'),0,'',',�귣��'),2)  ����ǰ���
from tb_etc_info;

239
NVL() : NULL���� Ư�� ���� ä���ִ� ���
SELECT * FROM TB_CUSTOMER;
SELECT CUSTOMER_NM, PHONE_NUMBER, NVL(PHONE_NUMBER,'XXX-XXXX-XXXX') FROM TB_CUSTOMER;

LEAST() : ������ �߿��� �ּҰ� ���ϱ�
SELECT LEAST(12,15,34,33,2,-5,0) FROM DUAL;
SELECT SYSDATE, SYSDATE+3, SYSDATE-100, LEAST(SYSDATE,SYSDATE+3, SYSDATE-100) FROM DUAL;

GREATEST() : ������ �߿��� �ִ밪 ���ϱ�
SELECT GREATEST(12,44,33,100,-99,2) FROM DUAL;

WIDTH_BUCKET() : ���۰����� ���ᰪ������ ���Ұ���ŭ ������ ����� ���ذ��� ��ġ�� ã�� ���
������ ����� ���ذ��� ��ġ�� ã�� ���
1~50���� 10���� ������ ������...15�� ��� ���� ���� ã���ÿ�.
SELECT WIDTH_BUCKET(15,1,50,10) FROM DUAL;
