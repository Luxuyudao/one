<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>应收账款</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>

	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_list">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
					class="divider"><i class="icon-angle-right"></i>
				</span></li>
				<li>应收款项</li>
			</ul>


		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>应收账款</h1>
			</div>
			
			<!--/page-header-->
			      <form class="form-inline bord1dd mar-t-15">
			          <div class="form-group overhidden">
			         	<div class="fl mar-t-15">
			            <label for="">账单编号</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="bill_sn">
			            </div>
			            <div class="fl mar-t-15">
			            <label for="">账单名称</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="bill_title">
			            </div>
			            <div class="fl mar-t-15">
			            <label for="">金额范围</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="a_min">
			            &nbsp;&nbsp;&nbsp;<span>至</span>&nbsp;&nbsp;&nbsp;
			            <input type="text" class="form-control wid140"  placeholder="" id="a_max">
			            </div>
			            <div class="fl mar-t-15">
			            <label>账单状态</label>
			            <select type="text" class="form-control wid140"  placeholder="" id="bill_state">
			              <option value="1">全部</option>
			              <option value="0">无效</option>
			              <option value="10">未支付</option>
			              <option value="20">支付中</option>
			              <option value="30">支付失败</option>
			              <option value="100">支付成功</option>
			            </select>
			            </div>
			            <button type="button" class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub" id="cx_btn" data-toggle="button">查询</button>
			          </div>
			        </form>
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
						<div class="tc mar-t-20">
							<button type="button" class="btn btn-submit" data-toggle="button"
								onClick="javascript :history.back(-1);" style="float: left;">返回</button>
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
				getMyProjectList(0, globle_page_size);
			});
		}); 
		
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setIntegerValue("bill_type", 3);
		xco.setStringValue("bill_sn", $("#bill_sn").val());//账单编号
		xco.setStringValue("bill_title", $("#bill_title").val());//账单名称
		if($("#a_min").val()!=''&&$("#a_min").val()!=null){
			xco.setIntegerValue("a_min", parseInt($("#a_min").val())*100);//金额
		}
		if($("#a_max").val()!=''&&$("#a_max").val()!=null){
			xco.setIntegerValue("a_max",  parseInt($("#a_max").val())*100);//金额
		}
			if ($("#bill_state").val() != 1) {
				xco.setIntegerValue("bill_state", $("#bill_state").val());//状态
			} 
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
				jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [
			'bill_sn', //账单编号
			'bill_title', //账单名称
			'out_user_name', //付款用户
			function(item) {
				return parseInt(item.get('bill_amount')) / 100+"元";
			}, //支付金额	
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("plan_time"));
				    }, //预计到账日期
				    
				    
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("finish_time"));
				    }, //支付成功日期
				    
				    
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
