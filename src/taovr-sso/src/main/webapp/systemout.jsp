<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>退出</title>

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
	
</body>
<script type="text/javascript">
	doSysExit();
	function doSysExit() {
		var xco = new XCO();
		var options = {
			url : "http://sso.boss.demo1.com/sysexit.xco",
			data : xco,
			success : doSysExitCallBack
		};
		$.doXcoRequest(options);
	}

	function doSysExitCallBack(data) {
		window.location.href="http://sso.boss.demo1.com/systemlogin.jsp";
	}
</script>
</html>
