/* 유저 */
CREATE TABLE member_TB(
    M_id VARCHAR2(50) NOT NULL PRIMARY KEY,
    M_pwd VARCHAR2(200) NOT NULL,
    M_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL UNIQUE,
    contact VARCHAR2(20) NOT NULL,
    zipcode NUMBER NOT NULL,
    address VARCHAR2(200) NOT NULL,
    detail_address VARCHAR2(200) NOT NULL,
    joined_date DATE DEFAULT SYSDATE NOT NULL,
    role VARCHAR2(10) CHECK (role IN ('ROLE_USER', 'ROLE_ADMIN')) NOT NULL
);

/* 상품 */
CREATE TABLE product_TB(
    P_id NUMBER PRIMARY KEY,
    P_name VARCHAR2(200) NOT NULL,
    P_price NUMBER NOT NULL,
    P_stock NUMBER NOT NULL,
    P_category varchar2(30) NOT NULL,
    P_date DATE default sysdate,
    p_Intro clob
);

/* 상품 시퀀스 */
CREATE SEQUENCE product_SQ
START WITH 1
INCREMENT BY 1;
-- product_SQ.NEXTVAL 로 사용(자동으로 1씩 증가)

/* 상품 카테고리 */
create table category_TB(
    C_Code varchar2(30) PRIMARY KEY,
    C_tier number(1) not null,
    C_Name varchar2(30) not null,
    C_parent varchar(30),
    foreign key(C_parent) references category_TB(C_Code) 
);

/* 상품 이미지 */
create table product_image_TB(
    p_Id int,
    fileName varchar2(100) not null,
    filePath  varchar2(200) not null,
    uuid varchar2(100)not null primary key,
    foreign key (p_Id) references product_TB(p_Id)
);

/* 주문 */
CREATE TABLE order_TB(
    O_Id NUMBER PRIMARY KEY,
    M_Id VARCHAR2(200) NOT NULL,
    M_Name VARCHAR2(50) NOT NULL,
    O_Zipcode NUMBER NOT NULL,
    O_address VARCHAR2(200) NOT NULL,
    O_detail_address VARCHAR2(200) NOT NULL,
    O_Date Date default sysdate,
    O_state VARCHAR2(50) NOT NULL,
    O_delivery_charge NUMBER NOT NULL,
    FOREIGN KEY(M_id) REFERENCES member_TB(M_id)
);

/* 주문 상품 */
CREATE TABLE order_item_TB(
    OI_id NUMBER PRIMARY KEY,
    O_id NUMBER NOT NULL,
    P_id NUMBER NOT NULL, 
    P_cnt NUMBER NOT NULL,
    P_price NUMBER NOT NULL,
    FOREIGN KEY(O_id) REFERENCES order_TB(O_id),
    FOREIGN KEY(P_id) REFERENCES product_TB(P_id)
);

/* 주문 시퀀스 */
CREATE SEQUENCE ordet_SQ
START WITH 1
INCREMENT BY 1;

/* 주문 상품 시퀀스 */
CREATE SEQUENCE order_item_SQ
START WITH 1
INCREMENT BY 1;

/* 리뷰 테이블 */
create table review_TB(
    r_Id NUMBER primary key,
    p_Id NUMBER not null,
    m_Id VARCHAR2(50) not null,
    r_Date DATE default sysdate,
    r_Content VARCHAR2(3500),
    r_Rating NUMBER(2,1) not null,
    FOREIGN KEY (m_Id)REFERENCES member_TB(m_Id),
    FOREIGN KEY (p_Id) REFERENCES product_TB(p_Id),
    UNIQUE(p_Id, m_Id)
);

/* 리뷰 시퀀스 */
CREATE SEQUENCE review_TB_SQ
START WITH 1
INCREMENT BY 1;

/* 장바구니 */       
create table cart_TB(
    ca_ID number primary key,
    m_Id varchar2(50),
    p_Id number,
    p_Cnt number,
    foreign key (m_Id) references member_TB(m_Id),
    foreign key (p_Id) references product_TB(p_Id ),
    UNIQUE(p_Id, m_Id)
);

/* 장바구니 시퀀스 */
CREATE SEQUENCE cart_SQ
START WITH 1
INCREMENT BY 1;

/* 문의게시판 */
CREATE TABLE question_TB(
Q_index NUMBER PRIMARY KEY, /* 시퀀스값 PK */
M_id VARCHAR2(50) NOT NULL,
Q_category VARCHAR2(20) NOT NULL,
Q_title VARCHAR2(100) NOT NULL,
Q_content VARCHAR2(600) NOT NULL,
Q_date DATE NOT NULL,
FOREIGN KEY(M_id) REFERENCES member_TB(M_id)
);

/* 문의 시퀀스 */
CREATE SEQUENCE question_SQ
START WITH 1
INCREMENT BY 1;

/* 반품 */
CREATE TABLE stock_TB(
O_index NUMBER NOT NULL, /* order_TB의 FK, PK */
P_index NUMBER NOT NULL, /* product_TB의 FK, PK */
Q_index NUMBER NOT NULL, /* question_TB의 FK */
FOREIGN KEY(O_index) REFERENCES order_TB(O_index),
FOREIGN KEY(P_index) REFERENCES product_TB(P_index),
FOREIGN KEY(Q_index) REFERENCES question_TB(Q_index),
CONSTRAINT stoct_TB PRIMARY KEY(O_index, P_index)
);

/* 답변 */
CREATE TABLE answer_TB(
Q_index NUMBER NOT NULL PRIMARY KEY, /* question_TB의 FK, PK */
MGR_id VARCHAR2(50) NOT NULL, /* manager_TB의 FK */
A_title VARCHAR2(100) NOT NULL,
A_content VARCHAR2(600) NOT NULL,
A_date DATE NOT NULL,
FOREIGN KEY(Q_index) REFERENCES question_TB(Q_index),
FOREIGN KEY(MGR_id) REFERENCES manager_TB(MGR_id)
);

/* 공지 */
CREATE TABLE notice_TB(
N_index NUMBER PRIMARY KEY, /* 시퀀스값 PK */
MGR_id VARCHAR2(50) NOT NULL, /* manager_TB의 FK */
N_title VARCHAR2(100) NOT NULL,
N_content VARCHAR2(600) NOT NULL,
N_date DATE NOT NULL,
FOREIGN KEY(MGR_id) REFERENCES manager_TB(MGR_id)
);

/* 공지 시퀀스 */
CREATE SEQUENCE notice_SQ
START WITH 1
INCREMENT BY 1;
