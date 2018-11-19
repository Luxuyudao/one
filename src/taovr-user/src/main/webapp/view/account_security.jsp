<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>账户安全</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="user"
		sub-page="anquan">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li>账户安全</li>
			</ul>
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>账户安全</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div style="width:70%;">
								<div class="form-group mar-t-15">
									<label>登录密码</label> <span>互联网账号存在被盗风险，建议您定期更改密码以保护账户安全</span> <a
										class="float_right" href="changepwd.jsp">修改</a>
								</div>
								<div class="form-group mar-t-15">
									<label>邮箱验证</label> <span class="wid310">您验证的邮箱：</span> <span
										id="email"></span> <a class="float_right"
										href="账户设置-账户安全-修改邮箱.html">修改</a>
								</div>
								<div class="form-group mar-t-15">
									<label>支付密码</label> <span class="wid310">安全程度：</span> <span>低</span>
									<span>建议您设置更高强度的密码</span> <a class="float_right"
										href="账户设置-账户安全-修改支付密码.html">修改</a>
								</div>
								<div class="form-group mar-t-15">
									<label>实名认证</label> <span class="wid310">您认证的实名信息：</span> <span></span>&nbsp;&nbsp;&nbsp;
									<span>*13***************</span>
									<div id="renzheng" class="float_right"></div>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
var userid='';
	function getUser() {
		var xco = new XCO();
		//xco.setLongValue("user_id", userid);

		var options = {
			url : "/tvr-user/getUser1.xco",
			data : xco,
			success : getUserCallBack
		};
		$.doXcoRequest(options);

	}
	
	function getUserCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var email = data.getStringValue("email");
			$("#email").text(email.substring(0, 3) + "****"+ email.substring(8, email.length));
			userid=data.getLongValue("user_id");
			getUserlist(data.getStringValue("mobile_phone"));
		}
		
	}
	getUser();
	function getUserlist(phone){
		var xco = new XCO();
		xco.setStringValue("phone", phone);
		xco.setIntegerValue("start", 0);
		xco.setIntegerValue("pageSize", 10);
		var options = {
			url : "/tvr-user/getUserlistu13.xco",
			data : xco,
			success : getUserlistCallBack
		};
		$.doXcoRequest(options);
	}
	
	function getUserlistCallBack(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total=data.getXCOValue("total");
			var datas=data.getXCOListValue("data");
			if(total==0){
				var aHtml='';
				aHtml+='<a href="authentication.jsp?userid='+userid+'">未认证</a>';
				$("#renzheng").append(aHtml);
			}else{
				var state=datas[0].getIntegerValue("audit_state");
				if(state==10||state==20){
					var aHtml='';
					aHtml+='<span class="blue">审核中</span>';
					$("#renzheng").append(aHtml);
				}
				if(state==30){
					var aHtml='';
					aHtml+='<a href="authentication.jsp?userid='+userid+'&type='+datas[0].getIntegerValue("cert_type")+'">未通过</a>';
					$("#renzheng").append(aHtml);
				}
				if(state==100){
					var aHtml='';
					aHtml+='<span class="blue">已认证</span>';
					$("#renzheng").append(aHtml);
				}
			}
		}
	}
	
</script>
</html>
