DROP TABLE REVIEWS;
DROP TABLE VOD; -- 영화 테이블
DROP TABLE USER_T;

-- 회원 USER
CREATE TABLE USER_T (
    USER_NO        NUMBER             NOT NULL,         -- PK
    ID             VARCHAR2(40 BYTE)  NOT NULL UNIQUE,  -- ID 정규식에 반영
    PW             VARCHAR2(64 BYTE)  NOT NULL,         -- SHA-256 암호화 방식 사용
    NAME           VARCHAR2(40 BYTE),                   -- 이름
    GENDER         VARCHAR2(2 BYTE),                    -- M, F, NO
    EMAIL          VARCHAR2(100 BYTE) NOT NULL UNIQUE,  -- 이메일
    MOBILE         VARCHAR2(15 BYTE),                   -- 하이픈 제외(-) 후 저장
    BIRTHYEAR      VARCHAR2(4 BYTE),                    -- 출생년도(YYYY)
    BIRTHDATE      VARCHAR2(4 BYTE),                    -- 출생월일(MMDD)
    POSTCODE       VARCHAR2(5 BYTE),                    -- 우편번호
    ROAD_ADDRESS   VARCHAR2(100 BYTE),                  -- 도로명주소
    JIBUN_ADDRESS  VARCHAR2(100 BYTE),                  -- 지번주소
    DETAIL_ADDRESS VARCHAR2(100 BYTE),                  -- 상세주소
    EXTRA_ADDRESS  VARCHAR2(100 BYTE),                  -- 참고항목
    AGREECODE      NUMBER             NOT NULL,         -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    JOINED_AT      DATE,                                -- 가입일
    PW_MODIFIED_AT DATE,                                -- 비밀번호변경일
    AUTOLOGIN_ID   VARCHAR2(32 BYTE),                   -- 자동로그인할 때 사용하는 ID(SESSION_ID를 사용함)
    AUTOLOGIN_EXPIRED_AT DATE                           -- 자동로그인 만료일
);


--------vod 테이블
CREATE TABLE VOD (
	VOD_NO	        NUMBER		NOT NULL,
	VOD_TITLE	    CLOB		NOT NULL,
	VOD_CONTENT	    CLOB,
	VOD_DATE	    DATE,
	VOD_PRICE   	NUMBER,
	VOD_STAR	    NUMBER,
	VOD_ACTOR	    CLOB,
	VOD_DIRECTOR	CLOB,
	VOD_CATEGORY	VARCHAR2(100 BYTE),
	VOD_COMPANY	    VARCHAR2(100 BYTE),
	VOD_PHOTO	    CLOB,
	VOD_YOUTUBE	    CLOB,
    VOD_SHOT        CLOB
);



-------------------------review
CREATE TABLE REVIEWS(
    REVIEW_NO           NUMBER NOT NULL,            -- PK
    VOD_NO              NUMBER NOT NULL,  --FK(VOD TABLE)
    REVIEW_TITLE        VARCHAR2(1000 BYTE) NOT NULL,
    ID                 VARCHAR2(40 BYTE) NOT NULL,  --FK (USER TABLE)
    REVIEW_CONTENT      CLOB,
    REVIEW_CREATED_AT   TIMESTAMP,                     
    REVIEW_MODIFIED_AT  TIMESTAMP,
    REVIEW_HITS         NUMBER DEFAULT 0 NOT NULL,
    REVIEW_STAR         NUMBER NOT NULL
    
);

-- USER_TABLE PK
ALTER TABLE USER_T
    ADD CONSTRAINT PK_USER
        PRIMARY KEY(USER_NO);
        
-- VOD 테이블의 PK
ALTER TABLE VOD
    ADD CONSTRAINT PK_VOD
        PRIMARY KEY(VOD_NO);





-- REVIEWS_TABLE
ALTER TABLE REVIEWS
ADD CONSTRAINT PK_REVIEWS PRIMARY KEY (REVIEW_NO);


ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_VOD
FOREIGN KEY (VOD_NO)
REFERENCES VOD(VOD_NO);
-- REVIEWS_TABLE
ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_USER
FOREIGN KEY (ID)
REFERENCES USER_T(ID);

DROP SEQUENCE USER_SEQ;
DROP SEQUENCE VOD_SEQ;
DROP SEQUENCE REVIEWS_SEQ;

CREATE SEQUENCE USER_SEQ NOCACHE;
CREATE SEQUENCE VOD_SEQ NOCACHE;
CREATE SEQUENCE REVIEWS_SEQ NOCACHE;