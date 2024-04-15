package com.yx.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import com.yx.po.BookBean;
import oracle.jdbc.OracleTypes;

public class BookInfoTool {

    private static final String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
    private static final String DB_USERNAME = "library";
    private static final String DB_PASSWORD = "root123";

    public static List<BookBean> getAllBooksInfo() throws SQLException {
        Connection conn = null;
        CallableStatement stmt = null;
        ResultSet rs = null;
        List<BookBean> books = new ArrayList<>();
        try {
            // 建立数据库连接
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // 调用存储过程
            stmt = conn.prepareCall("{CALL get_all_books_info(?)}");
            stmt.registerOutParameter(1, OracleTypes.CURSOR);
            stmt.execute();
            rs = (ResultSet) stmt.getObject(1);


            // 遍历结果集
            while (rs.next()) {
                String name = rs.getString("NAME");
                String author = rs.getString("AUTHOR");
                String publish = rs.getString("PUBLISH");
                String isbn = rs.getString("ISBN");
                String introduction = rs.getString("INTRODUCTION");
                String language = rs.getString("LANGUAGE");
                double price = rs.getDouble("PRICE");
                BookBean bookBean = new BookBean(name, author, publish, isbn, introduction, language, price);
                books.add(bookBean);
                //System.out.println(bookBean.toString());

            }
        } finally {
            // 释放资源
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
            return books;
        }
    }

    public JSONObject getJson() throws SQLException {
        List<BookBean> books = BookInfoTool.getAllBooksInfo();
        // 创建一个空的 JSONObject 对象
        JSONObject responseData = new JSONObject();
        // 将需要返回的数据填充到 JSONObject中
        JSONArray booksJson = new JSONArray();

        for (BookBean book : books) {
            JSONObject bookJson = new JSONObject();
            bookJson.put("name", book.getName());
            bookJson.put("author", book.getAuthor());
            bookJson.put("publish", book.getPublish());
            bookJson.put("isbn", book.getIsbn());
            bookJson.put("introduction", book.getIntroduction());
            bookJson.put("language", book.getLanguage());
            bookJson.put("price", book.getPrice());
            booksJson.add(bookJson);
        }
        responseData.put("books", booksJson);
        return responseData;
    }

    public static void main(String[] args) {
        try {
            JSONObject json = new BookInfoTool().getJson();
            // 将 responseData 对象的 JSON 字符串输出到控制台
            System.out.println(json.toString());


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
