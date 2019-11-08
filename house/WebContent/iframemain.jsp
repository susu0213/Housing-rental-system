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

    <!-- 基础定义的样式  -->

    <!-- 后台框架页面样式 -->
    <link rel="stylesheet" href="css2/admin.css" type="text/css"/>
    <!-- 引入字体图表 -->
    <link href="css/Font-Awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Jquery支持 -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <!-- 后台框架控制 -->
    <script type="text/javascript" src="js/admin.js"></script>

</head>

<body>
<div class="backAdmin">
    <div class="top">
        <!-- logo  -->
        <div class="topleft">
            <div class="title"><h2 style="margin-left: 30px;font-size: 30px"><font color="white">房屋租赁系统个人信息</font></h2></div>
        </div>



        <div class="topright">
            <ul>
                <li><a href="javascript:;" onclick="exit()">安全退出</a></li>
            </ul>

            <div class="user">
                <img src="images/user_photo.jpg" alt="用户头像"/>
                <span><font color="white">${sessionScope['User']['account']}</font>,你好</span>
            </div>

        </div>
    </div>

    <div class="left">
        <a href="index.jsp">
            <div class="lefttop">
                <i class="icon-cloud icon-large pull-left icon-border"></i>
                <span>回到主页</span>
            </div>
        </a>
        <dl class="leftmenu">



            <dd>
                <div class="title">
                    <i class="icon-user-md icon-large pull-left icon-border"></i>
                    <span>个人信息</span>
                </div>
                <ul class="menuson">
                    <li><i class="icon-list"></i><a href="UserInf.do?id=${sessionScope['User']['id']}" target="rightFrame">个人资料</a></li>
                    <li><i class="icon-adn"></i><a href="MyHouseServlet.do?houseLord=${sessionScope['User']['account']}" target="rightFrame">我想出租</a></li>
                    <li><i class="icon-apple"></i><a href="BargainServlet.do?customName=${sessionScope['User']['account']}" target="rightFrame">求租合同</a></li>
                    <li><i class="icon-apple"></i><a href="BargainRentServlet.do?lordName=${sessionScope['User']['account']}" target="rightFrame">出租合同</a></li>
                    <li><i class="icon-camera-retro"></i><a href="CollectServlet.do?userName=${sessionScope['User']['account']}" target="rightFrame">我的收藏</a></li>
                </ul>
            </dd>
            <dd>
                <div class="title">
                    <i class="icon-user-md icon-large pull-left icon-border"></i>
                    <span>留言区</span>
                </div>
                <ul class="menuson">
                    <li><i class="icon-list"></i><a href="MessageServlet.do" target="rightFrame">留言板</a></li>
                </ul>
            </dd>
            <dd>
                <div class="title">
                    <i class="icon-user-md icon-large pull-left icon-border"></i>
                    <span>失败信息</span>
                </div>
                <ul class="menuson">
                    <li><i class="icon-list"></i><a href="ReasonHouse.do?name=${sessionScope['User']['account']}" target="rightFrame">审核失败</a></li>
                    <li><i class="icon-list"></i><a href="ReasonBargain.do?name=${sessionScope['User']['account']}" target="rightFrame">交易失败</a></li>
                </ul>
            </dd>



        </dl>


    </div>
    <div class="right">
        <div class="inner">
            <!-- 设置iframe -->
            <iframe id="rightFrame" name="rightFrame" class="mainIframe" scrolling="no" frameborder="0" src="Welcome.jsp"
                    onload="initIframe()"></iframe>
        </div>
    </div>
    <div class="bottom">
        <span>房屋租赁系统</span>
        <i> 版权所有 @ 房屋租赁系统 </i>
    </div>
</div>

</body>
<script type="text/javascript">
    function exit() {
        if(window.confirm("您确认要退出吗")){
            window.location.href="Login.do";
        }
    }
</script>
</html>