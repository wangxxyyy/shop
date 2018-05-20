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
<link rel="stylesheet" type="text/css" href="css/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function doSearch() {
		$('#dg').treegrid('load', {
			title : $('#name').val(),
		});
	}

    function saveGoodsItems() {
        $.ajax({
            type : "POST",
            url : "goodsClassify/saveOrUpdateGoodsClassify",
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

	function addGoodsClassify() {
		var rows = $('#dg').treegrid('getSelections');
		if (rows.length == 0) {
			$('#dlg').dialog('open').dialog('setTitle', '添加商品');
			$('#fm').form('clear');
		} else if (rows.length == 1) {
			$('#dlg').dialog('open').dialog('setTitle', '添加商品');
			$('#fm').form('clear');
			var row = $('#dg').treegrid('getSelected');
			var id = row.id;
			$("#parentId").val(id);
		}
	}

    function wangxian(){
        var rows = $('#dg').datagrid('getSelections');
        if (rows.length>1){
            $.messager.show({
                title:'消息提示',
                msg:'只能选择一行进行设置！',
                timeout:2000,
                showType:'slide'
            });
            return;
        }else if(rows.length==1){
            $('#dmg').dialog('open').dialog('setTitle','添加商品');
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

    function saveOrUpdateGoodsClassify() {
        $.ajax({
            type : "POST",
            url : "goodsClassify/saveOrUpdateGoodsClassify",
            async : false,
            dataType : "json",
            data : $("#fm").serialize(),
            success : function(data) {
                var _msg;
                if (data == 1) {
                    _msg = "保存商品分类成功！"				}
                else if (data == 0) {
                    _msg = "保存商品分类失败！"
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

	function editGoodsClassify() {
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

	function deleteGoodsClassify() {
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
					url : "goodsClassify/deleteGoodsClassify",
					async : false,
					dataType : "json",
					data : {
						'id' : row.id
					},
					success : function(data) {
						var _msg;
						if (data == 1) {
							_msg = "删除商品分类成功！"
						} else if (data == 0) {
							_msg = "删除商品分类失败！"
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
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addGoodsClassify()">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editGoodsClassify()">编辑</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteGoodsClassify()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="wangxian()">添加商品</a>
	</div>
	<div id="tb" style="padding: 3px">
		<span>商品分类名称:</span>
		<input id="name" name="name" style="line-height: 26px; border: 1px solid #ccc">
		<a  href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a  href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
	</div>
	<table id="dg" class="easyui-treegrid"
		style="width: 100%; height: 400px" url="goodsClassify/list" idField='id'
		treeField='name' toolbar='#tb' pagination="true" rownumbers="false"
		fitColumns="true" singleSelect="false">
		<thead>
			<tr>
				<th field="id" checkbox="true"></th>
				<th data-options="field:'name',width:100,align:'center'">商品分类名称</th>
				<th data-options="field:'orders',width:100,align:'center'">排序</th>
				<th data-options="field:'state',width:150,align:'center'">状态</th>
				<th data-options="field:'createDate',width:100,align:'center'">创建时间</th>
			</tr>
		</thead>
	</table>
	<div id="dlg" class="easyui-dialog aaa"
		style="width: 400px; height: 300px !important; padding: 20px 30px"
		closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<form id="fm" method="post">
			<input type="hidden" name="id">
			<input type="hidden" name="parentId" id="parentId" value="0">
			<div class="fitem">
				<label>商品分类名称:</label>
				<input type="text" name="name" onblur="verification()">
				<span style="width: 110px; font-style: normal; line-height: 49px; color: red; padding-left: 5px; font-size: 10px;" id="nameDesc"></span>
			</div>
			<div class="fitem">
				<label>排序:</label> <input type="text" name="orders">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrUpdateGoodsClassify()">保存</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

	<div id="dmg" class="easyui-dialog" style="width:500px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>

		<table id="dbg" class="easyui-treegrid" style="width:100%;height:400px"
			   url="goodsClassify/listItemsShop" idField='id' treeField='name'   pagination="true"
			   rownumbers="false" fitColumns="true" singleSelect="false">
			<thead>
			<tr>
				<th field="id" checkbox="true"></th>
				<th data-options="field:'name',width:200,align:'center'">商品名称</th>
				<th data-options="field:'stock',width:100,align:'center'">商品库存</th>
			</tr>
			</thead>
		</table>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRoleMenu()">保存</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dmg').dialog('close')">取消</a>
	</div>
</body>
</html>