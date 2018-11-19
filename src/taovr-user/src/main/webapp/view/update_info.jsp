<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>修改信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="user" sub-page="geren">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li><a href="账户设置-个人信息.html">个人信息</a><span class="divider"><i
						class="icon-angle-right"></i> </span>
				</li>
				<li>修改信息</li>
			</ul>
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>修改信息</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label></label> <img id="user_img" alt="150x150" height="120"
									width="120" src="../images/thumb-6.jpg">
							</div>
							<form action="/uploadImage.xco" enctype="multipart/form-data"
								method="post" target="hidden_frame">
								<div class="form-group mar-t-15">
									<label></label> <input id="file" type="file" name="file1">
								</div>
								<div class="form-group mar-t-15">
									<label></label> <input type="submit" value="提交">
								</div>
							</form>
							<iframe name="hidden_frame" id="hidden_frame"
								style="display: none;"></iframe>
							<div class="form-group">
								<label class="mar-t-15">昵称</label> <input id="nick_name"
									type="text" class="form-control  mar-t-15 wid310" value=""
									placeholder="">
							</div>
							<div class="form-group mar-t-15">
								<label>性别</label> <label style="width:4%;"> <input
									name="sex" type="radio" value="男"> <span class="lbl">
										男</span> </label> <label style="width:4%;"> <input name="sex"
									type="radio" value="女"> <span class="lbl"> 女</span> </label> <label
									style="width:5%;"> <input name="sex" type="radio"
									value="保密"> <span class="lbl"> 保密</span> </label>
							</div>
							<div class="form-group overhidden">
								<label class="fl mt20">生日</label>
								<div style="width:357px;"
									class="row-fluid mar-t-15 ml5 input-append date fl">
									<input class="span10 date-picker wid296" id="birthday"
										type="text" data-date-format="yyyy-mm-dd"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>
							<div class="form-group mar-t-15">
								<label>行业</label> <input id="industry" type="text"
									class="form-control  mar-t-15 wid310" value="" placeholder="">
							</div>
							<div class="form-group mar-t-15">
								<label>联系电话</label> <input id="contact_phone" type="text"
									class="form-control  mar-t-15 wid310" value="" placeholder="">
							</div>
							<div class="form-group">
								<label class="mar-t-15">联系地址</label> 
								<select class="form-control mar-t-15" style="width:105px;" id="proj_province">
								</select> 
								<select class="form-control mar-t-15" style="width:105px;" id="proj_city">
								</select> 
								<select class="form-control mar-t-15 wid107" style="width:105px;" id="proj_area">
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15"></label> <input id="user_addr"
									type="text" class="form-control  mar-t-15 wid310"
									placeholder="">
							</div>
							<div class="form-group mar-t-15">
								<label>邮箱地址</label> <input id="email" type="text"
									class="form-control wid310" value="" placeholder="">
							</div>
						</div>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">
						<i class=" icon-edit mr10"></i>保存
					</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript :back();"><i class=" icon-undo mr10"></i>返回</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var url = '';
	function getUser() {
		var xco = new XCO();
		//xco.setLongValue("user_id", '1');

		var options = {
			url : "/tvr-user/getUser1.xco",
			data : xco,
			success : getUserCallBack
		};
		$.doXcoRequest(options);

	}
	
	function back(){
		window.location.href="personal_information.jsp";
	}

	function getUserCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			$("#nick_name").val(data.getStringValue("nick_name"));
			$("input[name='sex'][value='" + data.getStringValue("gender")+ "']").attr("checked", true);
			$("#birthday").val(data.getStringValue("birthday"));
			$("#industry").val(data.getStringValue("industry"));//行业
			$("#contact_phone").val(data.getStringValue("contact_phone"));//联系电话
			//$("#user_province").val(data.getStringValue("user_province_code"));
			//$("#user_city").val(data.getStringValue("user_city_code"));
			//$("#user_area").val(data.getStringValue("user_area_code"));
			province_city_area.init(data.getStringValue("user_province_code"),data.getStringValue("user_city_code"),data.getStringValue("user_area_code"));
			$("#user_addr").val(data.getStringValue("user_addr"));
			$("#email").val(data.getStringValue("email"));
			$("#user_img").attr('src', data.getStringValue("avatar"));
		}
	}
	
	function uploadCallBack(data) {
		var xco = new XCO();
		xco.fromXML(data);
		if (0 == xco.getCode()) {
			var results = xco.get("updateResult");
			$("#user_img").attr('src', results[0].get("url"));
			url = results[0].get("url");
			jAlert("上传成功！","提示");
		}
	}

	getUser();

	$(document).ready(
			function() {
				$("#tj_btn").click(
						function() {
							var xco = new XCO();
							xco.setStringValue("nickname", $("#nick_name").val());//昵称
							xco.setStringValue("gender", $('input:radio[name=sex]:checked').val());
							xco.setStringValue("birthday", $("#birthday").val());
							xco.setStringValue("industry", $("#industry").val());
							xco.setStringValue("contact_phone", $("#contact_phone").val());
							xco.setStringValue("user_province_code", $("#proj_province").val());
							xco.setStringValue("user_province", $("#proj_province").find("option:selected").text());
							xco.setStringValue("user_city_code",$("#proj_city").val());
							xco.setStringValue("user_city", $("#proj_city").find("option:selected").text());
							xco.setStringValue("user_area_code",$("#proj_area").val());
							xco.setStringValue("user_area", $("#proj_area").find("option:selected").text());
							xco.setStringValue("user_addr", $("#user_addr").val());
							xco.setStringValue("email", $("#email").val());
							xco.setStringValue("avatar", url);
							//xco.setLongValue("user_id", '1');

							var options = {
								url : "/tvr-user/updateUser2.xco",
								data : xco,
								success : updateUserCallBack
							};
							jConfirm("确认要修改资料吗？","确认框",function(r){
				 				if(r){
					 				$.doXcoRequest(options);
				 				}
				 			});
						});
			});

	function updateUserCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data.getMessage());
		} else {
			jAlert("修改成功！","成功提示",function(r){
				window.location.href="personal_information.jsp";
			})
		}
	}
</script>
</html>
