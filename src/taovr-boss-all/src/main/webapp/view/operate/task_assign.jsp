<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "任务管理";
%>
<head>
<meta charset="utf-8" />
<title>任务审核</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="operate" sub-page="taskaudit">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><i class="icon-home"></i><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
				<li>任务审核</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>任务审核</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label>*任务名称</label> <span id="task_name"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*任务顾问</label> <span id="adviser_name"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*任务周期</label> <span id="cycle"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*任务类型</label> <span id="task_type"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*任务酬劳</label> <span id="real_amount"></span>
							</div>
							<div class="form-group mar-t-15">
								<label class="div-inline">*任务要求</label>
								<p class="wid310 div-inline" id="task_desc"></p>
							</div>
							<!-- 
							<div class="form-group mar-t-15">
								<label class="div-inline">*任务附件</label>
								<span id="contract"></span><a class="blue" id="contract_url">下载</a>
							</div>
							 -->
							<div class="form-group overhidden">
				                <label class="mar-t-15 pull-left">任务附件</label>
				                <div class=" overhidden formwrapper1">
				                  <ul class="wid310 mar-t-15 unstyled" id="resources1">
				                    
				                  </ul>
				                </div>
				            </div>
							<div class="" style="margin:10px 20px;"></div>
							<div class="form-group">
								<label style="margin-top:10px;">审核意见</label> 
								<label class="inline" style="width:60px;"> 
									<input name="through" type="radio" class="ace" value="2"> <span class="lbl"> 通过</span> 
								</label>
								&nbsp; &nbsp; &nbsp; 
								<label class="inline" style="width:75px;"> 
									<input name="through" type="radio" class="ace" value="1" checked> <span class="lbl"> 不通过</span> 
								</label>
							</div>
							<div class="form-group">
								<label class="mar-t-15"></label>
								<textarea id="remark" class="form-control  mar-t-15 wid310"
									rows="4"></textarea>
							</div>
						</form>
					</div>
				</div>

				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">
						<i class=" icon-ok mr10"></i>提交
					</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript :back();">返回</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function back(){
	window.location.href="task_audit.jsp";
}
var project_task_sn='';
	$(document).ready(function(){
		$("#tj_btn").click(function(){
			var xco = new XCO();
			xco.setStringValue("project_task_sn",project_task_sn);
			xco.setIntegerValue("through",parseInt($('input:radio[name=through]:checked').val()));
			xco.setStringValue("remark",$("#remark").val());
			//xco.setStringValue("user_name",'张三');
			
			var options = {
				url: "/project-operate/updateTaskF63.xco",
				data: xco,
				success: getUpdateTaskCallBack
			};
			jConfirm("确认提交吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
	});
	
	function getUpdateTaskCallBack(data){
		if(data.getCode()!=0){
			jAlert('doCallBack error:\n' + data,"错误提示");
		}else{
			jAlert("审核成功！！","成功提示", function(r) {
				window.location.href="task_audit.jsp";
			});
	}
	}
	var project_task_sn = getURLparam("project_task_sn");
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
	
	function getProjectTaskCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var task = data.getXCOValue("task");
			$("#task_name").text(task.getStringValue("task_name")); 
			$("#adviser_name").text(task.getStringValue("adviser_name"));//任务顾问
			$("#cycle").text(
					task.getIntegerValue("task_cycle")
							+ task.getStringValue("cycle_unit_name"));//任务周期
			$("#task_type").text(task.getStringValue("task_type"));//任务类型
			$("#real_amount").text(task.getIntegerValue("real_amount")/100+"元");//任务酬劳
			$("#task_desc").text(task.getStringValue("task_desc"));//任务要求
			project_task_sn=task.getStringValue("project_task_sn");
			//$("#contract").text(data.getStringValue("contract"));//项目合约名称
			//$("#contract_url").attr("href",data.getStringValue("contract_url"));
			var resources=data.getXCOListValue("resources");
			var fjHtml = '';
				if(resources==null||undefined==resources){
				$("#resources1").append(getResourcesNull(fjHtml));
			}else{
				for(var i=0; i<resources.length; i++){
					if(resources[i].getIntegerValue("type")==2){//任务需求附件
						fjHtml = getResources2(fjHtml,resources[i]);
					}	
				}
				if(fjHtml==null||fjHtml==''){
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}	
		}
	}
</script>
</html>
