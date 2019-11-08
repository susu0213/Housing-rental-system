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
    <title>房屋租赁系统</title>
    <link href="style/styles.css" rel="stylesheet" type="text/css" />
    <link href="style/xixi.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="style/lrtk1.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lrtk.js"></script>
</head>

<body>
<div id="wrap">
    <!--header-->
    <div id="header">
        <div id="top">
            <h1><a href="#this">花房家具--创意抓住你的心</a></h1>
            <form action="HouseServlet.do" method="post">
                <input type="text" name="search" value="${searchLast}" id="input_1" />
                <select name="type">
                    <c:if test="${type eq '小区名称'}" var="s1">
                        <option value="小区名称" selected="selected">小区名称</option>
                    </c:if>
                    <c:if test="${!s1}">
                        <option value="小区名称">小区名称</option>
                    </c:if>
                    <c:if test="${type eq '小区地址'}" var="s2">
                        <option value="小区地址" selected="selected">小区地址</option>
                    </c:if>
                    <c:if test="${!s2}">
                        <option value="小区地址">小区地址</option>
                    </c:if>
                    <c:if test="${type eq '租金'}" var="s3">
                        <option value="租金" selected="selected">租金</option>
                    </c:if>
                    <c:if test="${!s3}">
                        <option value="租金">租金</option>
                    </c:if>
                    <c:if test="${type eq '面积'}" var="s4">
                        <option value="面积" selected="selected">面积</option>
                    </c:if>
                    <c:if test="${!s4}">
                        <option value="面积">面积</option>
                    </c:if>
                    <c:if test="${type eq '户型'}" var="s5">
                        <option value="户型" selected="selected">户型</option>
                    </c:if>
                    <c:if test="${!s5}">
                        <option value="户型">户型</option>
                    </c:if>
                    <c:if test="${type eq '房东姓名'}" var="s6">
                        <option value="房东姓名" selected="selected">房东姓名</option>
                    </c:if>
                    <c:if test="${!s6}">
                        <option value="房东姓名">房东姓名</option>
                    </c:if>
                    <c:if test="${type eq '房东电话'}" var="s7">
                        <option value="房东电话" selected="selected">房东电话</option>
                    </c:if>
                    <c:if test="${!s7}">
                        <option value="房东电话">房东电话</option>
                    </c:if>
                </select>
                <input type="submit"  value="搜索" id="input_2" />
                <input type="hidden" name="pageNow" value="1">
            </form>
            <a href="#this"  class="ko"> <c:if test="${sessionScope['User']['account']==null}" var="login">

                <a href="login.jsp">登录</a><a href="sign.jsp">注册</a>
            </c:if>'
            <c:if test="${!login}">
                <a href="iframemain.jsp">${sessionScope['User']['account']},你好</a>
            </c:if>
        </div>
        <div id="nav_left"></div>
        <ul id="nav">
            <li><a href="index.jsp" >首页</a></li>
            <li><a href="HouseServlet.do">未租房屋</a></li>
            <li><a href="#this">我的房屋</a></li>
            <li><a href="#this">留言板</a></li>
            <li><a href="pro_house.jsp">装修图片</a></li>
        </ul>
        <%--<ul id="suv">--%>
            <%--<li><a href="#this">新品</a></li>--%>
            <%--<li><a href="#this">特价</a></li>--%>
            <%--<li><a href="#this">秒杀</a></li>--%>
            <%--<li><a href="#this">秀家</a></li>--%>
            <%--<li><a href="#this">资讯</a></li>--%>
            <%--<li  class="last"><a href="#this">乐淘</a></li>--%>
        <%--</ul>--%>
        <span id="pos"><img src="img/icon_12.gif" alt="icon" /><a href="#this">首页</a>><a href="#this">装修图片</a></span>
        <div id="main">
            <div id="class">
                <dl class="bed">
                    <dt>床上用品</dt>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                </dl>
                <dl class="bed ">
                    <dt class="li2">布艺织物</dt>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                </dl>
                <dl class="bed">
                    <dt class="li3">工艺饰品</dt>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                </dl>
                <dl class="bed">
                    <dt class="li4">收纳洗护</dt>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                </dl>
                <dl class="bed">
                    <dt class="li3">厨房餐饮</dt>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                    <dd><a href="#this">被芯</a></dd>
                </dl>
            </div>
            <div class="focus">
                <ul class="rslides f426x240">
                    <li><a href="#this"><img src="img/04.jpg" alt="家居图片" /></a></li>
                    <li><a href="#this" ><img src="img/06.jpg" alt="家居图片" /></a></li>
                    <li><a href="#this"><img src="img/07.jpg" alt="家居图片" /></a></li>
                    <li><a href="#this"><img src="img/05.jpg" alt="家居图片" /></a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--//header-->
    <!--contents-->
    <div id="contents">
        <div id="new_img">
            <h2 class="h2_2 tit_7">最新图片</h2>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_13.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_12.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_14.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_13.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_14.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_13.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_12.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_13.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_12.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_14.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_12.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_13.gif" alt="img" /></a></dt>
                <dd><a href="pro_shop.html">现代家居的沉稳设计</a></dd>
            </dl>



        </div>
        <div id="top_house">
            <div id="top_1" class="h2_bg1">
                <h2 class="h2_1 tit_8">装修图片点击排<img src="img/more.gif" alt="more" class="more_1" />行榜</h2>
                <ul  id="cli">
                    <li>
                        <dl>
                            <dt><a href="pro_shop.html"><img src="img/img_15.gif" alt="img" /></a></dt>
                            <dd><a href="pro_shop.html">90-130平现代婚</a></dd>
                            <dd>点击：<span>23451</span></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="pro_shop.html"><img src="img/img_15.gif" alt="img" /></a></dt>
                            <dd><a href="pro_shop.html">90-130平现代婚</a></dd>
                            <dd>点击：<span>23451</span></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="pro_shop.html"><img src="img/img_15.gif" alt="img" /></a></dt>
                            <dd><a href="pro_shop.html">90-130平现代婚</a></dd>
                            <dd>点击：<span>23451</span></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="pro_shop.html"><img src="img/img_15.gif" alt="img" /></a></dt>
                            <dd><a href="pro_shop.html">90-130平现代婚</a></dd>
                            <dd>点击：<span>23451</span></dd>
                        </dl>
                    </li>

                </ul>
            </div>
            <div id="bottom" class="h2_bg1">
                <h2 class="h2_1 tit_9">装修巧技<a href="#this" class="more_1"><img src="img/more.gif" alt="more" /></a></h2>
                <ul>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a></li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a></li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a> </li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a> </li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a></li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a> </li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a> </li>
                    <li><a href="pro_shop.html">书房装修要注意什么问题?</a></li>
                </ul>
                <a href="#this"><img src="img/btn_4.gif" alt="" id="btn_4" /></a>
            </div>
        </div>
        <div id="create">
            <h2 class="h2_2 tit_4">创意集市</h2>
            <dl>
                <dt><a href="#this"><img src="img/img_6.gif" alt="沙发" /></a></dt>
                <dd><a href="#this">拼合沙发，让你的生活多姿多彩……</a></dd>
                <dd><a href="#this">【更多】</a></dd>
            </dl>
            <ul>
                <li><a href="#this">[ 创意家居妙趣横生 煮妇神器让你乐享不停！</a></li>
                <li><a href="#this">[ 创意家居妙趣横生 煮妇神器让你乐享不停！</a></li>
            </ul>
            <span>订阅创意杂志</span>
            <input type="text" name="email"  class="inp_txt" value="请输入您的邮箱地址"/>
            <input type="button"  value="订阅" class="inp_btn"/>
        </div>
        <div id="show">
            <h2 class="h2_2 tit_5">我秀我家</h2>
            <ul id="sty_1">
                <li><a href="pro_shop.html">现代简约</a></li>
                <li><a href="pro_shop.html">现代简约</a></li>
                <li><a href="pro_shop.html">现代简约</a></li>
                <li><a href="pro_shop.html">现代简约</a></li>
                <li><a href="pro_shop.html">现代简约</a></li>
            </ul>
            <ul id="sty">
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>
                <li><a href="pro_shop.html">中式风格精装修青岛80平小户型大方宽敞</a></li>

            </ul>
            <dl>
                <dt><a href="pro_shop.html"><img src="img/img_7.gif" alt="" /></a></dt>
                <dd><a href="pro_shop.html">传统家具客厅 来自中式的风格</a></dd>
            </dl>
        </div>
    </div>
    <div id="tbox">
        <a id="gotop" href="javascript:void(0)"></a>
        <a id="jianyi" target="_blank" href=""></a>
    </div>
    <!--//contetns-->
    <!--footer-->
    <div id="footer">
        <div id="tel">
            <dl>
                <dt>24小时客服热线</dt>
                <dd><span>400 8834823</span></dd>
                <dd>截止今日，花房在全国已有实体店123家</dd>
                <dd><img src="img/btn_3.gif" alt="btn" /></dd>
            </dl>
        </div>
        <div id="service">
            <ul id="ser_1">
                <li>
                    <a href="#this">关于花房</a>
                    <span><a href="#this">公司简介</a></span>
                    <span><a href="#this">CEO致辞</a></span>
                    <span><a href="#this">体验馆</a></span>
                    <span><a href="#this">联系我们</a></span>
                    <span><a href="#this">诚聘精英</a></span>
                </li>
                <li>
                    <a href="#this">新手指南</a>
                    <span><a href="#this">注册新用户</a></span>
                    <span><a href="#this">订购家具流程</a></span>
                    <span><a href="#this">体验馆购买指导</a></span>
                    <span><a href="#this">付款方式</a></span>
                    <span><a href="#this">常见问题解答</a></span>
                </li>
                <li>
                    <a href="#this">配送安装</a>
                    <span><a href="#this">收货指南</a></span>
                    <span><a href="#this">全国体验服务费</a></span>
                    <span><a href="#this">维修补件说明</a></span>

                </li>
                <li>
                    <a href="#this">售后服务</a>
                    <span><a href="#this">退换货说明</a></span>
                    <span><a href="#this">如何申请退款</a></span>
                    <span><a href="#this">物流配送</a></span>
                </li>
                <li>
                    <a href="#this">购物保障</a>
                    <span><a href="#this">正品保证</a></span>
                    <span><a href="#this">注册协议</a></span>
                    <span><a href="#this">隐私保护</a></span>
                    <span><a href="#this">免责声明</a></span>
                </li>
            </ul>
        </div>
        <div id="link">友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网 | 宜家家居 | 新浪家														                              具 | 网易家具  |  我的家  | 小资世界</div>

        <address>©2010-2012 花房 版权所有 ICP备案证书号：京ICP备08008334号</address>
    </div>

    <!--footer-->
</div>
</body>
</html>

