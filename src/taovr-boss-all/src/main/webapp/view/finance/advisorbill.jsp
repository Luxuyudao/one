<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
		String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>顾问账单</title>
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
				<li>顾问账单</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>顾问账单</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label class="mar-t-15 ">*项目编号</label> <label class="mar-t-15 "
									style="text-align:left;" id="project_sn"></label>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*项目名称</label> <label class="mar-t-15 "
									style="text-align:left;" id="project_name"></label>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*项目状态</label> <label class="mar-t-15 "
									style="text-align:left;" id="project_state"></label>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*收款用户</label> <label class="mar-t-15 "
									style="text-align:left;" id="adviser_name"></label>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*项目金额</label>
								 <span class="mar-t-15 "style="text-align:left;" id="real_amount"> </span>
								<span class="mar-t-15 ">元</span>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*已收款项</label> <span class="mar-t-15 "
									style="text-align:left;" id="received_amount"></span><span>元</span> <em
									class="red mar-t-15 tips mar-l-10" style="margin-left:70px">如果已收款项不等于项目款项，不允许生成账单</em>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*顾问支出</label> <span class="mar-t-15 "
									style="text-align:left;" id="paid_advi_amount"></span>
									<span>元</span>
							</div>
							<div class="form-group">
								<label class="mar-t-15">*利润</label> <span class="mar-t-15 "
									style="text-align:left;" id="lr"></span>
									<span>元</span>
							</div>
							<div class="form-group mar-t-15">
								<label>*提成</label> <input id="tc" type="text" style="width:160px">
								<span>%</span> <em class="red tips mar-l-10">提成比例不得大于10%</em>
							</div>
							<div class="form-group mar-t-15">
								<label>*结算金额</label> <span id="jsje"></span>
								<div>
									<div class="form-group overhidden">
										<label class="fl mt20">*到期日期</label>
										<div style="width:200px;"
											class="row-fluid mar-t-15 ml5 input-append date fl">
											<input class="span10 date-picker" id="date_time" type="text"
												data-date-format="yyyy-mm-dd"> <span class="add-on"><i
												class="icon-calendar"></i> </span> <label
												style="text-align:center;width:130px;"> <input
												name="form-field-checkbox" class="ace ace-checkbox-2"
												type="checkbox" /> <span class="lbl" style="width:140px;">提前3天提醒</span>
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="mar-t-15">*备注</label>
									<textarea id="remark" class="form-control  mar-t-15 wid310"
										rows="4"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="tc mar-t-20">
								<button id="sc_btn" type="button" class="btn btn-submit"
									data-toggle="button">
									<i class=" icon-ok mr10"></i>生成账单
								</button>
							</div>
						</div>

					</div>
				</div>
				<hr />
				<table id="table_bug_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>账单编号</th>
							<th>账单名称</th>
							<th>付款用户</th>
							<th>支付金额</th>
							<th>到期日期</th>
							<th>状态</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="bill_table">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var in_user_id = '';
	var in_user_name = '';
	//查询账单信息
	var project_sn = getURLparam("project_sn");
	getMyProjectTaskList(project_sn);	
	function getMyProjectTaskList(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "/tvr-project/getProject1.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}
	getBillList(project_sn);	
	function getBillList(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "/tvr-finance/getBillListF6.xco",
			data : xco,
			success : getBillListCallBack
		};
		$.doXcoRequest(options);
	}

	function getBillListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var bill = data.getXCOListValue("data");
			var keyOptions = [ 'bill_sn',//账单编号
			'bill_title',//账单名称
			'out_user_name',//付款账户
			function(item) {//支付金额
				return parseInt(item.get('bill_amount')) / 100;
			}, 
			function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("plan_time"));
				    },
			function(item) {//状态
				return getBillState(item.get('bill_state'));
			}, 'remark',//备注
			function(item) {//操作
				if (item.get('bill_state') == 10) {
					return checkUrl(item);
				}
				return "";
			}, ];
			renderTable("#bill_table", bill, keyOptions);
		}
	}
	function tanchuan(bill_sn) {
		layer.open({
			type : 2,
			title : "确认付款",
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ "800px", "600px" ],
			content : [ "advisorpayment.jsp?bill_sn=" + bill_sn ]
		});
	}
	function checkUrl(item) {
		return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuan("
				+ item.get("bill_sn") + ")\">确认付款</a>";
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			$("#project_sn").text(data.getStringValue("project_sn")); //项目编号
			$("#project_name").text(data.getStringValue("project_name")); //项目名称
			$("#project_state").text(data.getStringValue("project_state")); //项目状态
			$("#adviser_name").text(data.getStringValue("adviser_name")); //收款用户
			$("#real_amount").text(parseInt(data.getStringValue("real_amount")) / 100); //项目金额
			$("#received_amount").text(parseInt(data.getStringValue("received_amount")) / 100); //已收款项
			$("#paid_advi_amount").text(parseInt(data.getStringValue("paid_advi_amount")) / 100); //专家支出
			$("#lr").text(parseInt(data.getIntegerValue("real_amount"))/ 100- parseInt(data.getIntegerValue("paid_advi_amount"))/ 100);//利润														
			in_user_id = data.getLongValue("adviser_id");
			in_user_name = data.getLongValue("adviser_name");
		}
	}
	$(document).ready(function() {
		$('#tc').bind('input propertychange',function() {
			$("#jsje").text(parseInt($("#lr").text())* parseInt(this.value)/ 100);
		}).bind('input input',function() {
			$("#jsje").text(parseInt($("#lr").text())* parseInt(this.value)/ 100);
		});
		$("#sc_btn").click(function() {
			var xco = new XCO();
			xco.setStringValue("bill_title",getBillTitleState($("#project_name").text(), 2));//账单名称
			xco.setIntegerValue("bill_amount",parseInt($("#jsje").text()) * 100);//账单金额
			xco.setStringValue("project_sn", $("#project_sn").text());//项目编号
			xco.setLongValue("in_user_id",in_user_id);//入帐方ID
			xco.setStringValue("in_user_name",in_user_name);//入帐方名称
			xco.setLongValue("out_user_id", '1');//出帐方ID
			xco.setStringValue("out_user_name",'系统');//出帐方名称
			xco.setIntegerValue("pay_channels",2);//支付渠道
			xco.setStringValue("plan_time", $("#date_time").val());//预计支付时间
			xco.setStringValue("remark", $("#remark").val());//备注

			var options = {
				url : "/tvr-finance/insertBillF7.xco",
				data : xco,
				success : getInsertBillCallBack
			};
			$.doXcoRequest(options);
		});
	});

	function getInsertBillCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			alert("生成账单成功");
			refresh();
		
		}
	}
	function refresh() {
		window.location.reload();//刷新当前页面.
	}
</script>
</html>
