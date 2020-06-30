<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/boot-crm.css"
	type=text/css rel=stylesheet>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<script>
		
	//注册
	function register(){
		var username = $("#username").val();
	    var usercode = $("#usercode").val();
	    var password = $("#password").val();
	    if(usercode=="" || password==""||username==""){
	    	$("#message").text("个人信息不能为空！");
	        return false;
	    }  
	    return true;
	}
	
</script>
</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="${pageContext.request.contextPath}/images/rightbg.jpg">
	<div ALIGN="center">
		<table border="0" width="1140px" cellspacing="0" cellpadding="0"
			id="table1">
			<tr>
				<td height="93"></td>
				<td></td>
			</tr>
			<tr>
				<td
					background="${pageContext.request.contextPath}/images/rights.jpg"
					width="740" height="412"></td>
				<td class="login_msg" width="400" align="center">
					<!-- margin:0px auto; 控制当前标签居中 -->
					<fieldset style="width: auto; margin: 0px auto;">
						<legend>
							<font style="font-size: 15px" face="宋体"> 欢迎使用BOOT客户管理系统 </font>
						</legend>
						<font color="red"> <%-- 提示信息--%> <span id="message">${msg}</span>
						</font>
						
						<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
						<form action="${pageContext.request.contextPath }/addUser.action" method="post" onsubmit="return register()">
					<br/><br/>  姓&nbsp;名：<input id="username" type="text" name="username" /><br /> <br />
							        账&nbsp;号：<input id="usercode" type="text" name="usercode" /> <br /> <br />
								密&nbsp;码：<input id="password" type="password" name="password" />
								<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
								<input type="submit" value="注册"  onClick="register()"/>&nbsp;&nbsp;&nbsp;							
						</form>
						
					</fieldset>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
