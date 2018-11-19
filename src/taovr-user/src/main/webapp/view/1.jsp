<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>添加案例</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<link href="../css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<!--[if IE 7]>
    <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
    <![endif]-->
<!-- page specific plugin styles -->

<!-- ace styles -->
<link rel="stylesheet" href="../css/ace.min.css" />
<link rel="stylesheet" href="../css/ace-responsive.min.css" />
<link rel="stylesheet" href="../css/ace-skins.min.css" />
<!--[if lt IE 9]>
    <link rel="stylesheet" href="css/ace-ie.min.css" />
    <![endif]-->
<!-- 自己的样式-->
<link rel="stylesheet" href="../libs/css/header.css">
<link rel="stylesheet" href="../libs/css/style.css">
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
	<form id="form3" name="form3"
		action="http://user.demo1.com/uploadFile.xco"
		enctype="multipart/form-data" method="post" target="hidden_frame">
		<input type="file" name="file" /> <br />
		<input type="submit" value="提交" />
	</form>
	<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
</body>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/xco3.js"></script>
<script type="text/javascript" src="../js/jquery-xco.js"></script>
<script type="text/javascript">
	function uploadCallBack(data) {
		var xco = new XCO();
		xco.fromXML(data);
		alert(xco);
	}
</script>
</html>
