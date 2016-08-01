<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
</title>
<!-- Bootstrap -->
	<link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/resources/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/demo.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">

	<script src="<%=path%>/resources/jquery/1.11.1/jquery.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
	<script src="<%=path%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.bootstrap.min.js"></script>
	<script src="<%=path%>/resources/js/modal.js"></script>
	<script src="<%=path%>/resources/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=path%>/resources/ztree/js/jquery.ztree.core.min.js" type="text/javascript" ></script>
 	<script src="<%=path%>/resources/ztree/js/jquery.ztree.exedit.min.js" type="text/javascript" ></script>
</head>
<body>

	<div class="container">
		<!-- 动态包含 -->
		<jsp:include page="include/top.jsp"></jsp:include>
		
		
		<div class="row">
			
			<jsp:include page="include/nav.jsp"></jsp:include>
			
			<div class="col-md-9">
				<iframe id="mainFrame" name="mainFrame" src="" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="650">
				
				</iframe>
				
			</div>
		</div>
		
	</div>
	
		

</body>
</html>