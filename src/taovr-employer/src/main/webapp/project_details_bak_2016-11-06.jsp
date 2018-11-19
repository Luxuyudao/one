<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>项目详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="index">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="http://employer.demo1.com/index.jsp">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li><a href="项目中心.html"></a><span class="divider"><i
							class="icon-angle-right"></i> </span></li>
					<li>项目详情</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->

			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>项目详情</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>项目编号</label> <span id="project_sn"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目顾问</label> <span id="adviser_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>行业分类</label> <span id="project_catg_name"></span>
								</div>

								<div class="form-group mar-t-15">
									<label>项目名称</label> <span id="project_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目周期</label> <span id="cycle"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目预算</label> <span id="budget_amount"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>实施地址</label> <span id="address"></span>
								</div>
								<div class="form-group mar-t-15">
									<label class="div-inline">需求描述</label>
									<p class="wid310 div-inline" id="project_desc"></p>
								</div>

								<div class="form-group">
									<label style="font-weight:bold;" id="resources2">任务附件</label>
								</div>
								<div id="resources1"></div>
								<div class="hr hr-24" style="margin:10px 20px;"></div>
								<div class="form-group">
									<label style="font-weight:bold;">项目合约</label> <span id="contract"></span><a
										class="blue" id="contract_url">下载</a>
								</div>
								<div class="hr hr-24" style="margin:10px 20px;"></div>
								<div class="form-group">
									<label style="font-weight:bold;">项目进度</label>
									<div style="text-align:center;">
										<table
											class="table table-striped table-bordered table-hover margin"
											style="width:80%;margin-left:140px;">
											<thead>
												<tr>
													<th>任务编号</th>
													<th>任务名称</th>
													<th>任务内容</th>
													<th>任务状态</th>
													<th>任务进度</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="table_task_content">
											</tbody>
										</table>
									</div>
								</div>
								<div class="hr hr-24" style="margin:10px 20px;"></div>
								<div class="form-group">
									<label style="font-weight:bold;">验收结果</label>
									<table class="table table-striped table-bordered table-hover margin" style="width:80%; margin-left:140px;">
										<tbody id="table_applies_content">
											
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button"
							onClick="javascript :history.back(-1);"><i class=" icon-undo mr10"></i>返回</button>
						<!-- 
						<button type="button" class="btn btn-submit" data-toggle="button"><i class=" icon-print mr10"></i>打印</button>
						 -->
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
</body>
	<script type="text/javascript">
		//获取我的任务列表
		function getMyProjectTaskList(project_sn){
			var xco=new XCO();
			xco.setStringValue("project_sn", project_sn);
			var options = {
				url: "/tvr-project/getProject4.xco",
				data: xco,
				success: getMyProjectTaskListCallBack
			};
			$.doXcoRequest(options);
		}
		
		function getMyProjectTaskListCallBack(data){
			if(data.getCode()!=0){
			jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var project=data.getXCOValue("project");
				var resources=data.getXCOListValue("resources");
				var tasks=data.getXCOListValue("tasks");
				var applies=data.getXCOListValue("applies");
				$("#project_sn").text(project.getStringValue("project_sn"));
				$("#adviser_name").text(project.getStringValue("adviser_name"));
				$("#project_catg_name").text(project.getStringValue("project_catg_name"));
				$("#project_name").text(project.getStringValue("project_name"));
				$("#cycle").text(project.getIntegerValue("project_cycle")+project.getStringValue("cycle_unit_name"));
				$("#budget_amount").text(parseInt(project.getIntegerValue("budget_amount")) / 100);
				$("#address").text(project.getStringValue("proj_province")+project.getStringValue("proj_city")+project.getStringValue("proj_area")+project.getStringValue("proj_addr"));
				$("#project_desc").text(project.getStringValue("project_desc"));
				var fjHtml = '';
 				if(resources==null||undefined==resources){
					$("#resources1").append(getResourcesNull(fjHtml));
				}else{
					for(var i=0; i<resources.length; i++){
						if(resources[i].getIntegerValue("type")==1){//项目需求附件
							fjHtml = getResources(fjHtml,resources[i]);
						}	
					}
					if(fjHtml==null||fjHtml==''){
						fjHtml = getResourcesNull(fjHtml);
					}
					$("#resources1").append(fjHtml);
				}		
				
				$("#contract").text(project.getStringValue("contract"));//项目合约名称
				$("#contract_url").attr("href",project.getStringValue("contract_url"));
				
				var keyOptions1=[
					'project_task_sn',//任务编号
					'task_name',//任务名称(问题)
					'task_desc',//任务内容
					function(item){//任务状态
						return getTaskCtrlState(item.get("task_ctrl_state"),item.get("task_state"),item.get("task_notpass_mark"));
					},
					function(item){
						return item.get('task_progress')+'%';
					},//任务进度
					function(item){//操作
						var project_task_sn = item.get("project_task_sn");
						var aHtml='';
						
						if(item.get("task_ctrl_state")==1&&item.get("task_state")==50){
							aHtml+='<a href="task_check.jsp?project_task_sn='+project_task_sn+'">验收</a>';
						}else{
							aHtml+='<a href="task_details.jsp?project_task_sn='+project_task_sn+'">详情</a>';
						}
						
						return aHtml;
					},
				];
				var keyOptions2=[
				 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },
					function(item){
						return getExamineState(item.get('through'));
					},
					'remark',
				];
				renderTable("#table_task_content",tasks,keyOptions1);
				renderTable("#table_applies_content",applies,keyOptions2);
			}
		}
		
		getMyProjectTaskList(getURLparam("project_sn"));
	</script>
</html>
