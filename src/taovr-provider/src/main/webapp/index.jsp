<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>服务商中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i>服务商中心</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>服务商中心</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid padding">
					<div class="row-fluid indexBox">
						<div class="div-inline">
							<a href="#" title="Photo Title" data-rel="colorbox"> <img
								alt="150x150" height="120" width="120" src="<%=photo %>">
							</a>
						</div>
						<div class="div-inline margin_left">
							<div>
								<span style="font-size:20px; font-weight:bold;"><%=user_name%></span>
							</div>
							<div class="mar-t-15">
								<a class="blue user-level position-relative"href="javascript:vord(0);">
								<i class="level level1 position-absolute"></i>钻石会员</a>
								 <a href="#">
								<img src="img/weikaitong.png">
								</a>
							</div>
							<div class="margin_top overhidden">
								<a class="blue pull-left" href="javascript:vord(0);">账户安全:</a> <span
									class="s-level s-level1 pull-left"></span> <span
									class="pull-left t-level1">较高</span>
							</div>
						</div>
						<div class="div-inline margin_left">
							<ul class="ucountList unstyled overhidden">
								<li><a href="project_receive.jsp" class="position-relative"> <i
										class="ucount icon3 position-absolute"></i> <span>待接单<em
											class="countNum" id="state20">0</em>
									</span> </a></li>
								<li><a href="project_list.jsp" class="position-relative"> <i
										class="ucount icon2 position-absolute"></i> <span>执行中<em
											class="countNum" id="state30">0</em>
									</span> </a></li>
								<li><a href="project_list.jsp" class="position-relative"> <i
										class="ucount icon1 position-absolute"></i> <span>待验收<em
											class="countNum" id="state40">0</em>
									</span> </a></li>
								<li><a href="project_list.jsp" class="position-relative"> <i
										class="ucount icon4 position-absolute"></i> <span>待收款<em
											class="countNum" id="state60">0</em>
									</span> </a></li>
							</ul>
						</div>					
						<div class="bord1dd div-inline margin_left userInfo bg_eee pull-right">
							<div>
								余<span class="mlem">额：</span> <span>0</span> <span>元</span>
							</div>
							<div>
								V&nbsp;<span class="mlem">币：</span> <span>85</span> <span>个</span>
							</div>
							<div>
								<span>体验券：</span> <span>1</span> <span>张</span>
							</div>
						</div>


					</div>

					<hr />

					<form class="form-inline bord1dd">
						<div class="form-group overhidden">



							<div class="fl mar-t-15">
								<label for="">任务编号</label> <input type="text"
									class="form-control" placeholder="" id="project_task_sn">
							</div>
							<div class="fl mar-t-15">
								<label for="">任务名称</label> <input type="text"
									class="form-control" placeholder="" id="task_name">
							</div>
								<div class="fl mar-t-15" >
								<label for="">审核状态</label> 
								
								<select class="form-control marg0  wid80 vm" id="task_state">
									<option value="1">-全部-</option>
									<option value="30">实施中</option>
									<option value="40">待初验</option>
									<option value="50">待终验</option>
									<option value="60">代付款</option>
									<option value="70">代结案</option>
									<option value="100">已完成</option>
								</select>
							</div>

							<button id="cx_btn" type="button"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button">查询</button>
						</div>
					</form>

					<hr />
					<!--/page-header-->
					<div class="row-fluid" style="margin-top: -10px;">
						<!-- PAGE CONTENT BEGINS HERE -->
						<div class="row-fluid mar-t-15">
							<div class="row-fluid">
								<div class="row-fluid mar-t-15">
									<div class="span12">
										<table id="table_bug_report"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>任务编号</th>
													<th>任务名称</th>
													<th>任务进度</th>
													<th>任务状态</th>
													<th>项目顾问</th>
													<th>任务周期</th>
													<th>酬劳</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="table_content">

											</tbody>
										</table>
										<jsp:include page="page.jsp" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
</body>
<script type="text/javascript">
	//获取个状态数目
	employerProjectStats();
	function employerProjectStats() {
		var xco = new XCO();
		var options = {
			url : "/tvr-project/getProviderProjectTaskStatsP18.xco",
			data : xco,
			success : employerProjectStatsCallBack
		};
		$.doXcoRequest(options);
	}

	function employerProjectStatsCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			var values = data.getXCOListValue("taskStats");
			if (values) {
				for ( var i = 0; i < values.length; i++) {
					var state20 = values[i].getStringValue("task_state");
					if (state20 == "20") {
						$("#state20").text(
								values[i].getStringValue("state_count"))
					}
					var state30 = values[i].getStringValue("task_state");
					if (state30 == "30") {
						$("#state30").text(
								values[i].getStringValue("state_count"))
					}
					var state40 = values[i].getStringValue("task_state");
					if (state40 == "40") {
						$("#state40").text(
								values[i].getStringValue("state_count"))
					}
					var state60 = values[i].getStringValue("task_state");
					if (state60 == "60") {
						$("#state60").text(
								values[i].getStringValue("state_count"))
					}
				}
			}
		}
	}
	var renderPage = true;
	$(document).ready(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getMyProjectList(0, globle_page_size);
		});
	});
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		//xco.setIntegerValue("user_id", 1);
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_task_sn", $("#project_task_sn").val());//任务编号
		xco.setStringValue("task_name", $("#task_name").val());//任务名称
		if ($("#task_state").val() != 1) {
			xco.setIntegerValue("task_state", $("#task_state").val());//状态
		}
		var options = {
			url : "/tvr-project/getMyTaskListP19.xco",
			data : xco,
			success : getMyProjectListCallBack
		};
		$.doXcoRequest(options);
	}
	var renderPage = true;
	function getMyProjectListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [
					'project_task_sn', //项目编号
					'task_name', //项目名称	
					function(item) {
						return item.get('task_progress') + "%"
					},
					function(item) {
						return getTaskCtrlState(item.get("task_ctrl_state"),
								item.get("task_state"), item
										.get("task_notpass_mark"));
					},

					'adviser_name', //项目顾问
					function(item) {
						return item.get('task_cycle')
								+ item.get('cycle_unit_name')
					}, //任务周期

					function(item) {
						return parseInt(item.get('proposed_amount')) / 100;
					}, //酬劳							
					function(item) {
						return checkUrl(item.get('project_task_sn'), item
								.get('task_state'), item.get('task_progress'),
								item.get('task_ctrl_state'));
					}, ];
			var datalist = data.getXCOListValue("tasks");
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getMyProjectList,
						globle_page_size);
			}
		}
	}
	getMyProjectList(0, globle_page_size);
	function checkUrl(project_task_sn, task_state, task_progress,
			task_ctrl_state) {
		var aHtml = '';
		aHtml += '<a href="task-details.jsp?project_task_sn=' + project_task_sn
				+ '">查看</a>';
		if (task_ctrl_state == 1) {
			if (task_state == 30 && task_progress == 100) {
				aHtml += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="project_submit.jsp?project_task_sn='
						+ project_task_sn + '">提交</a>';
			}
			if (task_state == 70) {
				aHtml += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="project_receipt.jsp">收款</a>';
			}
		}

		return aHtml;
	}
</script>
</html>
