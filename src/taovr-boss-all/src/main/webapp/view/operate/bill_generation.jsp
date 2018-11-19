<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "任务管理";
%>
<head>
<meta charset="utf-8" />
<title>账单生成</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
<div id="main-content" class="clearfix" data-page="operate" sub-page="providerbillgeneration">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营管理</a><span class="divider"><i
						class="icon-angle-right"></i> </span>
				</li>
				<li>账单生成</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>账单生成</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<form class="form-inline bord1dd form-add1">
					<div class="form-group">
						<label>*任务编号</label> <span id="project_task_sn"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*任务名称</label> <span id="task_name"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*任务状态</label> <span id="task_state"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*顾问 </label> <span id="adviser_name"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*服务商 </label> <span id="providers_name"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*验收日期</label> <span id="update_time"></span>
					</div>

					<div class="form-group mar-t-15">
						<label>*支付金额</label> <span id="real_amount"></span>
						<span>元</span>
					</div>
					<div class="form-group mar-t-15">
						<label for="" class="fl" style="margin-top:3px;">到期日期</label>
						<div style="width:160px;" class="ml5 input-append date fl">
							<input class="span10 date-picker" id="end_time"
								data-date-format="yyyy-mm-dd" type="text"> <span
								class="add-on"><i class="icon-calendar"></i> </span>
						</div>
					</div>

				</form>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">
						<i class=" icon-ok mr10"></i>提交
					</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript:back()">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function back(){
		window.location.href="http://manager.boss.demo1.com/view/operate/task_audit.jsp";
	}

var project_task_sn=getURLparam("project_task_sn");
var project_sn='';
var in_user_id='';
var in_user_name='';
	$(document).ready(function(){
		$("#tj_btn").click(function(){
			var xco=new XCO();
			xco.setStringValue("bill_title",getBillTitleState($("#task_name").text(),3));//账单名称
			xco.setIntegerValue("bill_amount",parseInt($("#real_amount").text())*100);//账单金额
			xco.setStringValue("project_sn",project_sn);//项目编号
			xco.setStringValue("project_task_sn",$("#project_task_sn").text());//任务编号
			xco.setLongValue("in_user_id",in_user_id);//入帐方ID
			xco.setStringValue("in_user_name",in_user_name);//入帐方名称
			xco.setLongValue("out_user_id",'1');//出帐方ID
			xco.setStringValue("out_user_name",'系统');//出帐方名称
			xco.setIntegerValue("pay_channels",2);//支付渠道
			xco.setStringValue("plan_time",$("#end_time").val());//预计支付时间
			xco.setStringValue("remark","");//备注
			
			var options = {
				url : "/tvr-finance/insertBillF16.xco",
				data : xco,
				success : getInsertBillCallBack
			};
			$.doXcoRequest(options);
		});
	});
	
	function getInsertBillCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			jAlert("生成账单成功","提示",function(r){
				window.location.href="task_audit.jsp";
		});
		}
	}
	function getProjectTask(_project_task_sn){
		var xco=new XCO();
		xco.setStringValue("project_task_sn",_project_task_sn);
		
		var options = {
			url : "/tvr-project/getProjectTask1.xco",
			data : xco,
			success : getProjectTaskCallBack
		};
		$.doXcoRequest(options);
	} 
	
	function getProjectTaskCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			$("#project_task_sn").text(data.getStringValue('project_task_sn'));
			$("#task_name").text(data.getStringValue('task_name'));
			$("#task_state").text(getProjectState(data.getStringValue('task_state')));
			$("#adviser_name").text(data.getStringValue('adviser_name'));
			$("#providers_name").text(data.getStringValue('providers_name'));
			$("#update_time").text(data.getStringValue('update_time'));
			$("#real_amount").text(parseInt(data.getStringValue('real_amount'))/100);
			in_user_id=data.getStringValue('providers_id');
			in_user_name=data.getStringValue('providers_name');
			project_sn=data.getStringValue('project_sn');
		}
	}
	getProjectTask(project_task_sn);
</script>
</html>