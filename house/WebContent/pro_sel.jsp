<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   /*
   @Author:
   @Date:
   @projectName:
   @TEL:
   @QQ:
   */
    
    /*
        全路径,形式如下:
        request.getScheme():获取http协议
        request.getServerName():获取本地服务器名
        request.getServerPort():获取服务器端口号
        path:访问路径
    */

%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="<%=basepath%>">
    <title>房屋租赁网站</title>
    <link href="style/styles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>

<body>
<div id="wrap">
    <!--header-->
    <form action="HouseServlet.do" method="post">
    <div id="header">
        <div id="top">
            <h1><a href="#this">房屋租赁网站</a></h1>
            <input type="text" name="search" value="${searchLast}" id="input_1" />
            <input type="hidden" value="${sessionScope['User']['account']}" id="name">
            <select name="type" id="input_3">
                <c:if test="${type eq '小区名称'}" var="s1">
                    <option value="小区名称" selected="selected">小区名称</option>
                </c:if>
                <c:if test="${!s1}">
                    <option value="小区名称">小区名称</option>
                </c:if>
                <c:if test="${type eq '小区地址'}" var="s2">
                    <option value="小区地址" selected="selected">小区地址</option>
                </c:if>
                <c:if test="${!s2}">
                    <option value="小区地址">小区地址</option>
                </c:if>
                <c:if test="${type eq '租金'}" var="s3">
                    <option value="租金" selected="selected">租金</option>
                </c:if>
                <c:if test="${!s3}">
                    <option value="租金">租金</option>
                </c:if>
                <c:if test="${type eq '面积'}" var="s4">
                    <option value="面积" selected="selected">面积</option>
                </c:if>
                <c:if test="${!s4}">
                    <option value="面积">面积</option>
                </c:if>
                <c:if test="${type eq '户型'}" var="s5">
                    <option value="户型" selected="selected">户型</option>
                </c:if>
                <c:if test="${!s5}">
                    <option value="户型">户型</option>
                </c:if>
                <c:if test="${type eq '房东姓名'}" var="s6">
                    <option value="房东姓名" selected="selected">房东姓名</option>
                </c:if>
                <c:if test="${!s6}">
                    <option value="房东姓名">房东姓名</option>
                </c:if>
                <c:if test="${type eq '房东电话'}" var="s7">
                    <option value="房东电话" selected="selected">房东电话</option>
                </c:if>
                <c:if test="${!s7}">
                    <option value="房东电话">房东电话</option>
                </c:if>
            </select>
            <input type="submit"  value="搜索" id="input_2" />
            <a href="#this"  class="ko"> <c:if test="${sessionScope['User']['account']==null}" var="login">

                <a href="login.jsp">登录</a><a href="sign.jsp">注册</a>
            </c:if>
            <c:if test="${!login}">
                <a href="iframemain.jsp">${sessionScope['User']['account']},你好</a> <a href="javascript:;" onclick="exit()">退出</a>
            </c:if>
        </div>
        <div id="nav_left"></div>
        <ul id="nav">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="HouseServlet.do" class="bg">未租房屋</a></li>
            <li><a href="iframemain.jsp" onclick="return check()">我的信息</a></li>
        </ul>
    <!--//header-->
    <!--contents-->
    <div id="contents">
        <div id="result" >
            <c:forEach items="${pager.datas}" var="house" varStatus="vs">
            <dl>
                <dt><a href="HouseOne.do?id=${house['id']}" onclick="return check()"><img src="upload/${house['houseImage'] }" style="width: 220px;height: 146px;"  alt="" /></a></dt>
                <dd><a href="HouseOne.do?id=${house['id']}" onclick="return check()">${house['houseName']}</a></dd>
                <dd>￥<span>${house['houseMoney']}</span></dd>
            </dl>
            </c:forEach>
        </div>

        <div id="page">
            <div id="ap">
                <c:if test="${pager.pageNow gt 1}">
                <a href="javascript:;" class="next" onclick="pageDO()">上一页</a>
                </c:if>
                <c:if test="${pager.pageNow lt pager.totalPages}">
                <a href="javascript:;" class="next" onclick="pagePl()">下一页</a>
                </c:if>
                <span>共${pager.totalPages}页 到第</span>
                <input type="text" name="pageNow" id="pageNow" value="${pager.pageNow}"  class="text"/>
                <span>页</span>
                <input type="submit" value="确定" name="" id="button"  class="button"/>
            </div>
        </div>

    </div>
    <!--//contents-->
    <!--footer-->
    <div id="footer">

        <div id="link">
            友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网 | 宜家家居 | 新浪家														                              具 | 网易家具  |  我的家  | 小资世界</div>
    </div>
    <address><a href="Background.do">后台系统</a></address>

    <!--//footer-->
</div>
    </form>
</body>
<script type="text/javascript">
    function pagePl() {
        var pageNow = $("#pageNow").val();
        $("#pageNow").val(parseInt(pageNow)+1);
        $("#button").click();

    }
    function pageDO() {
        var pageNow = $("#pageNow").val();
        $("#pageNow").val(pageNow-1);
        $("#button").click();

    }
    function check() {
        var name = $("#name").val();
        if(name==null||name==''){
            alert("请先登录");
            return false;
        }
        return true;
    }
</script>
<script type="text/javascript">
    function exit() {
        if(window.confirm("您确认要退出吗")){
            window.location.href="Login.do";
        }
    }
</script>
</html>

