<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<meta charset="utf-8" />
    <title>系统角色</title>
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
	<div id="main-content" class="clearfix">
		<div id="page-content" class="clearfix">
			<div class="row-fluid"> 
		      <!-- PAGE CONTENT BEGINS HERE -->
		      <div class="row-fluid mar-t-15">
		        <div class="span12">
		          <form class="form-inline bord1dd form-add1">
		            <div class="form-group">
		              <label class="mar-t-15">角色名称</label>
		              <label class="mar-t-15 " style="text-align:left;" id="role_name"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">状态</label>
		              <label class="mar-t-15 " style="text-align:left;" id="state"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">角色说明</label>
		              <label class="mar-t-15 " style="text-align:left;" id="role_desc"></label>
		            </div>
		          </form>
		        </div>
		      </div>
		</div>	
	</div>
	<!-- PAGE CONTENT BEGINS HERE -->
	<div>
        <div class="span12">
          <div class="tc" style="margin-top:40px;">             
            <button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-undo mr10"></i>关闭</button>
          </div>
        </div>
    </div>
</body>
	
	 <script type="text/javascript">
	 			selectOne();
	 			function selectOne(){
	 				var role = new XCO();
	 				role.setIntegerValue("role_id",getURLparam("role_id"));
	 				var options ={
						url:"/tvr-system/queryRoleById.xco",
						data:role,
						success: function(data){
							if (data.getCode() != 0) {
								tvrAlert('doCallBack error:\n' + data);
							}else{
								$("#role_name").text(data.getStringValue("role_name"));
								var state = data.getStringValue("state");
								if(state == 0){
									$("#state").text("停用");
								}else{
									$("#state").text("启用");
								}
								$("#role_desc").text(data.getStringValue("role_desc"));
							}
						}
					};
					$.doXcoRequest(options);
	 			};
	 			
	 			$(function() {	
					//关闭
					$("#ok").click(function(){
						 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                   		 parent.layer.close(index);
					})	
           		})
           		
	</script>
</html>
