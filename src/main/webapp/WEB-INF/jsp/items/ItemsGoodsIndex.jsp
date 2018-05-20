<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function doSearch() {
            $('#dg').treegrid('load', {
                name : $('#name').val(),
            });
        }

        function saveOrUpdateItemsShop() {
            $.ajax({
                type : "POST",
                url : "itemsShop/saveOrUpdateItemsShop",
                async : false,
                dataType : "json",
                data : $("#fm").serialize(),
                success : function(data) {
                    var _msg;
                    if (data == 1) {
                        _msg = "保存商品成功！"				}
                    else if (data == 0) {
                        _msg = "保存商品失败！"
                    }
                    $.messager.show({
                        title : '消息提示',
                        msg : _msg,
                        timeout : 2000,
                        showType : 'slide'
                    });
                    $('#dlg').dialog('close'); // close the dialog
                    $('#dg').treegrid('reload'); // reload the user data
                },
                error : function(data) {
                    $.messager.show({
                        title : '消息提示',
                        msg : "保存出错！ ",
                        timeout : 2000,
                        showType : 'slide'
                    });
                }
            });
        }

        function addItemsShop() {
            var rows = $('#dg').treegrid('getSelections');
            $('#dlg').dialog('open').dialog('setTitle', '添加商品');
            $('#fm').form('clear');
            $('#classify').combotree({
                url: "itemsShop/listClassify",
                required: true
            });
        }

        function editGoodsClassify(){
            var rows = $('#dg').datagrid('getSelections');
            if (rows.length<=0){
                $.messager.show({
                    title:'消息提示',
                    msg:'请选择设置的商品！',
                    timeout:2000,
                    showType:'slide'
                });
                return;
            }else if(rows.length>0){
                $('#dmg').dialog('open').dialog('setTitle','添加分类');
                $('#fm').form('load',rows[0]);
            }else{
                $.messager.show({
                    title:'消息提示',
                    msg:'请选择设置信息！',
                    timeout:2000,
                    showType:'slide'
                });
                return;
            }
        }

     /*   function saveOrUpdateItemsShop() {
            $.ajax({
                type : "POST",
                url : "itemsShop/saveOrUpdateItemsShop",
                async : false,
                dataType : "json",
                data : $("#fm").serialize(),
                success : function(data) {
                    var _msg;
                    if (data == 1) {
                        _msg = "保存商品成功！"				}
                    else if (data == 0) {
                        _msg = "保存商品失败！"
                    }
                    $.messager.show({
                        title : '消息提示',
                        msg : _msg,
                        timeout : 2000,
                        showType : 'slide'
                    });
                    $('#dlg').dialog('close'); // close the dialog
                    $('#dg').treegrid('reload'); // reload the user data
                },
                error : function(data) {
                    $.messager.show({
                        title : '消息提示',
                        msg : "保存商品出错！ ",
                        timeout : 2000,
                        showType : 'slide'
                    });
                }
            });
        }*/
        function saveItemsClassify(){
            var shops = $('#dg').treegrid('getSelections');
            var classify = $('#dbg').datagrid('getSelected');
            var classifyName = classify.name;
            var shopIdArray = new Array();
            for(var i=0;i<shops.length;i++){
                shopIdArray.push(shops[i].id);
            }
            var shopIds = shopIdArray.join(";");
            $.ajax({
                type: "POST",
                url: "itemsShop/saveItemsClassify",
                async: false,
                dataType:"json",
                data: {'classifyName':classifyName,'shopIds':shopIds},
                success: function(data){
                    var _msg;
                    if(data==1){
                        _msg="设置成功！"
                    }else if(data==0){
                        _msg="设置失败失败！"
                    }
                    $('#dbg').treegrid('reload');
                    $.messager.show({
                        title:'消息提示',
                        msg:_msg,
                        timeout:2000,
                        showType:'slide'
                    });
                },
                error:function(data){
                    $.messager.show({
                        title:'设置异常！',
                        msg:_msg,
                        timeout:2000,
                        showType:'slide'
                    });
                }
            });
        }


        function editItemsShop() {
            var rows = $('#dg').datagrid('getSelections');
            if (rows.length > 1) {
                $.messager.show({
                    title : '消息提示',
                    msg : '只能选择一行进行编辑！',
                    timeout : 2000,
                    showType : 'slide'
                });
                return;
            } else if (rows.length == 1) {
                $('#dlg').dialog('open').dialog('setTitle', '编辑');
                $('#fm').form('load', rows[0]);
            } else {
                $.messager.show({
                    title : '消息提示',
                    msg : '请选择编辑信息！',
                    timeout : 2000,
                    showType : 'slide'
                });
                return;
            }
        }

        function deleteItemsShop() {
            var rows = $('#dg').treegrid('getSelections');
            if (rows.length < 1) {
                $.messager.show({
                    title : '消息提示',
                    msg : '请选择删除的数据！',
                    timeout : 2000,
                    showType : 'slide'
                });
                return;
            } else {
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    $.ajax({
                        type : "POST",
                        url : "itemsShop/deleteItemsShop",
                        async : false,
                        dataType : "json",
                        data : {'id' : row.id},
                        success : function(data) {
                            var _msg;
                            if (data == 1) {
                                _msg = "删除商品成功！"
                            } else if (data == 0) {
                                _msg = "删除商品失败！"
                            }
                            $('#dg').treegrid('reload');
                            $.messager.show({
                                title : '消息提示',
                                msg : _msg,
                                timeout : 2000,
                                showType : 'slide'
                            });
                        },
                        error : function(data) {
                            $.messager.show({
                                title : '删除异常！',
                                msg : _msg,
                                timeout : 2000,
                                showType : 'slide'
                            });
                        }
                    });
                }
            }
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品分类管理界面</title>
    <title>Insert title here</title>
</head>
<body style="padding: 0 0;">
<div>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addItemsShop()">添加</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editItemsShop()">编辑</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteItemsShop()">删除</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="editGoodsClassify()">设置所属分类</a>

</div>
<div id="tb" style="padding: 3px">
    <span>商品名称:</span>
    <input id="name" name="name" style="line-height: 26px; border: 1px solid #ccc">
    <a  href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
    <a  href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
</div>
<table id="dg" class="easyui-treegrid"
       style="width: 100%; height: 400px" url="itemsShop/list" idField='id'
       treeField='name' toolbar='#tb' pagination="true" rownumbers="false"
       fitColumns="true" singleSelect="false">
    <thead>
    <tr>
        <th field="id" checkbox="true"></th>
        <th data-options="field:'name',width:100,align:'center'">商品名称</th>
        <th data-options="field:'price',width:100,align:'center'">商品价格</th>
        <th data-options="field:'colour',width:150,align:'center'">商品颜色</th>
        <th data-options="field:'stock',width:150,align:'center'">商品库存</th>
        <th data-options="field:'createDate',width:100,align:'center'">创建时间</th>
    </tr>
    </thead>
</table>
<div id="dlg" class="easyui-dialog aaa" style="width: 500px; height: 300px !important; padding: 20px 30px" closed="true" buttons="#dlg-buttons">
    <form id="fm" action="itemsShop/saveOrUpdateItemsShop" method="post" enctype="multipart/form-data">
        <div class="fitem">
            <label>商品名称:</label>
            <input type="text" name="name" onblur="verification()">
            <span style="width: 110px; font-style: normal; line-height: 49px; color: red; padding-left: 5px; font-size: 10px;" id="nameDesc"></span>
        </div>
        <div class="fitem">
            <label>商品价格:</label> <input type="text" name="price">
        </div>
        <div class="fitem">
            <label>商品颜色:</label> <input type="text" name="colour">
        </div>
        <div class="fitem">
            <label>商品描述:</label> <input type="text" name="describes">
        </div>
        <div class="fitem">
            <label>商品库存:</label> <input type="text" name="stock">
        </div>
        <div class="fitem">
            <label>选择分类:</label>
            <input id="classify" name="classify">
        </div>
        <div class="fitem">
            <input type="file" id="photos" name="photos" >
        </div>
        <input type="submit" />
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrUpdateItemsShop()">保存</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

<div id="dmg" class="easyui-dialog" style="width:500px;height:400px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle"></div>
    <table id="dbg" title="" class="easyui-datagrid" style="width:99%;height:300px;"
           url="itemsShop/listGoodsClassify"  rownumbers="false" fitColumns="true"
           singleSelect="false" pagination="true">
        <thead>
        <tr>
            <th field="id" checkbox="true"></th>
            <th field="name" width="30" align="center">商品分类名称</th>
            <th field="state" width="30" align="center">商品分类状态</th>
        </tr>
        </thead>
    </table>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveItemsClassify()">保存</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dmg').dialog('close')">取消</a>
</div>
</body>
</html>