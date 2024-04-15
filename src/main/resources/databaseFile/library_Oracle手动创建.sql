CREATE TABLE admin (
  id NUMBER(11) NOT NULL,
  username VARCHAR2(20) NULL,
  password VARCHAR2(20) NULL,
  adminType NUMBER(11) NULL,
  CONSTRAINT admin_pk PRIMARY KEY (id)
) 
-- ��������
CREATE SEQUENCE admin_seq
    START WITH 5
    INCREMENT BY 1
    MAXVALUE 999999999999999999999999999
    NOCACHE
    NOCYCLE
    NOORDER;

-- ����������
CREATE OR REPLACE TRIGGER admin_trg
    after INSERT ON admin
    FOR EACH ROW
BEGIN
    SELECT admin_seq.NEXTVAL INTO :new.id FROM dual;
END;
CREATE OR REPLACE TRIGGER admin_trg
    BEFORE INSERT ON admin
    FOR EACH ROW
BEGIN
    SELECT admin_seq.NEXTVAL INTO :new.id FROM dual;
END;

select * from admin;

-- �� admin ���в���һ���¼�¼
INSERT INTO admin (username, password, adminType)
VALUES ('admin', 'admin', 1);
-- �� admin ���в�������¼�¼
INSERT INTO admin (username, password, adminType)
VALUES ('root2', 'root2', 0);

CREATE TABLE book_info (
    -- id �ֶΣ����ͣ��Զ���������Ϊ����
    id NUMBER(11) NOT NULL,
    -- name �ֶΣ��ַ������ͣ���󳤶�Ϊ 20 ���ַ�
    name VARCHAR2(20 CHAR) NULL,
    -- author �ֶΣ��ַ������ͣ���󳤶�Ϊ 30 ���ַ�
    author VARCHAR2(30 CHAR) NULL,
    -- publish �ֶΣ��ַ������ͣ���󳤶�Ϊ 30 ���ַ�
    publish VARCHAR2(30 CHAR) NULL,
    -- isbn �ֶΣ��ַ������ͣ���󳤶�Ϊ 30 ���ַ�
    isbn VARCHAR2(30 CHAR) NULL,
    -- introduction �ֶΣ��ַ������ͣ���󳤶�Ϊ 50 ���ַ�
    introduction VARCHAR2(50 CHAR) NULL,
    -- language �ֶΣ��ַ������ͣ���󳤶�Ϊ 20 ���ַ�
    language VARCHAR2(20 CHAR) NULL,
    -- price �ֶΣ������ͣ���Ϊ��
    price NUMBER(18,2) NULL,
    -- publish_date �ֶΣ��������ͣ���Ϊ��
    publish_date DATE NULL,
    -- type_id �ֶΣ����ͣ���Ϊ��
    type_id NUMBER(11) NULL,
    -- status �ֶΣ����ͣ���Ϊ��
    status NUMBER(11) NULL,
    -- ��������
    CONSTRAINT book_info_pk PRIMARY KEY (id)
);
-- �������� book_info_seq
CREATE SEQUENCE book_info_seq
    INCREMENT BY 1
    START WITH 1;
-- ���������� book_info_trig
CREATE OR REPLACE TRIGGER book_info_trig
BEFORE INSERT ON book_info
FOR EACH ROW
BEGIN
    :NEW.id := book_info_seq.NEXTVAL;
END;

-- �����һ����¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (1, '���μ�', 'ʩ����', '��е��ҵ������', '100011', 'ʦͽ����ȥ����ȡ�澭', '����', 42, TO_DATE('2020-03-20', 'YYYY-MM-DD'), 1, 0);

-- ����ڶ�����¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (2, '��������', '�޹���', '�廪��ѧ������', '100012', '����ĩ�������', '����', 48, TO_DATE('2018-03-30', 'YYYY-MM-DD'), 1, 1);

-- �����������¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (3, '��¥��', '��ѩ��', '��е��ҵ������', '100013', '�������ڶ���Ů֮�����', '����', 39, TO_DATE('2019-04-04', 'YYYY-MM-DD'), 1, 1);

-- �����������¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (4, '�ʱ���', '���˼', 'ԭ���ܳ�����', '100014', '���˼��ʣ���ֵ����', 'Ӣ��', 42, TO_DATE('2019-04-05', 'YYYY-MM-DD'), 5, 0);

-- �����������¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (5, '����ѧԭ��', '��Ъ��', '��е��ҵ������', '100015', '��������ѧ�繫��Ϊ��ʱ��������', 'Ӣ��', 45, TO_DATE('2020-04-06', 'YYYY-MM-DD'), 5, 0);

-- �����������¼
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (6, '�����µ��й�����', '������', '������ѧ������', '100016', 'ʮ�󾭵䷨ѧ����', '����', 42, TO_DATE('2015-04-05', 'YYYY-MM-DD'), 4, 1);

-- ��ѯ�������м�¼
SELECT * FROM book_info;

CREATE SEQUENCE lend_list_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE lend_list (
  id NUMBER PRIMARY KEY,
  bookId NUMBER,
  readerId NUMBER,
  lendDate TIMESTAMP,
  backDate TIMESTAMP,
  backType NUMBER,
  exceptRemarks VARCHAR2(255)
);

COMMENT ON TABLE lend_list IS '���ļ�¼��˭�ں�ʱ������ʲô�飬������û�й黹���黹ʱ����٣�';

CREATE TRIGGER lend_list_trigger
BEFORE INSERT ON lend_list
FOR EACH ROW
BEGIN
  SELECT lend_list_seq.nextval INTO :new.id FROM dual;
END;
/

INSERT INTO lend_list VALUES (15, 1, 1, TO_TIMESTAMP('2021-04-04 10:07:31', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-04-04 21:09:27', 'YYYY-MM-DD HH24:MI:SS'), 0, NULL);

INSERT INTO lend_list VALUES (36, 2, 2, TO_TIMESTAMP('2021-04-04 21:48:17', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-04-04 21:50:00', 'YYYY-MM-DD HH24:MI:SS'), 2, NULL);

INSERT INTO lend_list VALUES (37, 3, 3, TO_TIMESTAMP('2021-04-04 21:50:22', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-04-04 21:50:32', 'YYYY-MM-DD HH24:MI:SS'), 3, NULL);

INSERT INTO lend_list VALUES (38, 5, 1, TO_TIMESTAMP('2021-04-05 21:35:35', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-04-05 21:35:47', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);

INSERT INTO lend_list(id, bookId, readerId, lendDate) VALUES (lend_list_seq.nextval, 6, 3, TO_TIMESTAMP('2021-04-05 21:42:35', 'YYYY-MM-DD HH24:MI:SS'));

CREATE TABLE notice (
  id NUMBER PRIMARY KEY,
  topic VARCHAR2(50),
  content VARCHAR2(255),
  author VARCHAR2(20),
  createDate TIMESTAMP,
  CONSTRAINT notice_topic_nn CHECK (topic IS NOT NULL),
  CONSTRAINT notice_author_nn CHECK (author IS NOT NULL)
);
COMMENT ON TABLE notice IS '���棨��¼ϵͳ������һЩ֪ͨ�����棩';

CREATE SEQUENCE notice_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;


CREATE OR REPLACE TRIGGER notice_trig
BEFORE INSERT ON notice
FOR EACH ROW
BEGIN
  SELECT notice_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����1', '���ǵ�һ�����ݲ��԰�', 'admin', TIMESTAMP '2021-04-01 21:35:53');
INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����2', '���ǵڶ������ݲ��԰�', 'admin', TIMESTAMP '2021-04-02 22:38:03');
INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����3', '���ǵ��������ݲ��԰�', 'weiney', TIMESTAMP '2021-04-03 06:47:54');
INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����4', '���ǵ��ĸ����ݲ��԰�', 'root1', TIMESTAMP '2021-04-04 06:48:01');
INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����5', '���ǵ�������ݲ��԰�', 'root1', TIMESTAMP '2021-04-04 06:49:03');
INSERT INTO notice (topic, content, author, createDate) VALUES ('�����ڲ�����6', '���ǵ��������ݲ��԰�', 'weiney', TIMESTAMP '2021-04-05 07:48:04');

CREATE SEQUENCE reader_info_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE TABLE reader_info (
  id NUMBER PRIMARY KEY,
  username VARCHAR2(20),
  password VARCHAR2(20),
  realName VARCHAR2(20),
  sex VARCHAR2(5),
  birthday DATE,
  address VARCHAR2(30),
  tel VARCHAR2(11),
  email VARCHAR2(15),
  registerDate TIMESTAMP,
  readerNumber VARCHAR2(20),
  CONSTRAINT reader_info_username_uq UNIQUE (username)
);
COMMENT ON TABLE reader_info IS '������Ϣ��������¼�˺�����ȣ�';

CREATE OR REPLACE TRIGGER reader_info_trig
BEFORE INSERT ON reader_info
FOR EACH ROW
BEGIN
  SELECT reader_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('zhangsan', '12345', '������', '��', TO_DATE('2001-04-01', 'yyyy-mm-dd'), '�����ϲ�', '13767134834', 'yu123@163.com', TO_TIMESTAMP('2021-04-02 13:18:59', 'yyyy-mm-dd hh24:mi:ss'), '8120116041');
INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('mary', '12345', '����', 'Ů', TO_DATE('2004-04-01', 'yyyy-mm-dd'), '�����人', '15270839599', 'yx123@163.com', TO_TIMESTAMP('2021-03-06 07:57:56', 'yyyy-mm-dd hh24:mi:ss'), '8120116044');
INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('cindy', '12345', '����', 'Ů', TO_DATE('2010-04-04', 'yyyy-mm-dd'), '��������', '13834141133', 'zs1314@163.com', TO_TIMESTAMP('2021-04-04 13:36:42', 'yyyy-mm-dd hh24:mi:ss'), '8120116042');

CREATE SEQUENCE type_info_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
  CREATE TABLE type_info (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(20),
  remarks CHAR(10)
);
ALTER TABLE type_info MODIFY(remarks VARCHAR2(50));

COMMENT ON TABLE type_info IS 'ͼ�����ͱ�';

CREATE OR REPLACE TRIGGER type_info_trig
BEFORE INSERT ON type_info
FOR EACH ROW
BEGIN
  SELECT type_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

INSERT INTO type_info VALUES (1, '��ѧ��', '��ұ���');
INSERT INTO type_info VALUES (2, '��ʷ��', '�˽���ʷ�Ļ�');
INSERT INTO type_info VALUES (3, '��ѧ��', '����');
INSERT INTO type_info VALUES (4, '��ѧ��', 'ѧϰ���ɣ����˾');
INSERT INTO type_info VALUES (5, '����ѧ��', '�㾭��');
INSERT INTO type_info VALUES (6, 'ͳ��ѧ��', 'ѧϰͳ�ƣ������޵�');
insert into type_info values(7, '�������','������ı�����');

update type_info set id = 2 where id = 5;

select * from book_info;
select * from reader_info;
delete from book_info where id = 6;

SELECT  count( book.id )  AS counts,  type.NAME
FROM  book_info book 
LEFT JOIN type_info type ON type.id = book.type_id
GROUP BY book.type_id;

SELECT COUNT(book.id) AS counts, type.name
FROM book_info book
LEFT JOIN type_info type ON type.id = book.type_id
GROUP BY book.type_id, type.name;

-- �����û�������ͼ
CREATE VIEW reader_lend_view AS
SELECT reader_info.username, book_info.name, book_info.author, lend_list.lenddate
FROM reader_info, lend_list, book_info
WHERE reader_info.id = lend_list.readerid AND lend_list.bookid = book_info.id;

commit;


