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
<title>角色管理</title>
<!-- Bootstrap -->
	<link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/resources/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/demo.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">

	<script src="<%=path%>/resources/lib/jquery-1.11.1.js"></script>
	<script src="<%=path%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.bootstrap.min.js"></script>
	<script src="<%=path%>/resources/jquery-validation/1.11.1/jquery.validate.min.js"></script>
	<script src="<%=path%>/resources/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=path%>/resources/ztree/js/jquery.ztree.core.min.js" type="text/javascript" ></script>
 	<script src="<%=path%>/resources/ztree/js/jquery.ztree.exedit.min.js" type="text/javascript" ></script>
</head>
<body>


				<div id="toolbar">
					<button  type="button" class="btn btn-default" onclick="addManage()">增加</button>
				</div>
				<table id="table"></table>
				<!-- 修改块  start-->
				<div id="wrap">
					<form id="form" method="post" role="form" enctype="multipart/form-data">
						<div class="form-group" hidden="hidden">
							<div class="input-group">
								<label class="input-group-addon" for="mId">ID</label> 
								<input type="text" class="form-control" name="mId" readonly="readonly">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="roleId">角色</label> 
								<select type="text" class="form-control" name="roleId">
									<c:forEach items="${roleMap}" var="role">
										<option value ='${role.key}'>${role.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="managerAccount">名称</label> 
								<input type="text" class="form-control" name="managerAccount">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="realName">真实姓名</label> 
								<input type="text" class="form-control" name="realName" id="realName">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="isLock">是否被锁</label> 
								<select class="form-control" name="isLock" id="isLock" >
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="isDelete">是否删除</label> 
								<select type="text" class="form-control" name="isDelete" id="isDelete" >
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="balance">balance</label> 
								<input type="text" class="form-control" name="balance" id="balance" >
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="addMan">添加人</label> 
								<input type="text" class="form-control" name="addMan" id="addMan" readonly="readonly">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="addTime">添加时间</label> 
								<input type="text" class="form-control" name="addTime" id="addTime" readonly="readonly">
							</div>
						</div>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<a onclick="Item.save()" class="btn btn-primary" id="submitButton">提交</a>
					</form>
				</div>
				<!-- 修改块  end-->


<script>
    $(function() {
    	Item.init();
    	$('#table').bootstrapTable({
    		 toolbar:"#toolbar",
    		 method: 'get',
             url: "<%=path%>/queryManage",
             cache: false,
             height: 600,
             striped: true,
             pagination: true,
             pageSize: 20,
             pageList: [5,10, 25, 50, 100, 200],
             contentType: "application/x-www-form-urlencoded",
             search: true,
             showColumns: false,
             showRefresh: true,
             minimumCountColumns: 2,
             clickToSelect: true,
             singleSelect : false,
             columns: [{
            	 		title: 'ID',
                        field: 'mId',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    },{
                        title: '角色',
                        field: 'roleName',
                        align: 'left',
                        valign: 'middle',
                        sortable: true
                        
                    },{
                        title: '名称',
                        field: 'managerAccount',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '真实姓名',
                        field: 'realName',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '是否被锁',
                        field: 'isLock',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        formatter:function(value){
                        	if(0 == value) return '否';
                        	if(1 == value) return '是';
                        	return value;
                        }
                    },{
                        title: 'balance',
                        field: 'balance',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '是否被删除',
                        field: 'isDelete',
                        align: 'center',
                        valign: 'middle',
                        formatter:function(value){
                        	if(0 == value) return '否';
                        	if(1 == value) return '是';
                        	return value;
                        }
                    },{
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    },{
                        title: '添加人',
                        field: 'addMan',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '添加时间',
                        field: 'addTime',
                        align: 'left',
                        valign: 'middle',
                        sortable: true
                    }]
        })
        
    })
	
    
    function addManage(){
    	$("#wrap").dialog({title:"增加管理员",autoOpen: false});
    	$('#form').form("clear");
    	Item.commitUrl = '${ctx}/insertManage';
		$("#wrap").dialog("open");
    }
    
    function operateFormatter(value, row, index) {
        return ['',
				'<button class="btn btn-default" id="modify" type="botton">修改</button>'
        ].join('');
    }
    window.operateEvents = {
        'click #modify': function (e, value, row, index) {
        	$("#wrap").dialog({title:"修改管理员",autoOpen: false});
        	$('#form').form("clear");
        	
        	Item.commitUrl = '${ctx}/updateManage';
        	
			$('#form').form("load",row);
			$("#wrap").dialog("open");
        }
    };
    var Item = {
			commitUrl : '',
			init : function() {
				$("#wrap").dialog({title:"修改管理员",autoOpen: false});
			},
			save : function() {
				$('#form').form({
					url : Item.commitUrl,
					 onSubmit:function(){ 
						 var result = $(this).validate().form();
						 if(!result){
							 return false;
						 }
				        }, 
					success:function(data){
						 $("#wrap").dialog("close");
						if(data =="success"){
							 $.messager.popup("success!");
							 $('#table').bootstrapTable('refresh');
						}else{
							$.messager.alert("提示", "failed!");
						}
					} 
				});

				if(Item.commitUrl=='${ctx}/updateManage'){
					$.messager.confirm("警告", "确定要更新吗!", function() {
						$('#form').form('submit');
					});
				}
				if(Item.commitUrl=='${ctx}/insertManage'){
					$.messager.confirm("警告", "确定要更新吗!", function() {
						$('#form').form('submit');
					});
				}
				
			}
			
	}
</script>

</body>
</html>