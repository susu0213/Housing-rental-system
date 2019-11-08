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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <base href="background/">
    <title>瑞曼科技 - 网站后台管理中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="瑞曼科技专业的网站后台管理系统" />
    <meta name="keywords" content="瑞曼,网站管理系统,企业网站" />
    <meta name="Author" content="RainMan" />
    <meta name="CopyRight" content="瑞曼科技" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
</head>
<body>
<table width="100%">
    <!-- 顶部部分 -->
    <tr height="41"><td colspan="2" background="./Images/login_top_bg.gif">&nbsp;</td></tr>
    <!-- 主体部分 -->
    <tr style="background:url(./Images/login_bg.jpg) repeat-x;" height="532">
        <!-- 主体左部分 -->
        <td id="left_cont">
            <table width="100%" height="100%">
                <tr height="155"><td colspan="2">&nbsp;</td></tr>
                <tr>
                    <td width="20%" rowspan="2">&nbsp;</td>
                    <td width="60%">
                        <table width="100%">
                            <tr height="70"><td align="right"></td></tr>
                            <tr height="274">
                                <td valign="top" align="right">
                                    <ul>
                                        <li>欢迎光临房屋租赁系统后台</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    <td width="15%" rowspan="2">&nbsp;</td>
                    </td>
                </tr>
                <tr><td colspan="2">&nbsp;</td></tr>
            </table>
        </td>
        <!-- 主体右部分 -->
        <td id="right_cont">
            <table height="100%">
                <tr height="30%"><td colspan="3">&nbsp;</td></tr>
                <tr>
                    <td width="30%" rowspan="5">&nbsp;</td>
                    <td valign="top" id="form">
                        <form action="../AdminLogin.do" method="post" onsubmit="return check()">
                            <table valign="top" width="50%">
                                <tr><td colspan="2"><h4 style="letter-spacing:1px;font-size:16px;">房屋租赁网站管理后台</h4></td></tr>
                                <tr><td>管理员：</td><td><input type="text" name="username" value="" id="username" /></td></tr>
                                <tr><td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td><td><input type="password" name="password" value="" id="password" /></td></tr>
                                <tr class="bt" align="center"><td>&nbsp;<input type="submit" value="登陆" /></td><td>&nbsp;<input type="reset" value="重填" /></td></tr>
                                <tr><font color="red">${message}</font></tr>
                            </table>
                        </form>
                    </td>
                    <td rowspan="5">&nbsp;</td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
            </table>
        </td>
    </tr>
    <!-- 底部部分 -->
    <tr id="login_bot"><td colspan="2"><p>Copyright © 2017 房屋租赁网站管理后台 &nbsp;<a href="../index.jsp"><font color="white">前台页面</font></a> </p></td></tr>
</table>
</body>
<script type="text/javascript">
    function check() {
        var username = $("#username").val();
        var password = $("#password").val();
        if(username==""){
            alert("请输入用户名");
            $("#username").focus();
            return false;
        }
        if(password==""){
            alert("请输入密码");
            $("#password").focus();
            return false;
        }
        return true;
    }

</script>
</html>