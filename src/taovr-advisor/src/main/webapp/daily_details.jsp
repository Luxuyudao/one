<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<div class="page-header position-relative crumbs-nav">
				<h1>日报详情</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group mar-t-15">
								<label>工作日期</label> <span id="create_time"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>完成进度</label> <span id="progress"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>完成内容</label> <span id="report_desc"></span>
							</div>

							<div class="form-group overhidden">
				                <label class="mar-t-15 pull-left">日志附件</label>
				                <div class=" overhidden formwrapper1">
				                  <ul class="wid310 unstyled" id="resources1">
				                  
				                  </ul>
				                </div>
				            </div>

						</form>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="close" type="button" class="btn btn-submit" data-toggle="button">返回</button>
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
	var task_report_id = getURLparam("task_report_id");
	getTaskReport(task_report_id);
	function getTaskReport(task_report_id) {
		var xco = new XCO();
		xco.setLongValue("task_report_id", task_report_id);

		var options = {
			url : "/tvr-project/getTaskReport.xco",
			data : xco,
			success : getTaskReportCallBack
		};
		$.doXcoRequest(options);
	}

	function getTaskReportCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var report = data.getXCOListValue("report");
			var resources = data.getXCOListValue("resources");

			$("#create_time").text(report.getStringValue("create_time"));
			$("#progress").text(report.getStringValue("progress") + '%');
			$("#report_desc").text(report.getStringValue("report_desc"));

			var fjHtml = '';
			if (resources == null || undefined == resources) {//日志附件
				$("#resources1").append(getResourcesNull(fjHtml));
			} else {
				for(var i=0; i<resources.length; i++){
				
					if(resources[i].getIntegerValue("type")==6){//日志附件
						fjHtml = getResources2(fjHtml,resources[i]);
					}		
				}
				if(fjHtml==null||fjHtml==''){
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}
		}
	}
</script>
</html>