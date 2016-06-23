<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.lang.*"%> 

<%

%>

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> 
			 <span class="glyphicon glyphicon-tags"></a> <a class="navbar-brand" href="#">图书信息管理系统</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown "><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-expanded="true"> <span class="glyphicon glyphicon-user "></span>&nbsp;
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- <li><a href="changePassword">修改密码</a></li>
						<li class="divider"></li> -->

						<li><a href="logout">logout <span class="glyphicon glyphicon-log-out"></span></a></li>
					</ul></li>

			</ul>
		</div>
	</div>



	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<!-- <li><a href="overview">overview</a></li> -->
				<!-- <li><a href="listCountLog">插件日志</a></li> -->
				

				<li><a href="#">图书</a>
					<ul class="nav nav-second-level">
						<li><a href="book">图书</a></li>
						
						
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

