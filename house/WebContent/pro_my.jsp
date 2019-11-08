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
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>

<body>
<div id="wrap">
    <!--header-->
    <div id="header">
        <div id="top">
            <h1><a href="#this">花房家具--创意抓住你的心</a></h1>
            <form action="HouseServlet.do" method="post">
            <input type="text" name="search" value="${searchLast}" id="input_1" />
                <select name="type">
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
                <a href="#this">${sessionScope['User']['account']},你好</a>
            </c:if>
        </div>
        <div id="nav_left"></div>
        <ul id="nav">
            <li><a href="#this">首页</a></li>
            <li><a href="HouseServlet.do">未租房屋</a></li>
            <li><a href="#this"  class="bg">我的房屋</a></li>
            <li><a href="#this">留言板</a></li>
            <li><a href="#this">装修图片</a></li>
        </ul>
    <!--//header-->
    <!--contents-->
    <div id="contents">
        <div id="result" >
            <c:forEach items="${pager.datas}" var="house" varStatus="vs">
            <dl>
                <dt><a href="HouseOne.do?id=${house['id']}" ><img src="upload/${house['houseImage'] }" alt="" /></a></dt>
                <dd><a href="HouseOne.do?id=${house['id']}" >${house['houseName']}</a></dd>
                <dd>￥<span>${house['houseMoney']}</span></dd>
            </dl>
            </c:forEach>
        </div>
    <form action="MyHouseServlet.do" method="post">
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
                <input type="hidden" value="${sessionScope['User']['account']}" name="houseLord">
                <input type="submit" value="确定" name="" id="button"  class="button"/>
            </div>
        </div>
    </form>
    </div>
    <!--//contents-->
    <!--footer-->
    <div id="footer">
        <div id="tel">
            <dl>
                <dt>24小时客服热线</dt>
                <dd ><span>400 8834823</span></dd>
                <dd>截止今日，花房在全国已有实体店123家</dd>
                <dd><img src="img/btn_3.gif" alt="btn" /></dd>
            </dl>
        </div>
        <div id="service">
            <ul id="ser_1">
                <li>
                    <a href="javascript:;">关于花房</a>
                    <span><a href="javascript:;">公司简介</a></span>
                    <span><a href="javascript:;">CEO致辞</a></span>
                    <span><a href="#this">体验馆</a></span>
                    <span><a href="#this">联系我们</a></span>
                    <span><a href="#this">诚聘精英</a></span>
                </li>
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
                <li>
                    <a href="#this">购物保障</a>
                    <span><a href="#this">正品保证</a></span>
                    <span><a href="#this">注册协议</a></span>
                    <span><a href="#this">隐私保护</a></span>
                    <span><a href="#this">免责声明</a></span>
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
</script>
</html>

