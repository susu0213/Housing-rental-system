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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="./Js/prototype.lite.js" type="text/javascript"></script>
    <script src="./Js/moo.fx.js" type="text/javascript"></script>
    <script src="./Js/moo.fx.pack.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
    <script type="text/javascript">
        window.onload = function () {
            var contents = document.getElementsByClassName('content');
            var toggles = document.getElementsByClassName('type');

            var myAccordion = new fx.Accordion(
                toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                dl_a.onfocus=function(){
                    this.blur();
                }
            }
        }
    </script>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
    <tr>
        <td width="182" valign="top">
            <div id="container">
                <h1 class="type"><a href="javascript:void(0)">房屋信息</a></h1>
                <div class="content">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><img src="./Images/menu_top_line.gif" width="182" height="5" /></td>
                        </tr>
                    </table>
                    <ul class="RM">
                        <li><a href="../HouseAgreeServlet.do?read=1" target="main">已审批</a></li>
                        <li><a href="../BHouseServlet.do?read=2" target="main">未审批</a></li>
                    </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">合同信息</a></h1>
                <div class="content">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><img src="./Images/menu_top_line.gif" width="182" height="5" /></td>
                        </tr>
                    </table>
                    <ul class="RM">
                        <li><a href="../BBargainServlet.do" target="main">合同信息</a></li>
                    </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">留言板</a></h1>
                <div class="content">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><img src="./Images/menu_top_line.gif" width="182" height="5" /></td>
                        </tr>
                    </table>
                    <ul class="RM">
                        <li><a href="../BMessageServlet.do" target="main">留言信息</a></li>
                    </ul>
                </div>
                <!-- *********** -->
                <h1 class="type"><a href="javascript:void(0)">账户信息</a></h1>
                <div class="content">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><img src="./Images/menu_top_line.gif" width="182" height="5" /></td>
                        </tr>
                    </table>
                    <ul class="RM">
                        <li><a href="AdminInformation.jsp" target="main">个人信息</a></li>
                        <li><a href="../UserServlet.do" target="main">用户管理</a></li>
                    </ul>
                </div>
                <!-- *********** -->
            </div>
        </td>
    </tr>
</table>
</body>
</html>

