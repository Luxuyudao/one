<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>项目执行</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>

<body>
	<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="projectlist" >
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://advisor.demo1.com/index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li>项目执行</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>项目执行</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid">
					<form class="form-inline bord1dd mar-t-20">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">项目编号</label> <span id="project_sn"></span>
							</div>
							<div class="fl mar-t-15">
								<label for="">雇主</label> <span id="employer_name"></span>
							</div>
							<div class="fl mar-t-15">
								<label for="">项目名称</label> <span id="project_name"></span>
							</div>
							<button id="add_task" type="button"
									class="btn mar-t-10 mr20 fr btn-small btn-danger btn-sub"
									data-toggle="button">新增任务</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="row-fluid mar-t-15">

					<div class="span12">
						<table id="table_bug_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>子任务编号</th>
									<th>任务名称</th>
									<th>任务状态</th>
									<th>服务商</th>
									<th>任务周期</th>
									<th>酬劳</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="table_content">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="tc mar-t-20">
				<button type="button" class="btn btn-submit" onclick="javascript:back();"data-toggle="button">返回</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
		function back(){
			window.location.href="project_list.jsp";
		}
		var project_sn = getURLparam("project_sn");
		var behalf='';
		getProject(project_sn);
		$("#add_task").click(function(){
		
			window.location.href='add_task.jsp?project_sn='+project_sn+'&behalf='+behalf;
		});
	function getProject(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "/tvr-project/getProject1.xco",
			data : xco,
			success : getProjectCallBack1
		};
		var options2 = {
			url : "/tvr-project/getProjectTaskList.xco",
			data : xco,
			success : getProjectCallBack2
		};
		$.doXcoRequest(options);
		$.doXcoRequest(options2);
	}

	function getProjectCallBack1(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			$("#project_sn").text(data.getStringValue("project_sn"));
			$("#employer_name").text(data.getStringValue("employer_name"));
			$("#project_name").text(data.getStringValue("project_name"));
			behalf=data.getStringValue("behalf");
		}
	}
	function getProjectCallBack2(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var datalist = data.getXCOListValue("data");
			var keyOptions = [ 'project_task_sn',//任务编号
			'task_name',//任务名称
			//'task_desc',//任务内容
			function(item) {
				return getTaskCtrlState(item.get("task_ctrl_state"),item.get("task_state"),item.get("task_notpass_mark"));
			} , 'providers_name',//服务商
			function(item) {//任务周期
				return item.get('task_cycle') + item.get('cycle_unit_name');
			}, function(item) {//酬劳
				return parseInt(item.get('real_amount')) / 100 + "元";
			},function(item) {
					var project_task_sn = item.get("project_task_sn");
					var project_sn = item.get("project_sn");
					var state = item.get("task_state");
					var aHtml = "";
					aHtml += '<a href="task_details.jsp?project_task_sn='+project_task_sn+'">详情</a>';
					if(item.get("task_ctrl_state")==1){
						if(state == 10){
						aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
						aHtml += '<a href="task_compile.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">编辑</a>';
						aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
						aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 20){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 30){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 40){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_check.jsp?project_task_sn='+project_task_sn+'">验收</a>';
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 50){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 60){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="task_termination.jsp?project_sn='+project_sn+'&project_task_sn='+project_task_sn+'">终止</a>';
						}else if(state == 70){
							
						}else if(state == 100){
								aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="#?project_sn='+project_sn+'">评价</a>';
						}
					}
					
					return aHtml;
				} ];
			renderTable("#table_content", datalist, keyOptions);
		}
	}
</script>
</html>