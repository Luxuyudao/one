<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "职业认证";
%>
<head>
<meta charset="utf-8" />
<title>职业认证</title>
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
				<li>职业认证</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>职业认证</h1>
			</div>
			<div class="row-fluid">
				<form class="form-inline bord1dd">
					<div class="form-group overhidden">
						<div class="fl mar-t-15">
							<label for="">用户名称</label> <input id="username" type="text"
								class="form-control" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">公司名称</label> <input id="coname" type="text"
								class="form-control" placeholder=""> 
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
							<th>用户名称</th>
							<th>公司名称</th>
							<th>行业分类</th>
							<th>公司电话</th>
							<th>审核结果</th>
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
		xco.setStringValue("username", $("#username").val());//用户名称
		xco.setStringValue("company_name", $("#coname").val());//公司名称
		var options = {
			url : "/tvr-system/getprofessionlist.xco",
			data : xco,
			success : getprofessionlistCallBack
		};
		$.doXcoRequest(options);
	}

	var renderPage = true;
	function getprofessionlistCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [
					'nick_name', //用户名称
					'company_name', //公司名称
					function(item){//行业类型
						var array=item.get('project_catg_name').split(",");
						return array[array.length-1];
					}, 
					'company_phone', //公司电话
					function(item) {//状态	
						return getAuditState(item.get('audit_state'));
					}, 
					//操作	
					function(item) {
						var aHtml = '';
						aHtml += '<a href="occupation_details.jsp?user_id='+item.get("user_id")+'">详情</a> ';
						if(item.get('audit_state')==10||item.get('audit_state')==20){
							aHtml += '<a href="occupation_examine.jsp?user_id='+item.get("user_id")+'">审核</a> ';
						}
						return aHtml;
					} ];
			var datalist = data.getXCOListValue("data");
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
