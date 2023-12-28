CREATE SEQUENCE DEPT_SEQ 
    INCREMENT BY 1 -- 1씩 증가하는 번호 생성
    START WITH 1   -- 1부터 번호 생성
    NOMAXVALUE     -- 상한선 없음
    NOMINVALUE     -- 하한선 없음
    NOCYCLE        -- 번호순환 없음
    CACHE 20       -- 20개의 번호를 미리 생성(번호를 미리 생성하지 않는 NOCACHE 옵션을 사용)
    NOORDER        -- 번호를 순서 없이 사용
; --위 사항 모두 defeult값
   -- 사원 테이블의 사원번호를 생성하는 시퀀스 만들기
   CREATE SEQUENCE EMPLOYEE_SEQ
   START WITH 1001
   NOCACHE ;
   
CREATE TABLE DEPART_T(
DEPT_NO NUMBER NOT NULL ,
DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
LOCATION VARCHAR2(15 BYTE) NOT NULL,
CONSTRAINT PK_DEPARTMENT_T PRIMARY KEY(DEPT_NO)
);

CREATE TABLE EMPLOYEE_T(
EMP_NO NUMBER NOT NULL,
NAME VARCHAR2(20 BYTE) NOT NULL,
DEPART NUMBER ,
POSITON VARCHAR2(20 BYTE),
GENDER CHAR(2 BYTE),
HIRE_DATE DATE,
SALARY NUMBER,
CONSTRAINT PK_EMPLOYEE_T PRIMARY KEY(EMP_NO),
CONSTRAINT FK_DEPART_T FOREIGN KEY(DEPART) REFERENCES DEPART_T(DEPT_NO) ON DELETE SET NULL
);


INSERT INTO DEPART_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL,'영업부','대구');
INSERT INTO DEPART_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL,'인사부','서울');
INSERT INTO DEPART_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL,'총무부','대구');
INSERT INTO DEPART_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL,'기획부','서울');
                       --ㄴ모든 칼럼일 경우 괄호안 생략가능 
 -- 사원 테이블에 행 삽입하기
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL,'구창민',1,'과장','M','95/05/01','5000000');
                                                                        --날짜엔 / OR - 사용 
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL,'김민서',1,'사원','M','17/09/01','25000000');
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL,'이은영',2,'부장','F','90/09/01','55000000');
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL,'한성일',2,'과장','M','93/04/01','5000000');

/*

     DQL
     1. Data Query Language 데이터 조회어
     2. 데이터(행, Row)를 조회할 때 사용한다.
     3. DQL을 실행해도 데이터베이스에 변화는 발생하지 않는다.
     4. 형식
        SELECT 조회할 칼럼, 조회할 칼럼.... 
        FROM 테이블명 (여기까진 필수 입력)
        WHERE 조건식(여기부턴 생략 가능)
        GROUP BY 그룹화 할 칼럼, ....
        HAVING 그룹조건식 (GROUP BY와 HAVING절은 같이 들어가거나 빠지거나 같이 움직여야함)
        ORDER BY 정렬할 칼럼 ASC(내림차순)|DESC(오름차순),정렬할 칼럼 ASC|DESC ....
         
              
     */
     
     -- 1. 부서 테이블의 모든 칼럼을 조회하시오.
     SELECT DEPT_NO,DEPT_NAME, LOCATION
     FROM DEPART_T;
     
     SELECT *
     FROM DEPART_T; --모든 칼럼을 의미하는 *, 실제 개발할때는 사용 금지(성능이 느려짐)
     
     SELECT DEPARTMENT_T.DEPT_NO,DEPARTMENT_T.DEPT_NAME,DEPARTMENT_T.LOCATION
     FROM DEPART_T;
     
     SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
     FROM DEPART_T D; -- 테이블의 별명(ALIAS)을 D로 지정
     
     -- 2. 부서 테이블의 모든 칼럼을 조회하시오. 조회할 칼럼명을 '부서번호', '부서명','위치'로 지정하시오.
     SELECT DEPT_NO AS 부서번호
          , DEPT_NAME AS 부서명
          , LOCATION AS 위치
     FROM DEPART_T;
     
     
     -- 3. 부서 테이블의 위치 칼럼을 중복을 제거하여 조회하시오.
     SELECT DISTINCT LOCATION -- DISTINT
     FROM DEPART_T;
     
     
     SELECT LOCATION 
     FROM DEPART_T 
     GROUP BY LOCATION;       -- GROUP BY
     
/*
     주요 조건식 작성 방법
     1. 칼럼 = 값 -값이랑 똑같은걸 찾는거
     2. 칼럼 BETWEEN 값1 AND 값2 -값1과 값2 사이에 있는것을 찾는거
     3. 칼럼 IN(값1, 값2)  - 값1 또는 값2가 들어가 있는것을 모두 찾는거
     4. 칼럼 IS NULL -널값을 가지는지 점검
     5. 칼럼 IS NOT NULL -널값이 아닌걸 조회할때
     6. 칼럼 LIKE 값 -값이 포함된 걸 찾는거
     
     


*/
     
     
     
     
     