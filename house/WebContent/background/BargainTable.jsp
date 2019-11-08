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
                                <td valign="bottom"><h3 style="letter-spacing:1px;">合同信息</h3></td>
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
                                                <th>租客姓名</th>
                                                <th>租客电话</th>
                                                <th>房东姓名</th>
                                                <th>房东电话</th>
                                                <th>审核管理员姓名</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${pager.datas}" var="bargain" varStatus="vs">
                                            <tr align="center" class="d">
                                                <td>${bargain['customName']}</td>
                                                <td>${bargain['customTel']}</td>
                                                <td>${bargain['lordName']}</td>
                                                <td>${bargain['lordTel']}</td>
                                                <td>${bargain['adminName']}</td>
                                                <td>
                                                    <c:if test="${bargain['customName'] ne null and bargain['customName'] ne '' and bargain['lordName'] ne null and bargain['lordName'] ne '' }" var="s1">
                                                        交易成功
                                                    </c:if>
                                                    <c:if test="${bargain['customName'] ne null and bargain['customName'] ne ''}" var="s2">
                                                        <c:if test="${!s1}">
                                                            待交易
                                                        </c:if>
                                                    </c:if>
                                                </td>
                                                <td><a href="../HouseOneServlet.do?id=${bargain['houseId']}">房屋信息</a></td>
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
                        <form action="../BBargainServlet.do" method="post">
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
</script>
</html>
