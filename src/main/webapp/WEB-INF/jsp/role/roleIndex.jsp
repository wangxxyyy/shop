<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>权限管理</title>
<link rel="stylesheet" type="text/css" href="css/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function addRole(){
	$('#dlg').dialog('open').dialog('setTitle','添加角色');
	$('#fm').form('clear');
}

function editMenu(){
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
	    $('#dmg').dialog('open').dialog('setTitle','设置菜单');
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

function doSearch(){
	$('#dg').datagrid('load',{
		name: $('#name').val(),
		code: $('#code').val()
	});
}

function saveOrUpdateRole(){
	$.ajax({
		   type: "POST",
		   url: "role/saveOrUpdateRole",
		   async: false,
		   dataType:"json",
		   data:$("#fm").serialize(),
		   success: function(data){
			   var _msg;
			     if(data==1){
			    	 _msg="保存角色成功！"
			     }else if(data==0){
			    	 _msg="保存角色失败！"
			     }
			     $.messager.show({
						title:'消息提示',
						msg:_msg,
						timeout:2000,
						showType:'slide'
				});
			    $('#dlg').dialog('close');		// close the dialog
			    $('#dg').datagrid('reload');	// reload the user data
		   },
		   error:function(data){
			   $.messager.show({
					title:'消息提示',
					msg:"保存角色出错！ ",
					timeout:2000,
					showType:'slide'
			    });
		   }
     });
}

function editRole(){
	var rows = $('#dg').datagrid('getSelections');
	if (rows.length>1){
		$.messager.show({
			title:'消息提示',
			msg:'只能选择一行进行编辑！',
			timeout:2000,
			showType:'slide'
		});
		return;
	}else if(rows.length==1){
	    $('#dlg').dialog('open').dialog('setTitle','编辑');
	    $('#fm').form('load',rows[0]);
	}else{
		$.messager.show({
			title:'消息提示',
			msg:'请选择编辑信息！',
			timeout:2000,
			showType:'slide'
		});
		return;
     }
}

function deleteRole(){           
	var rows = $('#dg').datagrid('getSelections');
	if(rows.length<1){
		$.messager.show({
			title:'消息提示',
			msg:'请选择删除的数据！',
			timeout:2000,
			showType:'slide'
		});
		return;
	}else{
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
			$.ajax({
				   type: "POST",
				   url: "role/deleteRole",
				   async: false,
				   dataType:"json",
				   data: {'id':row.id},
				   success: function(data){
					     var _msg;
					     if(data==1){
					    	 _msg="删除角色成功！"
					     }else if(data==0){
					    	 _msg="删除角色失败！"
					     }
					     $('#dg').datagrid('reload');
					     $.messager.show({
								title:'消息提示',
								msg:_msg,
								timeout:2000,
								showType:'slide'
						});
				   },
				   error:function(data){
					   $.messager.show({
							title:'删除异常！',
							msg:_msg,
							timeout:2000,
							showType:'slide'
					   });
				   }
			});
		}
	}
}

function saveRoleMenu(){
	var role = $('#dg').datagrid('getSelected');
	var menus = $('#dbg').treegrid('getSelections');
	var roleId = role.id;
	var menuIdArray = new Array();
	for(var i=0;i<menus.length;i++){
		menuIdArray.push(menus[i].id);
	}
	var menuIds = menuIdArray.join(";"); 
	$.ajax({
		   type: "POST",
		   url: "role/saveRoleMenu",
		   async: false,
		   dataType:"json",
		   data: {'roleId':roleId,'menuIds':menuIds},
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
</script>
</head>
<body>
    <div>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRole()">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRole()">编辑</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteRole()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMenu()">设置菜单</a>
	</div>
	<div id="tb" style="padding:3px">
		<span>角色名字:</span>
		<input id="name" name="name" style="line-height:26px;border:1px solid #ccc">
		<span>角色代码编号:</span>
		<input id="code" name="code" style="line-height:26px;border:1px solid #ccc">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
	</div>
	<table id="dg" title="" class="easyui-datagrid" style="width:99%;height:300px;"
			url="role/list" toolbar="#tb" rownumbers="false" fitColumns="true" 
			singleSelect="false" pagination="true">
		<thead>
			<tr>
				<th field="id" checkbox="true"></th>
				<th field="name" width="50" align="center">角色名字</th>
				<th field="code" width="80" align="center">角色代码编号</th>
				<th field="state" width="70" align="center">角色状态</th>
				<th field="createDate" width="80" align="center">角色创建时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="dlg" class="easyui-dialog" style="width:500px;height:200px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<form  id="fm" method="post">
			<input type="hidden" name="id">
			<div class="fitem">
				<label>角色名字:</label>
				<input  type="text" id="names" name="name" onblur="verification()">
				<span style="width:110px;font-style:normal; line-height: 49px; color:red; padding-left:5px;font-size: 10px;" id="nameDesc"></span>
			</div>
			<div class="fitem">
				<label>角色编号:</label>
				<input type="text" name="code">
			</div>
		</form>
    </div>
    <div id="dlg-buttons">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrUpdateRole()">保存</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	
	<div id="dmg" class="easyui-dialog" style="width:500px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		
		<table id="dbg" class="easyui-treegrid" style="width:100%;height:400px"
	      url="role/listMenu" idField='id' treeField='title'   pagination="true"
	      rownumbers="false" fitColumns="true" singleSelect="false">
		    <thead>
				<tr>
					<th field="id" checkbox="true"></th>
					<th data-options="field:'title',width:200,align:'center'">菜单名称</th>
					<th data-options="field:'orders',width:100,align:'center'">排序</th>
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