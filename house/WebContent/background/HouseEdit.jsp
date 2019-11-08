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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <base href="background/">
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- 头部开始 -->
    <tr>
        <td width="17" valign="top" background="Images/mail_left_bg.gif">
            <img src="Images/left_top_right.gif" width="17" height="29" />
        </td>
        <td valign="top" background="Images/content_bg.gif">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="Images/content_bg.gif">
                <tr><td height="31"><div class="title">添加栏目</div></td></tr>
            </table>
        </td>
        <td width="16" valign="top" background="Images/mail_right_bg.gif"><img src="Images/nav_right_bg.gif" width="16" height="29" /></td>
    </tr>
    <!-- 中间部分开始 -->
    <tr>
        <!--第一行左边框-->
        <td valign="middle" background="Images/mail_left_bg.gif">&nbsp;</td>
        <!--第一行中间内容-->
        <td valign="top" bgcolor="#F7F8F9">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <!-- 空白行-->
                <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                <tr>
                    <td colspan="4">
                        <table>
                            <tr>
                                <td width="100" align="center"><img src="Images/mime.gif" /></td>
                                <td valign="bottom"><h3 style="letter-spacing:1px;">房屋信息修改</h3></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- 一条线 -->
                <tr>
                    <td height="40" colspan="4">
                        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                            <tr><td></td></tr>
                        </table>
                    </td>
                </tr>
                <!-- 添加栏目开始 -->
                <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="96%">
                        <table width="100%">
                            <tr>
                                <td colspan="2">
                                    <form action="../BHouseUpdate.do" method="post">
                                        <input type="hidden" name="id" value="${house['id']}"/>
                                        <table width="100%" class="cont">
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>小区名称：</td>
                                                <td width="20%"><input class="text" type="text" name="houseName" value="${house['houseName']}" /></td>
                                                <td>设置小区名称</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>小区地址：</td>
                                                <td width="20%"><input class="text" type="text" name="houseAddress" value="${house['houseAddress']}" /></td>
                                                <td>设置小区地址</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>租金：</td>
                                                <td width="20%"><input class="text" type="text" name="houseMoney" value="${house['houseMoney']}" /></td>
                                                <td>设置租金</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>面积：</td>
                                                <td width="20%"><input class="text" type="text" name="houseArea" value="${house['houseArea']}" /></td>
                                                <td>设置面积</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>户型：</td>
                                                <td width="20%"><input class="text" type="text" name="houseType" value="${house['houseType']}" /></td>
                                                <td>设置户型</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>房东姓名：</td>
                                                <td width="20%"><input class="text" type="text" name="houseLord" value="${house['houseLord']}" /></td>
                                                <td>设置房东姓名</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="2%">&nbsp;</td>
                                                <td>房东电话：</td>
                                                <td width="20%"><input class="text" type="text" name="houseTel" value="${house['houseTel']}" /><input type="hidden" name="read" value="${read}"/></td>
                                                <td>设置房东电话</td>
                                                <td width="2%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">&nbsp;</td>
                </tr>
                <!-- 添加栏目结束 -->
                <tr>
                    <td height="40" colspan="4">
                        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                            <tr><td></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td background="Images/mail_right_bg.gif">&nbsp;</td>
    </tr>
    <!-- 底部部分 -->
    <tr>
        <td valign="bottom" background="Images/mail_left_bg.gif">
            <img src="Images/buttom_left.gif" width="17" height="17" />
        </td>
        <td background="Images/buttom_bgs.gif">
            <img src="Images/buttom_bgs.gif" width="17" height="17">
        </td>
        <td valign="bottom" background="Images/mail_right_bg.gif">
            <img src="Images/buttom_right.gif" width="16" height="17" />
        </td>
    </tr>
</table>
</body>
</html>
