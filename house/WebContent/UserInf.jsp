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
                <li><a href="#tab1" class="selected">个人信息</a></li>
            </ul>
        </div>

        <div id="tab1" class="tabson">

            <div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>
            <form action="UserInformation.do" method="post" onsubmit="return check()">
                <ul class="forminfo">
                    <li><input type="hidden" value="${User.id}" name="id"></li>
                    <li><label>用户名<b>*</b></label><input name="account" id="account" type="text" value="${User.account}" class="dfinput" placeholder="请填写用户名"  style="width:518px;"/></li>
                    <li><label>密码<b>*</b></label><input name="password" id="password" type="text" value="${User.password}" class="dfinput" placeholder="请填写密码"  style="width:518px;"/></li>
                    <li><label>地址</label><input name="address" type="text" class="dfinput" value="${User.address}" placeholder="请填写地址"  style="width:518px;"/></li>
                    <li><label>电话</label><input name="tel" type="text" class="dfinput" value="${User.tel}" placeholder="请填写电话"  style="width:518px;"/></li>
                    <li><label>邮箱</label><input name="email" type="text" class="dfinput" value="${User.email}" placeholder="请填写邮箱"  style="width:518px;"/></li>
                    <li><div class="reindex"><input type="submit" value="修改信息"></div></li>
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
                var account = $("#account").val();
                var password = $("#password").val();
                if(account==''){
                    alert("请输入用户名");
                    return false;
                }
                if(password==''){
                    alert("请输入密码");
                    return false;
                }
            }
        </script>





    </div>


</body>

</html>
