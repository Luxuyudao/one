<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>项目详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="index">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="http://manager.boss.demo1.com/view/operate/index.jsp">项目中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
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
								<!-- 
								
								<div class="form-group">
									<label style="font-weight:bold;" id="resources2">任务</label>
								</div>
								<div id="resources1"></div>
								 -->
								 <div class="form-group overhidden">
					                <label class="mar-t-15 pull-left">项目附件</label>
					                <div class=" overhidden formwrapper1">
					                	<!-- 
					                  		<p>最多可添加五个附件，每个大小不超过100M.</p>
					                 	-->
					                  <ul class="wid310 mar-t-15 unstyled" id="resources1">
					                  <!-- 
					                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">查看</a> </li>
					                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">查看</a> </li>
					                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">查看</a> </li>
					                   -->
					                  </ul>
					                </div>
					            </div>
							</form>
							<div class="box border">
				              <div class="box-title">
				                <h4><i class="fa fa-table"></i>项目合约</h4>
				              </div>
				              <div class="form-inline bord1dd form-add1" id="project_content">
				                <a class="ml15" href="#" id="heyueUrl" target="_blank"></a><a href="#" class="ml15" id="downloadUrl" target="_blank">下载</a>
				              </div>
				            </div>
						</div>
					</div>
					<div class="box border mt20">
		              <div class="box-title">
		                <h4><i class="fa fa-table"></i>项目进度</h4>
		                <div class="tools"> <a href="#box-config" data-toggle="modal" class="config"> <i class="fa fa-cog"></i> </a> <a href="javascript:;" class="reload"> <i class="fa fa-refresh"></i> </a> <a href="javascript:;" class="collapse"> <i class="fa fa-chevron-up"></i> </a> <a href="javascript:;" class="remove"> <i class="fa fa-times"></i> </a> </div>
		              </div>
		              <div class="box-body" >
		                <table id="task_table" class="table bord1dd">
		                  <thead>
		                    <tr>
		                      <th width="14%">任务编号</th>
		                      <th width="50%">任务名称</th>
		                      <th width="15%">任务状态</th>
		                      <th width="13%">任务进度</th>
		                      <th width="8%">操作</th>
		                    </tr>
		                  </thead>
		                  <tbody id="project_process">
		                    
		                  </tbody>
		                </table>
		              </div>
		            </div>
		            <div class="box border">
		              	<div class="box-title">
		                	<h4><i class="fa fa-table"></i>验收结果</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14" id="yanshou_result">
		              	<!-- 
		                <div class=" form-group">
		                	<label class="form-control">2016-09-09 12:23:50</label>
							<span class="inlineBlock mb5 vm wid80">未通过</span>
							<div class="inlineBlock mar-t-15 resultBox vm">场景做的没有达到效果，需尽快修改</div>
		                </div>
		                <div class=" form-group">
		                	<label class="form-control">2016-09-09 12:23:50</label>
							<span class="inlineBlock mb5 vm wid80">未通过</span>
							<div class="inlineBlock mar-t-15 resultBox vm">场景做的没有达到效果，需尽快修改</div>
		                </div>
		              	 -->
		             	</div>
		            </div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button"
							onClick="javascript :back();"><i class=" icon-undo mr10"></i>返回</button>
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
		function back(){
			window.location.href="http://manager.boss.demo1.com/view/operate/index.jsp";
		}	
	
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
							fjHtml = getResources2(fjHtml,resources[i]);
						}	
					}
					if(fjHtml==null||fjHtml==''){
						fjHtml = getResourcesNull(fjHtml);
					}
					$("#resources1").append(fjHtml);
				}	
 				//alert(project.getStringValue("contract"));
				if(project.getStringValue("contract")){
					$("#heyueUrl").text(project.getStringValue("contract"));//项目合约名称
				}else{
					$("#heyueUrl").remove();
					$("#project_content").html("<span style=\"margin-left:40px;\">暂无</span>");
				}
				if(project.getStringValue("contract_url")){
					$("#downloadUrl").attr("href",project.getStringValue("contract_url"));
				}else{
					$("#downloadUrl").remove();
				}
				
				//渲染 项目进度
				if(!tasks){
					$("#project_process").html("");
				}else{
					$("#project_process").html("");
					var str="";
					for ( var i = 0; i < tasks.length; i++) {
						str+="<tr>";
						str+="<td>"+tasks[i].getStringValue("project_task_sn")+"</td>";
						str+="<td>"+tasks[i].getStringValue("task_name")+"</td>";
						str+="<td>"+getTaskCtrlState2(tasks[i].getIntegerValue("task_ctrl_state"),tasks[i].getIntegerValue("task_state"),tasks[i].getIntegerValue("task_notpass_mark"))+"</td>";
						str+="<td>"+checkProcess(tasks[i].getIntegerValue("task_progress"))+"</td>";
						str+="<td>"+checksUrl(tasks[i])+"</td>";
						str+="</tr>";
					}
					$("#project_process").html(str);
				}
				
				//渲染 验收
				var applies=data.getXCOListValue("applies");
				if(!applies){
					$("#yanshou_result").html("<span style=\"margin-left:40px;\">暂无</span>");
				}else{
					$("#yanshou_result").html("");
					var str="";
					for ( var i = 0; i < applies.length; i++) {
						str+="<div class=\" form-group\">";
						str+="<label class=\"form-control\">"+applies[i].getStringValue("create_time")+"</label>";
						str+="<span class=\"inlineBlock mb5 vm wid80\">"+checkAstate(applies[i].get("through"))+"</span>";
						str+="<div class=\"inlineBlock mar-t-15 resultBox vm\">"+applies[i].get("remark")+"</div>";
						str+="</div>";
					}
					$("#yanshou_result").html(str);
				}
			}
		};
		
		function checkAstate(state){
			if(state == 1){
				return "审核不通过";
			}else{
				return "审核通过";
			}
		}
		
		function checkProcess(process){
			return process+"%";
		};
		
		function checksUrl(item){
			var project_task_sn = item.getStringValue("project_task_sn");
			var aHtml='';
			
			if(item.getIntegerValue("task_ctrl_state")==1&&item.getIntegerValue("task_state")==50&&item.get('task_behalf')==1){
				aHtml+='<a href="task_details.jsp?project_task_sn='+project_task_sn+'">验收</a>';
			}else{
				aHtml+='<a href="task_details.jsp?project_task_sn='+project_task_sn+'">详情</a>';
			}
			return aHtml;
		}
		
		getMyProjectTaskList(getURLparam("project_sn"));
	</script>
</html>
