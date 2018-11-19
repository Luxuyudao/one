<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>日报详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">
<link rel="stylesheet" href="css/ace.min.css" />
<link rel="stylesheet" href="css/ace-responsive.min.css" />
<link rel="stylesheet" href="css/ace-skins.min.css" />
<link rel="stylesheet" href="libs/css/header.css">
<link rel="stylesheet" href="libs/css/style.css">
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

.margin {
	margin-left: 145px;
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
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label>工作日期</label> <span id=create_time></span>
							</div>
							<div class="form-group mar-t-15">
								<label>任务进度</label> <span id="progress"></span><span>%</span>
							</div>
							<div class="form-group mar-t-15">
								<label class="div-inline">完成内容</label>
								<span id="report_desc"></span>
							</div>
								<div class="form-group overhidden">
					                <label class="mar-t-15 pull-left">附件</label>
					                <div class=" overhidden formwrapper1">
					                  <ul class="wid310 unstyled" id="resources1">
					                  
					                  </ul>
					                </div>
					            </div>
						</form>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="close" type="button" class="btn btn-submit" data-toggle="button">关闭</button>
				</div>
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
</body>
<script type="text/javascript" src="http://file.demo1.com/js/xco3.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
<script type="text/javascript" src="http://file.demo1.com/layer/layer.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>
<script type="text/javascript">

	$("#close").click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	});
	//获取我的任务列表
	var task_report_id = getURLparam("task_report_id");
	getMyProjectTaskList(task_report_id);
	function getMyProjectTaskList(task_report_id) {
		var xco = new XCO();
		xco.setStringValue("task_report_id", task_report_id);

		var options = {
			url : "/tvr-project/getTaskReport.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);

	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			var dataObject = data.getXCOValue("report");
			var resources = data.getXCOListValue("resources");
			$("#create_time").text(dataObject.getStringValue("create_time"));
			$("#progress").text(dataObject.getStringValue("progress"));
			$("#report_desc").text(dataObject.getStringValue("report_desc"));
			var rwfjHtml = '';
			if (resources == null || undefined == resources) {//日报附件
				$("#resources1").append(getResourcesNull(rwfjHtml));
			} else {
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 6) {//日报需求附件
						rwfjHtml = getResources2(rwfjHtml, resources[i]);
					}
				}
				if (rwfjHtml == null || rwfjHtml == '') {
					rwfjHtml = getResourcesNull(rwfjHtml);
				}
				$("#resources1").append(rwfjHtml);
			}
		}
	}
</script>
</html>
