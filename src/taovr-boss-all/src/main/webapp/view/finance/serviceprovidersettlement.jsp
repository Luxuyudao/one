<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
		String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>服务商账单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp"%>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/finance/index.jsp">财务中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li>服务商账单</li>
				</ul>
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>服务商账单</h1>
				</div>
				<div class="row-fluid">
					<div class="row-fluid">
						<form class="form-inline bord1dd">
                  
							<div class="form-group overhidden">
								<div class="fl mar-t-15">
									<label for="">账单编号</label> <input type="text"
										class="form-control" placeholder="">
								</div>
								<div class="fl mar-t-15">
									<label for="">任务名称</label> <input type="text"
										class="form-control" placeholder="">
								</div>
								<div class="fl mar-t-15">
									<label for="">服务商</label> <input type="text"
										class="form-control" placeholder="">
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
											<th>账单编号</th>
											<th>账单名称</th>
											<th>收款用户</th>
											<th>支付金额</th>
											<th>状态</th>
											<th>备注</th>
											<th>操作</th>
										</tr>
									</thead>
										<tbody id="table_content">
										</tbody>
								</table>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var project_sn = getURLparam("project_sn");
	getMyProjectList(project_sn);	
	function getMyProjectList(project_sn) {
		var xco = new XCO();
		xco.setIntegerValue("project_sn", project_sn);
		var options = {
			url : "/tvr-finance/getBillListF8.xco",
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
			var keyOptions = [ 'bill_sn', //账单编号
			'bill_title', //账单名称
			'in_user_name', //收款用户
			function(item) {
				return parseInt(item.get('bill_amount')) / 100;
			}, //金额	

			//项目状态	
			function(item) {

				if (item.get('bill_state') == 0) {
					var aHtml = '无效';
					return aHtml;
				}
				if (item.get('bill_state') == 10) {
					var aHtml = '未支付';
					return aHtml;
				}
				if (item.get('bill_state') == 20) {
					var aHtml = '支付中';
					return aHtml;
				}
				if (item.get('bill_state') == 30) {
					var aHtml = '支付失败';
					return aHtml;
				}
				if (item.get('bill_state') == 100) {
					var aHtml = '支付成功';
					return aHtml;
				}

			},
			'remark', //备注
			//操作				
			function(item) {
				if (item.get('bill_state') == 10) {
					return checkUrl(item);
				}
				return "";
			},//操作
			];
			var datalist = data.getXCOListValue("data");
			renderTable("#table_content", datalist, keyOptions);

		}
	}
	function checkUrl(item) {
		return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuan("
				+ item.get("bill_sn") + ")\">确认付款</a>";
	}
	function tanchuan(bill_sn) {
		layer.open({
			type : 2,
			title : "确认付款",
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ "800px", "600px" ],
			content : [ "serviceproviderpayment.jsp?bill_sn=" + bill_sn]
		});
	}
</script>
</html>
