<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
   	<meta charset="utf-8" />
    <title>系统用户</title>
    <!-- basic styles -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
	<!--[if IE 7]>
	    <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
	    <![endif]-->
	<!-- page specific plugin styles -->
	
	<!-- ace styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
	<!--[if lt IE 9]>
	    <link rel="stylesheet" href="css/ace-ie.min.css" />
	    <![endif]-->
	<!-- 自己的样式-->
	<link rel="stylesheet" href="/${pageContext.request.contextPath}libs/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
	<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">
	<!-- basic scripts -->
	<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
	<script src="http://file.demo1.com/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->
	
	<!--[if lt IE 9]>
	<script type="text/javascript" src="http://file.demo1.com/js/excanvas.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script src="http://file.demo1.com/jalert/jquery.ui.draggable.js" type="text/javascript"></script>
	<script src="http://file.demo1.com/jalert/jquery.alerts.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/bootstrap-datepicker.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/bootstrap-timepicker.min.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/date.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/daterangepicker.min.js"></script>
	<!-- ace scripts -->
	<script src="http://file.demo1.com/js/ace-elements.min.js"></script>
	<script src="http://file.demo1.com/js/ace.min.js"></script>
	
	<script type="text/javascript" src="http://file.demo1.com/js/xco3.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
	
	<script type="text/javascript" src="http://file.demo1.com/layer/layer.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>

</head>
<body>	
		<div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-body">
                  <form action="" class="form-inline" style="background: none;padding: 10px;">
                      <div class="form-group">
                          <label for="exampleInputName2" class="mar-t-15">管理员名称</label>
                          <input type="text" class="form-control" style="height:30px !important;" id="name" placeholder=""/>
                          <label for="exampleInputName2" class="mar-t-15">用户状态</label>
                          <select  id="state">
                              <option value="1">启用</option>
                              <option value="0">停用</option>
                          </select>
                      </div>
                      <div class="form-group">
			              <label>管理员描述</label>
			              <textarea class="form-control" style="margin-top:40px;width:525px;" rows="4" id="manager_desc"></textarea>
			          </div>
                  </form>
                  <div class="row-fluid">
                      <div class="span12">
                          <label for="form-field-8" style="color:red;">选择角色</label>
                          <table id="table_bug_report" class="table table-striped table-bordered table-hover font-s-14-imp">
                              <thead>
	                              <tr>
	                                  <th class="center">角色名称</th>
	                                  <th class="center">选择</th>
	                              </tr>
                              </thead>
                              <tbody id="content">
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div>
        <div class="tc" style="margin-top:40px;text-aling:center;">             
          <button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-ok mr10"></i>提交</button>
          <button type="button" class="btn btn-submit" data-toggle="button" id="cancel"><i class=" icon-undo mr10"></i>关闭</button>
        </div>
      </div>
</body>
	
	 <script type="text/javascript">
	 
	 			$(function() {	
					doSubmit();
					
					$("#cancel").click(function(){
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                   		parent.layer.close(index);
					});
					
					//确定
					$("#ok").click(function(){
						var xco = new XCO();
			
						var name = $("#name").val();
						if(name){
							xco.setStringValue("name",name);
						}else{
							tvrAlert("管理员名称为空！！！");
							return;
						}
						var state = $("#state").val();
						if(state){
							xco.setStringValue("state",state);
						}else{
							tvrAlert("请选择管理员状态！！！");
							return;
						}
						var flag = 0;
						$('input:checkbox').each(function (index, domEle) {
							if($(domEle).prop("checked")){
								flag = flag | $(domEle).val();
							}
						});
						if(flag == 0){
							tvrAlert("请选择角色！！！");
							return;
						}else{
							xco.setIntegerValue("sys_role_ids",flag);
						}
						var url='';
						var id = getURLparam("id") == null?0:getURLparam("id");
						if(id){
							url="/tvr-system/updateSysUser.xco";
							xco.setIntegerValue("id",id);
						}else{
							url="/tvr-system/insertSysUser.xco";
						}
						xco.setStringValue("manager_desc",$("#manager_desc").val());
						var options ={
							url:url,
							data:xco,
							success: function(result){
								if(result.getCode() != 0) {
									tvrAlert('doCallBack error:\n' + result);
								}else{
									tvrAlert("操作成功！");
							        parent.window.location.href="/view/systemuser/userlist.jsp";
									var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
							        parent.layer.close(index);
								}
							}
						};
						$.doXcoRequest(options);
					})
           		})
           		
           		function doSubmit(){
					var xco=new XCO();
					var url = '';
					var id = getURLparam("id") == null?0:getURLparam("id");
					if(id){
						url="/tvr-system/findRoleList.xco";
					}else{
						url="/tvr-system/findRoleSingle.xco";
					}
					xco.setIntegerValue("id",id);
		  			var options ={
							url:url,
							data:xco,
							success: manage
					};
					$.doXcoRequest(options);					
				}
				
				function manage(xco){
					var role = 0;
					var user=xco.getXCOListValue("user");
					if(user){
						$("#name").val(user.getObjectValue("name"));
						$("#state").val(user.getObjectValue("state"));
						$("#manager_desc").val(user.getObjectValue("manager_desc"));
						$("#pwd").val(user.getObjectValue("pwd"));
						role = user.getObjectValue("role")
					}
	                $("#content").html("");
					var values=xco.getXCOListValue("rolelist");
					if(values){
						var tdIndex = 1;
						for ( var i = 0; i < values.length; i++) {
							if(role){
								if(role & values[i].getObjectValue("role_id")){
									$("#content").append('<tr>'
										+'<td>'+values[i].getObjectValue("role_name")+'</td>'
										+'<td><label><input type="checkbox" checked="checked" value='+values[i].getObjectValue("role_id")+' class="ace-checkbox-2"/><span class="lbl"></span></label></td>'
										+'</tr>')
								}else{
									$("#content").append('<tr>'
										+'<td>'+values[i].getObjectValue("role_name")+'</td>'
										+'<td><label><input type="checkbox" value='+values[i].getObjectValue("role_id")+' class="ace-checkbox-2"/><span class="lbl"></span></label></td>'
										+'</tr>')
								}
							}else{
								$("#content").append('<tr>'
										+'<td>'+values[i].getObjectValue("role_name")+'</td>'
										+'<td><label><input type="checkbox" value='+values[i].getObjectValue("role_id")+' class="ace-checkbox-2"/><span class="lbl"></span></label></td>'
										+'</tr>')
							}
						}
					}
				}  

               
</script>
</html>
