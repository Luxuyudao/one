<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="addproject">
			<!--#breadcrumbs-->
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="http://employer.demo1.com/index.jsp">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li>任务详情</li>
				</ul>
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>任务详情</h1>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>*任务名称</label> <span id="task_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务顾问</label> <span id="adviser_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务周期</label> <span id="cycle"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务类型</label> <span id="task_type"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*实施地址</label> <span id="address"></span>
								</div>

								<div class="form-group mar-t-15">
									<label class="div-inline">*任务要求</label>
									<p class="wid310 div-inline" id="task_desc"></p>
								</div>
								<div class="form-group">
									<label style="font-weight:bold;" id="resources2">*任务附件</label>
								</div>
								<div id="resources1">
									<!-- <div class="form-group">
										<label></label> <a href="#">xxx.txt</a>
									</div>
									<div class="form-group">
										<label></label> <a href="#">xxx.txt</a>
									</div>
									<div class="form-group">
										<label></label> <a href="#">xxx.txt</a>
									</div> -->
								</div>
								<div class="hr hr-24" style="margin:10px 20px;"></div>
								<div class="form-group">
									<label style="font-weight:bold;">任务进度</label>
									<table
										class="table table-striped table-bordered table-hover margin"
										 >
										<thead>
											<tr>
												<th>日报编号</th>
												<th>日期</th>
												<th>完成内容</th>
												<th>任务进度</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="table_log_content">
										</tbody>
									</table>
								</div>
								<div class="pagination fr" style="padding-right:6%;">
									<ul id="pagination_1"></ul>
								</div>
								<div style="clear:both;"></div>
								<div class="hr hr-24" style="margin:10px 20px;"></div>
								<div class="form-group">
									<label style="font-weight:bold;">验收结果</label>
									<table
										class="table table-striped table-bordered table-hover margin"
										>
										<tbody id="table_applies_content">
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button"
							onClick="javascript:back;">关闭</button>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
</body>
<script type="text/javascript">
	function back(){
		window.location.href="http://employer.demo1.com/project_details.jsp?project_sn="+project_sn;
	}
	function getProjectTask(_start, _pageSize) {
		var xco = new XCO();
		xco.setStringValue("project_task_sn", getURLparam("project_task_sn"));
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		var options = {
			url : "/tvr-project/getProjectTask4.xco",
			data : xco,
			success : getProjectTaskCallBack
		};
		$.doXcoRequest(options);
	}
	
	var renderPage = true;
	function getProjectTaskCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var task = data.getXCOValue("task");//任务详情表
			var resources = data.getXCOListValue("resources");//附件表
			var applies = data.getXCOListValue("applies");//任务验收申请表
			var total = data.getIntegerValue("total");
			var reports = data.getXCOListValue("reports");
			$("#task_name").text(task.getStringValue("task_name")); 

			$("#adviser_name").text(task.getStringValue("adviser_name"));//任务顾问
			$("#cycle").text(
					task.getIntegerValue("task_cycle")
							+ task.getStringValue("cycle_unit_name"));//任务周期
			$("#task_type").text(task.getStringValue("task_type"));//任务类型
			$("#address").text(task.getStringValue("task_province")+task.getStringValue("task_city")+task.getStringValue("task_area")+task.getStringValue("task_addr"));//实施地址
			$("#task_desc").text(task.getStringValue("task_desc"));//任务要求
			var fjHtml = '';
			if (resources == null || undefined == resources) {//任务附件
				$("#resources1").append(getResourcesNull(fjHtml));
			} else {
				for(var i=0; i<resources.length; i++){
					if(resources[i].getIntegerValue("type")==2){//任务附件
						fjHtml = getResources(fjHtml,resources[i]);
					}		
				}
				if(fjHtml==null||fjHtml==''){
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}
			
			var keyOptions1 = [ 
				'task_report_id',//日志编号
				'update_time',//时间
				'report_desc',//内容
				function(item){//任务进度
					return item.get('progress')+'%';
				},
				function(item) {//操作
					var task_report_id = item.get("task_report_id");
					var aHtml = '';
					aHtml += '<a href="task_report_case.jsp?task_report_id='+task_report_id+'">详情</a>';
					return aHtml;
				}, ];
			var keyOptions2=[
			 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },
				function(item){
					return getExamineState(item.get('through'));
				},
				'remark',
			];
			renderTable("#table_log_content",reports,keyOptions1);
			renderTable("#table_applies_content",applies,keyOptions2);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getProjectTask,
						globle_page_size);
			}
		}
	}
	getProjectTask(0,globle_page_size);
</script>
</html>
