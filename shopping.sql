/* ���� */
CREATE TABLE member_TB(
M_id VARCHAR2(50) NOT NULL PRIMARY KEY,
M_pwd VARCHAR2(200) NOT NULL,
M_name VARCHAR2(50) NOT NULL,
email VARCHAR2(50) NOT NULL UNIQUE,
contact VARCHAR2(20) NOT NULL,
zipcode NUMBER NOT NULL,
address VARCHAR2(200) NOT NULL,
detail_address VARCHAR2(200) NOT NULL,
joined_date DATE NOT NULL
);

/* ������ */
CREATE TABLE manager_TB(
MGR_id VARCHAR2(50) PRIMARY KEY NOT NULL,
MGR_pwd VARCHAR2(200) NOT NULL,
MGR_name VARCHAR2(50) NOT NULL,
create_date DATE NOT NULL
);

/* ��ǰ */
CREATE TABLE product_TB(
P_index NUMBER PRIMARY KEY, /* �������� PK */
P_name VARCHAR2(200) NOT NULL,
P_price NUMBER NOT NULL,
P_rest NUMBER NOT NULL,
P_date DATE NOT NULL
);
/* ��ǰ ������ */
CREATE SEQUENCE product_SQ
START WITH 1
INCREMENT BY 1;

/* ��ǰ �̹��� */
CREATE TABLE product_image_TB(
uuid VARCHAR2(100) NOT NULL PRIMARY KEY, /* �̹����� �ҷ����� ���� ���̵� PK */
P_index NUMBER NOT NULL,
file_path VARCHAR2(300) NOT NULL,
upload_date DATE NOT NULL,
FOREIGN KEY(P_index) REFERENCES product_TB(P_index)
);

/* �ֹ� */
CREATE TABLE order_TB(
O_index NUMBER PRIMARY KEY, /* �������� PK */
M_id VARCHAR2(200) NOT NULL,
O_name VARCHAR2(50) NOT NULL,
O_zipcode NUMBER NOT NULL,
O_address VARCHAR2(200) NOT NULL,
O_detail_address VARCHAR2(200) NOT NULL,
O_state VARCHAR2(50) NOT NULL,
O_delivery_charge NUMBER NOT NULL,
FOREIGN KEY(M_id) REFERENCES member_TB(M_id)
);
/* �ֹ� ������ */
CREATE SEQUENCE ordet_SQ
START WITH 1
INCREMENT BY 1;

/* �ֹ���� */
CREATE TABLE order_list_TB(
O_index NUMBER NOT NULL, /* order_TB�� FK, PK */
P_index NUMBER NOT NULL, /* product_TB�� FK, PK */
OL_qty NUMBER NOT NULL,
OL_price NUMBER NOT NULL,
FOREIGN KEY(O_index) REFERENCES order_TB(O_index),
FOREIGN KEY(P_index) REFERENCES product_TB(P_index),
CONSTRAINT order_list_TB PRIMARY KEY(O_index, P_index)
);  

/* ��ٱ��� */
CREATE TABLE cart_TB(
M_id VARCHAR2(50) NOT NULL, /* member_TB�� FK, PK */
P_index NUMBER NOT NULL, /* product_TB�� FK, PK */
C_qty NUMBER NOT NULL,
FOREIGN KEY(M_id) REFERENCES member_TB(M_id),
FOREIGN KEY(P_index) REFERENCES product_TB(P_index),
CONSTRAINT cart_TB PRIMARY KEY(M_id, P_index)
);

/* ���� */
CREATE TABLE wish_TB(
M_id VARCHAR2(50) NOT NULL, /* member_TB�� FK, PK */
P_index NUMBER NOT NULL, /* product_TB�� FK, PK */
FOREIGN KEY(M_id) REFERENCES member_TB(M_id),
FOREIGN KEY(P_index) REFERENCES product_TB(P_index),
CONSTRAINT wish_TB PRIMARY KEY(M_id, P_index)
);

/* ���ǰԽ��� */
CREATE TABLE question_TB(
Q_index NUMBER PRIMARY KEY, /* �������� PK */
M_id VARCHAR2(50) NOT NULL,
Q_category VARCHAR2(20) NOT NULL,
Q_title VARCHAR2(100) NOT NULL,
Q_content VARCHAR2(600) NOT NULL,
Q_date DATE NOT NULL,
FOREIGN KEY(M_id) REFERENCES member_TB(M_id)
);

/* ���� ������ */
CREATE SEQUENCE question_SQ
START WITH 1
INCREMENT BY 1;

/* ��ǰ */
CREATE TABLE stock_TB(
O_index NUMBER NOT NULL, /* order_TB�� FK, PK */
P_index NUMBER NOT NULL, /* product_TB�� FK, PK */
Q_index NUMBER NOT NULL, /* question_TB�� FK */
FOREIGN KEY(O_index) REFERENCES order_TB(O_index),
FOREIGN KEY(P_index) REFERENCES product_TB(P_index),
FOREIGN KEY(Q_index) REFERENCES question_TB(Q_index),
CONSTRAINT stoct_TB PRIMARY KEY(O_index, P_index)
);

/* �亯 */
CREATE TABLE answer_TB(
Q_index NUMBER NOT NULL PRIMARY KEY, /* question_TB�� FK, PK */
MGR_id VARCHAR2(50) NOT NULL, /* manager_TB�� FK */
A_title VARCHAR2(100) NOT NULL,
A_content VARCHAR2(600) NOT NULL,
A_date DATE NOT NULL,
FOREIGN KEY(Q_index) REFERENCES question_TB(Q_index),
FOREIGN KEY(MGR_id) REFERENCES manager_TB(MGR_id)
);

/* ���� */
CREATE TABLE notice_TB(
N_index NUMBER PRIMARY KEY, /* �������� PK */
MGR_id VARCHAR2(50) NOT NULL, /* manager_TB�� FK */
N_title VARCHAR2(100) NOT NULL,
N_content VARCHAR2(600) NOT NULL,
N_date DATE NOT NULL,
FOREIGN KEY(MGR_id) REFERENCES manager_TB(MGR_id)
);

/* ���� ������ */
CREATE SEQUENCE notice_SQ
START WITH 1
INCREMENT BY 1;