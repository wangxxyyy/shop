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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理界面</title>
<link rel="stylesheet" type="text/css" href="css/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css"> 
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({   
	    url:'user/list',
	    pagination:true,
	    toolbar:'#tb',
	    fitColumns:true,
	    pageNumber:1,
	    pageSize:10,
	    rownumbers:true,
	    columns:[[   
	        {field:'id',checkbox:true},   
	        {field:'name',title:'姓名',width:80,align:'center'},   
	        {field:'age',title:'年龄',width:50,align:'center'},
	        {field:'sex',title:'性别',width:50,align:'center'},
	        {field:'idCard',title:'身份证号码',width:130,align:'center'},
	        {field:'telephone',title:'电话号码',width:120,align:'center'},
	        {field:'email',title:'电子邮件',width:130,align:'center'},
	        {field:'loginName',title:'登录用户名',width:100,align:'center'},
	        {field:'  ',title:'操作',width:100,align:'center',
	        	formatter:function(value,row,index){     		
	        		var html = "<a href=\"javascript:void(0);\" onclick=\"resetPassword('"+row.id+"')\">重置密码</a>"
					return html;
			    }
	        }
	    ]]   
	});  
});

function resetPassword(userId){
	$.ajax({
		   type: "POST",
		   url: "user/resetPassword",
		   async: false,
		   dataType:"json",
		   data:{'userId':userId},
		   success: function(data){
			   var _msg;
			     if(data==1){
			    	 _msg="重置密码成功！"
			     }else if(data==0){
			    	 _msg="重置密码失败！"
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
					msg:"重置密码出错！ ",
					timeout:2000,
					showType:'slide'
			    });
		   }
  });
}


function saveOrUpdateUser(){
	$.ajax({
		   type: "POST",
		   url: "user/saveOrUpdateUser",
		   async: false,
		   dataType:"json",
		   data:$("#fm").serialize(),
		   success: function(data){
			   var _msg;
			     if(data==1){
			    	 _msg="保存用户成功！"
			     }else if(data==0){
			    	 _msg="保存用户失败！"
			     }
			     $.messager.show({
						title:'消息提示',
						msg:_msg,
						timeout:2000,
						showType:'slide'
				});
			    $('#dg').datagrid('reload');	// reload the user data
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
//添加验证
function verification(){
	var name = $("#names").val();
	$.ajax({
		   type: "POST",
		   url: "user/verification",
		   async: false,
		   dataType:"json",
		   data: {'name':name},
		   success: function(data){
		     if(data==1){
		    	 $("#nameDesc").text("用户认证通过！");
		     }else{
		    	 $("#nameDesc").text("用户名重复！");
		     }
		   },
		   error:function(data){
			    alert("添加出错！");
		   }
		});
}
//编辑弹窗
function editUser(){
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
	$('#dlg').dialog('open').dialog('setTitle','添加用户');
	$('#fm').form('clear');
}

function doSearch(){
	$('#dg').datagrid('load',{
		name: $('#name').val(),
		email: $('#email').val()
	});
}

function deleteUser(){
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
				   url: "user/delete",
				   async: false,
				   dataType:"json",
				   data: {'id':row.id},
				   success: function(data){
					     var _msg;
					     if(data==1){
					    	 _msg="删除用户成功！"
					     }else if(data==0){
					    	 _msg="删除用户失败！"
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

function editRole(){
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
	    $('#dmg').dialog('open').dialog('setTitle','设置权限');
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

function saveUserRole(){
	var user = $('#dg').datagrid('getSelected');
	var roles = $('#dbg').datagrid('getSelections');
	var userId = user.id;
	var roleIdArray = new Array();
	for(var i=0;i<roles.length;i++){
		roleIdArray.push(roles[i].id);
	}
	var roleIds = roleIdArray.join(";"); 

	$.ajax({
		   type: "POST",
		   url: "user/saveUserRole",
		   async: false,
		   dataType:"json",
		   data: {'userId':userId,'roleIds':roleIds},
		   success: function(data){
			     var _msg;
			     if(data==1){
			    	 _msg="设置成功！"
			     }else if(data==0){
			    	 _msg="设置失败失败！"
			     }
			     $('#dbg').datagrid('reload');
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
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUser()">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUser()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRole()">设置权限</a>
	</div>
	<div id="tb" style="padding:3px">
		<span>用户名:</span>
		<input id="name" name="name" style="line-height:26px;border:1px solid #ccc">
		<span>电子邮件:</span>
		<input id="email" name="email" style="line-height:26px;border:1px solid #ccc">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload" onclick="doRefresh()">刷新</a>
	</div>
	
	<table id="dg"></table> 
	
<!-- 	<table id="dg" title="" class="easyui-datagrid" style="width:99%;height:300px;"
			url="user/list" toolbar="#tb" rownumbers="false" fitColumns="true" 
			singleSelect="false" pagination="true">
		<thead>
			<tr>
				<th field="id" checkbox="true"></th>
				<th field="name" width="50" align="center">姓名</th>
				<th field="age" width="30" align="center">年龄</th>
				<th field="sex" width="30" align="center">性别</th>
				<th field="idCard" width="70" align="center">身份证号码</th>
				<th field="telephone" width="70" align="center">电话号码</th>
				<th field="email" width="70" align="center">电子邮件</th>
				<th field="address" width="100" align="center">用户地址</th>
				<th field="loginName" width="80" align="center">登录用户</th>
			</tr>
		</thead>
	</table> -->
	
	<div id="dlg" class="easyui-dialog" style="width:500px;height:400px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
	<div class="ftitle"></div>
	<form  id="fm" method="post">
		<input type="hidden" name="id">
		<div class="fitem">
			<label>用户名:</label>
			<input  type="text" id="names" name="name" onblur="verification()">
			<span style="width:110px;font-style:normal; line-height: 49px; color:red; padding-left:5px;font-size: 10px;" id="nameDesc"></span>
		</div>
		<div class="fitem">
			<label>年龄:</label>
			<input type="text" name="age">
		</div>
		<div class="fitem">
			<label>性别:</label>
			<input type="radio" name="sex" value="1">男
			<input type="radio" name="sex" value="0"/>女
		</div>
		<div class="fitem">
			<label>身份证号码:</label>
			<input type="text" name="idCard" >
		</div>
		<div class="fitem">
			<label>电话号码:</label>
			<input type="text" name="telephone" >
		</div>
		<div class="fitem">
			<label>电子邮件:</label>
			<input type="text" name="email" >
		</div>
		<div class="fitem">
			<label>住址:</label>
			<input type="text" name="address" >
		</div>
		<div class="fitem">
			<label>登录用户:</label>
			<input type="text" name="loginName" >
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrUpdateUser()">保存</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

	<div id="dmg" class="easyui-dialog" style="width:500px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
	     <table id="dbg" title="" class="easyui-datagrid" style="width:99%;height:300px;"
					url="user/listRole"  rownumbers="false" fitColumns="true" 
					singleSelect="false" pagination="true">
				<thead>
					<tr>
						<th field="id" checkbox="true"></th>
						<th field="name" width="30" align="center">角色名字</th>
						<th field="code" width="30" align="center">角色代码编号</th>
					</tr>
				</thead>
		</table>
	</div>
	<div id="dlg-buttons">
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUserRole()">保存</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dmg').dialog('close')">取消</a>
	</div>
</body>
</html>