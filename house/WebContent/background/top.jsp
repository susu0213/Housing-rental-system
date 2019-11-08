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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
    <script type="text/javascript">
        function logout() {
            if(window.confirm('您确定要退出吗？')) {
                top.location = '../AdminLogin.do';
            }
        }
    </script>
</head>
<body>
<table cellpadding="0" width="100%" height="64" background="./Images/top_top_bg.gif">
    <tr valign="top">
        <td width="50%"><a href="javascript:void(0)"></a></td>
        <td width="30%" style="padding-top:13px;font:15px Arial,SimSun,sans-serif;color:#FFF">管理员：<b>${sessionScope['Admin']['account']}</b> 您好，感谢登陆使用！</td>
        <td style="padding-top:10px;" align="center"><a href="../index.jsp" target="_parent"><img style="border:none" src="./Images/index.gif" /></a></td>
        <td style="padding-top:10px;" align="center"><a href="javascript:;"><img style="border:none" src="./Images/out.gif" onclick="logout();" /></td>
    </tr>
</table>
</body>
</html>