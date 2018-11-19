<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>新增雇主</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<style>
/*提交按钮样式 */
.btn-sub {
	padding: 5px 35px;
	vertical-align: bottom;
	margin-left: 10px;
}

.create-btn {
	padding: 40px 35px 1px;
	line-height: 140px;
}

.wid155 {
	width: 153px;
}

.wid320 {
	width: 323px;
}

.wid107 {
	width: 105px;
}

.align_center {
	text-align: center;
}
/* 备注文本框*/
input.remark {
	width: 540px;
}

table>tbody>tr>td {
	vertical-align: middle !important;
}

table>tbody>tr>td>label>input {
	width: 50px;
	margin-bottom: 0 !important;
}

table>tbody>tr>td>label>select {
	width: 80px;
	margin-bottom: 0 !important;
}
</style>
</head>
<body>
	<div id="main-content" class="clearfix">
		<div class="row-fluid">
			<!-- PAGE CONTENT BEGINS HERE -->
			<div class="row-fluid mar-t-15">
				<div class="span12">
					<form class="form-inline bord1dd form-add1">
						<div class="form-group">
							<label class="mar-t-15">*雇主名称</label> <input id="nick_name" type="text"
								class="form-control  mar-t-15 wid310" placeholder="">
						</div>
						<div class="form-group mar-t-15" >
							<label>性别</label>
							<label class="inline" style="width:7%;text-align:left;">
				  			<input name="sex" type="radio" class="ace" value="男">
				  				<span class="lbl">男</span>
							</label>
							<label class="inline" style="width:7%;text-align:left;">
				  			<input name="sex" type="radio" class="ace" value="女">
				  				<span class="lbl">女</span>
				 			</label>
				 			<label class="inline" style="width:7%;text-align:left;">
				  			<input name="sex" type="radio" class="ace" value="保密" checked>
				  				<span class="lbl">保密</span>
				 			</label>
						</div>
						<div class="form-group mar-t-15">
								<label for=""  class="fl" style="margin-top:3px;">生日</label>
								<div style="width:230px;" class="ml5 input-append date">
									<input class="span10 date-picker" id="birthday" data-date-format="yyyy-mm-dd" type="text">
									<span class="add-on"><i class="icon-calendar"></i></span> 
								</div>
				            </div>
						
							<div class="form-group">
								<label class="mar-t-15">*行业分类</label> 
								<select class="form-control mar-t-15" style="width:105px;" id="first">
								</select> 
								<select class="form-control mar-t-15" style="width:105px;" id="second">
								</select> 
								<select class="form-control mar-t-15 wid107" style="width:105px;" id="third">
								</select>
								<input id="project_catg" disabled type="hidden" class="form-control  mar-t-15 wid310" placeholder="">
							</div>
						
						
						<div class="form-group">
							<label class="mar-t-15">*联系电话</label> <input id="phone" type="text"
								class="form-control  mar-t-15 wid310" placeholder="">
						</div>

						<div class="form-group">
							<label class="mar-t-15">*联系邮箱</label> <input id="email" type="text"
								class="form-control  mar-t-15 wid310" placeholder="">
						</div>
						<div class="form-group">
							<label class="mar-t-15">*雇主地址</label> <select
								class="form-control mar-t-15 wid107" id="proj_province">
							</select> <select class="form-control mar-t-15 wid107"
								id="proj_city">
							</select> <select class="form-control mar-t-15 wid107"
								id="proj_area">
							</select>
						</div>
						<div class="form-group">
							<label class="mar-t-15"></label> <input id="user_addr" type="text"
								class="form-control  mar-t-15 wid310" placeholder="">
						</div>
					</form>
				</div>
			</div>
			<div class="tc mar-t-20">
				<button id="select" type="button" class="btn btn-submit" data-toggle="button">
					<i class=" icon-ok mr10"></i>提交
				</button>
				<button type="button" class="btn btn-submit" data-toggle="button"
					onClick="closeWin()">关闭</button>
			</div>
		</div>

	</div>
	<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
<script src="http://file.demo1.com/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.sparkline.min.js"></script>
<!-- ace scripts -->
<script src="http://file.demo1.com/js/ace-elements.min.js"></script>
<script src="http://file.demo1.com/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
<script src="http://file.demo1.com/jalert/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="http://file.demo1.com/jalert/jquery.alerts.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://file.demo1.com/js/bootstrap-datepicker.min.js" charset="utf-8"></script> 
    <script type="text/javascript" src="http://file.demo1.com/js/bootstrap-timepicker.min.js"></script> 
    <script type="text/javascript" src="http://file.demo1.com/js/date.js"></script> 
    <script type="text/javascript" src="http://file.demo1.com/js/daterangepicker.min.js"></script> 
	<script type="text/javascript">
		$(function() {
			$('.date-picker').datepicker();
			$('#timepicker1').timepicker({
				minuteStep : 1,
				showSeconds : true,
				showMeridian : false
			});
		});
	</script>
</body>
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/selectoption.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/xco3.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/init_industry_catg.js"></script>
<script type="text/javascript">
	init_industry_catg.init();
	$(function() {
		province_city_area.init();
		$("#select").click(function() {
			var xco=new XCO();
			xco.setStringValue("phone",$("#phone").val());//手机号
			xco.setStringValue("nick_name",$("#nick_name").val());//昵称
			xco.setStringValue("gender",$('input:radio[name=sex]:checked').val());//性别
			xco.setStringValue("birthday",$("#birthday").val());//生日
			xco.setStringValue("industry",$("#industry").val());//行业
			xco.setStringValue("email",$("#email").val());//邮箱
			xco.setStringValue("user_province",$("#proj_province").find("option:selected").text());//省
			xco.setStringValue("user_province_code",$("#proj_province").val());//省号
			xco.setStringValue("user_city",$("#proj_city").find("option:selected").text());//市
			xco.setStringValue("user_city_code",$("#proj_city").val());//市号
			xco.setStringValue("user_area",$("#proj_area").find("option:selected").text());//区
			xco.setStringValue("user_area_code",$("#proj_area").val());//区号
			xco.setStringValue("user_addr",$("#user_addr").val());//详细地址
			var options = {
				url : "/userService/addProxyUser.xco",
				data : xco,
				success : getAddProxyUserCallBack
			};
			
			$.doXcoRequest(options);
			
		})
	});
	
	function getAddProxyUserCallBack(data){
	
		if(data.getCode()!=0){
			tvrAlert('doCallBack error:\n' + data.getMessage());
		}else{
			var userid=data.get("user_id");
			var str = $("#nick_name").val();
			if (str == "") {
				alert("新增雇主失败！！！");
				return;
			} else {
				parent.$("#username").val(str);
				parent.$("#userid").val(userid);
				closeWin();
			} 
		}
	}
	//关闭弹窗
	function closeWin() {
		//parent.window.location.href="/view/team/teamlist.jsp";
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	}
</script>
</html>
