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
<html>
<head>
    <base href="<%=basepath%>">
    <title>房屋租赁系统</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>

</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="javascript:;">首页</a></li>
    </ul>
</div>

<div class="mainindex">


    <div class="welinfo">
        <span><img src="images/sun.png" alt="天气" /></span>
        <b>${sessionScope['User']['account']},早上好，欢迎使用房屋租赁系统</b>(hanpang8983@foxmail.com)
    </div>



    <div class="xline"></div>

    <div class="pangsir"><b>欢迎光临</b>(<a href="http://pangsir8983.github.io" target="_blank">${sessionScope['User']['account']}</a>)</div>

    <ul class="umlist">
        <li><a href="javascript:;">如何发布文章</a></li>
        <li><a href="javascript:;">如何访问网站</a></li>
        <li><a href="javascript:;">如何管理广告</a></li>
        <li><a href="javascript:;">后台用户设置(权限)</a></li>
        <li><a href="javascript:;">系统设置</a></li>
    </ul>


</div>



</body>

</html>
