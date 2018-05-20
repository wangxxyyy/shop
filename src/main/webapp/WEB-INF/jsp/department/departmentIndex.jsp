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
<title>Basic TreeGrid - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="css/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function doSearch(){
	$('#dg').treegrid('load',{
		name: $('#name').val(),
		number: $('#number').val()
	});
}

function addDepartment(){
	var rows = $('#dg').treegrid('getSelections');
	if (rows.length>1){
		$.messager.show({
			title:'消息提示',
			msg:'只能选择一个部门进行添加！',
			timeout:2000,
			showType:'slide'
		});
		return;
	}else if(rows.length==1){
		$('#dlg').dialog('open').dialog('setTitle','添加部门');
		$('#fm').form('clear');
		var row = $('#dg').treegrid('getSelected');
		var id = row.id;
		$("#parentId").val(id);
	}else{
		$.messager.show({
			title:'消息提示',
			msg:'请选择添加的部门！',
			timeout:2000,
			showType:'slide'
		});
		return;
      }
   } 
   
function saveOrUpdateDepartment(){
	$.ajax({
		   type: "POST",
		   url: "department/saveOrUpdateDepartment",
		   async: false,
		   dataType:"json",
		   data:$("#fm").serialize(),
		   success: function(data){
			   var _msg;
			     if(data==1){
			    	 _msg="保存部门成功！"
			     }else if(data==0){
			    	 _msg="保存部门失败！"
			     }
			     $.messager.show({
						title:'消息提示',
						msg:_msg,
						timeout:2000,
						showType:'slide'
				});
			    $('#dlg').dialog('close');		// close the dialog
			    $('#dg').treegrid('reload');	// reload the user data
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

function deleteDepartment(){           
	var rows = $('#dg').treegrid('getSelections');
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
				   url: "department/deleteDepartment",
				   async: false,
				   dataType:"json",
				   data: {'id':row.id},
				   success: function(data){
					     var _msg;
					     if(data==1){
					    	 _msg="删除部门成功！"
					     }else if(data==0){
					    	 _msg="删除部门失败！"
					     }
					     $('#dg').treegrid('reload');
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
   
function editDepartment(){
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

function addUser(){
	var rows = $('#dg').treegrid('getSelections');
	if (rows.length>1){
		$.messager.show({
			title:'消息提示',
			msg:'只能选择一个部门进行添加！',
			timeout:2000,
			showType:'slide'
		});
		return;
	}else if(rows.length==1){
		$('#dlg').dialog('open').dialog('setTitle','添加部门人员');
		$('#fm').form('clear');
		var row = $('#dg').treegrid('getSelected');
		var id = row.id;
		$("#parentId").val(id);
	}else{
		$.messager.show({
			title:'消息提示',
			msg:'请选择添加部门！',
			timeout:2000, 
			showType:'slide'
		});
		return;
      }
   }

</script>
</head>
<body style="padding: 0 0;">
	<div>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addDepartment()">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDepartment()">编辑</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteDepartment()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUser()">添加部门人员</a>
	</div>
	<div id="tb" style="padding:3px">
		<span>部门名称:</span>
		<input id="name" name="name" style="line-height:26px;border:1px solid #ccc">
		<span>部门编号:</span>
		<input id="number" name="number" style="line-height:26px;border:1px solid #ccc">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
	</div>
	<table id="dg" class="easyui-treegrid" style="width:100%;height:400px"
      url="department/list" idField='id' treeField='name' toolbar='#tb' pagination="true"
      rownumbers="false" fitColumns="true" singleSelect="false">
	    <thead>
			<tr>
				<th field="id" checkbox="true"></th>
				<th data-options="field:'number',width:180,align:'center'">部门编号</th>
				<th data-options="field:'name',width:200,align:'center'">部门名称</th>
				<th data-options="field:'sorts',width:100,align:'center'">排序</th>
				<th data-options="field:'state',width:150,align:'center'">状态</th>
				<th data-options="field:'createDate',width:150,align:'center'">创建时间</th>
			</tr>
	    </thead>
    </table>
    
    <div id="dlg" class="easyui-dialog aaa" style="width:400px;height:300px!important;padding:20px 30px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<form  id="fm" method="post">
			<input type="hidden" name="id">
			<input type="hidden" name="parentId" id="parentId" >
			<div class="fitem">
				<label>部门编号:</label>
				<input  type="text" id="number" name="number">
			</div>
			<div class="fitem">
				<label>部门名称:</label>
				<input type="text" name="name" onblur="verification()">
				<span style="width:110px;font-style:normal; line-height: 49px; color:red; padding-left:5px;font-size: 10px;" id="nameDesc"></span>
			</div>
			<div class="fitem">
				<label>排序:</label>
				<input type="text" name="sorts" >
			</div>
		</form>
    </div>
    
    <div id="dlg-buttons">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrUpdateDepartment()">保存</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	
    <div id="dmg" class="easyui-dialog" style="width:500px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
	     <table id="dbg" title="" class="easyui-datagrid" style="width:99%;height:300px;"
					url="department/listUser"  rownumbers="false" fitColumns="true" 
					singleSelect="false" pagination="true">
				<thead>
					<tr>
						<th field="id" checkbox="true"></th>
						<th field="name" width="30" align="center">姓名</th>
						<th field="email" width="30" align="center">电子邮件</th>
					</tr>
				</thead>
		</table>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDepartmentUser()">保存</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dmg').dialog('close')">取消</a>
	</div>
</body>
</html>