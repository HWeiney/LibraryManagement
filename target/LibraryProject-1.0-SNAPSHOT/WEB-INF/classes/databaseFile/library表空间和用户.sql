-- ������ռ�
CREATE TABLESPACE tablespace_library
    DATAFILE 'D:\Oracle\WEINEY\oracleproject.dbf' SIZE 10M 
    AUTOEXTEND ON NEXT 10M MAXSIZE 100M;
    
CREATE USER library IDENTIFIED BY root123 DEFAULT TABLESPACE tablespace_library;
grant connect, resource to library;
GRANT CREATE VIEW TO library;