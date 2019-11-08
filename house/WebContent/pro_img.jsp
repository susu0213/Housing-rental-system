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
    <script src="js/jquery.min.js" type="text/javascript"></script>

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
                <a href="iframemain.jsp">${sessionScope['User']['account']},你好</a>
            </c:if>
        </div>
        <div id="nav_left"></div>
        <ul id="nav">
            <li><a href="index.jsp" >首页</a></li>
            <li><a href="HouseServlet.do">未租房屋</a></li>
            <li><a href="#this">我的房屋</a></li>
            <li><a href="#this">留言板</a></li>
            <li><a href="pro_house.jsp">装修图片</a></li>
        </ul>
        <%--<ul id="suv">--%>
            <%--<li><a href="#this">新品</a></li>--%>
            <%--<li><a href="#this">特价</a></li>--%>
            <%--<li><a href="#this">秒杀</a></li>--%>
            <%--<li><a href="#this">秀家</a></li>--%>
            <%--<li><a href="#this">资讯</a></li>--%>
            <%--<li  class="last"><a href="#this">乐淘</a></li>--%>
        <%--</ul>--%>
        <span id="pos"><img src="img/icon_12.gif" alt="icon" /><a href="#this">首页</a>><a href="#this">宜室宜家</a></span>

    </div>
    <!--//header-->
    <!--contents-->
    <div id="contents">
        <ul id="lxf-box">
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/IMG_2395.JPG" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/收纳内裤.jpg" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/高柜便利设计.jpg" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/小房子3.jpg" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/小房子2.jpg" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/小房子.jpg" alt="" /></a>
                <h3>图片标题</h3>
            </li><li><a href="#this"><img src="img/beijing.jpg" alt="" /></a>
            <h3>图片标题</h3>
        </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>
            <li><a href="#this"><img src="img/ad_3.gif" alt="" /></a>
                <h3>图片标题</h3>
            </li>

        </ul>

        <script >
            /*
             原理：1.把所有的li的高度值放到数组里面
             2.第一行的top都为0
             3.计算高度值最小的值是哪个li
             4.把接下来的li放到那个li的下面

             */
            var margin = 10;//这里设置间距
            var li=$("#lxf-box li");//这里是区块名称
            var	li_W = li[0].offsetWidth+margin;//取区块的实际宽度（包含间距，这里使用源生的offsetWidth函数，不适用jQuery的width()函数是因为它不能取得实际宽度，例如元素内有pandding就不行了）
            function liuxiaofan(){//定义成函数便于调用
                var h=[];//记录区块高度的数组
                var n = 1003/li_W|0;//窗口的宽度除以区块宽度就是一行能放几个区块

                for(var i = 0;i < li.length;i++) {//有多少个li就循环多少次
                    li_H = li[i].offsetHeight;//获取每个li的高度
                    if(i < n) {//n是一行最多的li，所以小于n就是第一行了
                        h[i]=li_H;//把每个li放到数组里面
                        li.eq(i).css("top",0);//第一行的Li的top值为0
                        li.eq(i).css("left",i * li_W);//第i个li的左坐标就是i*li的宽度
                    }
                    else{
                        min_H =Math.min.apply(null,h) ;//取得数组中的最小值，区块中高度值最小的那个
                        minKey = getarraykey(h, min_H);//最小的值对应的指针
                        h[minKey] += li_H+margin ;//加上新高度后更新高度值
                        li.eq(i).css("top",min_H+margin);//先得到高度最小的Li，然后把接下来的li放到它的下面
                        li.eq(i).css("left",minKey * li_W);	//第i个li的左坐标就是i*li的宽度
                    }
                    $("h3").eq(i).text("欧洲风格，独享乐居");//把区块的序号和它的高度值写入对应的区块H3标题里面

                }
            }
            /* 使用for in运算返回数组中某一值的对应项数(比如算出最小的高度值是数组里面的第几个) */
            function getarraykey(s, v) {for(k in s) {if(s[k] == v) {return k;}}}
            /*这里一定要用onload，因为图片不加载完就不知道高度值*/
            window.onload = function() {liuxiaofan();};
            /*浏览器窗口改变时也运行函数*/
            window.onresize = function() {liuxiaofan();};


        </script>
    </div>

    <!--//contents-->

</div>

</body>
</html>
