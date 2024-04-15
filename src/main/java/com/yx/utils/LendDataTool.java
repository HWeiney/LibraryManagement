package com.yx.utils;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import oracle.jdbc.OracleTypes;

/**
 * @author Weiney
 * @ToDo
 * @create 2023-06-17 12:58
 */
public class LendDataTool {
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521/xe";
    private static final String DB_USER = "library";
    private static final String DB_PASS = "root123";

    public JSONObject getLendDataById(int id) throws SQLException {
        // 获取数据库连接
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        // 准备 SQL 语句并创建 CallableStatement 对象
        String sql = "{call getLendDataById(?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql);

        // 设置输入参数值
        stmt.setInt(1, id);

        // 注册输出参数类型
        stmt.registerOutParameter(2, OracleTypes.CURSOR);

        // 执行存储过程
        stmt.execute();

        // 获取结果集并封装成 JSON 数组
        ResultSet rs = (ResultSet) stmt.getObject(2);
        JSONArray jsonArray = new JSONArray();
        while (rs.next()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("username", rs.getString("username"));
            jsonObject.put("bookname", rs.getString("name"));
            jsonObject.put("author", rs.getString("author"));
            Date lendDate = rs.getDate("lenddate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String lendDateStr = sdf.format(lendDate);
            jsonObject.put("lenddate", lendDateStr);
            jsonArray.add(jsonObject);
        }

        // 创建一个空的 JSONObject 对象
        JSONObject responseData = new JSONObject();
        responseData.put("lend", jsonArray);

        // 关闭资源
        rs.close();
        stmt.close();
        conn.close();
        return responseData;
    }

    public static void main(String[] args) {
        int id = 4;  // 设置读者 ID
        LendDataTool lendData = new LendDataTool();
        try {
            JSONObject lendDataById = lendData.getLendDataById(4);
            System.out.println(lendDataById.toString());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
