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
    <title>房屋租赁系统</title>
    <link href="style/styles.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="style/lrtk1.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
</head>

<body>
<div id="wrap">
    <!--header-->
    <div id="header">
        <div id="top">
            <h1><a href="IndexServlet.do">房屋租赁网站</a></h1>
            <form action="HouseServlet.do" method="post">
                <input type="hidden" value="${sessionScope['User']['account']}" id="name">
                <input type="text" name="search" value="${searchLast}"  id="input_1" />
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
                <input type="hidden" name="pageNow" value="1">
            </form>
            <a href="#this"  class="ko"> <c:if test="${sessionScope['User']['account']==null}" var="login">

                <a href="login.jsp">登录</a><a href="sign.jsp">注册</a>
        </c:if>
            <c:if test="${!login}">
                <a href="iframemain.jsp">${sessionScope['User']['account']},你好</a> <a href="javascript:;" onclick="exit()">退出</a>
            </c:if>
        </div>
        <div id="meun11">
            <div id="nav_left"></div>
            <ul id="nav">
                <li><a href="index.jsp" class="bg">首页</a></li>
                <li><a href="HouseServlet.do">未租房屋</a></li>
                <li><a href="iframemain.jsp" onclick="return check();">我的信息</a></li>
            </ul>
        </div>
    <div id="contents">
        <div id="sale">
            <h2 class="h2_2">未租房屋</h2>
            <c:forEach items="${pagerHouse.datas}" var="house" varStatus="vs" begin="0" end="8">
            <dl>
                <dt><a href="javascript:;"><img src="upload/${house['houseImage'] }" alt="${house['houseImage'] }" width="152px" height="115px" /></a></dt>
                <dd><a href="javascript:;">${house['houseName']}</a></dd>
                <dd><a href="javascript:;">租金：<span>${house['houseMoney']}/月</span></a></dd>
            </dl>
            </c:forEach>
        </div>
        <div id="rank" class="h2_bg1">
            <h2><br/><br/></h2>
            <ul>
                <c:forEach items="${pagerMessage.datas}" var="message" varStatus="vs" begin="0" end="10">
                <li><a href="javascript:;">${message['userMessage']}</a></li>
                </c:forEach>
            </ul>
        </div>
    <div id="tbox">
        <a id="gotop" href="javascript:void(0)"></a>
        <a id="jianyi" target="_blank" href=""></a>
    </div>
    <!--//contents-->
    <!--footer-->
    <div id="footer">
        <div id="link">友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网 | 宜家家居 | 新浪家														                              具 | 网易家具  |  我的家  | 小资世界</div>
    </div>
    <address><a href="Background.do">后台系统</a></address>
    <!--//footer-->

</div>
<script type="text/javascript">
    swfobject.registerObject("FlashID");

    function check() {
        var name = $("#name").val();
        if(name==null||name==''){
            alert("请先登录");
            return false;
        }
        return true;
    }
</script>
</body>
<script type="text/javascript">
    function exit() {
        if(window.confirm("您确认要退出吗")){
            window.location.href="Login.do";
        }
    }
</script>
</html>
