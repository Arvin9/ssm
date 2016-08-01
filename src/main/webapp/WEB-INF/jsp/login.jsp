<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<base href="<%=basePath%>">

		<title>Nebula</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap -->
		<link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet">
		
		
		 <!-- Custom styles for this template -->
    	<link href="<%=path%>/resources/css/signin.css" rel="stylesheet">
		<script src="<%=path%>/resources/jquery/1.11.1/jquery.min.js"></script>
		<script src="<%=path%>/resources/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
		<script src="<%=path%>/resources/bootstrap-jquery/jquery.bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/dropdown.js"></script>
		<script src="<%=path%>/resources/js/md5.min.js"></script>
  </head>
  
  <body>
		<div class="container">
			
			<form class="form-signin" id="form" action="login" method="post">
				<h2 class="form-signin-heading">
					Please sign in
				</h2>
				<label for="inputEmail" class="sr-only">
					Email address
				</label>
				<input type="text" id="managerAccount" name="managerAccount" class="form-control"
					 required autofocus>
				<label for="inputPassword" class="sr-only">
					Password
				</label>
				<input type="password" id="password" name="password" class="form-control"
					placeholder="Password" required>
				<div class="checkbox">
					<label>
						<input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="button" onclick="login()">
					Sign in
				</button>
			</form>
		</div>
		<!-- /container -->
		<script>
		var message = "${message}"
		if("no" == message){
			$.messager.alert("警告","无此用户");
		}else if("error" == message){
			$.messager.alert("警告","密码错误");
		}
		function login(){
			var managerAccount = $('#managerAccount').val();
			var password = md5($('#password').val());
			$('#password').val(password);
			$('#form').submit();
			
		}
		</script>		
		
	</body>
</html>
