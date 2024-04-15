--------------------------------------------------------
--  文件已创建 - 星期五-六月-16-2023   
--------------------------------------------------------
DROP SEQUENCE "LIBRARY"."ADMIN_SEQ";
DROP SEQUENCE "LIBRARY"."BOOK_INFO_SEQ";
DROP SEQUENCE "LIBRARY"."LEND_LIST_SEQ";
DROP SEQUENCE "LIBRARY"."NOTICE_SEQ";
DROP SEQUENCE "LIBRARY"."READER_INFO_SEQ";
DROP SEQUENCE "LIBRARY"."TYPE_INFO_SEQ";
DROP TABLE "LIBRARY"."ADMIN";
DROP TABLE "LIBRARY"."BOOK_INFO";
DROP TABLE "LIBRARY"."LEND_LIST";
DROP TABLE "LIBRARY"."NOTICE";
DROP TABLE "LIBRARY"."READER_INFO";
DROP TABLE "LIBRARY"."TYPE_INFO";
DROP PROCEDURE "LIBRARY"."GET_ALL_BOOKS_INFO";
--------------------------------------------------------
--  DDL for Sequence ADMIN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."ADMIN_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOOK_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."BOOK_INFO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LEND_LIST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."LEND_LIST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence READER_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."READER_INFO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TYPE_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LIBRARY"."TYPE_INFO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."ADMIN" 
   (	"ID" NUMBER(11,0), 
	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"ADMINTYPE" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;

   COMMENT ON COLUMN "LIBRARY"."ADMIN"."USERNAME" IS '用户名';
   COMMENT ON TABLE "LIBRARY"."ADMIN"  IS '管理员表';
--------------------------------------------------------
--  DDL for Table BOOK_INFO
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."BOOK_INFO" 
   (	"ID" NUMBER(11,0), 
	"NAME" VARCHAR2(20 CHAR), 
	"AUTHOR" VARCHAR2(30 CHAR), 
	"PUBLISH" VARCHAR2(30 CHAR), 
	"ISBN" VARCHAR2(30 CHAR), 
	"INTRODUCTION" VARCHAR2(50 CHAR), 
	"LANGUAGE" VARCHAR2(20 CHAR), 
	"PRICE" NUMBER(18,2), 
	"PUBLISH_DATE" DATE DEFAULT SYSDATE, 
	"TYPE_ID" NUMBER(11,0), 
	"STATUS" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;
--------------------------------------------------------
--  DDL for Table LEND_LIST
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."LEND_LIST" 
   (	"ID" NUMBER, 
	"BOOKID" NUMBER, 
	"READERID" NUMBER, 
	"LENDDATE" TIMESTAMP (6), 
	"BACKDATE" TIMESTAMP (6), 
	"BACKTYPE" NUMBER, 
	"EXCEPTREMARKS" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;

   COMMENT ON TABLE "LIBRARY"."LEND_LIST"  IS '借阅记录（谁在何时借走了什么书，并且有没有归还，归还时间多少）';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."NOTICE" 
   (	"ID" NUMBER, 
	"TOPIC" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(255 BYTE), 
	"AUTHOR" VARCHAR2(20 BYTE), 
	"CREATEDATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;

   COMMENT ON TABLE "LIBRARY"."NOTICE"  IS '公告（记录系统发布的一些通知、公告）';
--------------------------------------------------------
--  DDL for Table READER_INFO
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."READER_INFO" 
   (	"ID" NUMBER, 
	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"REALNAME" VARCHAR2(20 BYTE), 
	"SEX" VARCHAR2(5 BYTE), 
	"BIRTHDAY" DATE, 
	"ADDRESS" VARCHAR2(30 BYTE), 
	"TEL" VARCHAR2(11 BYTE), 
	"EMAIL" VARCHAR2(15 BYTE), 
	"REGISTERDATE" TIMESTAMP (6), 
	"READERNUMBER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;

   COMMENT ON TABLE "LIBRARY"."READER_INFO"  IS '读者信息（包括登录账号密码等）';
--------------------------------------------------------
--  DDL for Table TYPE_INFO
--------------------------------------------------------

  CREATE TABLE "LIBRARY"."TYPE_INFO" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"REMARKS" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;

   COMMENT ON TABLE "LIBRARY"."TYPE_INFO"  IS '图书类型表';
REM INSERTING into LIBRARY.ADMIN
SET DEFINE OFF;
Insert into LIBRARY.ADMIN (ID,USERNAME,PASSWORD,ADMINTYPE) values (5,'admin','admin',1);
Insert into LIBRARY.ADMIN (ID,USERNAME,PASSWORD,ADMINTYPE) values (6,'weiney','123',1);
Insert into LIBRARY.ADMIN (ID,USERNAME,PASSWORD,ADMINTYPE) values (7,'root1','root1',0);
Insert into LIBRARY.ADMIN (ID,USERNAME,PASSWORD,ADMINTYPE) values (8,'root2','root2',0);
REM INSERTING into LIBRARY.BOOK_INFO
SET DEFINE OFF;
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (50,'大奉打更人','卖报小郎君','起点中文网','01003','天不生我许七安，大奉万古如长夜','汉语',34,null,14,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (51,'Oracle从入门到精通','Oracle','Oracle公司','01005','select * from user;','英语',65,null,11,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (52,'数据结构-从概念到C++实现','王红梅','清华大学出版社','ISBN2023','数据结构，学习算法必不可少','汉语',67,null,11,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (53,'经世济民','Simth','人民出版社','ISBN010053','经世济民','英语',54,null,13,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (54,'经济学原理','清华大学','清华大学','ISBN2345','经济改变世界格局','中文',23,null,13,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (55,'线性代数','李永乐','金榜时代','ISBN2532','线代大弟子','中文',54,null,15,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (48,'零基础学Java','杜聚宾','动力节点Java研究院','01001','零基础学Java就来动力节点，动力节点，被称为业界黄埔军校','汉语',54,null,11,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (49,'民法典','中国','人民出版社','01002','《民法典》介绍了我国民法相关法律','汉语',34,null,12,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (56,'斗罗大陆·绝世唐门','唐家三少','起点中文','01004','封号斗罗','汉语',93,null,14,1);
Insert into LIBRARY.BOOK_INFO (ID,NAME,AUTHOR,PUBLISH,ISBN,INTRODUCTION,LANGUAGE,PRICE,PUBLISH_DATE,TYPE_ID,STATUS) values (47,'武动乾坤','我吃西红柿','起点中文网','ISBN09384','武动乾坤！！！','汉语',35,to_date('21-6月 -23','DD-MON-RR'),14,1);
REM INSERTING into LIBRARY.LEND_LIST
SET DEFINE OFF;
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (44,52,4,to_timestamp('15-6月 -23 11.50.15.181000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (42,50,4,to_timestamp('15-6月 -23 11.50.15.168000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (43,51,4,to_timestamp('15-6月 -23 11.50.15.175000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (45,53,4,to_timestamp('15-6月 -23 11.50.15.187000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (46,54,4,to_timestamp('15-6月 -23 11.50.15.191000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (47,55,4,to_timestamp('15-6月 -23 11.50.15.197000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (48,48,4,to_timestamp('15-6月 -23 11.50.15.201000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (49,49,4,to_timestamp('15-6月 -23 11.50.15.205000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (50,56,4,to_timestamp('15-6月 -23 11.50.15.210000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (51,47,4,to_timestamp('15-6月 -23 11.50.15.212000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (52,50,3,to_timestamp('15-6月 -23 11.50.43.914000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (53,52,3,to_timestamp('15-6月 -23 11.50.43.918000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (54,54,3,to_timestamp('15-6月 -23 11.50.43.922000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
Insert into LIBRARY.LEND_LIST (ID,BOOKID,READERID,LENDDATE,BACKDATE,BACKTYPE,EXCEPTREMARKS) values (55,55,3,to_timestamp('15-6月 -23 11.50.43.928000000 下午','DD-MON-RR HH.MI.SSXFF AM'),null,null,null);
REM INSERTING into LIBRARY.NOTICE
SET DEFINE OFF;
Insert into LIBRARY.NOTICE (ID,TOPIC,CONTENT,AUTHOR,CREATEDATE) values (8,'关于图书管理系统','连接Oracle数据库','admin',to_timestamp('12-6月 -23 11.19.20.868000000 下午','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into LIBRARY.READER_INFO
SET DEFINE OFF;
Insert into LIBRARY.READER_INFO (ID,USERNAME,PASSWORD,REALNAME,SEX,BIRTHDAY,ADDRESS,TEL,EMAIL,REGISTERDATE,READERNUMBER) values (4,'wei','root','wei','男',to_date('07-6月 -23','DD-MON-RR'),null,'15652452222','55656',null,'202100838');
Insert into LIBRARY.READER_INFO (ID,USERNAME,PASSWORD,REALNAME,SEX,BIRTHDAY,ADDRESS,TEL,EMAIL,REGISTERDATE,READERNUMBER) values (1,'zhangsan','12345','彭于晏','男',to_date('01-4月 -01','DD-MON-RR'),'江西南昌','13767134834','yu123@163.com',to_timestamp('02-4月 -21 01.18.59.000000000 下午','DD-MON-RR HH.MI.SSXFF AM'),'8120116041');
Insert into LIBRARY.READER_INFO (ID,USERNAME,PASSWORD,REALNAME,SEX,BIRTHDAY,ADDRESS,TEL,EMAIL,REGISTERDATE,READERNUMBER) values (2,'mary','12345','陈恋','女',to_date('01-4月 -04','DD-MON-RR'),'湖北武汉','15270839599','yx123@163.com',to_timestamp('06-3月 -21 07.57.56.000000000 上午','DD-MON-RR HH.MI.SSXFF AM'),'8120116044');
Insert into LIBRARY.READER_INFO (ID,USERNAME,PASSWORD,REALNAME,SEX,BIRTHDAY,ADDRESS,TEL,EMAIL,REGISTERDATE,READERNUMBER) values (3,'cindy','123456','辛帝','女',to_date('04-4月 -10','DD-MON-RR'),null,'13834141133','56565@163.com',null,'8120116042');
Insert into LIBRARY.READER_INFO (ID,USERNAME,PASSWORD,REALNAME,SEX,BIRTHDAY,ADDRESS,TEL,EMAIL,REGISTERDATE,READERNUMBER) values (5,'root','123456','root','男',to_date('01-6月 -23','DD-MON-RR'),null,'15245156801','54545@112',null,'070019');
REM INSERTING into LIBRARY.TYPE_INFO
SET DEFINE OFF;
Insert into LIBRARY.TYPE_INFO (ID,NAME,REMARKS) values (12,'法学系列',' 法学系列丛书');
Insert into LIBRARY.TYPE_INFO (ID,NAME,REMARKS) values (13,'金融学系列','金融学系列丛书');
Insert into LIBRARY.TYPE_INFO (ID,NAME,REMARKS) values (14,'网络文学系列','网络小说');
Insert into LIBRARY.TYPE_INFO (ID,NAME,REMARKS) values (11,'计算机系列','计算机系列丛书');
Insert into LIBRARY.TYPE_INFO (ID,NAME,REMARKS) values (15,'数学系列','考研数学系列丛书');
--------------------------------------------------------
--  DDL for Index BOOK_INFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIBRARY"."BOOK_INFO_PK" ON "LIBRARY"."BOOK_INFO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;
--------------------------------------------------------
--  DDL for Index READER_INFO_USERNAME_UQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIBRARY"."READER_INFO_USERNAME_UQ" ON "LIBRARY"."READER_INFO" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;
--------------------------------------------------------
--  DDL for Index ADMIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIBRARY"."ADMIN_PK" ON "LIBRARY"."ADMIN" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY" ;
--------------------------------------------------------
--  DDL for Trigger ADMIN_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."ADMIN_TRG" 
    BEFORE INSERT ON admin
    FOR EACH ROW
BEGIN
    SELECT admin_seq.NEXTVAL INTO :new.id FROM dual;
END;
/
ALTER TRIGGER "LIBRARY"."ADMIN_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BOOK_INFO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."BOOK_INFO_TRIG" 
BEFORE INSERT ON book_info
FOR EACH ROW
BEGIN
    :NEW.id := book_info_seq.NEXTVAL;
END;
/
ALTER TRIGGER "LIBRARY"."BOOK_INFO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LEND_LIST_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."LEND_LIST_TRIGGER" 
BEFORE INSERT ON lend_list
FOR EACH ROW
BEGIN
  SELECT lend_list_seq.nextval INTO :new.id FROM dual;
END;
/
ALTER TRIGGER "LIBRARY"."LEND_LIST_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NOTICE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."NOTICE_TRIG" 
BEFORE INSERT ON notice
FOR EACH ROW
BEGIN
  SELECT notice_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "LIBRARY"."NOTICE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger READER_INFO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."READER_INFO_TRIG" 
BEFORE INSERT ON reader_info
FOR EACH ROW
BEGIN
  SELECT reader_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "LIBRARY"."READER_INFO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_INFO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LIBRARY"."TYPE_INFO_TRIG" 
BEFORE INSERT ON type_info
FOR EACH ROW
BEGIN
  SELECT type_info_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "LIBRARY"."TYPE_INFO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure GET_ALL_BOOKS_INFO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "LIBRARY"."GET_ALL_BOOKS_INFO" (
  book_cur OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN book_cur FOR
    SELECT
      NAME,
      AUTHOR,
      PUBLISH,
      ISBN,
      INTRODUCTION,
      LANGUAGE,
      PRICE,
      PUBLISH_DATE,
      TYPE_ID,
      STATUS
    FROM
      BOOK_INFO;
END;

/
--------------------------------------------------------
--  Constraints for Table READER_INFO
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."READER_INFO" ADD CONSTRAINT "READER_INFO_USERNAME_UQ" UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
  ALTER TABLE "LIBRARY"."READER_INFO" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."NOTICE" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
  ALTER TABLE "LIBRARY"."NOTICE" ADD CONSTRAINT "NOTICE_AUTHOR_NN" CHECK (author IS NOT NULL) ENABLE;
  ALTER TABLE "LIBRARY"."NOTICE" ADD CONSTRAINT "NOTICE_TOPIC_NN" CHECK (topic IS NOT NULL) ENABLE;
--------------------------------------------------------
--  Constraints for Table LEND_LIST
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."LEND_LIST" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TYPE_INFO
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."TYPE_INFO" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."ADMIN" ADD CONSTRAINT "ADMIN_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
  ALTER TABLE "LIBRARY"."ADMIN" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOK_INFO
--------------------------------------------------------

  ALTER TABLE "LIBRARY"."BOOK_INFO" ADD CONSTRAINT "BOOK_INFO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TABLESPACE_LIBRARY"  ENABLE;
  ALTER TABLE "LIBRARY"."BOOK_INFO" MODIFY ("ID" NOT NULL ENABLE);
