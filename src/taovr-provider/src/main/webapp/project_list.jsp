<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务列表</title>
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_list">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://provider.demo1.com/index.jsp">首页</a><span
					class="divider"><i class="icon-angle-right"></i>
				</span>
				</li>
				<li>任务列表</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>任务列表</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid padding">
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
							<div class="fl mar-t-15">
								<label for="">项目顾问</label> <input type="text" class="form-control"
									placeholder="" id="adviser_name">
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

										<div class="form-actions">
											<jsp:include page="page.jsp" />
										</div>

									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- PAGE CONTENT BEGINS HERE -->
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
		//xco.setIntegerValue("user_id", 1);
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_task_sn", $("#project_task_sn").val());//任务编号
		xco.setStringValue("task_name", $("#task_name").val());//任务名称
		xco.setStringValue("adviser_name", $("#adviser_name").val());//雇主名称
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
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [ 'project_task_sn', //项目编号
			'task_name', //项目名称	
			function(item){
				return item.get('task_progress')+'%';
			},
			function(item){
				return getTaskCtrlState(item.get("task_ctrl_state"),item.get("task_state"),item.get("task_notpass_mark"));
			},
			'adviser_name', //项目顾问
			function(item) {
				return item.get('task_cycle') + item.get('cycle_unit_name')
			}, //任务周期

			function(item) {
				return parseInt(item.get('proposed_amount')) / 100;
			}, //酬劳							
			function(item) {
				return checkUrl(item.get('project_task_sn'),item.get('task_state'),item.get('task_progress'),item.get('task_ctrl_state'));
			}, 
			];
			var datalist = data.getXCOListValue("tasks");
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),
						getMyProjectList, globle_page_size);
			}
		}
	}
	getMyProjectList(0, globle_page_size);
	
	function checkUrl(project_task_sn,task_state,task_progress,task_ctrl_state){
			var aHtml='';
			aHtml+='<a href="task-details.jsp?project_task_sn='+project_task_sn+'">查看</a>';
			if(task_ctrl_state==1){
				if(task_state==30&&task_progress==100){
					aHtml+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="project_submit.jsp?project_task_sn='+project_task_sn+'">提交</a>';
				}
				if(task_state==70){
					aHtml+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="project_receipt.jsp">收款</a>';
				}
			}
			
			return aHtml;
		}
		
</script>
</html>
