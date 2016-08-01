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
	<link href="<%=path%>/resources/jquery-validation/1.11.1/validate.css" rel="stylesheet">

	<script src="<%=path%>/resources/lib/jquery-1.11.1.js"></script>
	<script src="<%=path%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
	<script src="<%=path%>/resources/js/jquery.bootstrap.min.js"></script>
	<script src="<%=path%>/resources/js/modal.js"></script>
	<script src="<%=path%>/resources/jquery-validation/1.11.1/jquery.validate.min.js"></script>
	<script src="<%=path%>/resources/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=path%>/resources/ztree/js/jquery.ztree.core.min.js" type="text/javascript" ></script>
 	<script src="<%=path%>/resources/ztree/js/jquery.ztree.exedit.min.js" type="text/javascript" ></script>
	<script src="<%=path%>/resources/ztree/js/jquery.ztree.excheck.min.js" type="text/javascript" ></script>
</head>
<body>
				
				<div id="toolbar">
					<button  type="button" class="btn btn-default" onclick="addRole()">增加</button>
				</div>
				<table id="table"></table>

				<!-- 修改块  start-->
				<div id="wrap" >
					<form id="form" method="post" role="form"
						enctype="multipart/form-data">
						<div class="form-group"  id="roleIdDiv">
							<div class="input-group">
								<label class="input-group-addon" for="roleId">角色ID</label> 
								<input type="text" class="form-control" name="roleId" id="roleId" readonly="readonly">
								
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="roleName">角色名称</label> 
								<input type="text" class="form-control" name="roleName" id="roleName" required="required">
							</div>
						</div>
						<div class="form-group" >
							<div class="input-group">
								<label class="input-group-addon" for="ownMenus">所属菜单</label> 
								<input type="text" class="form-control" name="ownMenus" id="ownMenus" readonly="readonly">
							</div>
							<div>
								<ul id="editTree" class="ztree"></ul>
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
             url: "<%=path%>/queryRole",
             cache: false,
             height: 600,
             striped: true,
             pagination: true,
             pageSize: 20,
             pageList: [5,10, 25, 50, 100, 200],
             contentType: "application/x-www-form-urlencoded",
             search: true,
             showColumns: true,
             showRefresh: true,
             minimumCountColumns: 2,
             clickToSelect: true,
             singleSelect : false,
             columns: [{
            	 		title: '角色ID',
                        field: 'roleId',
                        align: 'center',
                        valign: 'middle',
                        visible : false
                    },{
                        title: '角色名称',
                        field: 'roleName',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },{
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    },{
                        title: '所属菜单',
                        field: 'ownMenus',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
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
    
    
    function addRole(){
    	$("#wrap").dialog({title:"增加角色",autoOpen: false});
    	$('#form').form("clear");
    	Item.commitUrl = '${ctx}/insertRole';
    	$('#roleIdDiv').hide();
    	$('#roleName').attr("required","required");
    	$('#roleName').removeAttr("readonly");
    	zTreeInit();
		$("#wrap").dialog("open");
    }
    
    function operateFormatter(value, row, index) {
        return ['',
				'<button class="btn btn-default" id="modify" type="botton">修改</button>'
        ].join('');
    }
    window.operateEvents = {
        'click #modify': function (e, value, row, index) {
        	$("#wrap").dialog({title:"修改角色",autoOpen: false});
        	$('#form').form("clear");
        	Item.commitUrl = '${ctx}/updateRole';
        	$('#roleIdDiv').show();
        	
			$('#form').form("load",row);
			zTreeInit();
			$("#wrap").dialog("open");
        }
    };
   
    var Item = {
			commitUrl : '',
			init : function() {
				$("#wrap").dialog({title:"操作",autoOpen: false});
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

				if(!$('#url').val()=='' && !$('#url').val().startsWith('http')){
					$.messager.popup('url必须是http/https开头！');
					return false;
				}else if(Item.commitUrl=='${ctx}/updateRole'){
					$.messager.confirm("警告", "确定要更新吗!", function() {
						$('#form').form('submit');
					});
				}else if(Item.commitUrl=='${ctx}/insertRole'){
					$.messager.confirm("警告", "确定要增加吗!", function() {
						$('#form').form('submit');
					});
				}else{
					$('#form').form('submit');
				}
				
			}
			
	}

</script>

  <SCRIPT LANGUAGE="JavaScript">
  
  
  function getAsyncUrl(treeId, treeNode) {
		var roleId = $('#roleId').val();
		var url;
		if(null == roleId){
			url = "/queryMenuEdit";
		}else{
			url = "/queryMenuEdit?roleId="+roleId+"";
		}
		return url;
	};

   function zTreeInit(){
	   var zTreeObjEdit;
	   // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
	   var zNodesEdit = null;
	   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	   
				   
			   
	   var settingEdit = {
				async: {
					enable: true,
					url: getAsyncUrl
				},
				check: {
					enable: true,
					chkStyle: "checkbox",
					chkboxType: { "Y": "ps", "N": "ps" }
				},
				data: {
					key: {
						name: "menuName",
						url: "menuUrl"
					},
					simpleData: {
						enable: true,
						idKey: "menuId",
						pIdKey: "parentId",
						rootPId: "root"
					}
				},
				callback: {
					beforeCheck: zTreeBeforeCheck,
					onCheck: zTreeOnCheck
				}

		   };
	   
	      zTreeObjEdit = $.fn.zTree.init($("#editTree"), settingEdit, zNodesEdit);
   };
	
   
  
   function zTreeBeforeCheck(treeId, treeNode) {
	    return true;
	}
   
   function zTreeOnCheck(){
	   var treeObj = $.fn.zTree.getZTreeObj("editTree");
	   var nodes = treeObj.getCheckedNodes(true);
	   var nodeStr = '';
	   for(i=0;i<nodes.length;i++){
		   nodeStr += nodes[i].menuId + ',';
	   }
	   $('#ownMenus').val(nodeStr);
   }
  </SCRIPT>

</body>
</html>