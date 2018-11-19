<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "任务管理";
%>
<head>
<meta charset="utf-8" />
<title>服务商账单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>

	<div id="main-content" class="clearfix" data-page="operate" sub-page="providerbillgeneration">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><a href="运营人员中心.html">运营管理</a><span class="divider"><i
						class="icon-angle-right"></i> </span></li>
				<li><a href="#">服务商账单</a><span class="divider"></span></li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>服务商账单</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">任务编号</label> <input id="project_task_sn"
									type="text" class="form-control" placeholder="任务编号">
							</div>
							<div class="fl mar-t-15">
								<label for="">任务名称</label> <input id="task_name" type="text"
									class="form-control" placeholder="任务名称">
							</div>

							<!-- <div class="fl mar-t-15">
								<label for="">审核状态</label> <select
									class="form-control marg0  wid80 vm">
									<option>-状态-</option>
									<option>审核中</option>
									<option>已通过</option>
									<option>未通过</option>
								</select>
							</div> -->
							<div class="fl mar-t-15">
								<label for="">项目编号</label> <input id="project_sn" type="text"
									class="form-control" placeholder="">
							</div>

							<div class="fl mar-t-15">
								<label for="" style="margin-top:3px;">时间</label>
								<div style="width:230px;" class=" input-append date">
									<input class="span10 date-picker" id="start_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
								至
								<div style="width:230px;" class="ml5 input-append date">
									<input class="span10 date-picker" id="end_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>

							<button type="button" id="cx_btn"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button">查询</button>
						</div>
					</form>
				</div>

				<div class="row-fluid mar-t-15">
					<div class="span12">
						<table id="table_bug_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>任务编号</th>
									<th>任务名称</th>
									<th>任务状态</th>
									<th>顾问</th>
									<th>服务商</th>
									<th>任务周期</th>
									<th>酬劳</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="task_table">

							</tbody>
						</table>
						<div class="form-actions">
							<div class="pagination fr">
								<ul id="pagination_1">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var renderPage = true;
	$(document).ready(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getTaskList();
		});
	});
	function getTaskList() {
		var xco = new XCO();
		xco.setStringValue("task_name", $("#task_name").val());
		xco.setStringValue("project_task_sn", $("#project_task_sn").val());
		xco.setStringValue("project_sn", $("#project_sn").val());
		xco.setStringValue("start_time", $("#start_time").val());
		xco.setStringValue("end_time", $("#end_time").val());

		var options = {
			url : "/tvr-project/getTaskListP66.xco",
			data : xco,
			success : getTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getXCOValue("total");
			var tasks = data.getXCOListValue("tasks");
			var keyOptions = [
					'project_task_sn',
					'task_name',
					function(item) {
						return getProjectState(item.get('task_state'));
					},
					'adviser_name',
					'providers_name',
					function(item) {
						return item.get('task_cycle')
								+ item.get('cycle_unit_name')
					}, function(item) {
						return parseInt(item.get('real_amount')) / 100 + "元";
					}, function(item) {
						var aHtml = '';
						aHtml += '<a href="bill_generation.jsp?project_task_sn='+item.get("project_task_sn")+'">生成账单</a> ';
						return aHtml;
					}, ];
			renderTable("#task_table", tasks, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),getTaskList, globle_page_size);
			}
		}
	}
	getTaskList();
</script>
</html>
