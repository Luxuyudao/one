<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>会员管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
<style>
/*提交按钮样式 */
.btn-sub {
	padding: 5px 35px;
	vertical-align: bottom;
	margin-left: 10px;
}

.create-btn {
	padding: 40px 35px 1px;
	line-height: 140px;
}

.float_left {
	float: left;
}

.float_right {
	float: right;
}

.margin_left {
	margin-left: 30px;
}

.margin_right {
	margin-right: 30px;
}

.clear {
	clear: both;
}

.padding_left {
	padding-left: 30px;
}

.padding {
	padding: 0px 15px;
}

.padding2 {
	padding: 20px 20px;
}

.padding_right {
	padding-right: 30px;
}

.div-inline {
	display: inline-block;
}

.width {
	width: 350px;
}

.margin_top {
	margin-top: 5px;
}

.align_left {
	text-align: left;
}

.bg_eee {
	background-color: #eee;
}

.margin {
	margin-left: 145px;
}
/* 备注文本框*/
input.remark {
	width: 540px;
}

table>tbody>tr>td {
	vertical-align: middle !important;
}

table>tbody>tr>td>label>input {
	width: 50px;
	margin-bottom: 0 !important;
}

table>tbody>tr>td>label>select {
	width: 80px;
	margin-bottom: 0 !important;
}
</style>
</head>

<body>
		<div id="main-content" class="clearfix">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="我的案例.html">我的案例</a><span class="divider"></i>
					</span></li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>我的案例</h1>
				</div>
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<!--<span>货架编号：</span><span>01</span>
                    <span>所属仓库：</span><span>01</span>-->
						<div class="form-group overhidden">

							<div class="fl mar-t-15">
								<label for="" class="fl" style="margin-top:3px;">创建时间</label>
								<div style="width:150px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" data-date-format="dd-mm-yyyy"
										type="text"> <span class="add-on"><i
										class="icon-calendar"></i> </span>
								</div>
								<span class="fl" style="margin-top:3px;">&nbsp;&nbsp;至&nbsp;</span>
								<div style="width:150px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" data-date-format="dd-mm-yyyy"
										type="text"> <span class="add-on"><i
										class="icon-calendar"></i> </span>
								</div>
							</div>
							<div class="fl mar-t-15">
								<label for="">项目名称</label> <input type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">金额范围</label> <input style="width:138px;"
									type="text" class="form-control" placeholder=""> <span>&nbsp;至&nbsp;</span>
								<input style="width:138px;" type="text" class="form-control"
									placeholder="">
							</div>

							<button type="button"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button">查询</button>
							<a href="我的案例-案例提交.html"><button type="button"
									class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
									data-toggle="button">新增案例</button> </a>
						</div>
					</form>
					<div class="row-fluid">
						<div class="row-fluid mar-t-15">
							<div class="span12">
								<table id="table_bug_report"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>创建时间</th>
											<th>项目名称</th>
											<th>行业分类</th>
											<th>项目工期</th>
											<th>项目金额</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="table_content">
										<tr>
											<td><span>2016-09-18 12:22:32</span>
											</td>
											<td><span>华北电池智能安防系统</span>
											</td>
											<td><span>16091812223201</span>
											</td>
											<td><span>6个月</span>
											</td>
											<td>
												<div>
													<span>800000元</span>
												</div>
											</td>
											<td><a class="blue" href="我的案例-案例展示.html">查看</a>
											</td>
										</tr>
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
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>
	
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(function() {
			$('.date-picker').datepicker();
			$('#timepicker1').timepicker({
				minuteStep : 1,
				showSeconds : true,
				showMeridian : false
			});

		});
	</script>
</body>

<script type="text/javascript"><%--
	function getMyCaseList(_start,_pageSize){
		var xco=new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		var options = {
			url : "http://advisor.demo1.com/tvr-project/getMyCaseList.xco",
			data : xco,
			success : getMyCaseListCallBack
		};
		$.doXcoRequest(options);
	}
	var renderPage=true;
	function getMyCaseListCallBack(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("cases");
			var keyOptions = [
					'create_time',//创建时间
					'project_case_name',//项目名称
					'project_catg',//行业分类
					function(item) {//项目周期
						return item.get('project_cycle')
								+ item.get('cycle_unit_name')
					}, function(item) {//项目预算
						return parseInt(item.get('budget_amount')) / 100+"元";
					}, function(item) {
						var aHtml = '';
						aHtml += '<a>查看</a> ';
						return aHtml;
					}, ];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),
						getMyCaseList, globle_page_size);
			}
		}
	}
	getMyCaseList(0,globle_page_size);
--%></script>
</html>