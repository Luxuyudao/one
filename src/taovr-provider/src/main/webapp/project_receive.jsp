<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务抢单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_receive">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
					class="divider"><i class="icon-angle-right"></i>
				</span>
				</li>
				<li>任务抢单</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>任务抢单</h1>
			</div>
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">任务编号</label> <input class="form-control wid140"  type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">任务名称</label> <input class="form-control wid140" type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">任务金额</label> <input class="form-control wid140" type="text"
									class="form-control" placeholder="">&nbsp&nbsp&nbsp
								至&nbsp&nbsp&nbsp <input class="form-control wid140" type="text" class="form-control"
									placeholder="">
							</div>


							<button type="button"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button">查询</button>
						</div>
					</form>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>任务编号</th>
										<th>任务名称</th>
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

</body>

<script type="text/javascript">
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		//xco.setIntegerValue("user_id", 1);
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		var options = {
			url : "/tvr-project/getMyCanGrabTaskListP20.xco",
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
				'task_name', //项目名称  
				function(item) {
					return "待接单"
				}, //任务状态	
				'adviser_name', //项目顾问
				function(item) {
					return item.get('task_cycle') + item.get('cycle_unit_name')
				}, //任务周期
	
				function(item) {
					return parseInt(item.get('proposed_amount')) / 100+"元";
				}, //酬劳							
				function(item) {
					return checkUrl(item.get('project_task_sn'),item.get('task_push_id'));
				}	 
			];
			var datalist = data.getXCOListValue("tasks");

			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getMyProjectList,
						globle_page_size);
			}
		}
	}
		function checkUrl(project_task_sn,task_push_id){
			return '<a href="task_grab.jsp?project_task_sn='+project_task_sn+'&task_push_id='+task_push_id+'">查看</a>';
		}
	getMyProjectList(0, globle_page_size);
</script>
</html>
