<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>项目列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="left.jsp" %>
</head>

<body>
	<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="projectlist">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://advisor.demo1.com/index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>项目列表</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>项目列表</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->

				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<!--<span>货架编号：</span><span>01</span>
                    <span>所属仓库：</span><span>01</span>-->
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
								<label for="">雇主</label> <input id="employer_name" type="text"
									class="form-control wid140" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label>状态</label> <select id="project_state" type="text"
									class="form-control wid140" placeholder="">
										<option value="1">全部</option>
										<option value="20">已审核</option>
										<option value="30">待签约</option>
										<option value="40">代付款</option>
										<option value="50">实施中</option>
										<option value="60">待验收</option>
										<option value="70">待结案</option>
										<option value="80">已完成</option>
									</select>
							</div>
							<button id="cx_btn" type="button"
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
										<th width="12%">时间</th>
										<th width="10%">项目编号</th>
										<th width="18%">项目名称</th>
										<th width="18%">项目甲方</th>
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
		//xco.setLongValue("user_id", 1);
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_sn", $("#project_sn").val());//项目编号
		xco.setStringValue("project_name", $("#project_name").val());//项目名称
		xco.setStringValue("employer_name", $("#employer_name").val());//雇主名称
		if ($("#project_state").val() != 1) {
			xco.setIntegerValue("project_state", $("#project_state").val());//状态
		}
		var options = {
			url : "/tvr-project/getMyProjectListP36.xco",
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
					}, 	function(item) {
						var project_sn = item.get("project_sn");
						var state = item.get("project_state");
						var aHtml = "";
						aHtml += '<a href="project_details.jsp?project_sn='+project_sn+'">详情</a>';
						 if(state == 20){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="submit_contract.jsp?project_sn='+project_sn+'">签约</a>';
						}else if(state == 30){
							
						}else if(state == 40){
							
						}else if(state == 50){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_acceptance.jsp?project_sn='+project_sn+'">验收</a>';
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_implement.jsp?project_sn='+project_sn+'">执行</a>';
						}else if(state == 60){
							
						}else if(state == 100||state == 70){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_appoint.jsp?project_sn='+project_sn+'">评价</a>';
						}
						return aHtml;
					} ];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),
						getAdvisorProjectList, globle_page_size);
			}
		}
	}
	getAdvisorProjectList(0, globle_page_size);
</script>
</html>