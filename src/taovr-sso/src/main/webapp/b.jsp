<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>系统SSO: 登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript"
	src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/xco.js"></script>
<script type="text/javascript"
	src="http://file.demo1.com/js/jquery-xco-src.js"></script>

</head>

<body>
	<h1>系统SSO: 登录</h1>
	用户:
	<input type="text" name="mobile_phone" id="mobile_phone" />
	<br /> 密码:
	<input type="text" name="user_pwd" id="user_pwd" value="123456" />
	<br />

	<br />
	<br />
<!-- 
	<input type="button" value="平台用户登录" onclick="doUserLogin()" />
	<input type="button" value="平台用户退出" onclick="doUserExit()" />
	<br />
	<br />
	 -->
	<input type="button" value="系统后台登录" onclick="doSysLogin()" />
	<input type="button" value="系统后台退出" onclick="doSysExit()" />
</body>
<script type="text/javascript">

	function getLoginXco(){
		var xco = new XCO();
		xco.setStringValue("mobile_phone", $('#mobile_phone').val());
		xco.setStringValue("user_pwd", $('#user_pwd').val());		
		if('' == $('#mobile_phone').val()){
			alert('用户名。。。。。');
			return null;
		}
		return xco;
	}

	function doUserLogin() {
		var xco = getLoginXco();
		if(null == xco){return;}
		var options = {
			url : "http://sso.demo1.com/userlogin.xco",
			data : xco,
			success : doUserLoginCallBack
		};
		$.doXcoRequest(options);
	}

	function doUserLoginCallBack(data) {
		alert('doUserLoginCallBack:\n' + data);
	}
	
	function doUserExit() {
		var xco = getLoginXco();
		if(null == xco){return;}
		var options = {
			url : "http://sso.demo1.com/userexit.xco",
			data : xco,
			success : doUserExitCallBack
		};
		$.doXcoRequest(options);
	}

	function doUserExitCallBack(data) {
		alert('doUserExitCallBack:\n' + data);
	}

	function doSysLogin() {
		var xco = getLoginXco();
		if(null == xco){return;}
		var options = {
			url : "http://sso.boss.demo1.com/syslogin.xco",
			data : xco,
			success : doSysLoginCallBack
		};
		$.doXcoRequest(options);
	}

	function doSysLoginCallBack(data) {
		if (data.getCode() != 0) {
			alert('doSysLoginCallBack:\n' + data);
		} else {
			var role = data.getXCOValue("data").getIntegerValue("role");
			if(role&1 == 1){
				//有管理员权限
				window.location.href="http://manager.boss.demo1.com/view/dict/industrylist.jsp";
			}else if(role&2 == 2){
				//有客服权限
				window.location.href="http://manager.boss.demo1.com/view/customer/index.jsp";
			}else if(role&4 == 4){
				//有运营权限
				window.location.href="http://manager.boss.demo1.com/view/operate/index.jsp";
			}else if(role &8 == 8){
				//有财务权限
				window.location.href="http://manager.boss.demo1.com/view/finance/index.jsp";
			}
		}
		
	}
	
	
	function doSysExit() {
		var xco = getLoginXco();
		if(null == xco){return;}
		var options = {
			url : "http://sso.boss.demo1.com/sysexit.xco",
			data : xco,
			success : doSysExitCallBack
		};
		$.doXcoRequest(options);
	}

	function doSysExitCallBack(data) {
		alert('doSysExitCallBack:\n' + data);
	}
</script>
</html>
