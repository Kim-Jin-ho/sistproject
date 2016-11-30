SELECT USER
FROM DUAL;
-->> SCOTT

DROP TABLE TBL_MEMBER PURGE;

--�� �ǽ� ���̺�(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
,CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
-->> ���̺� ���� �Ϸ�

--�� �ǽ� ���̺�(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
(
  SID NUMBER
, KOR NUMBER(3)
, ENG NUMBER(3)
, MAT NUMBER(3)
,CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
,CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
            REFERENCES TBL_MEMBER(SID)

);

-->> ���� �Ϸ�


DROP SEQUENCE MEMBERSEQ;
--�� ������ ����
CREATE SEQUENCE MEMBERSEQ NOCACHE;

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '����ȣ','010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������','010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������','010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������','010-4444-4444');

--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������','010-2222-2222');

--> ���� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)VALUES(MEMBERSEQ.NEXTVAL, '������','010-2222-2222');

COMMIT;
SELECT *
FROM TBL_MEMBER;