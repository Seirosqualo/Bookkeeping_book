<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<script src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/sign.css"type="text/css" />
<script>
$(function()
		{	
$("#submit").click(function()
		{
	if($("#put_idname").val()==null||$("#put_idname").val()=="")
		{
		alert("用户班级名不能为空");
		$("#sign_form").attr("onsubmit","return false");
		}
	else if($("#put_password").val()==null||$("#put_password").val()=="")
		{
		alert("密码不能为空");
		$("#sign_form").attr("onsubmit","return false");
		}
	else if($("#put_password").val()!=$("#put_repassword").val())
		{
		alert("两次输入密码不一致");
		$("#sign_form").attr("onsubmit","return false");
		}
	else
		{
		$("#sign_form").attr("onsubmit","return true");
		}
		})
		})
</script>
</head>
<body>
<div>
			<form action="/jike_banji_guanlifei_manage_system/sign_Server" method="post"id="sign_form">
			<div align="center"id="title">注册</div>
			
<div style="margin:30px;">
<div class="panel panel-default"id="tip_block">
  <div class="panel-heading"id="tip"><span class="glyphicon glyphicon-hand-right"></span>班级名不得超过20个字符，如有超过请适当裁剪:</div>
</div>			
	<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">用户班级</span>
  <input type="text" class="form-control" placeholder="ClassName" aria-describedby="basic-addon1"id="put_idname"name="idname">
</div>
</div>

<div style="margin:30px;">
<div class="panel panel-default"id="tip_block">
  <div class="panel-heading"id="tip"><span class="glyphicon glyphicon-hand-right"></span>密码由字符，数字，符号组成，不得超过20个字符:</div>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">输入密码</span>
  <input type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1"id="put_password"name="password"required maxlength="20">
</div>
</div>

<div style="margin:30px;">
<div class="panel panel-default"id="tip_block">
  <div class="panel-heading"id="tip"><span class="glyphicon glyphicon-hand-right"></span>重复输入新设置的新密码:</div>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">确认密码</span>
  <input type="password" class="form-control" placeholder="RE_Password" aria-describedby="basic-addon1"id="put_repassword"required maxlength="20">
</div>
</div>

<div>
	  <input type="submit" class="btn btn-default"value="提交"id="submit"></input>
</div>

</form>
</div>
</body>
</html>