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
    <link href="css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="js/select-ui.min.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>

    <script type="text/javascript">
        KE.show({
            id : 'content7',
            cssPath : './index.css'
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 345
            });
            $(".select2").uedSelect({
                width : 167
            });
            $(".select3").uedSelect({
                width : 100
            });
        });
    </script>
</head>

<body>


<div class="formbody">


    <div id="usual1" class="usual">

        <div class="itab">
            <ul>
                <li><a href="#tab1" class="selected">房屋出租</a></li>
            </ul>
        </div>

        <div id="tab1" class="tabson">

            <div class="formtext">Hi，<b>${sessionScope['User']['account']}</b>，欢迎您试用信息发布功能！</div>
            <form action="HouseUpdate.do" method="post" onsubmit="return check()">
                <ul class="forminfo">
                    <li><input type="hidden" name="id" value="${house['id']}"></li>
                    <li><label>小区名称<b>*</b></label><input name="houseName" id="houseName" type="text" class="dfinput" value="${house['houseName']}" placeholder="请填写小区名称"  style="width:518px;"/></li>
                    <li><label>小区地址<b>*</b></label><input name="houseAddress" id="houseAddress" type="text" class="dfinput" value="${house['houseAddress']}" placeholder="请填写小区地址"  style="width:518px;"/></li>
                    <li><label>租金<b>*</b></label><input name="houseMoney" id="houseMoney" type="text" class="dfinput" value="${house['houseMoney']}" placeholder="请填写租金"  style="width:518px;"/></li>
                    <li><label>面积</label><input name="houseArea" type="text" class="dfinput" placeholder="请填写面积" value="${house['houseArea']}"  style="width:518px;"/></li>
                    <li><label>户型</label><input name="houseType" type="text" class="dfinput" placeholder="请填写户型" value="${house['houseType']}"  style="width:518px;"/></li>
                    <li><input name="houseLord" type="hidden" class="dfinput" value="${sessionScope['User']['account']}" placeholder="请填写房东姓名"  style="width:518px;"/></li>
                    <li><label>房东电话</label><input name="houseTel" type="text" class="dfinput" placeholder="请填写房东电话" value="${house['houseTel']}"  style="width:518px;"/></li>
                    <li><div class="reindex"><input type="submit" value="发布"></div></li>
                </ul>
            </form>




    </div>

    <script type="text/javascript">
        $("#usual1 ul").idTabs();
    </script>

    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>

        <script type="text/javascript">
            function check(){
                var account = $("#houseName").val();
                var password = $("#password").val();
                var passwordCheck = $("#passwordCheck").val();
                if(account==''){
                    alert("请输入小区名称");
                    return false;
                }
                return true;
            }
        </script>





</div>


</body>

</html>