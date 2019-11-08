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
    <script type="text/javascript" src="js/jquery.js"></script>
</head>

<body>
<div id="wrap">
    <!--header-->
    <div id="header">
        <div id="leader">

            <a href="#this"  class="ko"> <c:if test="${sessionScope['User']['account']==null}" var="login">

                <span>亲，欢迎来到花房家居！请<a href="login.jsp">登录</a>&nbsp;<a href="sign.jsp">注册</a></span>
            </c:if>
            <c:if test="${!login}">
                <span> <a href="iframemain.jsp">${sessionScope['User']['account']},你好</a></span>
            </c:if>
    <!--//header-->
    <!--contents-->
    <div id="contents">
        <ul id="nav_2">
            <li><a href="index.jsp" class="bg">首页</a></li>
            <li><a href="HouseServlet.do">未租房屋</a></li>
            <li><a href="iframemain.jsp">我的信息</a></li>
        </ul>
        <div id="baby">
            <span>${house['houseName']}</span>
            <div id="img_1"><img src="upload/${house['houseImage'] }" style="width: 220px;height: 146px;" alt="" /></div>
            <ul id="introduce">
                <li>价格：<a href="#this">￥${house['houseMoney']}/月</a></li>
                <li><input type="hidden" value="${house['houseCustom']}" id="houseCustom"></li>
                <li><input type="hidden" value="${house['houseLord']}" id="houseLord"></li>
                <li><input type="hidden" value="${sessionScope['User']['account']}" id="name"></li>
                <li>小区地址：${house['houseAddress']}</li>
                <li>面积：${house['houseArea']}</li>
                <li>户型：${house['houseType']}</li>
                <li>房东姓名：${house['houseLord']}</li>
                <li>房东电话：${house['houseTel']}</li>
                <li><a href="BargainAddServlet.do?houseCustom=${sessionScope['User']['account']}&id=${house['id']}&customTel=${sessionScope['User']['tel']}" onclick="return check()">我想租房 <a href="CollectAdd.do?houseId=${house['id']}&userName=${sessionScope['User']['account']}" onclick="collect()">收藏</a></li>
            </ul>

        </div>
        <div id="introduce_1">
        </div>
        <div id="detail">
            <ul id="main_2">
                <li>价格：<a href="#this">￥${house['houseMoney']}/月</a></li>
                <li>小区地址：${house['houseAddress']}</li>
                <li>面积：${house['houseArea']}</li>
                <li>户型：${house['houseType']}</li>
                <li>房东姓名：${house['houseLord']}</li>
                <li>房东电话：${house['houseTel']}</li>
                <li><img src="upload/${house['houseImage'] }" style="width: 440px;height: 292px;" alt="" /></li>
            </ul>
        </div>
    </div>
    <!--//contents-->
    <!--footer-->
    <div id="footer">
        <div id="tel">
            <dl>
                <dt>24小时客服热线</dt>
                <dd ><span>400 8834823</span></dd>
            </dl>
        </div>
        <div id="service">
            <ul id="ser_1">
                <li>
                    <a href="#this">新手指南</a>
                    <span><a href="#this">注册新用户</a></span>
                    <span><a href="#this">订购家具流程</a></span>
                    <span><a href="#this">体验馆购买指导</a></span>
                    <span><a href="#this">付款方式</a></span>
                    <span><a href="#this">常见问题解答</a></span>
                </li>
                <li>
                    <a href="#this">配送安装</a>
                    <span><a href="#this">收货指南</a></span>
                    <span><a href="#this">全国体验服务费</a></span>
                    <span><a href="#this">维修补件说明</a></span>

                </li>
                <li>
                    <a href="#this">售后服务</a>
                    <span><a href="#this">退换货说明</a></span>
                    <span><a href="#this">如何申请退款</a></span>
                    <span><a href="#this">物流配送</a></span>
                </li>
            </ul>
        </div>
        <div id="link">
            友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网 | 宜家家居 | 新浪家														                              具 | 网易家具  |  我的家  | 小资世界</div>
    </div>
    <address>©2010-2012 花房 版权所有 ICP备案证书号：京ICP备08008334号</address>

    <!--//footer-->
</div>
</body>
<script type="text/javascript">
    function check() {
        var houseCustom = $("#houseCustom").val();
        var name = $("#name").val();
        var houseLord = $("#houseLord").val();
        if(houseCustom!=''){
            alert("此房屋正在出租");
            return false;
        }
        if(houseLord==name){
            alert("你不能租自己的房子");
            return false;
        }
        alert("申请成功!");
        return true;
    }
    function collect() {
        alert("成功收藏");
    }
</script>
</html>
