<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>商品加入购物车</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="filed/saved_resource">
    <link rel="stylesheet" type="text/css" href="filed/saved_resource(2)">
    <script type="text/javascript" src="filed/saved_resource(3)"></script>
    <script type="text/javascript" src="filed/saved_resource(1)"></script>
</head>
<body>
<div id="shortcut-2014">
    <div class="w">
        <ul class="fr">
            <li class="fore1 dorpdown" id="ttbar-login"><div class="dt cw-icon">
                <i class="icon-plus-nickname"></i>
                <i class="ci-right"><s>◇</s></i>
                <a class="nickname" target="_blank" href="https://home.jd.com/">王12200904</a>
            </div>
                <div class="dd dorpdown-layer">
                    <div class="dd-spacer"></div>
                    <div class="userinfo">
                        <div class="u-pic"><a target="_blank" href="https://home.jd.com/">
                            <img src="./购物车_files/no-img_mid_.jpg" width="60" height="60"></a>
                        </div>
                        <div class="u-plus">
                            <a href="https://passport.jd.com/uc/login?ltype=logout" class="link-logout">退出</a>
                            <a href="https://plus.jd.com/index" target="_blank" class="icon-plus-dropdown"></a>
                        </div>
            <li class="fore2">
                <div class="dt">
                    <a target="_blank" href="https://order.jd.com/center/list.action">我的订单</a>
                </div>
            </li>
            <li class="fore3 dorpdown" id="ttbar-myjd">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>
                    <a target="_blank" href="https://home.jd.com/">我的京东</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="fore4">
                <div class="dt">
                    <a target="_blank" href="https://vip.jd.com/">京东会员</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="fore5">
                <div class="dt">
                    <a target="_blank" href="https://b.jd.com/">企业采购</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="fore6 dorpdown" id="ttbar-apps" aid="2_955_6342">
                <div class="dt cw-icon">
                    <i class="ci-left"></i>
                    <i class="ci-right"><s>◇</s></i>
                    <a target="_blank" href="https://app.jd.com/">手机京东</a>
                </div>
            </li>
            <li class="fore7 dorpdown" id="ttbar-atte" aid="2_955_6494">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>关注京东
                </div>
            </li>
            <li class="fore8 dorpdown" id="ttbar-serv">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>客户服务
                </div>
            </li>
            <li class="fore9 dorpdown" id="ttbar-navs">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>网站导航
                </div>
            </li>
        </ul>
    </div>
</div>
<div id="o-header-2013">
    <div id="header-2013" style="display:none;">
    </div></div>
<div class="w">
    <div id="logo-2014">
        <a href="https://www.jd.com/" class="logo">京东</a>
    </div>
    <div id="search-2014">
        <div class="form">
            <input type="text" onkeydown="javascript:if(event.keyCode==13) search(&#39;key&#39;);" autocomplete="off" id="key" accesskey="s" class="text">
            <button onclick="search(&#39;key&#39;);return false;" class="button cw-icon"><i></i>搜索</button>
        </div>
    </div>
    <div id="settleup-2014" class="dorpdown">
        <div class="cw-icon">
            <i class="ci-left"></i>
            <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">4</i>
            <a target="_blank" onclick="" href="shoppingRecord/shoppingRecordHome">我的购物车</a>
        </div>
    </div>
    <div id="hotwords-2014"></div>
    <span class="clr"></span>
</div>
<div id="nav-2014">
    <div class="w">
        <div class="w-spacer"></div>
        <div id="categorys-2014" class="dorpdown" data-type="default" style="height: auto; left: 0px; position: absolute;">
            <div class="dt">
                <a target="_blank" href="https://www.jd.com/allSort.aspx">全部商品分类<i class="ci-right"><s>◇</s></i></a>
            </div>
            <div class="dd" style="display:none;"></div></div>
        <div id="navitems-2014" style="padding-left: 210px;">
            <ul id="navitems-group1">
                <li clstag="h|keycount|2015|06a" id="nav-fashion" class="fore1">
                    <a target="_blank" href="https://channel.jd.com/fashion.html">服装城</a>
                </li>
                <li clstag="h|keycount|2015|06b" id="nav-beauty" class="fore2">
                    <a target="_blank" href="https://channel.jd.com/beautysale.html">美妆馆</a>
                </li>
                <li clstag="h|keycount|2015|06c" id="nav-chaoshi" class="fore3">
                    <a target="_blank" href="https://channel.jd.com/chaoshi.html">超市</a>
                </li>
                <li clstag="h|keycount|2015|06i" id="nav-fresh" class="fore4">
                    <a target="_blank" href="https://fresh.jd.com/">生鲜</a>
                </li>
            </ul>
            <div class="spacer"></div>
            <ul id="navitems-group2">
                <li clstag="h|keycount|2015|06d" id="nav-jdww" class="fore1">
                    <a target="_blank" href="https://www.jd.hk/">全球购</a>
                </li>
                <li clstag="h|keycount|2015|06e" id="nav-red" class="fore2">
                    <a target="_blank" href="https://red.jd.com/">闪购</a>
                </li>
                <li clstag="h|keycount|2015|06g" id="nav-auction" class="fore4">
                    <a target="_blank" href="https://paimai.jd.com/">拍卖</a>
                </li>
                <li clstag="h|keycount|2015|06h" id="nav-jr" class="fore5">
                    <a target="_blank" href="https://jr.jd.com/">金融</a>
                </li>
            </ul>
        </div>
        <div id="treasure"></div>
        <span class="clr"></span>
    </div>
</div>
<div class="main">
    <div class="success-wrap">
        <div class="w" id="result">
            <div class="m succeed-box">
                <div class="mc success-cont">
                    <div class="success-lcol">
                        <div class="success-top">
                            <b class="succ-icon"></b>
                            <h3 class="ftx-02">商品已成功加入购物车！</h3>
                        </div>
                    </div>
                    <div class="success-btns success-btns-new">
                        <div class="success-ad">
                            <a href="https://cart.jd.com/addToCart.html?rcd=1&amp;pid=3133853&amp;pc=1&amp;nr=1&amp;rid=1487142365345&amp;em=#none"></a>
                        </div>
                        <div class="clr">
                        </div>
                        <div>
                            <a class="btn-tobback" href="https://item.jd.com/3133853.html" target="_blank" clstag="pageclick|keycount|201601152|3">查看商品详情</a><a class="btn-addtocart" href="https://cart.jd.com/cart.action?r=0.3472469942894103" id="GotoShoppingCart" clstag="pageclick|keycount|201601152|4"><b></b>去购物车结算</a></div></div></div></div></div>
    </div>
</div>
<div id="service-2014">
    <div class="slogen">
		<span class="item fore1">
			<i></i><b>多</b>品类齐全，轻松购物
		</span>
        <span class="item fore2">
			<i></i><b>快</b>多仓直发，极速配送
		</span>
        <span class="item fore3">
			<i></i><b>好</b>正品行货，精致服务
		</span>
        <span class="item fore4">
			<i></i><b>省</b>天天低价，畅选无忧
		</span>
    </div>
</div>
</body>
</html>