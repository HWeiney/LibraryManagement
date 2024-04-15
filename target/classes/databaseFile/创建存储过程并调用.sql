-- 创建获取所有图书信息存储过程
CREATE OR REPLACE PROCEDURE get_all_books_info (
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

-- 调用get_all_books_info

DECLARE
  book_cur SYS_REFCURSOR;
  book_name BOOK_INFO.NAME%TYPE;
  book_author BOOK_INFO.AUTHOR%TYPE;
  book_publish BOOK_INFO.PUBLISH%TYPE;
  book_isbn BOOK_INFO.ISBN%TYPE;
  book_intro BOOK_INFO.INTRODUCTION%TYPE;
  book_lang BOOK_INFO.LANGUAGE%TYPE;
  book_price BOOK_INFO.PRICE%TYPE;
  book_pub_date BOOK_INFO.PUBLISH_DATE%TYPE;
  book_type_id BOOK_INFO.TYPE_ID%TYPE;
  book_status BOOK_INFO.STATUS%TYPE;
BEGIN
  get_all_books_info(book_cur => book_cur);
  LOOP
    FETCH book_cur INTO book_name, book_author, book_publish, book_isbn,
                       book_intro, book_lang, book_price, book_pub_date,
                       book_type_id, book_status;
    EXIT WHEN book_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(book_name || ' - ' || book_author || '  -  ' || book_price || ' - ' || book_publish || '  -  ' || book_isbn || '  -  ' || book_intro || '  -  ' || book_lang || '  -  ' || book_price || '  -  ' || book_pub_date || '  -  ' || book_type_id);
    -- 在这里使用结果集中的数据，输出到屏幕上
  END LOOP;
  CLOSE book_cur;
END;

CREATE OR REPLACE PROCEDURE getLendDataById(
    p_id IN reader_lend_view.id%TYPE,
    cur_out OUT SYS_REFCURSOR
) AS
BEGIN
OPEN cur_out FOR SELECT * FROM reader_lend_view WHERE id = p_id;
END;
