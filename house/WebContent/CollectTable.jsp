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
    <title>房屋租赁系统</title> <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="commons/hp_layer_helper-v0.1.js"></script>
    <script>
        $(function () {
            //绑定添加事件
            $("#add").click(function () {
                frameset_layer().open("模拟添加功.html");
            })

            $("#update").click(function () {
                top.layer.open({
                    type: 2,
                    area: ['700px', '530px'],
                    fix: false, //不固定
                    maxmin: true,
                    content: 'update.html'
                })
            });
        });


    </script>


</head>
<body>


<div class="rightinfo">
    <div class="tools">
    </div>


    <table class="tablelist">
        <thead>
        <tr>
            <th>序号</th>
            <th>小区名称<i class="sort"><img src="images/px.gif"/></i></th>
            <th>小区地址</th>
            <th>租金</th>
            <th>面积</th>
            <th>户型</th>
            <th>房东姓名</th>
            <th>房东电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${house}" var="house" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${house['houseName']}</td>
            <td>${house['houseAddress']}</td>
            <td>${house['houseMoney']}</td>
            <td>${house['houseArea']}</td>
            <td>${house['houseType']}</td>
            <td>${house['houseLord']}</td>
            <td>${house['houseTel']}</td>
            <td><a href="HouseOne.do?id=${house['id']}" target="_blank" class="tablelink">查看</a> <a href="javascript:;" onclick="DCheck(${house['id']})" class="tablelink"> 取消收藏</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <form action="CollectServlet.do" method="post">
    <div class="pagin">
        <div class="message">共<i class="blue">${pager.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${pager.pageNow}&nbsp;</i>页</div>
        <ul class="paginList">
            <c:if test="${pager.pageNow gt 1}">
            <li class="paginItem"><a href="javascript:;" onclick="pageDO()"><span class="pagepre"></span></a></li>
            </c:if>
            <c:if test="${pager.pageNow lt pager.totalPages}">
            <li class="paginItem"><a href="javascript:;" onclick="pagePl()"><span class="pagenxt"></span></a></li>
            </c:if>
            <input type="hidden" name="pageNow" id="pageNow" value="${pager.pageNow}"  class="text"/>
            <input type="hidden" value="${sessionScope['User']['account']}" name="houseLord">
            <input type="submit" value="确定" name="" id="button"  class="button" style="display:none"/>
        </ul>
    </div>
    </form>

</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
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
    function DCheck(id) {
        if(window.confirm("您确认要取消收藏吗?")){
            window.location.href="CollectDelete.do?id="+id;
        }
    }
</script>
</body>

</html>