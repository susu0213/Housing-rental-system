<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./Style/skin.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
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
                                <td valign="bottom"><h3 style="letter-spacing:1px;">已批准房屋信息</h3></td>
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
                                    <form action="" method="">
                                        <table width="100%"  class="cont tr_color">
                                            <tr>
                                                <th>小区名称</th>
                                                <th>小区地址</th>
                                                <th>租金</th>
                                                <th>面积</th>
                                                <th>户型</th>
                                                <th>房东姓名</th>
                                                <th>房东电话</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${pager.datas}" var="house" varStatus="vs">
                                            <tr align="center" class="d">
                                                <td>${house['houseName']}</td>
                                                <td>${house['houseAddress']}</td>
                                                <td>${house['houseMoney']}</td>
                                                <td>${house['houseArea']}</td>
                                                <td>${house['houseType']}</td>
                                                <td>${house['houseLord']}</td>
                                                <td>${house['houseTel']}</td>
                                                <td><c:if test="${house['houseCustom'] eq '' or house['houseCustom'] eq null }" var="rent"><c:if test="${house['status'] ne '1'}" var="st">待出租</c:if></c:if>
                                                    <c:if test="${!rent}"><c:if test="${house['status'] eq null or house['status'] eq ''}">待交易</c:if></c:if>
                                                    <c:if test="${house['status'] eq '1'}">已出租</c:if></td>
                                                <td><a href="../HouseOneServlet.do?id=${house['id']}">查看</a>
                                                    <c:if test="${house['status'] ne '1'}" var="st"><a href="../HouseDelete.do?id=${house['id']}&read=${read}" onclick="return DCheck()">删除</a></c:if></td>
                                            </tr>
                                            </c:forEach>
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
                <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="51%" class="left_txt">
                        <form action="../HouseAgreeServlet.do" method="post">
                            共${pager.totalCount}条记录，当前显示第&nbsp;${pager.pageNow}&nbsp;页
                            <c:if test="${pager.pageNow gt 1}">
                            <a href="javascript:;" onclick="pageDO()">上一页
                                </c:if></a>
                                <c:if test="${pager.pageNow lt pager.totalPages}">
                                <a href="javascript:;" onclick="pagePl()">下一页</a>
                                </c:if>
                                <input type="hidden" name="pageNow" id="pageNow" value="${pager.pageNow}"  class="text"/>
                                <input type="submit" value="确定" name="" id="button"  class="button" style="display:none"/>
                                </div>
                        </form>
                    </td>
                    <td>&nbsp;</td><td>&nbsp;</td>
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
<script type="text/javascript">
    function pagePl() {
        var pageNow = $("#pageNow").val();
        $("#pageNow").val(parseInt(pageNow)+1);
        $("#button").click();

    }
    function pageDO() {
        var pageNow = $("#pageNow").val();
        $("#pageNow").val(parseInt(pageNow)-1);
        $("#button").click();

    }
    function DCheck() {
        if (window.confirm("您确认删除该条数据吗?")) {
            return true;
        }
        return false;
    }
</script>
</html>
