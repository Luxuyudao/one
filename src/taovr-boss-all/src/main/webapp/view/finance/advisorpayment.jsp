<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>确认付款</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
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

.wid155 {
	width: 153px;
}

.wid320 {
	width: 323px;
}

.wid107 {
	width: 105px;
}

.align_center {
	text-align: center;
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
	<div id="main-content" class="clearfix" data-page="projectcenter">
		<div class="row-fluid">
			<!-- PAGE CONTENT BEGINS HERE -->
			<div class="row-fluid mar-t-15">
				<div class="span12">
					<form class="form-inline bord1dd form-add1">
						<div class="form-group mar-t-15">
							<label>账单编号</label><span id="bill_sn"></span>
						</div>
						<div class="form-group mar-t-15">
							<label>收款用户</label><input id="in_account_holder" type="text"
								class="form-control wid310" placeholder=""> 
						</div>
						<div class="form-group mar-t-15">
							<label>收款账号</label> <input id="in_account" type="text"
								class="form-control wid310" placeholder="">
						</div>
						<div class="form-group mar-t-15">
							<label>收款银行</label> <input id="in_banks" type="text"
								class="form-control wid310" placeholder="">
						</div>
						<div class="form-group mar-t-15">
							<label>支付金额</label>
							<span id="bill_amount"></span>
						</div>
						<div class="form-group mar-t-15">
							<label>付款用户 </label> <span>上海迪拓网络科技有限公司</span>
						</div>
						<div class="form-group mar-t-15">
							<label>付款账号 </label><span>449468054115</span>
						</div>
						<div class="form-group mar-t-15">
							<label>付款银行</label> <span>中国银行上海市梅川路支行</span>
						</div>
						<div class="form-group mar-t-15">
							<label>备注</label>
							<textarea id="remark" class="form-control  mar-t-15 wid310"
								rows="4"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="tc mar-t-20" style="margin-bottom: 30px;">
				<button id="select" type="button" class="btn btn-submit"
					data-toggle="button">
					<i class=" icon-ok mr10"></i>提交
				</button>
			</div>
		</div>

	</div>
	
</body>
<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
<script src="http://file.demo1.com/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.sparkline.min.js"></script>
<script src="http://file.demo1.com/js/ace-elements.min.js"></script>
<script src="http://file.demo1.com/js/ace.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/xco2.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco-src2.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>
<script type="text/javascript">
	var bill_sn = getURLparam("bill_sn");
	var project_sn='';
	function getBillList(_bill_sn) {
		var xco=new XCO();
		xco.setStringValue("bill_sn",_bill_sn);
		
		var options = {
			url : "/tvr-finance/getBillListF12.xco",
			data : xco,
			success : getBillListCallBack
		};

		$.doXcoRequest(options);
	}
	
	function getBillListCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			$("#bill_amount").text(parseInt(data.getStringValue("bill_amount"))/100);
			project_sn=data.getStringValue("project_sn");
		}
	}
	$(function() {
		$("#bill_sn").text(bill_sn);
		$("#select").click(function() {
			var xco = new XCO();
			xco.setStringValue("in_account_holder",$("#in_account_holder").val());//收款用户
			xco.setStringValue("in_account", $("#in_account").val());//收款用户
			xco.setStringValue("in_banks",  $("#in_banks").val());//收款银行
			xco.setIntegerValue("in_type", 3);//账号类型
			xco.setStringValue("out_account_holder",'犀牛数码科技有限公司');//付款用户
			xco.setStringValue("out_account", '449468054115');//付款用户
			xco.setStringValue("out_banks", '中国银行上海市梅川路支行');//付款银行
			xco.setIntegerValue("out_type", 3);//账户类型
			xco.setIntegerValue("pay_channels", 2);//支付渠道
			xco.setStringValue("bill_sn", bill_sn);//账单编号
			xco.setStringValue("project_sn", project_sn);//项目编号
			xco.setStringValue("title_in", '');//明细标题
			xco.setStringValue("title_out", '');//明细标题

			var options = {
				url : "/tvr-finance/updateBillF10.xco",
				data : xco,
				success : updateBillCallBack
			};

			$.doXcoRequest(options);

		})
	});

	function updateBillCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			alert("确认成功");
			closeWin();
		}
	}
	//关闭弹窗
	function closeWin() {
		parent.window.location.href="advisorbill.jsp?project_sn="+project_sn;
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	}
	getBillList(bill_sn);
</script>
</html>
