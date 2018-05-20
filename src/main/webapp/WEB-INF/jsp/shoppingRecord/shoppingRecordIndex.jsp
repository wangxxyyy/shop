<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的购物车记录</title>
    <link type="text/css" rel="stylesheet" href="filesds/saved_resource">
    <link source="widget" href="filesds/saved_resource(1)" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="filesds/saved_resource(2)" source="widget">
    <link charset="utf-8" rel="stylesheet" href="css/shoppingRecord/area.css">
    <link charset="utf-8" rel="stylesheet" href="filesds/saved_resource(3)">
    <link charset="utf-8" rel="stylesheet" href="css/shoppingRecord//dialog.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="filesds/saved_resource(4)"></script>
    <script type="text/javascript">
        function deleteRecord(id){
            $.ajax({
                type: "POST",
                url: "shopingCart/deleteRecord",
                async: false,
                dataType:"json",
                data:{'id':id},
                success: function(data){
                    var _msg;
                    if(data==1){
                        window.location.href="shoppingRecord/shoppingRecordHome";
                    }else if(data==0){
                        _msg="删除失败！"
                    }
                    $.messager.show({
                        title:'消息提示',
                        msg:_msg,
                        timeout:2000,
                        showType:'slide'
                    });
                },
                error:function(data){
                    $.messager.show({
                        title:'消息提示',
                        msg:"删除出错！ ",
                        timeout:2000,
                        showType:'slide'
                    });
                }
            });
        }
        $(function () {
            $(".jdcheckbox").click(function () {
                if($(this).prop("checked")){
                    $(".child_checkbox").prop("checked","checked");
                    $(".jdcheckbox").prop("checked","");
                }else {
                    $(".child_checkbox").prop("checked","");
                    $(".jdcheckbox").prop("checked","");
                }
            });

            $(".child_checkbox").click(function () {
                var no_checked = $(".child_checkbox").length - $(".child_checkbox:checked").length;
                if(no_checked==0){
                    $(".jdcheckbox").prop("checked","checked");
                }else {
                    $(".jdcheckbox").prop("checked","");
                }
                var checks = $(".child_checkbox:checked").length;
                $('.checks').text(checks);

                //计算价格
                var countPrice = 0.0;
                $(".child_checkbox:checked").each(function () {
                    var price = $(this).parents(".item-form").find(".p-sum strong").text();
                    countPrice+=parseFloat(price);
                })
                    $(".sumPrice em").text(countPrice.toFixed(2));
            });
        })




    </script>
</head>
<body>
<div id="shortcut-2014">
    <div class="w">
        <ul class="fl">
            <li class="dorpdown" id="ttbar-mycity">
                <div class="dt cw-icon ui-areamini-text-wrap" style="">
                    <i class="ci-right"><s>◇</s></i>
                    送至：<span class="ui-areamini-text" data-id="19" title="广东">广东</span>
                </div>
            </li>
        </ul>
        <ul class="fr">
            <li class="fore1 dorpdown" id="ttbar-login">
                <span style="margin-right:10px">登录用户:${goodsUser.loginName}</span>
                <span style="margin-right: 10px"><a href="goodsUser/quitHome">退出</a></span>
            </li>
                </div>
                <div class="dd dorpdown-layer">
                    <div class="dd-spacer"></div>
                    <div class="userinfo">
                        <div class="u-pic">
                            <a target="_blank" href="https://home.jd.com/">
                                <img src="./我的购物车 - 京东商城_files/no-img_mid_.jpg" width="60" height="60"></a>
                        </div>
                        <div class="u-plus"><a href="https://passport.jd.com/uc/login?ltype=logout" class="link-logout">退出</a>
                            <a href="https://plus.jd.com/index" target="_blank" class="icon-plus-dropdown"></a>
                        </div>
            <li class="spacer"></li>
            <li class="fore2">
                <div class="dt">
                    <a target="_blank" href="https://order.jd.com/center/list.action">我的订单</a>
                </div>
            </li>
            <li class="spacer"></li>
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
            <li class="fore8 dorpdown" id="ttbar-serv">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>客户服务
                </div>
                <div class="dd dorpdown-layer"><div class="dd-spacer"></div><div class="dd-inner"><span class="loading"></span></div></div>
            </li>
            <li class="spacer"></li>
            <li class="fore9 dorpdown" id="ttbar-navs">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>网站导航
                </div>
                <div class="dd dorpdown-layer"><div class="dd-spacer"></div><div class="dd-inner"><span class="loading"></span></div></div>
            </li>
        </ul>
        <span class="clr"></span>
    </div>
</div>
<div id="o-header-2013"><div id="header-2013" style="display:none;"></div></div>
<div class="w w1 header clearfix">
    <div id="logo-2014">
        <a href="http://www.jd.com/" class="logo"></a>
        <a href="https://cart.jd.com/cart.action#none" class="link2"><b></b>购物车</a>
    </div>
    <div class="cart-search">
        <div class="form">
            <input id="key" type="text" class="itxt" autocomplete="off" accesskey="s" style="color: rgb(153, 153, 153);">
            <input type="button" class="button" value="搜索" clstag="clickcart|keycount|xincart|cart_search" onclick="javascript:void(0);">
        </div>
    </div>
</div>


<!-- main -->
<div id="container" class="cart">
    <div class="w">
        <div id="chunjie" class="mb10"></div>
        <div class="cart-filter-bar">
            <ul class="switch-cart">
                <li class="switch-cart-item curr">
                    <a href="https://cart.jd.com/cart.action#none">
                        <em>全部商品</em>
                        <span class="number">1</span>
                    </a>
                </li>
                <li class="switch-cart-item ui-switchable-selected">
                    <a class="" href="https://cart.yiyaojd.com/cart">
                        <em>京东大药房</em>
                    </a>
                </li>
            </ul>
            <div class="cart-store">
                <input id="hiddenLocationId" type="hidden">
                <input id="hiddenLocation" type="hidden">
                <span class="label">配送至：</span>
            </div>
            <div class="clr"></div>
            <div class="cart-warp">
                <div class="w">
                    <div id="jd-cart">
                        <div class="cart-main cart-main-new">
                            <div class="cart-thead">
                                <div class="column t-checkbox">
                                    <div class="cart-checkbox">
                                        <input type="checkbox" name="toggle-checkboxes" class="jdcheckbox chk-all" clstag="clickcart|keycount|xincart|cart_allCheck" checked="checked">
                                        <label for="">勾选全部商品</label>
                                    </div>
                                    全选
                                </div>
                                <div class="column t-goods">商品</div>
                                <div class="column t-props"></div>
                                <div class="column t-price">单价</div>
                                <div class="column t-quantity">数量</div>
                                <div class="column t-sum">小计</div>
                                <div class="column t-action">操作</div>
                            </div>
                            <div class="cart-item-list" id="cart-item-list-01">
                                <div class="cart-tbody" id="vender_8888">
                                    <div class="item-list">
                                        <c:forEach var="shopingCart" items="${list}" >
                                            <div class=" item-last item-item item-selected  " id="product_3296817">
                                                <div class="item-form">
                                                    <div class="cell p-checkbox">
                                                        <div class="cart-checkbox">
                                                            <input p-type="3296817_13" manfanzeng="1" type="checkbox" name="checkItem" value="3296817_13_196383091" checked="checked" class="checkbox child_checkbox" data-bind="cbid" clstag="clickcart|keycount|xincart|cart_checkOn_sku">
                                                        </div>
                                                    </div>
                                                    <div class="cell p-goods">
                                                        <div class="goods-item">
                                                            <div class="p-img">
                                                                <a href="https://item.jd.com/32968173.html" target="_blank" class="J_zyyhq_3296817">
                                                                    <img clstag="clickcart|keycount|xincart|cart_sku_pic" src="upload/${shopingCart.photo}"></a>
                                                            </div>
                                                            <div class="item-msg">
                                                                <div class="p-name">
                                                                    <a clstag="clickcart|keycount|xincart|cart_sku_name" href="https://item.jd.com/3296817.html" target="_blank">
                                                                        ${shopingCart.describes}
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="cell p-props p-props-new">
                                                        <div class="props-txt" title="${shopingCart.colour}">颜色：${shopingCart.colour}</div>
                                                    </div>
                                                    <div class="cell p-price">
                                                        <strong>${shopingCart.price}</strong>
                                                    </div>
                                                    <div class="cell p-quantity">
                                                        <div class="ac ftx-03 quantity-txt" _stock="stock_3296817">有货</div>
                                                    </div>
                                                    <div class="cell p-sum">
                                                        <strong>${shopingCart.price}</strong>
                                                    </div>
                                                    <div class="cell p-ops">
                                                        <a  href="javascript:void(0);" onclick="deleteRecord('${shopingCart.id}')">删除</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <div class="gift-box" id="gift_box_196383091">
                                            <div class="gift-arr"></div>
                                            <input type="hidden" class="chk" id="gift_num_196383091" value="12">
                                            <div class="op-btns ac">
                                                <a href="https://cart.jd.com/cart.action#none" class="btn-1 select-gift" clstag="clickcart|keycount|xincart|cart_huanGouSet">确定</a>
                                                <a href="https://cart.jd.com/cart.action#none" class="btn-9 ml10 del cancel-gift">取消</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="cart-floatbar">
                <div class="ui-ceilinglamp-1" style="width: 990px; height: 52px;"><div class="cart-toolbar" style="width: 988px; height: 50px;">
                    <div class="toolbar-wrap">
                        <div class="selected-item-list hide" style="display: none;">
                        </div>
                        <div class="options-box">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input type="checkbox" id="toggle-checkboxes_down" name="toggle-checkboxes" class="jdcheckbox chk-all" clstag="clickcart|keycount|xincart|cart_allCheckDown" checked="checked">
                                    <label for="">勾选全部商品</label>
                                </div>
                                全选
                            </div>
                            <div class="clr"></div>
                            <div class="toolbar-right">
                                <div class="normal">
                                    <div class="comm-right">
                                        <div class="btn-area">
                                            <a href="javascript:void(0);" onclick="return false;" clstag="clickcart|keycount|xincart|cart_gotoOrder" class="submit-btn" data-bind="1">
                                                去结算<b></b>
                                            </a>
                                        </div>
                                        <div class="price-sum">
                                            <div>
                                                <span class="txt txt-new">总价：</span>
                                                <span class="price sumPrice"><em data-bind="${shopingCart.price}">${shopingCart.price}</em></span>
                                                <b class="ml5 price-tips"></b>
                                            </div>
                                        </div>
                                        <div class="amount-sum">
                                            已选择<em class="checks">${fn:length(list)} </em>件商品
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
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
    <div class="w">
        <dl class="fore1">
            <dt>购物指南</dt>
            <dd>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-29.html">购物流程</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-151.html">会员介绍</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-297.html">生活旅行/团购</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue.html">常见问题</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-136.html">大家电</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/index.html">联系客服</a></div>
            </dd>
        </dl>
        <dl class="fore2">
            <dt>配送方式</dt>
            <dd>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-81-100.html">上门自提</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-81.html">211限时达</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/103-983.html">配送服务查询</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/109-188.html">配送费收取标准</a></div>
                <div><a target="_blank" href="https://en.jd.com/chinese.html">海外配送</a></div>
            </dd>
        </dl>
        <dl class="fore3">
            <dt>支付方式</dt>
            <dd>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-172.html">货到付款</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-173.html">在线支付</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-176.html">分期付款</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-174.html">邮局汇款</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-175.html">公司转账</a></div>
            </dd>
        </dl>
        <dl class="fore4">
            <dt>售后服务</dt>
            <dd>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/321-981.html">售后政策</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-132.html">价格保护</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/130-978.html">退款说明</a></div>
                <div><a rel="nofollow" target="_blank" href="https://myjd.jd.com/repair/repairs.action">返修/退换货</a></div>
                <div><a rel="nofollow" target="_blank" href="https://help.jd.com/user/issue/list-50.html">取消订单</a></div>
            </dd>
        </dl>
        <dl class="fore5">
            <dt>特色服务</dt>
            <dd>
                <div><a target="_blank" href="https://help.jd.com/user/issue/list-133.html">夺宝岛</a></div>
                <div><a target="_blank" href="https://help.jd.com/user/issue/list-134.html">DIY装机</a></div>
                <div><a rel="nofollow" target="_blank" href="https://fuwu.jd.com/">延保服务</a></div>
                <div><a rel="nofollow" target="_blank" href="https://o.jd.com/market/index.action">京东E卡</a></div>
                <div><a rel="nofollow" target="_blank" href="https://mobile.jd.com/">京东通信</a></div>
                <div><a rel="nofollow" target="_blank" href="https://s.jd.com/">京东JD+</a></div>
            </dd>
        </dl>
    </div>
</div>
</body>
</html>