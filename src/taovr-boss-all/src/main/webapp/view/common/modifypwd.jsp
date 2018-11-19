<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
   	<meta charset="utf-8" />
    <title>基本信息-人员信息</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
<!-- -->
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
<script type="text/javascript">
	 
	$(function() {	
		//确定
		$("#ok").click(function(){
			var xco = new XCO();
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			if(pwd1){
				xco.setStringValue("pwd1",pwd1);
			}else{
				jAlert("请输入新密码!","警告提示");
				return;
			}
			
			if(pwd2){
				xco.setStringValue("pwd2",pwd2);
			}else{
				jAlert("请再次输入新密码!","警告提示");
				return;
			}
			
			if(pwd2 != pwd1){
				jAlert("两次密码输入不一致!","警告提示");
				return;
			}
			
			var options = {
				url: "/tvr-plateform/changepwd.xco",
				data: xco,
				success: manage
			};
			
			$.doXcoRequest(options);
			
		});
		
		$("#closewin").click(function(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			parent.layer.close(index);	
		});
   });
        		
           		
			
				

               
</script>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="user"
		sub-page="anquan">
		
		<div id="page-content" class="clearfix">
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="form-inline bord1dd form-add1" >
								<div class="form-group">
									<label class="mar-t-15">请输入新密码</label>
									<input id="pwd1" type="password" class="form-control  mar-t-15" style="height:32px;" placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">请再次输入新密码</label>
									<input id="pwd2" type="password" class="form-control  mar-t-15" style="height:32px;" placeholder="">
								</div>
							</div>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button id="tijiao_btn" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>提交
						</button>
						<button id="closewin" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>返回
						</button>
					</div>
				</div>
			</div>
	</div>
		
</body>
</html>
