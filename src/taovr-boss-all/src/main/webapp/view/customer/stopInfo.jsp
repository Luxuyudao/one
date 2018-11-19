<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>会员管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
	
	<!-- basic scripts -->
	<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
	<script src="http://file.demo1.com/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->

	<!--[if lt IE 9]>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>
            <![endif]-->

	<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
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
	
	<script type="text/javascript" src="http://file.demo1.com/js/xco2.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco-src2.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
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
		              <label class="mar-t-15">注册手机</label>
		              <label class="mar-t-15 " style="text-align:left;" id="phone"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">停用原因</label>
		              <textarea class="form-control  mar-t-15 wid310" rows="4" id="reason"></textarea>
		            </div>
		            <div class="form-group">
		            	<label class="mar-t-15"></label>
		               <label class="mar-t-15 " style="width:240px;text-align:center;color:red;">注意：停用后，用户无法登陆。</label>
					<div>
		          </form>
		        </div>
		      </div>
		</div>	
	</div>
	<!-- PAGE CONTENT BEGINS HERE -->
	<div>
        <div class="span12">
          <div class="tc" style="margin-top:40px;">             
            <button type="button" class="btn btn-submit" data-toggle="button" id="stop"><i class=" icon-ok mr10"></i>提交</button>
            <button type="button" class="btn btn-submit" data-toggle="button" id="back"><i class=" icon-undo mr10"></i>关闭</button>
          </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript">
	var phone = getURLparam("phone");
	$(function(){
		$("#phone").text(phone);
		$("#stop").click(function(){
			var xco=new XCO();
			var reason = $("#reason").val();
			if(reason){
				xco.setStringValue("reason", reason);
			}else{
				tvrAlert("请填写停用原因！");
				return false;
			}
			xco.setIntegerValue("user_id", getURLparam("user_id"));
			xco.setIntegerValue("user_state", 0);
			var options ={
					url:"/tvr-user/userStop.xco",
					data:xco,
					success: function(result){
						if(result.getCode() != 0) {
							tvrAlert('doCallBack error:\n' + result);
						}else{
							tvrAlert("停用成功！");
					        parent.window.location.href="../../view/customer/userManage.jsp";
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
					        parent.layer.close(index);
						}
					}
			};
			jConfirm("确定要停用该用户?","确认框", function(r) {
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
		$("#back").click(function(){
			closeWin();
		})
	})
	
	//关闭弹窗
	function closeWin(){
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
	}
	
</script>
</html>