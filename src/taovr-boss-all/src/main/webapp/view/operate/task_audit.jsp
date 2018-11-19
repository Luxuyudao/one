<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "任务管理";
%>
<head>
<meta charset="utf-8" />
<title>任务管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="operate" sub-page="taskaudit">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
				<li>任务管理</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>任务管理</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid padding">
				<form class="form-inline bord1dd mar-t-15">
					<div class="form-group overhidden">
						<div class="fl mar-t-15">
							<label for="">任务编号</label> <input id="project_task_sn" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">任务名称</label> <input id="task_name" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label>状态</label> <select id="task_state" type="text"
								class="form-control wid140" placeholder="">
								<option value="1">全部</option>							
								<option value="10">未审核</option>
								<option value="60">代付款</option>
							</select>
						</div>
						<button id="cx_btn" type="button"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button">查询</button>
					</div>
				</form>
					
					<div class="row-fluid">
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
							<tbody id="table_content">

							</tbody>
						</table>
						<jsp:include page="page.jsp"></jsp:include>
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
					getMyProjectList(0, globle_page_size);
				});
			});
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		xco.setStringValue("task_states", '10,50,60');
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setIntegerValue("start", _start);
		xco.setStringValue("project_task_sn", $("#project_task_sn").val());//任务编号
		xco.setStringValue("task_name", $("#task_name").val());//任务名称
		if ($("#task_state").val() != 1) {
			xco.setIntegerValue("task_state", $("#task_state").val());//状态
		}
		var options = {
			url : "/tvr-project/getTaskListP64.xco",
			data : xco,
			success : getMyProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	var renderPage = true;
	function getMyProjectListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [ 'project_task_sn', //任务编号
			'task_name', //任务名称
			
			function(item){//任务状态
							return getTaskCtrlState(item.get("task_ctrl_state"),item.get("task_state"),item.get("task_notpass_mark"));
						}, //任务状态
					'adviser_name',//顾问名称	
					'providers_name',//服务商名称
			function(item){
				return item.get('task_cycle')+item.get('cycle_unit_name');
			}, //任务周期
			function(item) {
				return parseInt(item.get('real_amount')) / 100;
			}, //酬劳

			function(item) {
				var aHtml = '';
				if(item.get('task_ctrl_state')==1){
					if (item.get('task_state')==10&&item.get('task_notpass_mark')==0) {
						aHtml += '<a href="task_assign.jsp?project_task_sn='+item.get("project_task_sn")+'">审核</a> ';
						return aHtml;
					} 
					if (item.get('task_state')==10&&item.get('task_notpass_mark')==1) {
						aHtml += '未通过';
						return aHtml;
					} 
					if (item.get('task_state')==50&&item.get('task_behalf')==1) {
						aHtml += '<a href="replace_task_check.jsp?project_task_sn='+item.get("project_task_sn")+'">代验收</a>';
						return aHtml;
					}
					if (item.get('task_state')==60&&item.get('create_bill')==0) {
					aHtml += '<a href="bill_generation.jsp?project_task_sn='+item.get("project_task_sn")+'">生成账单</a> ';
						return aHtml;
					}
					if(item.get('task_state')==60&&item.get('create_bill')==1){
						return '已生成';
					}
				}
				if(item.get('task_ctrl_state')==2){
					return '已取消'
				}
				if(item.get('task_ctrl_state')==3){
					return '已终止'
				}
				return '';
			} ];
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
</script>
</html>
