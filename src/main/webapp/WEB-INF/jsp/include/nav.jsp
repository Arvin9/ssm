<div class="col-md-3">
	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>

<SCRIPT LANGUAGE="JavaScript">
   var roleId = ${roleId}
   var zTreeObj;
   var zNodes;
   var setting = {
		async: {
			enable: true,
			url: "/queryMenu?roleId="+roleId+""
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
		}
   };

   
   
   $(document).ready(function(){
	  
      zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
      
   });
  </SCRIPT>