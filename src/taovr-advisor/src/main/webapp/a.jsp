<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script> 
    <script type="text/javascript" src="js/xco.js"></script>
    <script type="text/javascript" src="js/jquery-xco-src.js"></script>

  </head>
  
  <body>
    This is my JSP page.1 <br>
    <input type="button" value="提交示例" onclick="doPostAjax()"/>
  </body>
  <script type="text/javascript">
  function doPostAjax() {
		var xco = new XCO();
		//xco.setIntegerValue("id", 10);
		//xco.setStringValue("name", "中国");
		var options = {
			url: "http://employer.taovr.com/tvr-test/getXxx.xco",
				  // http://employer.taovr.com/tvr-test/getXxx
			data: xco,
			success: doCallBack
		};
		$.doXcoRequest(options);
	}
	function doCallBack(data){
		alert('doCallBack:\n' + data);
	}
	
  </script>
</html>
