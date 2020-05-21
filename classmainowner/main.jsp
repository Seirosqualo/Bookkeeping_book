<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户主页面</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
		function chosechecktype(i)
		{
			
			if(i==0)//支出显示
			{
				$("#addin").attr("hidden",true);
				$("#addpay").attr("hidden",false);
				$("#paychose").attr("class","active");
				$("#inchose").attr("class","none");
			}
			else//显示收入
			{
				$("#addin").attr("hidden",false);
				$("#addpay").attr("hidden",true);
				$("#paychose").attr("class","none");
				$("#inchose").attr("class","active");
				
			}
		}
		function getoutselectvalue()
		{
			var selectednum=document.getElementById("selectoutgroup").selectedIndex;
			//alert(selectednum);
			var value=document.getElementById("selectoutgroup").options[selectednum].value;
			$("#outtypevalue").val(value);
		}
		function getselectbackvalue()
		{
			var selectednum=document.getElementById("selectbackgroup").selectedIndex;
			//alert(selectednum);
			var value=document.getElementById("selectbackgroup").options[selectednum].value;
			$("#backtypevalue").val(value);
		}
		$(function()
				{
				//	alert(	document.getElementById("id_name").innerHTML);
				var msg='<%=request.getParameter("message")%>';
				if(msg!="null")
					{
					alert(msg);
					}
				$("#modpassword").click(function()
						{
					window.location.href="/jike_banji_guanlifei_manage_system/classmainowner/mopassword.jsp";
						});
				
				$("#addpaybutton").click(function()
				{
					if($("#outtypevalue").val()==null||$("#outtypevalue").val()=="")
						{
						alert("支付类型不能为空");
						$("#payform").attr("onsubmit","return false");
						}
					else if($("#paymoney").val()==null||$("#paymoney").val()=="")
						{
						alert("支付钱数不能为空");
						$("#payform").attr("onsubmit","return false");
						}
					else if($("#payintro").val()==null||$("#payintro").val()=="")
					{
						alert("支付介绍不能为空");
						$("#payform").attr("onsubmit","return false");
					}
					else if($("#paytime").val()==null||$("#paytime").val()=="")
					{
						alert("支付时间不能为空");
						$("#payform").attr("onsubmit","return false");
					}
					else
						{
						
						$("#payform").attr("onsubmit","return true");
						}
				}		
				);
				
				$("#addbackbutton").click(function()	
				{
					if($("#backtypevalue").val()==null||$("#backtypevalue").val()=="")
					{
					alert("收入类型不能为空");
					$("#backform").attr("onsubmit","return false");
					}
				else if($("#backmoney").val()==null||$("#backmoney").val()=="")
					{
					alert("收入钱数不能为空");
					$("#backform").attr("onsubmit","return false");
					}
				else if($("#backintro").val()==null||$("#backintro").val()=="")
				{
					alert("收入介绍不能为空");
					$("#backform").attr("onsubmit","return false");
				}
				else if($("#backtime").val()==null||$("#backtime").val()=="")
				{
					alert("收入时间不能为空");
					$("#backform").attr("onsubmit","return false");
				}
				else
					{
					
					$("#backform").attr("onsubmit","return true");
					}
				})
				});
		function checkdetail()
		{
			window.location.href="./detailbill.jsp";
		}
</script>
</head>

<body>
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
<span style="padding: 10px;font-size: 24px;">17计科记账簿</span>
<span id="id_name"><%=session.getAttribute("id_name") %></span>
 <input type="button" class="btn btn-default"value="修改密码"style="padding: 5px;float: right;margin-left: 1000px;margin-top: 5px;"id="modpassword"value="修改密码">
    </div>
  </div>
</nav>

<div style="float: right;margin:10px">现有班费为：
 <span style="	color: red;"id="nowmoney"><%=request.getSession().getAttribute("summoneyvalue") %> </span> 
 <button class="btn btn-default" onclick="checkdetail()"> <span class="glyphicon glyphicon-arrow-right"></span><span>查看明细</span></button>
</div>

<div align="center"style="margin:50px ;">
	<div style="margin: 30px;font-size: 18px;width: 500px;font: '微软雅黑';">添加一条账单</div>
	
	<div style="width: 500px;">
<ul class="nav nav-tabs">
  <li role="presentation" class="active"id="paychose"style="width: 250px;"><a href="#" onclick=" chosechecktype(0)">支出</a></li>
  <li role="presentation"id="inchose"style="width: 250px;"><a href="#"onclick="chosechecktype(1)">收入</a></li>
</ul>
	</div>
	
	<div>
		
		<!--
    	支出
        -->
<div id="addpay"style="margin: 15px;">
<form action="/jike_banji_guanlifei_manage_system/addbillServer?sendtype=out"method="post"id="payform">
<div id="type"style="margin:30px">
	支出类别：<input type="text"width="80px"id="outtypevalue"name="paytype"readonly="readonly">
		<select onchange="getoutselectvalue()"id="selectoutgroup">
		<option>食品</option>
		<option>生活用品</option>
		<option>书本</option>
	</select>
</div>

<div>
	支出钱数：<input type="text"id="paymoney"name="paymoney"placeholder="例如：10"style="color:grey"> <span class="label label-primary"style="font-size: 12px;">人名币</span>
</div>

<div style="margin: 30px;">
	简介用途：&emsp;<input type="text"placeholder="例如：聚餐"id="payintro"name="payintro"style="color:grey">
</div>

<div>
	支出时间：<input type="date"id="paytime" name="paytime"placeholder="例如:2019-10-1"/>
</div>

<div>
	<input type="submit"value="提交"class="btn btn-default" style="margin: 20px;"id="addpaybutton"/>
</div>

</form>
</div>

<!--收入-->
<div id="addin" hidden="true">
	<form action="/jike_banji_guanlifei_manage_system/addbillServer?sendtype=back"method="post"id="backform">
<div id="type"style="margin:30px">
	收入类别：<input type="text"width="80px"id="backtypevalue"name="backtype"readonly="readonly">
		<select onchange="getselectbackvalue()"id="selectbackgroup">
		<option>食品</option>
		<option>生活用品</option>
		<option>书本</option>
		<option>其他</option>
	</select>
</div>

<div>
	收入钱数：<input type="text"name="backmoney"id="backmoney"placeholder="例如：10"style="color:grey"> <span class="label label-primary"style="font-size: 12px;">人名币</span>
</div>

<div style="margin: 30px;">
	简介用途：&emsp;<input type="text"placeholder="例如：班费"id="backintro"name="backintro"style="color:grey">
</div>

<div>
	收入时间：<input type="date"id="backtime" name="backtime"placeholder="例如:2019-10-1"/>
</div>

<div>
	<input type="submit"value="提交"class="btn btn-default" style="margin: 20px;"id="addbackbutton"/>
</div>
</form>
</div>
	</div>
	
	</body>
</html>