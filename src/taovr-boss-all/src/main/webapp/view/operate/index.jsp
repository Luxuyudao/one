<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>运营管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>

<body>
	<div id="main-content" class="clearfix" data-page="operate" sub-page="">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="index.jsp">运营管理</a><span
					class="divider"></span>
				</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>运营管理</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
			

				<form class="form-inline bord1dd mar-t-15">
					<div class="form-group overhidden">
						<div class="fl mar-t-15">
							<label for="">项目编号</label> <input id="project_sn" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">项目名称</label> <input id="project_name" type="text"
								class="form-control wid140" placeholder="">
						</div>
							<div class="fl mar-t-15">
								<label for="" class="fl" style="margin-top:3px;">开始时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="start_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
								<label for="" class="fl" style="margin-top:3px;">结束时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="end_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>
						<div class="fl mar-t-15">
							<label for="">雇主</label> <input id="employer_name" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<button id="cx_btn" type="button"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button">查询</button>
					</div>
				</form>
				<div class="row-fluid">
					<div class="row-fluid ">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width="12%">时间</th>
										<th width="10%">项目编号</th>
										<th width="18%">项目名称</th>
										<th width="18%">雇主</th>
										<th width="11%">项目工期</th>
										<th width="11%">项目金额</th>
										<th width="10%">全部状态</th>
										<th width="10%">操作</th>
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
	</div>

</body>
<script type="text/javascript">
	var renderPage = true;
	$(document).ready(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getAdvisorProjectList(0, globle_page_size);
		});
	});
	function getAdvisorProjectList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_sn", $("#project_sn").val());//项目编号
		xco.setStringValue("project_name", $("#project_name").val());//项目名称
		xco.setStringValue("employer_name", $("#employer_name").val());//雇主名称
		xco.setStringValue("project_states",'10,30,40,60');//状态
		xco.setStringValue("start_time", $("#start_time").val());//开始时间
		xco.setStringValue("end_time", $("#end_time").val());//结束时间
		var options = {
			url : "/tvr-project/getProjectListP60.xco",
			data : xco,
			success : getAdvisorProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	function getAdvisorProjectListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("projects");
			var keyOptions = [
					function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },
					'project_sn',
					'project_name',
					'employer_name',
					function(item) {
						return item.get('project_cycle')
								+ item.get('cycle_unit_name')
					}, function(item) {
						return parseInt(item.get('budget_amount')) / 100 + "元";
					}, function(item) {
						return getProjectState(item.get('project_state'));
					}, function(item) {
						var project_sn = item.get("project_sn");
						var aHtml = '';
						aHtml += '<a href="project_details.jsp?project_sn='+item.get("project_sn")+'">详情</a> ';
						if(item.get('project_state')==10){
							aHtml += '<a href="advisor_assign.jsp?project_sn='+item.get("project_sn")+'">审核</a> ';
						}
						if(item.get('project_state')==30&&item.get('behalf')==1){
							aHtml += '<a href="replace_appoint.jsp?project_sn='+item.get("project_sn")+'">代签约</a> ';
						}
						if(item.get('project_state')==40){
							aHtml +="<a href='javascript:void(0);' onclick=\"implement('"+project_sn+"')\">实施</a><br>"
						}
						if(item.get('project_state')==60&&item.get('behalf')==1){
							aHtml += '<a href="replace_project_check.jsp?project_sn='+item.get("project_sn")+'">代验收</a> ';
						}
						return aHtml;
					}, ];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),
						getAdvisorProjectList, globle_page_size);
			}
		}
	}
	getAdvisorProjectList(0, globle_page_size);
	function implement(project_sn){
			var xco=new XCO();
			xco.setStringValue("project_sn", project_sn);			
			var options = {
				url : "/project-operate/updateProjectP68.xco",
				data : xco,
				success : updateProjectP68CallBack
			};
			jConfirm("确认要实施该任务吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		}
		
		function updateProjectP68CallBack(data){
			if (data.getCode() != 0) {
				jAlert('doCallBack error:\n' + data,"错误提示");
			} else {
				jAlert('项目实施成功！');
				location.reload();
			}
		}
</script>
</html>