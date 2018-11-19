<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "案例管理";
%>
<head>
<meta charset="utf-8" />
<title>案例管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="operate" sub-page="casereview">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营管理</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>案例管理</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>案例管理</h1>
			</div>
			<div class="row-fluid">
				<form class="form-inline bord1dd">
					<div class="form-group overhidden">
						<div class="fl mar-t-15">
							<label for="">案例编号</label> <input id="project_case_sn" type="text"
								class="form-control" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">案例名称</label> <input id="project_case_name" type="text"
								class="form-control" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">审核类型</label> <select id="case_audit_type"
								class="form-control marg0  wid80 vm">
								<option value="1">全部</option>
								<option value="10">服务商资质案例</option>
								<option value="20">顾问资质案例</option>
								<option value="30">服务商新增案例</option>
								<option value="40">顾问新增案例</option>
							</select>
						</div>
						<div class="fl mar-t-15">
							<label for="">审核状态</label> <select id="case_audit_state"
								class="form-control marg0  wid80 vm">
								<option value="1">全部</option>
								<option value="10">新提交</option>
								<option value="20">重新提交</option>
								<option value="30">未通过</option>
								<option value="100">已通过</option>
							</select>
						</div>
						<button type="button" id="cx_btn"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button">查询</button>
					</div>
				</form>
			</div>
			<div class="row-fluid">
				<table id="table_bug_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>案例编号</th>
							<th>案例名称</th>
							<th>案例类型</th>
							<th>用户昵称</th>
							<th>案例审核类型</th>
							<th>案例状态</th>
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
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_case_sn", $("#project_case_sn").val());//任务编号
		xco.setStringValue("project_case_name", $("#project_case_name").val());//任务名称
		if ($("#case_audit_type").val() != 1) {
			xco.setIntegerValue("case_audit_type", $("#case_audit_type").val());//状态
		}
		if ($("#case_audit_state").val() != 1) {
			xco.setIntegerValue("case_audit_state", $("#case_audit_state").val());//状态
		}
		var options = {
			url : "/tvr-project/getMyCaseListP61.xco",
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
			var keyOptions = [
					'project_case_sn', //案例编号
					'project_case_name', //案例名称
					'project_catg', //案例类型
					'user_name', //用户昵称	
					function(item){
						return getCaseAuditTypeState(item.get('case_audit_type'));
					},
					function(item) {
						return getCaseState(item.get('case_audit_state'));
					}, //状态	
					//操作	
					function(item) {
						var aHtml = '';
						aHtml += '<a href="case_details.jsp?project_case_sn='+item.get("project_case_sn")+'">详情</a> ';
						if(item.get('case_audit_state')==10||item.get('case_audit_state')==20){
							aHtml += '<a href="case_examine.jsp?project_case_sn='+item.get("project_case_sn")+'">审核</a> ';
						}
						return aHtml;
					} ];
			var datalist = data.getXCOListValue("cases");
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
