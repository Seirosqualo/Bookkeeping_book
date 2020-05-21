<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css"type="text/css" />
<script>
$(function()
		{
$("#submit").click(function()
		{
	if($("#id_name").val()==null||$("#id_name").val()=="")
		{
		alert("用户名不能为空");
		$(".Login").attr("onsubmit"," return false");
		}
	else if($("#id_password").val()==null||$("#id_password").val()=="")
	{
		alert("密码不能为空");
		$(".Login").attr("onsubmit"," return false");
	}
	else
	{
	$(".Login").attr("onsubmit","return true");
	}
	
		});
		$("#submitvisitor").click(function()
				{
			if($("#v_name").val()==null||$("#v_name").val()=="")
				{
				alert("进入者应填入班级名");
				$(".vLogin").attr("onsubmit"," return false");
				}
			else
				{
				$(".vLogin").attr("onsubmit"," return true");
				}
				})
	
	
		})
		
		function onloadpage()
		{
	var msg='<%=(String)request.getParameter("message")%>';
	if(msg!="null")
		{
		alert(msg);
		}
		}
		
		function choseusertype(i)
		{
			if(i==1)
				{
				$("#nagative0").attr("class","active");
				$("#nagative2").attr("class","none");
				$(".info_block").attr("hidden",false);
				$("#visitor_block").attr("hidden",true);

				}
			else
				{
				$("#nagative0").attr("class","none");
				$("#nagative2").attr("class","active");
				$(".info_block").attr("hidden",true);
				$("#visitor_block").attr("hidden",false);
				}
		}
		
</script>
</head>
<body onload="onloadpage()">

	
<div class="page">
		<div class="chose_usertypebox">
<ul class="nav nav-tabs">
  <li role="presentation" class="active"id="nagative0"><a href="#"onclick="choseusertype(1)">17计科登陆查账簿</a></li>
    <li role="presentation" id="nagative2"class="visitor"><a onclick="choseusertype(2)">游客登陆</a></li>
  <li role="presentation" id="nagative1"class="sign"><a href="./sign.jsp">注册</a></li>
</ul>
		</div>
		<div class="info_block">
		<form method="post"action="/jike_banji_guanlifei_manage_system/Login_Serve"class="Login">
			<div class="putonguser">
			
			<div class="name_box">
			<div class="input-group">
  <span class="input-group-addon" id="basic-addon1"> 请输入班级名</span>
  <input type="text" class="form-control" placeholder="ClassName" aria-describedby="basic-addon1"name="entry_name"id="id_name">
			</div>
			</div>
			
			<div class="password_box">
		  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1"> 请输入密码</span>
  <input type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1"name="entry_password"id="id_password">
			</div>
			</div>
			<div class="button_in">
				<input type="submit" class="btn btn-default"value="进入主页面"id="submit"></div>
			</div>

			</form>	
		</div>
		
		<div id="visitor_block"hidden="true">
		<form method="post"action="/jike_banji_guanlifei_manage_system/visitorServer"class="vLogin">
			<div class="putonguser">
			
			<div class="name_box">
			<div class="input-group">
  <span class="input-group-addon" id="basic-addon1"> 请输入班级名</span>
  <input type="text" class="form-control" placeholder="ClassName" aria-describedby="basic-addon1"name="v_name"id="v_name">
			</div>
			</div>
			<div class="button_in">
				<input type="submit" class="btn btn-default"value="进入主页面"id="submitvisitor"></div>
			</div>

			</form>	
		</div>
		
		
</div>
</div>
</body>
</html>