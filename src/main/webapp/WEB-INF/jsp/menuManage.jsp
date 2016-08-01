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
					<button  type="button" class="btn btn-default" onclick="addMenu()">增加</button>
				</div>
				<table id="table"></table>
				<!-- 修改块  start-->
				<div id="wrap">
					<form id="form" method="post" role="form" enctype="multipart/form-data">
						<div class="form-group" hidden="hidden">
							<div class="input-group">
								<label class="input-group-addon" for="id">ID</label> 
								<input type="text" class="form-control" name="id" readonly="readonly">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="menuName">菜单名称</label> 
								<input type="text" class="form-control" name="menuName">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="menuId">菜单ID</label> 
								<input type="text" class="form-control" name="menuId">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="parentId">父节点ID</label> 
								<input type="text" class="form-control" name="parentId">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="menuUrl">菜单Url</label> 
								<input type="text" class="form-control" name="menuUrl" id="menuUrl">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="available">有效状态</label> 
								<select class="form-control" name="available" id="available" >
									<option value="1">有效</option>
									<option value="0">无效</option>
								</select>
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
             url: "<%=path%>/queryMenu",
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
                        field: 'id',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    },{
                        title: '菜单名称',
                        field: 'menuName',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '菜单ID',
                        field: 'menuId',
                        align: 'left',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '父节点 ID',
                        field: 'parentId',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '菜单Url',
                        field: 'menuUrl',
                        align: 'left',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '有效状态',
                        field: 'available',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        formatter:function(value){
                        	if(0 == value) return '无效';
                        	if(1 == value) return '有效';
                        	return value;
                        }
                    },{
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    }]
        })
        
    })
    
    function addMenu(){
    	$("#wrap").dialog({title:"增加菜单",autoOpen: false});
    	$('#form').form("clear");
    	Item.commitUrl = '${ctx}/insertMenu';
    	$('#roleIdDiv').hide();
    	$('#roleName').removeAttr("readonly");
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
        	
        	Item.commitUrl = '${ctx}/updateMenu';
        	
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

				if(Item.commitUrl=='${ctx}/updateMenu'){
					$.messager.confirm("警告", "确定要更新吗!", function() {
						$('#form').form('submit');
					});
				}else if(Item.commitUrl=='${ctx}/insertMenu'){
					$.messager.confirm("警告", "确定要更新吗!", function() {
						$('#form').form('submit');
					});
				}
				
			}
			
	}

</script>

</body>
</html>