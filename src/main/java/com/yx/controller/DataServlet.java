package com.yx.controller;

import com.alibaba.fastjson.JSONObject;
import com.yx.utils.BookInfoTool;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置响应内容类型为 JSON
        response.setContentType("application/json");
        // 设置响应报文的编码为 UTF-8
        response.setCharacterEncoding("UTF-8");

        // 调用工具类BookInfoTool中的封装好的JSON数据
        JSONObject responseData = null;
        try {
            responseData = new BookInfoTool().getJson();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // 将 JSON 字符串作为响应发送回前端
        response.getWriter().write(responseData.toString());
    }
}
