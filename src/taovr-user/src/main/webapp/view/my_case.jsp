<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>我的案例</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>

<body>
	<div id="main-content" class="clearfix" data-page="user"
		sub-page="">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li></i> <a href="#">我的案例</a><span class="divider"></i> </span></li>

			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>我的案例</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>创建时间</th>
										<th>项目名称</th>
										<th>项目状态</th>
										<th>行业分类</th>
										<th>项目工期</th>
										<th>项目金额</th>
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
	</div>

</body>
<script type="text/javascript">
	var renderPage = true;
	$(document).ready(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getMyCaseList(0, globle_page_size);
		});
	});
	function getMyCaseList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_case_name", $("#project_case_name").val());//案例名称
		var options = {
			url : "/tvr-project/getMyCaseListP61.xco",
			data : xco,
			success : getMyCaseListCallBack
		};
		$.doXcoRequest(options);
	}
	var renderPage = true;
	function getMyCaseListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("cases");
			var total = data.getIntegerValue("total");
			var keyOptions = [
					function(item) {
						return dataFormat("yyyy-MM-dd hh:mm:ss", item
								.get("create_time"));
					},//创建时间
					'project_case_name',//案例名称
					function(item){//案例状态
						return getCaseState(item.get('case_audit_state'));
					},
					'project_catg',//行业分类
					function(item) {//项目周期
						return item.get('project_cycle')
								+ item.get('cycle_unit_name')
					},
					function(item) {//项目预算
						return parseInt(item.get('budget_amount')) / 100 + "元";
					},
					function(item) {
						var project_case_sn = item.get("project_case_sn");
						var aHtml = '';
						aHtml += '';
						aHtml += '<a href="update_case.jsp?project_case_sn='
								+ project_case_sn + '">编辑</a>';
						return aHtml;
					}, ];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getMyCaseList,
						globle_page_size);
			}
		}
	}
	getMyCaseList(0, globle_page_size);
</script>
</html>