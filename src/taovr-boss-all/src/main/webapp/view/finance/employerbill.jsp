<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
		String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>雇主账单</title>
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
				<li>雇主账单</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>雇主账单</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label class="mar-t-15">项目编号</label> <span class="mar-t-15"
									id="project_sn"></spam>
							</div>
							<div class="form-group">
								<label class="mar-t-15">付款用户</label> <span class="mar-t-15"
									id="employer_name"></span>
							</div>
							<div class="form-group">
								<label class="mar-t-15">项目金额</label> <span class="mar-t-15"
									id="real_amount"></span><span>元</span> <em style="margin-left:50px"
									class="red mar-t-15 tips mar-l-10">*付款总金额不得大于项目金额</em>
							</div>
							<div class="form-group">
								<label class="mar-t-15">已付金额</label> <span class="mar-t-15"
									id="paid_amount"></span><span>元</span>
							</div>
							<div class="form-group">
								<label class="mar-t-15">待付金额</label> <span class="mar-t-15 "
									id="payment_amount"></span><span>元</span>
							</div>
							<div class="form-group">
								<label class="mar-t-15">支付金额</label> <input   id="zfje" type="text" class="form-control  mar-t-15 wid140">元
							    <span style="font-size:20px"></span><em style="margin-left:50px" class="red mar-t-15 tips mar-l-10">*支付金额不得大于待支付总额</em>
							</div>
							<div class="form-group overhidden">
								<label class="fl mt20">到期日期</label>
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


							<div class="form-group">
								<label class="mar-t-15">备注</label>
								<textarea id="remark" class="form-control  mar-t-15 wid310"
									rows="4"></textarea>
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
					<tbody id="table_content">

					</tbody>
				</table>
			</div>
		</div>
</body>
<script type="text/javascript">
	var out_user_name = '';
	var out_user_id = '';
	var project_name = '';
	//查询账单信息
	var project_sn = getURLparam("project_sn");
	getMyProjectTaskList(project_sn);	
	function getMyProjectTaskList(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url :"/tvr-project/getProject1.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			out_user_id = data.getLongValue("employer_id");
			out_user_name = data.getLongValue("employer_name");
			project_name = data.getStringValue("project_name");
			$("#project_sn").text(data.getStringValue("project_sn")); //项目编号
			$("#employer_name").text(data.getStringValue("employer_name")); //付款用户			
			$("#real_amount").text(
					parseInt(data.getStringValue("real_amount")) / 100); //项目金额.
			$("#paid_amount").text(
					parseInt(data.getStringValue("received_amount")) / 100); //已付金额	
			$("#payment_amount").text((parseInt(data.getIntegerValue("real_amount")) - parseInt(data.getIntegerValue("received_amount"))) / 100);//代付金额

		}
	}


	//账单列表
	function getMyProjectLists(_project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", _project_sn);
		var options = {
			url : "/tvr-finance/getBillListF4.xco",
			data : xco,
			success : getMyProjectListCallBacks
		};
		$.doXcoRequest(options);
	}

	function tanchuan(bill_sn) {
		layer.open({
			type : 2,
			title : "确认付款",
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ "800px", "600px" ],
			content : [ "employerpayment.jsp?bill_sn=" + bill_sn]
		});
	}

	var renderPage = true;
	function getMyProjectListCallBacks(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var keyOptions = [ 'bill_sn', //账单编号
			'bill_title', //账单名称
			'out_user_name', //付款用户
			function(item) {
				return parseInt(item.get('bill_amount')) / 100;
			}, //支付金额	
			 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("plan_time"));
				    },			

			function(item) {
				//项目状态	
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
			},//状态	
			'remark', //备注	
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
	getMyProjectLists(project_sn);
	function refresh() {
		window.location.reload();//刷新当前页面.
	}

	function checkUrl(item) {
		return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuan("
				+ item.get("bill_sn") + ")\">确认付款</a>";
	}

	$(document).ready(function() {
		$("#sc_btn").click(function() {
			var xco = new XCO();
			xco.setStringValue("bill_title",getBillTitleState(project_name, 1));//账单名称
			xco.setIntegerValue("bill_amount",parseInt($("#zfje").val()) * 100);//账单金额
			xco.setStringValue("project_sn", $("#project_sn").text());//项目编号
			xco.setLongValue("in_user_id", '1');//入帐方ID
			xco.setStringValue("in_user_name","北京犀牛数码科技有限公司");//入帐方名称
			xco.setLongValue("out_user_id",out_user_id);//出帐方ID
			xco.setStringValue("out_user_name",out_user_name);//出帐方名称
			xco.setIntegerValue("pay_channels",2);//支付渠道
			xco.setStringValue("plan_time", $("#date_time").val());//预计支付时间
			xco.setStringValue("remark", $("#remark").val());//备注

			var options = {
				url : "/tvr-finance/insertBillF5.xco",
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
			alert("生成账单成功！！");
			refresh();
		}
	}
</script>

</html>
