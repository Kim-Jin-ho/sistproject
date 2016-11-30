SELECT USER
FROM DUAL;
--> SCOTT

CREATE TABLE TBL_BOARD
( NUM         NUMBER NOT NULL           -- �Խù� ��ȣ
, NAME        VARCHAR2(30) NOT NULL     -- �Խù� �ۼ���
, PWD         VARCHAR2(20) NOT NULL     -- �Խù� ��ȣ
, EMAIL       VARCHAR2(50)              -- �ۼ��� �̸���
, SUBJECT     VARCHAR2(100) NOT NULL    -- �Խù� ����
, CONTENT     VARCHAR2(4000) NOT NULL   -- �Խù� ����
, IPADDR      VARCHAR2(20)              -- ������ Ŭ���̾�Ʈ IP
, HITCOUNT    NUMBER DEFAULT 0          -- ��ȸ��
, CREATED     DATE DEFAULT SYSDATE      -- �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM) -- �Խú� ��ȣ�� PK �������� ����
);
-->> ���̺� ���� �Ϸ�


DESC TBL_BOARD;

--�� �Խù� ��ȣ �ִ밪 ��ȸ ������
SELECT NVL(MAX(NUM),0) AS NUM
FROM TBL_BOARD;
--> ���� ����
SELECT NVL(MAX(NUM),0) AS NUM FROM TBL_BOARD;

--�� �Խù� �ۼ�(�������Է�) ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(1,'����ȯ','java003$','lee@class3.com','�Խù� �ۼ� �׽�Ʈ'
, '�Խù� �ۼ��� ������ ù ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
--> ���� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR) VALUES(1,'����ȯ','java003$','lee@class3.com','�Խù� �ۼ� �׽�Ʈ', '�Խù� �ۼ��� ������ ù ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
-->> �� ���� �Ϸ�

--�� �Խù� ���� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> ���� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD;

--�� ����Ʈ ��ü ���� Ȯ�� ������(�̿ϼ� ����)
SELECT NUM, SUBJECT, NAME, HITCOUNT, TO_CHAR(CREATED) AS CREATED
FROM TBL_BOARD
ORDER BY NUM DESC;
--> ���� ����
SELECT NUM, SUBJECT, NAME, HITCOUNT, TO_CHAR(CREATED) AS CREATED FROM TBL_BOARD ORDER BY NUM DESC;

--�� ���� ������ �߰��Է�
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(2,'����ȯ','java003$','il@class3.com','�Խù� �ۼ� �׽�Ʈ1'
, '�Խù� �ۼ��� ������ �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(3,'����ȯ','java003$','sam@class3.com','�Խù� �ۼ� �׽�Ʈ3'
, '�Խù� �ۼ��� ������ �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(4,'����ȯ','java003$','sa@class3.com','�Խù� �ۼ� �׽�Ʈ4'
, '�Խù� �ۼ��� ������ �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(5,'����ȯ','java003$','oo@class3.com','�Խù� �ۼ� �׽�Ʈ5'
, '�Խù� �ۼ��� ������ �ټ� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(6,'����ȯ','java003$','ouk@class3.com','�Խù� �ۼ� �׽�Ʈ6'
, '�Խù� �ۼ��� ������ ���� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(7,'ĥ��ȯ','java003$','chil@class3.com','�Խù� �ۼ� �׽�Ʈ7'
, '�Խù� �ۼ��� ������ �ϰ� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(8,'����ȯ','java003$','pal@class3.com','�Խù� �ۼ� �׽�Ʈ8'
, '�Խù� �ۼ��� ������ ���� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(9,'����ȯ','java003$','gu@class3.com','�Խù� �ۼ� �׽�Ʈ9'
, '�Խù� �ۼ��� ������ ��ȩ ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(10,'����ȯ','java003$','sip@class3.com','�Խù� �ۼ� �׽�Ʈ10'
, '�Խù� �ۼ��� ������ �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(11,'�Ͽ���','java003$','jin@class3.com','�Խù� �ۼ� �׽�Ʈ11'
, '�Խù� �ۼ��� ������ ���� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');

SELECT NUM, SUBJECT, NAME, HITCOUNT, TO_CHAR(CREATED) AS CREATED
FROM TBL_BOARD
ORDER BY NUM DESC;

COMMIT;
-->> Ŀ�� �Ϸ�

SELECT *
FROM TBL_BOARD;

DELETE FROM TBL_BOARD WHERE NUM=1;
DELETE FROM TBL_BOARD WHERE NUM=2;
DELETE FROM TBL_BOARD WHERE NUM=10;

COMMIT;
--> Ŀ�� �Ϸ�


SELECT NUM, SUBJECT, NAME, HITCOUNT, TO_CHAR(CREATED) AS CREATED
FROM TBL_BOARD
WHERE NUM>=1 AND NUM<=5
ORDER BY NUM DESC;

--�� ��ü ���� Ȯ�� ������
SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.*
FROM
(
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM TBL_BOARD
) DATA;

--������ �ٽ� �߰�
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(12,'�̿���','java003$','jin02@class3.com','�Խù� �ۼ� �׽�Ʈ12'
, '�Խù� �ۼ��� ������ �� �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(13,'�￵��','java003$','jin03@class3.com','�Խù� �ۼ� �׽�Ʈ13'
, '�Խù� �ۼ��� ������ �� �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(14,'�翵��','java003$','jin04@class3.com','�Խù� �ۼ� �׽�Ʈ14'
, '�Խù� �ۼ��� ������ �� �� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)
VALUES(15,'������','java003$','jin05@class3.com','�Խù� �ۼ� �׽�Ʈ15'
, '�Խù� �ۼ��� ������ �� �ټ� ��° �׽�Ʈ�Դϴ�.','127.0.0.1');

--�� ��ü ���� Ȯ�� ������
SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.*
FROM
(
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM TBL_BOARD
) DATA;

SELECT *
FROM
(
  SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.*
  FROM
  (
    SELECT NUM, NAME, SUBJECT, HITCOUNT
          , TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    --WHERE SUBJECT LIKE '%�Խù�%'
    --WHERE NAME LIKE '%����ȣ%'
    WHERE CONTENT LIKE '%��°%'
    ORDER BY NUM DESC
  ) DATA
)
WHERE RNUM >= 1 AND RNUM <=10;

-- ���� ����
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.* FROM  (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD) DATA)WHERE RNUM >= 1 AND RNUM <=10;

--�� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = NVL(HITCOUNT,0)+1
WHERE NUM=11;
--���� ����
UPDATE TBL_BOARD SET HITCOUNT = NVL(HITCOUNT,0)+1 WHERE NUM=11;


--�� Ư�� �Խù� ���� ��ȸ ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYY-MM-DD HH24:MI:SS') AS CREATED
FROM TBL_BOARD
WHERE NUM=11;
--���� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYY-MM-DD HH24:MI:SS') AS CREATED FROM TBL_BOARD WHERE NUM=11;


--��Ư�� �Խù� ���� ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM=16; 
-- ���� ����
DELETE FROM TBL_BOARD WHERE NUM=17; 


--��Ư�� �Խù� ���� ������ ����
UPDATE TBL_BOARD
SET NAME='�鿵��', PWD='1234',EMAIL='jin100@class3.com', SUBJECT='�����Ѵ�', CONTENT='������������'
WHERE NUM=11;
-- ���� ����
UPDATE TBL_BOARD SET NAME='�鿵��', PWD='1234',EMAIL='jin100@class3.com', SUBJECT='�����Ѵ�', CONTENT='������������' WHERE NUM=11;

SELECT NVL(MAX(NUM),0) AS NUM FROM TBL_BOARD;

ROLLBACK;

COMMIT;

-- �˻� ����
SELECT *
FROM
(
  SELECT ROW_NUMBER() OVER(ORDER BY NUM ASC) AS RNUM, DATA.*
  FROM
  (
    SELECT NUM, NAME, SUBJECT, HITCOUNT
          , TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    --WHERE SUBJECT LIKE '%�Խù�%'
    --WHERE NAME LIKE '%����ȣ%'
   ) DATA
  ORDER BY RNUM DESC
)
WHERE RNUM >=1 AND NUM <=30;
-- ���� ����
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE CONTENT LIKE '%��°%' ORDER BY NUM DESC) DATA) WHERE RNUM >= 1 AND RNUM <=10;
--WHERE SUBJECT LIKE '%�Խù�%' --WHERE NAME LIKE '%����ȣ%'



SELECT * FROM ( SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM, DATA.* FROM ( SELECT NUM, NAME,SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD')  AS CREATED FROM TBL_BOARD WHERE subject LIKE '%%'  ORDER BY NUM DESC) DATA) WHERE RNUM >= 1 AND RNUM <=10 ;



-- ������ ����;
SELECT NUM, SUBJECT, NAME, HITCOUNT, CREATED FROM TBL_BOARD WHERE NUM IN ((SELECT MAX(num) FROM TBL_BOARD  WHERE num < 22));
COMMIT;

-- ������ ����
SELECT * FROM TBL_BOARD WHERE NUM IN ((SELECT MAX(num) FROM TBL_BOARD  WHERE num > 22));

-- �Խñ� ��ȣ ���
SELECT *
FROM
(
  SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) AS RNUM,DATA.* 
  FROM 
  (
    SELECT NUM,NAME,SUBJECT,HITCOUNT,TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED 
    FROM TBL_BOARD 
    WHERE '%%' LIKE '%%'
  )DATA
) 
WHERE RNUM>=1 AND RNUM<=10;