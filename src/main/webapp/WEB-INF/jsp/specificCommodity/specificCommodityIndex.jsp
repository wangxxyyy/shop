<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="root61">
<head>
    <title>手机报价排行</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <meta name="format-detection" content="telephone=no">
    <base href="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="files/saved_resource">
    <link rel="stylesheet" type="text/css" href="files/saved_resource(1)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(3)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(4)">
    <link charset="utf-8" rel="stylesheet" href="css/specificCommodity/gift.css">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(5)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(6)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(7)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(8)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(9)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(10)">
    <link charset="utf-8" rel="stylesheet" href="files/saved_resource(11)">
    <link charset="utf-8" rel="stylesheet" href="css/specificCommodity/pager.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function saveShopingCart(){
            var sum = $("#total").val();
            $.ajax({
                type: "POST",
                url: "shopingCart/saveShopingCart",
                async: false,
                dataType:"json",
                data:{'id':'${itemsShop.id}', 'sum':sum},
                success: function(data){
                    var _msg;
                    if(data==1){
                        window.location.href="shopingCart/shopingCartHome";
                    }else if(data==0){
                        _msg="保存失败！"
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
                        msg:"保存出错！ ",
                        timeout:2000,
                        showType:'slide'
                    });
                }
            });
        }
    </script>
</head>
<body version="140120" class="cat-1-9987 cat-2-653 cat-3-655 item-3133813 JD JD-1">
<div id="shortcut-2014">
    <div class="w">
        <ul class="fr">
            <li class="fore1" id="ttbar-login" clstag="shangpin|keycount|topitemnormal|a02">
                <span style="margin-right:10px">登录用户:${goodsUser.loginName}</span>
                <span style="margin-right: 10px"><a href="goodsUser/quitHome">退出</a></span>
            </li>
            <li class="fore2" clstag="shangpin|keycount|topitemnormal|a03">
                <div class="dt">
                    <a target="_blank" href="https://order.jd.com/center/list.action">我的订单</a>
                </div>
            </li>
            <li class="fore3 dorpdown" id="ttbar-myjd" clstag="shangpin|keycount|topitemnormal|b04">
                <div class="dt cw-icon">
                    <a target="_blank" href="https://home.jd.com/">我的京东</a>
                </div>
            </li>
            <li class="fore4" clstag="shangpin|keycount|topitemnormal|a04">
                <div class="dt">
                    <a target="_blank" href="https://vip.jd.com/">京东会员</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="fore8 dorpdown" id="ttbar-serv" clstag="shangpin|keycount|topitemnormal|a07">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>客户服务
                </div>
            </li>
            <li class="fore9 dorpdown" id="ttbar-navs" clstag="shangpin|keycount|topitemnormal|a08">
                <div class="dt cw-icon">
                    <i class="ci-right"><s>◇</s></i>网站导航
                </div>
            </li>
        </ul>
    </div>
</div><!-- #shortcut-2014 -->
<div class="w">
    <div id="logo-2014">
        <a href="https://www.jd.com/" clstag="shangpin|keycount|topitemnormal|b01" class="logo">京东</a>
    </div>
    <div id="search-2014">
        <div class="form">
            <input type="text" onkeydown="javascript:if(event.keyCode==13) search(&#39;key&#39;);" autocomplete="off" id="key" accesskey="s" class="text" clstag="shangpin|keycount|topitemnormal|b02">
            <button onclick="search(&#39;key&#39;);return false;" class="button cw-icon" clstag="shangpin|keycount|topitemnormal|b03"><i></i>搜索</button>
        </div>
    </div>
    <div id="settleup-2014" class="dorpdown">
        <div class="cw-icon">
            <i class="ci-left"></i>
            <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">1</i>
            <a target="_blank"  onclick="" href="shoppingRecord/shoppingRecordHome">我的购物车</a>
        </div>
    </div>
</div>
<div class="crumb-wrap">
    <div class="w">
        <div class="crumb fl clearfix">
            <div class="item first"><a href="https://shouji.jd.com/" clstag="shangpin|keycount|product|mbNav-1">手机</a></div>
            <div class="item sep">&gt;</div>
            <div class="item"><a href="https://list.jd.com/list.html?cat=9987,653" clstag="shangpin|keycount|product|mbNav-2">手机通讯</a></div>
            <div class="item sep">&gt;</div>
            <div class="item"><a href="https://list.jd.com/list.html?cat=9987,653,655" clstag="shangpin|keycount|product|mbNav-3">手机</a></div>
            <div class="item sep">&gt;</div>
            <div class="item sep">&gt;</div>
            <div class="item ellipsis" title="AppleiPhone7">AppleiPhone7</div>
        </div><!-- .crumb -->
    </div>
</div><!-- .contact -->

<div class="clr">
</div>
<div class="w">
    <div class="product-intro clearfix">
        <div class="preview-wrap">
            <div class="preview" id="preview">
                <div id="spec-n1" class="jqzoom main-img" data-big="1" clstag="shangpin|keycount|product|mainpic_1">
                    <img id="spec-img" width="450" data-origin="//img13.360buyimg.com/n1/s450x450_jfs/t3301/16/1615084619/137077/bc52150e/57d0c513Nd51ff9a3.jpg" alt="Apple iPhone 7 (A1660) 32G 玫瑰金色 移动联通电信4G手机" src="files/57d0c513Nd51ff9a3.jpg" jqimg="//img13.360buyimg.com//n0/jfs/t3301/16/1615084619/137077/bc52150e/57d0c513Nd51ff9a3.jpg">
                </div>
            </div>
        </div>
        <div class="itemInfo-wrap">
            <div class="sku-name">Apple iPhone 7 (A1660) 32G 玫瑰金色 移动联通电信4G手机</div>
            <div class="summary p-choose-wrap">
                <div class="summary-stock" clstag="shangpin|keycount|product|quyuxuanze_1">
                    <div class="dt">配 送 至</div>
                    <div class="dd">
                        <div class="store clearfix">
                            <div id="store-prompt" class="store-prompt"><strong>有货</strong></div>
                            <div class="J-promise-icon promise-icon fl promise-icon-more" clstag="shangpin|keycount|product|promisefw_1" data-role="drop">
                                <div class="title fl">支持</div>
                            </div>
                        </div>
                    </div>
                </div>
                <form  id="fm" method="post">
                <div id="choose-attrs">
                    <div id="choose-attr-1" class="li p-choose" data-type="颜色" data-idx="0">
                        <div class="dt">选择颜色:</div>
                        <div class="dd">
                            <i>${itemsShop.colour}</i>
                        </div>
                        <div class="dt">价格:</div>
                        <div class="dd">
                            <i>${itemsShop.price}</i>
                        </div>
                        <div class="dt">总量:</div>
                        <div class="dd">
                            <i><input type="text" name="total"  id="total" value=""></i>
                        </div>
                        </div>
                    </div>
                </form>
                </div>

                <div class="w">
                    <div id="fittings" class="fittings ETab hide" style="display: block;">
                        <div class="tab-main large">
                            <ul>
                                <li data-tab="trigger" class="current" data-name="人气配件" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_人气配件&quot;,&quot;&quot;,&quot;main&quot;)">人气配件</li>
                                <li data-tab="trigger" data-name="手机贴膜" data-id="3" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_手机贴膜&quot;,&quot;&quot;,&quot;main&quot;)">手机贴膜</li>
                                <li data-tab="trigger" data-name="手机保护套" data-id="4" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_手机保护套&quot;,&quot;&quot;,&quot;main&quot;)">手机保护套</li>
                                <li data-tab="trigger" data-name="数据线" data-id="13" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_数据线&quot;,&quot;&quot;,&quot;main&quot;)">数据线</li>
                                <li data-tab="trigger" data-name="充电器" data-id="12" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_充电器&quot;,&quot;&quot;,&quot;main&quot;)">充电器</li>
                                <li data-tab="trigger" data-name="移动电源" data-id="10" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_移动电源&quot;,&quot;&quot;,&quot;main&quot;)">移动电源</li>
                                <li data-tab="trigger" data-name="手机支架" data-id="254" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_手机支架&quot;,&quot;&quot;,&quot;main&quot;)">手机支架</li>
                            </ul>
                        </div>
                        <div class="tab-con J_fitting_con clearfix">


                            </form>
                            <div class="infos" style="width: 400px;">
                                <div class="selected">已选择<em class="J-selected-cnt">0</em>个配件</div>
                                <div class="btn" style="display: inline-block;vertical-align: middle">
                                    <a href="emption/emptionHome?goodsId=${itemsShop.id}" class="btn-primary J-btn" target="_blank" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_ycgm_ljgm&quot;, pageConfig.getAccSelectedSkus(),&quot;main&quot;)">立即购买</a>
                                </div>
                                <div style="display: inline-block;vertical-align: middle" id="choose-btns" class="choose-btns clearfix">
                                    <a href="javascript:void(0);" onclick="saveShopingCart()" target="_blank"   class="btn-special1 btn-lg" clstag="shangpin|keycount|product|加入购物车_1">加入购物车</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</body>
</html>