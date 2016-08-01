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
<title>menu</title>
<!-- Bootstrap -->
	<link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/demo.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/resources/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">

	<script src="<%=path%>/resources/lib/jquery-1.11.1.js"></script>
  	<script src="<%=path%>/resources/ztree/js/jquery.ztree.core.min.js" type="text/javascript" ></script>
 	<script src="<%=path%>/resources/ztree/js/jquery.ztree.exedit.min.js" type="text/javascript" ></script>
	<script src="<%=path%>/resources/ztree/js/jquery.ztree.excheck.min.js" type="text/javascript" ></script>
</head>
<body>

<div>
   <ul id="treeDemo" class="ztree"></ul>
</div>

<button type="button" onclick="cl()">hh</button>

  <SCRIPT LANGUAGE="JavaScript">
   var curMenu = null, zTree_Menu = null;
   var zTreeObj;
   // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
   var zNodes = null;
   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
   var setting = {
		async: {
			enable: true,
			url: "/queryMenu"
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
			beforeRemove: zTreeBeforeRemove,
			beforeRename: zTreeBeforeRename,
			onRename: zTreeOnRename,
			onRemove: zTreeOnRemove
		}

   };
  
   
   
   function zTreeBeforeRemove(treeId, treeNode) {
	   if(confirm("确认删除?")){
			return true;
	   }
	   return false;
	}
   function zTreeBeforeRename(treeId, treeNode, newName, isCancel) {
		return newName.length > 2;
	}
   
   function zTreeOnRemove(event, treeId, treeNode) {
	   $.post("/deleteMenu",{id : treeNode.id})
	}
   function zTreeOnRename(event, treeId, treeNode, isCancel) {
	   $.post("/updateMenu",{id : treeNode.id, name : treeNode.name})
	}
   $(document).ready(function(){
      zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
   });
   
   function cl(){
	   var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	   var nodes = treeObj.getCheckedNodes(true);
	   var nodeStr = '';
	   for(i=0;i<nodes.length;i++){
		   nodeStr += nodes[i].menuId + ',';
	   }
	   alert(nodeStr); 
	   console.log(nodeStr);
   }
  </SCRIPT>



</body>
</html>