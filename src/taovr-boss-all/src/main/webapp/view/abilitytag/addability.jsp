<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>新增标签</title>
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
									<label class="mar-t-15">标签名称</label>
		              				<input type="text" class="form-control  mar-t-15 wid310" id="name" placeholder="">
								</div>
								<div class="form-group" style="margin-top:30px;">
									<label>状态</label>
									<label class="inline" style="width:10%;text-align:left;">
				  						<input name="form-field-radio" type="radio" class="ace" value="1" checked>
				  						<span class="lbl"> 启用</span>
									 </label>
									<label class="inline" style="width:10%;text-align:left;">
				  						<input name="form-field-radio" type="radio" class="ace" value="0">
				  						<span class="lbl"> 停用</span>
				 					</label>
								</div>
							</form>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-ok mr10"></i>提交</button>
						<button type="button" class="btn btn-submit" data-toggle="button" id="back"><i class=" icon-undo mr10"></i>关闭</button>
					</div>
				</div>
			</div>	
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>
</body>

<script type="text/javascript">

	$(function(){
		$("#ok").click(function(){
			var data = new XCO();
			var name = $("#name").val();
			if(name){
				data.setStringValue("name",name);
			}else{
				alert("请填写标签名称!!");
				return false;
			}
			
			var state = $('input:radio[name=form-field-radio]:checked').val();
			//$("input[name='form-field-radio']").val();
			if(state){
				data.setStringValue("state",state);
			}else{
				alert("请选择停用还是启用！");
				return false;
			}
			data.setIntegerValue("type",0);
			var options ={
					url:"/tvr-system/insertprojecttag.xco",
					data:data,
					success: function(data){
						if(data.getCode() != 0) {
							alert('doCallBack error:\n' + data);
						}else{
							alert("添加成功！");
					        parent.window.location.href="/view/abilitytag/abilitylist.jsp";
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
					        parent.layer.close(index);
						}
					}
			};
			$.doXcoRequest(options);
			
		});
		
		$("#back").click(function(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
		})
		
	})
</script>
</html>