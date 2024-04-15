<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.7.0/css/font-awesome.min.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        .layui-card {
            border: 1px solid #f2f2f2;
            border-radius: 5px;
        }

        .icon {
            margin-right: 10px;
            color: #1aa094;
        }

        .icon-cray {
            color: #ffb800 !important;
        }

        .icon-blue {
            color: #1e9fff !important;
        }

        .icon-tip {
            color: #ff5722 !important;
        }

        .layuimini-qiuck-module {
            text-align: center;
            margin-top: 10px
        }

        .layuimini-qiuck-module a i {
            display: inline-block;
            width: 100%;
            height: 60px;
            line-height: 60px;
            text-align: center;
            border-radius: 2px;
            font-size: 30px;
            background-color: #F8F8F8;
            color: #333;
            transition: all .3s;
            -webkit-transition: all .3s;
        }

        .layuimini-qiuck-module a cite {
            position: relative;
            top: 2px;
            display: block;
            color: #666;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            font-size: 14px;
        }

        .welcome-module {
            width: 100%;
            height: 210px;
        }

        .panel {
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 3px;
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05)
        }

        .panel-body {
            padding: 10px
        }

        .panel-title {
            margin-top: 0;
            margin-bottom: 0;
            font-size: 12px;
            color: inherit
        }

        .label {
            display: inline;
            padding: .2em .6em .3em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: .25em;
            margin-top: .3em;
        }

        .layui-red {
            color: red
        }

        .main_btn > p {
            height: 40px;
        }

        .layui-bg-number {
            background-color: #F8F8F8;
        }

        .layuimini-notice:hover {
            background: #f6f6f6;
        }

        .layuimini-notice {
            padding: 7px 16px;
            clear: both;
            font-size: 12px !important;
            cursor: pointer;
            position: relative;
            transition: background 0.2s ease-in-out;
        }

        .layuimini-notice-title, .layuimini-notice-label {
            padding-right: 70px !important;
            text-overflow: ellipsis !important;
            overflow: hidden !important;
            white-space: nowrap !important;
        }

        .layuimini-notice-title {
            line-height: 28px;
            font-size: 14px;
        }

        .layuimini-notice-extra {
            position: absolute;
            top: 50%;
            margin-top: -8px;
            right: 16px;
            display: inline-block;
            height: 16px;
            color: #999;
        }
    </style>
</head>
<body>
<div class="layuimini-container">

    <div class="layui-col-md4">

        <div class="layui-card">
            <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>系统公告</div>
            <div class="layui-card-body layui-text">
                <c:forEach var="notice" items="${noticeList}">
                    <div class="layuimini-notice">
                        <div class="layuimini-notice-title">${notice.topic}</div>
                        <div class="layuimini-notice-extra"><fmt:formatDate value="${notice.createDate}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/></div>
                        <div class="layuimini-notice-content layui-hide">
                                ${notice.content}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="layuimini-container">
    <div class="layui-col-md4">
        <div class="layui-card">
            <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>查看图书列表</div>
            <div class="layui-card-body layui-text">
                <div class="layuimini-notice">
                    <div class="layuimini-notice-title">查看书籍信息（存储过程）</div>
                    <div class="layuimini-notice-extra"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                    <div id="bookTableContainer" class="layuimini-notice-content layui-hide" >
                        <table id="bookTable" lay-filter="bookTable">
                            <thead>
                            <tr>
                                <th lay-data="{field:'name', width:150}">书名</th>
                                <th lay-data="{field:'author', width:100}">作者</th>
                                <th lay-data="{field:'publish', width:150}">出版社</th>
                                <th lay-data="{field:'isbn', width:150}">ISBN</th>
                                <th lay-data="{field:'introduction', width:300, templet:'#introductionTpl'}">简介</th>
                                <th lay-data="{field:'language', width:100}">语言</th>
                                <th lay-data="{field:'price', minWidth: 120, sort: true}">价格</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layuimini-container">
    <div class="layui-col-md4">
        <div class="layui-card">
            <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>借阅记录</div>
            <div class="layui-card-body layui-text">
                <div class="layuimini-notice">
                    <div class="layuimini-notice-title">查询借阅信息(存储过程+视图)</div>
                    <div class="layuimini-notice-extra"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                    <div id="lendTableContainer" class="layuimini-notice-content layui-hide" >
                        <table id="lendTable" lay-filter="lendTable">
                            <thead>
                            <tr>
                                <th lay-data="{field:'username', width:150}">用户名</th>
                                <th lay-data="{field:'bookname', width:100}">书名</th>
                                <th lay-data="{field:'author', width:150}">作者</th>
                                <th lay-data="{field:'lenddate', width:150}">借阅日期</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 获取要展示表格的容器元素
    var bookTableContainer = document.getElementById("bookTableContainer");

    // 发送 Ajax 请求获取数据并生成表格
    $.ajax({
        url: "data",
        type: "GET",
        dataType: "json",
        success: function (data) {
            // 生成表格的代码，与之前展示内容的部分类似
            var bookTable = $("<table/>").attr("id", "bookTable").attr("lay-filter", "bookTable").addClass("layui-table");
            var theadTr = $("<tr/>").append($("<th/>").attr("lay-data", "{field:'name', width:150}").text("书名"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'author', width:100}").text("作者"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'publish', width:150}").text("出版社"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'isbn', width:150}").text("ISBN"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'introduction', width:300, templet:'#introductionTpl'}").text("简介"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'language', width:100}").text("语言"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'price', minWidth: 120, sort: true}").text("价格"));
            var thead = $("<thead/>").append(theadTr);
            bookTable.append(thead);

            var tbody = $("<tbody/>");
            var books = data.books;
            for (var i = 0; i < books.length; i++) {
                // 生成表格行的代码，与之前展示内容的部分类似
                var book = books[i];
                var tr = $("<tr/>").append($("<td/>").text(book.name));
                tr.append($("<td/>").text(book.author));
                tr.append($("<td/>").text(book.publish));
                tr.append($("<td/>").text(book.isbn));
                tr.append($("<td/>").text(book.introduction));
                tr.append($("<td/>").text(book.language));
                tr.append($("<td/>").text(book.price));
                tbody.append(tr);
            }
            bookTable.append(tbody);

            // 将表格添加到容器元素中
            bookTableContainer.innerHTML = "";
            bookTable.appendTo(bookTableContainer);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            // 请求失败的处理，与之前展示内容的部分类似
            $("#result").text("请求失败：" + textStatus + "，" + errorThrown);
        }
    });

</script>

<script>
    // 获取要展示表格的容器元素
    var lendTableContainer = document.getElementById("lendTableContainer");
    var userId = "${sessionScope.user.id}";
    // 发送 Ajax 请求获取数据并生成表格
    $.ajax({
        url: "LendInfo?userId=" + userId,   // 将 userId 作为 URL 参数传递给后台
        type: "GET",
        dataType: "json",
        success: function (data) {
            // 生成表格的代码，与之前展示内容的部分类似
            var lendTable = $("<table/>").attr("id", "lendTable").attr("lay-filter", "lendTable").addClass("layui-table");
            var theadTr = $("<tr/>").append($("<th/>").attr("lay-data", "{field:'username', width:150}").text("用户名"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'bookname', width:100}").text("书名"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'author', width:150}").text("作者"));
            theadTr.append($("<th/>").attr("lay-data", "{field:'lenddate', width:150}").text("借阅日期"));
            var thead = $("<thead/>").append(theadTr);
            lendTable.append(thead);

            var tbody = $("<tbody/>");
            var lends = data.lend;
            for (var i = 0; i < lends.length; i++) {
                // 生成表格行的代码，与之前展示内容的部分类似
                var lend = lends[i];
                var tr = $("<tr/>").append($("<td/>").text(lend.username));
                tr.append($("<td/>").text(lend.bookname));
                tr.append($("<td/>").text(lend.author));
                tr.append($("<td/>").text(lend.lenddate));
                tbody.append(tr);
            }
            lendTable.append(tbody);

            // 将表格添加到容器元素中
            lendTableContainer.innerHTML = "";
            lendTable.appendTo(lendTableContainer);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            // 请求失败的处理，与之前展示内容的部分类似
            $("#result").text("请求失败：" + textStatus + "，" + errorThrown);
        }
    });

</script>


<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'miniTab', 'echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniTab = layui.miniTab,
            echarts = layui.echarts;

        miniTab.listen();

        /**
         * 查看公告信息
         **/
        $('body').on('click', '.layuimini-notice', function () {
            var title = $(this).children('.layuimini-notice-title').text(),
                noticeTime = $(this).children('.layuimini-notice-extra').text(),
                content = $(this).children('.layuimini-notice-content').html();
            var html = '<div style="padding:15px 20px; text-align:justify; line-height: 22px;border-bottom:1px solid #e2e2e2;background-color: #2f4056;color: #ffffff">\n' +
                '<div style="text-align: center;margin-bottom: 20px;font-weight: bold;border-bottom:1px solid #718fb5;padding-bottom: 5px"><h4 class="text-danger">' + title + '</h4></div>\n' +
                '<div style="font-size: 12px">' + content + '</div>\n' +
                '</div>\n';
            parent.layer.open({
                type: 1,
                title: '系统公告' + '<span style="float: right;right: 1px;font-size: 12px;color: #b1b3b9;margin-top: 1px">' + noticeTime + '</span>',
                area: 'auto;',
                shade: 0.8,
                id: 'layuimini-notice',
                btnAlign: 'c',
                moveType: 1,
                content: html
            });
        });
    });
</script>
</body>
</html>

