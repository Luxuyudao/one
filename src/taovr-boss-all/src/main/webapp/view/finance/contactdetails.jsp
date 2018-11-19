<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
	String pageName = "来往明细";
%>
<head>
<meta charset="utf-8" />
<title>来往明细</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="contactdetails">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/finance/index.jsp">财务中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>来往明细</li>
			</ul>
			<!--.breadcrumb-->

		</div>
		<!--#breadcrumbs-->

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>来往明细</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">

							<div class="fl mar-t-15">
								<label for=""  class="fl" style="margin-top:3px;">起始时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
								<input  id="start_time" class="span10 date-picker" id="id-date-picker-1" data-date-format="yyyy-mm-dd" type="text">
								<span class="add-on"><i class="icon-calendar"></i></span> 
							</div>
           					 </div>
							<div class="fl mar-t-15">
								<label for=""  class="fl" style="margin-top:3px;">结束时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input id="end_time" class="span10 date-picker" id="id-date-picker-1" data-date-format="yyyy-mm-dd" type="text">
									<span class="add-on"><i class="icon-calendar"></i></span> 
								</div>
				            </div>
							<div class="fl mar-t-15">
								<label for="">账户</label> <input id="username" type="text" class="form-control"
									placeholder="">
							</div>
							
								<div class="fl mar-t-15">
										<label for="">费用类型</label> <select id="amount_type"
											class="form-control marg0  wid80 vm">
											<option value="0">全部</option>
											<option value="1">收入</option>
											<option value="2">支出</option>			
										</select>
									</div>
							<button type="button" id="cx_btn"
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
										<th>流水编号</th>
										<th>创建时间</th>
										<th>账户</th>
										<th>金额</th>
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
		</div>
	</div>
</body>
<script type="text/javascript">
	var amount='';
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
		xco.setStringValue("start_time", $("#start_time").val());//开始时间
		xco.setStringValue("end_time", $("#end_time").val());//开始时间
		xco.setStringValue("user_name", $("#username").val());//账户	.
		if ($("#amount_type").val() != 0) {	
			xco.setIntegerValue("amount_type", $("#amount_type").val());//状态
		}
		var options = {
			url : "/tvr-finance/getBillListF2.xco",
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

			'pay_record_sn', //流水编号
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },
			'user_name', //账户	
			function(item) {
				return parseInt(item.get('amount')) / 100 + "元";
			}, //金额

			function(item) {
				if (item.get('details_type') == 1) {
					var aHtml = '雇主支付项目款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
				if (item.get('details_type') == 2) {
					var aHtml = '平台收入项目款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
				if (item.get('details_type') == 3) {
					var aHtml = '平台支付专家款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
				if (item.get('details_type') == 4) {
					var aHtml = '平台收入专家款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
				if (item.get('details_type') == 5) {
					var aHtml = '平台支付服务款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
				if (item.get('details_type') == 6) {
					var aHtml = '服务商收入服务款';
					aHtml += parseInt(item.get('amount')) / 100 + "元";
					return aHtml;
				}
			} //备注				
			];
			var datalist = data.getXCOListValue("fundDetailList");
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
