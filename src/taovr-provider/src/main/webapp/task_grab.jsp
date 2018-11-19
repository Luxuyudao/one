<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务抢单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_receive">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>任务抢单</li>
			</ul>
		</div>
		<div>
			<div class="header">
				<h3 style="margin-left: 25px;color:#2679b5">任务抢单</h3>
			</div>
			<div class="row-fluid">
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label>任务名称</label> <span id="task_name"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>任务顾问</label> <span id="adviser_name"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>任务周期</label> <span id="cycle"></span>
							</div>

							<div class="form-group mar-t-15">
								<label>任务酬劳</label> <span id="real_amount"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>任务类型</label> <span id="task_type"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>实施地址</label> <span id="address"></span>
							</div>
								<div class="form-group overhidden">
					                <label class="mar-t-15 pull-left">任务附件</label>
					                <div class="overhidden formwrapper1">
					                  <ul class="wid310 unstyled" id="resources1">
					                  </ul>
					                </div>
					            </div>

						</form>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">抢单</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript:back();">返回</button>
				</div>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
	function back(){
		window.location.href="project_receive.jsp";
	}
	var project_task_sn = getURLparam("project_task_sn");
	var task_push_id = getURLparam("task_push_id");
	$(document).ready(function() {
		$("#tj_btn").click(function() {
			var xco = new XCO();
			xco.setIntegerValue("task_push_id",task_push_id);
			xco.setStringValue("project_task_sn",project_task_sn);
			var options = {
				url : "/project-operate/updateTaskP22.xco",
				data : xco,
				success : getUpdateTaskCallBack
			};
			jConfirm("确认抢此任务吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
	});

	function getUpdateTaskCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			jAlert("抢单成功","提示",function(r){
				window.location.href="project_list.jsp";
			});
		}
	}
	
	getProjectTask(project_task_sn);
	function getProjectTask(project_task_sn) {
		var xco = new XCO();
		xco.setStringValue("project_task_sn", project_task_sn);
		var options = {
			url : "/tvr-project/getProjectTask2.xco",
			data : xco,
			success : getProjectTaskCallBack
		};
		$.doXcoRequest(options);
	}

	function getProjectTaskCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var task = data.getXCOValue("task");//任务详情表
			var resources = data.getXCOListValue("resources");//附件表
			$("#task_name").text(task.getStringValue("task_name"));// 任务名称暂缺
			$("#adviser_name").text(task.getStringValue("adviser_name"));//任务顾问
			$("#cycle").text(task.getIntegerValue("task_cycle")+ task.getStringValue("cycle_unit_name"));//任务周期
			$("#real_amount").text(parseInt(task.getStringValue("real_amount")) / 100 + "元");//任务酬劳
			$("#task_type").text(task.getStringValue("task_type"));//任务类型
			$("#address").text(task.getStringValue("task_province")+task.getStringValue("task_city")+task.getStringValue("task_area")+task.getStringValue("task_addr"));//实施地址
			$("#task_desc").text(task.getStringValue("task_desc"));//任务要求
			var fjHtml = '';
			if (resources == null || undefined == resources) {//任务附件
				$("#resources1").append(getResourcesNull(fjHtml));
			} else {
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 2) {//任务需求附件
						fjHtml = getResources2(fjHtml, resources[i]);
					}
					if (resources[i].getIntegerValue("type") == 8) {//任务验收附件
						fjHtml = getResources2(fjHtml, resources[i]);
					}
				}
				if (fjHtml == null || fjHtml == '') {
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}
		}
	}
</script>
</html>
