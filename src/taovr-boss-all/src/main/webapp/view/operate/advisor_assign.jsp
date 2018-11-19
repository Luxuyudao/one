<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>顾问指派</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>

	<div id="main-content" class="clearfix" data-page="operate" sub-page="advisorassign">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营管理</a><span class="divider"><i
						class="icon-angle-right"></i> </span></li>
				<li>顾问指派</li>
			</ul>

		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>顾问指派</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">

						<div class="form-inline bord1dd form-add1">


							<div class="form-group mar-t-15">
								<label>*项目甲方</label> <span id="employer_name"></span>
							</div>


							<div class="form-group">
								<label class="mar-t-15">*项目顾问</label> 
								<select
									class="form-control mar-t-15 wid320" id="adviser">
								</select>
							</div>
							<div class="form-group mar-t-15">
								<label>*行业分类</label> <span id="project_catg"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*项目名称</label> <span id="project_name"></span>
							</div>

							<div class="form-group mar-t-15">
								<label>*项目周期</label> <span id="cycle"></span>
							</div>

							<div class="form-group mar-t-15">
								<label>*项目预算</label> <span id="budget_amount"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*实施地址</label> <span id="address"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*需求描述</label> <span id="project_desc"></span>
							</div>
							<div class="form-group overhidden">
				                <label class="mar-t-15 pull-left">项目附件</label>
				                <div class=" overhidden formwrapper1">
				                  <ul class="wid310 mar-t-15 unstyled" id="resources1">
				                  
				                  </ul>
				                </div>
				            </div>
						
						</div>
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
		window.location.href="http://manager.boss.demo1.com/view/operate/index.jsp";
	}
	var project_sn=getURLparam("project_sn");
	//获取顾问列表
	advisorlist();
	function advisorlist(){
		var data = new XCO();
		data.setIntegerValue("start", 0);
		data.setIntegerValue("pageSize", 10000);
		var options = {
			url : "/tvr-project/getAdvisorListP63.xco",
			data : data,
			success : advisorlistCallBack
		};
		$.doXcoRequest(options);
	}
	
	function advisorlistCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var users = data.getXCOListValue("users");
			if(users){
				var str = "";
				for(var i=0;i<users.length;i++){
					str+="<option value="+users[i].getIntegerValue("user_id")+">"+users[i].getIntegerValue("nick_name")+"</option>"
				}
				$("#adviser").append(str);
			}
		}
	}
	
	$(document).ready(function() {
			$("#tj_btn").click(
						function() {
							var xco = new XCO();
							xco.setStringValue("adviser_id", $("#adviser").val());
							xco.setStringValue("adviser_name", $("#adviser").find("option:selected").text());
							xco.setStringValue("project_sn", project_sn);
							xco.setStringValue("remark", 'okokokok');
							xco.setIntegerValue("through", 2);

							var options = {
								url : "/project-operate/updateProjectF65.xco",
								data : xco,
								success : getUpdateProjectCallBack
							};
							$.doXcoRequest(options);
						});
			});

	function getUpdateProjectCallBack(data) {
		
		if(data.getCode()!=0){
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		}else{
			jAlert("指派成功！！","成功提示", function(r) {
				window.location.href="index.jsp";
			});
	}
	}
	function getProject() {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);

		var options = {
			url : "/tvr-project/getProject2.xco",
			data : xco,
			success : getProjectCallBack
		};
		$.doXcoRequest(options);
	}

	function getProjectCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var project = data.getXCOValue("project");
			var resources = data.getXCOListValue("resources");
			$("#employer_name").text(project.getStringValue("employer_name"));//甲方
			$("#employer_name").text(project.getStringValue("employer_name"));//顾问
			$("#project_name").text(project.getStringValue("project_name"));//项目名称
			$("#project_catg").text(project.getStringValue("project_catg_name"));
			$("#cycle").text(project.getStringValue("project_cycle")+ project.getStringValue("cycle_unit_name"));//项目周期
			$("#address").text(project.getStringValue("proj_province") + project.getStringValue("proj_city")+ project.getStringValue("proj_area") + project.getStringValue("proj_addr"));//项目周期
			$("#project_desc").text(project.getStringValue("project_desc"));
			$("#budget_amount").text(parseInt(project.getStringValue('budget_amount')) / 100+ '元');
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
		}
	}
	getProject();
</script>
</html>
