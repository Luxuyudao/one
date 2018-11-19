<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>应收款项</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="accountsreceivable">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="http://advisor.demo1.com/index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>应收款项</li>
			</ul>
			<!--.breadcrumb-->

		</div>
		<!--#breadcrumbs-->

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>应收款项</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<table id="table_bug_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>账单编号</th>
									<th>账单名称</th>
									<th>付款用户</th>
									<th>支付金额</th>
									<th>预计支付时间</th>
									<th>支付成功时间</th>
									<th>状态</th>
									<th>备注</th>
								</tr>
							</thead>
							<tbody id="table_content">
							</tbody>
						</table>
						<div class="pagination fr">
							<ul id="pagination_1"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>

</body>

<script type="text/javascript">
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setIntegerValue("bill_type", 2);
		var options = {
			url : "/tvr-finance/getBillListF14.xco",
			data : xco,
			success : getMyProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	var renderPage = true;
	function getMyProjectListCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [

			'bill_sn', //账单编号
			'bill_title', //账单名称
			'out_user_name', //付款用户
			function(item) {
				return parseInt(item.get('bill_amount')) / 100+ "元";
			}, //支付金额	
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("plan_time"));
				    },
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("finish_time"));
				    },
			function(item) {

				if (item.get('project_state') == 0) {
					var aHtml = '无效';
					return aHtml;
				}
				if (item.get('project_state') == 10) {
					var aHtml = '未支付';
					return aHtml;
				}
				if (item.get('project_state') == 20) {
					var aHtml = '支付中';
					return aHtml;
				}
				if (item.get('project_state') == 30) {
					var aHtml = '支付失败';
					return aHtml;
				}

				if (item.get('project_state') == 100) {
					var aHtml = '支付成功';
					return aHtml;
				}
				else{
					return "状态异常"
				}
			},//状态
			'remark', //备注
			];
			var datalist = data.getXCOListValue("bills");
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
