CREATE TABLE admin (
  id NUMBER(11) NOT NULL,
  username VARCHAR2(20) NULL,
  password VARCHAR2(20) NULL,
  adminType NUMBER(11) NULL,
  CONSTRAINT admin_pk PRIMARY KEY (id)
) 
-- 创建序列
CREATE SEQUENCE admin_seq
    START WITH 5
    INCREMENT BY 1
    MAXVALUE 999999999999999999999999999
    NOCACHE
    NOCYCLE
    NOORDER;

-- 创建触发器
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

-- 向 admin 表中插入一条新记录
INSERT INTO admin (username, password, adminType)
VALUES ('admin', 'admin', 1);
-- 向 admin 表中插入多条新记录
INSERT INTO admin (username, password, adminType)
VALUES ('root2', 'root2', 0);

CREATE TABLE book_info (
    -- id 字段，整型，自动递增，作为主键
    id NUMBER(11) NOT NULL,
    -- name 字段，字符串类型，最大长度为 20 个字符
    name VARCHAR2(20 CHAR) NULL,
    -- author 字段，字符串类型，最大长度为 30 个字符
    author VARCHAR2(30 CHAR) NULL,
    -- publish 字段，字符串类型，最大长度为 30 个字符
    publish VARCHAR2(30 CHAR) NULL,
    -- isbn 字段，字符串类型，最大长度为 30 个字符
    isbn VARCHAR2(30 CHAR) NULL,
    -- introduction 字段，字符串类型，最大长度为 50 个字符
    introduction VARCHAR2(50 CHAR) NULL,
    -- language 字段，字符串类型，最大长度为 20 个字符
    language VARCHAR2(20 CHAR) NULL,
    -- price 字段，浮点型，可为空
    price NUMBER(18,2) NULL,
    -- publish_date 字段，日期类型，可为空
    publish_date DATE NULL,
    -- type_id 字段，整型，可为空
    type_id NUMBER(11) NULL,
    -- status 字段，整型，可为空
    status NUMBER(11) NULL,
    -- 设置主键
    CONSTRAINT book_info_pk PRIMARY KEY (id)
);
-- 创建序列 book_info_seq
CREATE SEQUENCE book_info_seq
    INCREMENT BY 1
    START WITH 1;
-- 创建触发器 book_info_trig
CREATE OR REPLACE TRIGGER book_info_trig
BEFORE INSERT ON book_info
FOR EACH ROW
BEGIN
    :NEW.id := book_info_seq.NEXTVAL;
END;

-- 插入第一条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (1, '西游记', '施耐庵', '机械工业出版社', '100011', '师徒四人去西天取真经', '中文', 42, TO_DATE('2020-03-20', 'YYYY-MM-DD'), 1, 0);

-- 插入第二条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (2, '三国演义', '罗贯中', '清华大学出版社', '100012', '东汉末年分三国', '中文', 48, TO_DATE('2018-03-30', 'YYYY-MM-DD'), 1, 1);

-- 插入第三条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (3, '红楼梦', '曹雪芹', '机械工业出版社', '100013', '宝玉与众多男女之间故事', '中文', 39, TO_DATE('2019-04-04', 'YYYY-MM-DD'), 1, 1);

-- 插入第四条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (4, '资本论', '马克思', '原子能出版社', '100014', '马克思的剩余价值理论', '英文', 42, TO_DATE('2019-04-05', 'YYYY-MM-DD'), 5, 0);

-- 插入第五条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (5, '经济学原理', '马歇尔', '机械工业出版社', '100015', '西方经济学界公认为划时代的著作', '英文', 45, TO_DATE('2020-04-06', 'YYYY-MM-DD'), 5, 0);

-- 插入第六条记录
INSERT INTO book_info (id, name, author, publish, isbn, introduction, language, price, publish_date, type_id, status)
VALUES (6, '大变局下的中国法治', '李卫东', '北京大学出版社', '100016', '十大经典法学著作', '中文', 42, TO_DATE('2015-04-05', 'YYYY-MM-DD'), 4, 1);

-- 查询表中所有记录
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

COMMENT ON TABLE lend_list IS '借阅记录（谁在何时借走了什么书，并且有没有归还，归还时间多少）';

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
COMMENT ON TABLE notice IS '公告（记录系统发布的一些通知、公告）';

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

INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试1', '这是第一个内容测试啊', 'admin', TIMESTAMP '2021-04-01 21:35:53');
INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试2', '这是第二个内容测试啊', 'admin', TIMESTAMP '2021-04-02 22:38:03');
INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试3', '这是第三个内容测试啊', 'weiney', TIMESTAMP '2021-04-03 06:47:54');
INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试4', '这是第四个内容测试啊', 'root1', TIMESTAMP '2021-04-04 06:48:01');
INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试5', '这是第五个内容测试啊', 'root1', TIMESTAMP '2021-04-04 06:49:03');
INSERT INTO notice (topic, content, author, createDate) VALUES ('公告内部测试6', '这是第六个内容测试啊', 'weiney', TIMESTAMP '2021-04-05 07:48:04');

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
COMMENT ON TABLE reader_info IS '读者信息（包括登录账号密码等）';

CREATE OR REPLACE TRIGGER reader_info_trig
BEFORE INSERT ON reader_info
FOR EACH ROW
BEGIN
  SELECT reader_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('zhangsan', '12345', '彭于晏', '男', TO_DATE('2001-04-01', 'yyyy-mm-dd'), '江西南昌', '13767134834', 'yu123@163.com', TO_TIMESTAMP('2021-04-02 13:18:59', 'yyyy-mm-dd hh24:mi:ss'), '8120116041');
INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('mary', '12345', '陈恋', '女', TO_DATE('2004-04-01', 'yyyy-mm-dd'), '湖北武汉', '15270839599', 'yx123@163.com', TO_TIMESTAMP('2021-03-06 07:57:56', 'yyyy-mm-dd hh24:mi:ss'), '8120116044');
INSERT INTO reader_info (username, password, realName, sex, birthday, address, tel, email, registerDate, readerNumber) VALUES ('cindy', '12345', '辛帝', '女', TO_DATE('2010-04-04', 'yyyy-mm-dd'), '北京海淀', '13834141133', 'zs1314@163.com', TO_TIMESTAMP('2021-04-04 13:36:42', 'yyyy-mm-dd hh24:mi:ss'), '8120116042');

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

COMMENT ON TABLE type_info IS '图书类型表';

CREATE OR REPLACE TRIGGER type_info_trig
BEFORE INSERT ON type_info
FOR EACH ROW
BEGIN
  SELECT type_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

INSERT INTO type_info VALUES (1, '文学类', '陶冶情操');
INSERT INTO type_info VALUES (2, '历史类', '了解历史文化');
INSERT INTO type_info VALUES (3, '工学类', '造火箭');
INSERT INTO type_info VALUES (4, '法学类', '学习法律，打官司');
INSERT INTO type_info VALUES (5, '经济学类', '搞经济');
INSERT INTO type_info VALUES (6, '统计学类', '学习统计，天下无敌');
insert into type_info values(7, '计算机类','计算机改变世界');

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

-- 创建用户借阅视图
CREATE VIEW reader_lend_view AS
SELECT reader_info.username, book_info.name, book_info.author, lend_list.lenddate
FROM reader_info, lend_list, book_info
WHERE reader_info.id = lend_list.readerid AND lend_list.bookid = book_info.id;

commit;


