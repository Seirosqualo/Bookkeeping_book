<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function setchecktype(i)
	{
		//按分类查看
		if(i==0)
		{
			$("#groupbytype").attr("class","active");
			$("#groupbytime").attr("class","none");
			$("#cbytime").attr("hidden",true);
			$("#cbycategory").attr("hidden",false);
			$.ajax({
				url:"./getbill_info",
				 type:"post",
				dataType:"text",//必须
						 "success":function(msg)
						 {		
							 $("#tbodytable").html("");
							$("#tbodytable").append(msg);
						 },
			
			 "error":function(xhr,state,error)
			 {
				 alert("失败,当前"+state+" error:"+error);
			 }
		})

		}
		//按时间查看
		else
		{
			$("#groupbytype").attr("class","none");
			$("#groupbytime").attr("class","active");
			$("#cbytime").attr("hidden",false);
			$("#cbycategory").attr("hidden",true);
			var begintime=$("#begintime").val();
			var endtime=$("#endtime").val();
			var inputData={'begintime':begintime,'endtime':endtime};
		$.ajax({
				url:"./getbill_info2",
				 type:"post",
				 data:inputData,
				dataType:"text",//必须
						 "success":function(msg)
						 {		
							 $("#timebill").html("");
							$("#timebill").append(msg);
						 },
			
			 "error":function(xhr,state,error)
			 {
				 alert("失败,当前"+state+" error:"+error);
			 }
		})	
		}
	}
	function changetimecheckmethod()
	{
		var i=document.getElementById("timecheckmethod").selectedIndex;
		$("#showtimecheck").val(document.getElementById("timecheckmethod").options[i].value);
	
	}
	$(function()	
	{
		$.ajax({
			url:"./getbill_info",
			 type:"post",
			dataType:"text",//必须
					 "success":function(msg)
					 {			
						 $("#tbodytable").html("");
						$("#tbodytable").append(msg);
					 },
		
		 "error":function(xhr,state,error)
		 {
			 alert("0失败,当前"+state+" error:"+error);
		 }
	})
	})
		function searchperitime()
	{
	
		var begintime=$("#begintime").val();
		var endtime=$("#endtime").val();
		var inputData={'begintime':begintime,'endtime':endtime};
	$.ajax({
			url:"./getbill_info2",
			 type:"post",
			 data:inputData,
			dataType:"text",//必须
					 "success":function(msg)
					 {		
						 $("#timebill").html("");
							$("#timebill").append(msg);
					 },
		
		 "error":function(xhr,state,error)
		 {
			 alert("失败,当前"+state+" error:"+error);
		 }
	})
			
	}
</script>	
</head>
<body>

<div style="margin: 40px;">
 <ul class="nav nav-pills">
  <li role="presentation" class="active"id="groupbytype"><a onclick="setchecktype(0)">按分类查看</a></li>
  <li role="presentation"id="groupbytime"><a onclick="setchecktype(1)">按时间查看</a></li>
</ul>
<div style="float: right;">
<span class="label label-success">
<%=session.getAttribute("id_name") %>
</span>
</div>

</div>

<div id="cbycategory">
<div id="typeyip"style="margin: 20px;color: #483D8B;float: right;">
	支出:<span id="paymoney"style="color:green"><%=request.getSession().getAttribute("sumpaymoney") %>&emsp;&emsp;</span>
	收入:<span id="backmoney"style="color:red"><%=request.getSession().getAttribute("sumbackmoney") %></span>
	共计:<span id="nowsummoney"><%=request.getSession().getAttribute("sumnowmoney") %></span>
</div>

<div>
<div style="margin: 10px;">
	<table class="table table-bordered">
  <caption style="color: #483D8B;">分类查看:</caption>
  <thead>
    <tr>
      <th>使用类别</th>
      <th>介绍</th>
      <th>消费/支出</th>
      <th>时间</th>
    </tr>
  </thead>
  <tbody id="tbodytable">
  	
   
    
  </tbody>
</table>
</div>
</div>


</div>


<div hidden="true" id="cbytime" >

<div id="timetip"style="margin: 20px;color: #483D8B;float: right;">
	<div style="margin: 5px;">
	选择您要查看的时间段：
	</div>
	<div >
		开始时间:<input type="date"style="margin: 5px;"id="begintime"placeholder="例如2019-1-1"/>
	</div>
	<div>
	结束时间:<input type="date" style="margin: 5px;"id="endtime"placeholder="例如2019-12-1"/>
	</div>
	<div><input type="button"onclick="searchperitime()"value="确定"/></div>
</div>

<div id="timebill">

</div>
</div>


</body>
</html>