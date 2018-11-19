<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>案例展示</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="mycase">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li><a href="http://provider.demo1.com/mycase.jsp">我的案例</a><span class="divider"><i
						class="icon-angle-right"></i> </span></li>
				<li>案例展示</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>案例展示</h1>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<form class="form-inline bord1dd form-add1">
					<div class="form-group mar-t-15">
						<label>*创建时间</label> <span id="create_time"></span>
					</div>

					<div class="form-group mar-t-15">
						<label>*案例名称</label> <span id="project_case_name"></span>
					</div>

					<div class="form-group mar-t-15">
						<label>*案例描述</label> <span id="project_desc"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*行业分类</label> <span id="project_catg"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*案例工期</label> <span id="project_cycle"></span> <span
							id="cycle_unit_name"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*案例金额</label> <span id="budget_amount"></span><span>元</span>
					</div>
					<div class="form-group overhidden">
					     <label class="mar-t-15 pull-left">*项目预览</label>
					    <div class="form-group" id="video">
						</div>
					  </div>
						<div class="form-group overhidden">
					     <label class="mar-t-15 pull-left">*项目画册</label>
					    	 <div class="form-group" id="dss">
						</div>
						<div class="form-group overhidden">
					     <label class="mar-t-15 pull-left">*项目封面</label>
					     <div class="form-group" id="dss1">
						</div>
					  </div>
					  </div>
						<div class="form-group overhidden">
					     <label class="mar-t-15 pull-left">*项目文件</label>
					     <div class=" overhidden formwrapper1">
					    	<ul class="wid310 unstyled" id="resources3">
					  		 </ul>
					   	 </div>
					  </div>
				</form>
			</div>

		</div>
		<div class="tc mar-t-20" style="margin-left: -200px;">
			<button type="button" class="btn btn-submit" data-toggle="button"
				onClick="javascript:back();">返回</button>
		</div>
</body>

<script type="text/javascript">
	function back(){
			window.location.href="http://provider.demo1.com/mycase.jsp";
		}
	//获取我的任务列表
	var project_case_sn = getURLparam("project_case_sn");
	getMyProjectTaskList(project_case_sn);
	function getMyProjectTaskList(project_case_sn) {
		var xco = new XCO();
		xco.setStringValue("project_case_sn", project_case_sn);
		var options = {
			url : "/tvr-project/getMyCase.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var project = data.getXCOValue("case");
			var resources = data.getXCOListValue("resources");
			var tasks = data.getXCOListValue("tasks");
			$("#project_case_name").text(project.getStringValue("project_case_name"));
			$("#project_desc").text(project.getStringValue("project_desc"));
			$("#create_time").text(project.getStringValue("create_time"));
			$("#project_catg").text(project.getStringValue("project_catg"));
			$("#project_cycle").text(project.getStringValue("project_cycle"));
			$("#cycle_unit_name").text(project.getStringValue("cycle_unit_name"));
			$("#budget_amount").text(parseInt(project.getStringValue("budget_amount"))/100);
			var case_img="<img class='mar-t-15' src='"+project.getStringValue("case_image1_url")+"' width=\"150\" height=\"150\" />";
			$("#dss1").html(case_img);
			if(resources){
				var strrs = "";
				for(var m=0;m<resources.length;m++){
					if (resources[m].getIntegerValue("type") == 4) {//任务附件
							strrs +="<img class='mar-t-15 mr5' src='"+resources[m].getStringValue("url")+"' width=\"150\" height=\"150\" />";
						}				
				}

				$("#dss").html(strrs);
			}	
			checkVideo();
			if(resources){
				var strrs = "";
				for(var m=0;m<resources.length;m++){
					if (resources[m].getIntegerValue("type") == 3) {//任务附件
							strrs +="<video  width=\"350\" height=\"250\"  controls=\"controls\">"
							strrs +="<source src='"+resources[m].getStringValue("url")+"' type=\"video/ogg\"/>"
				  			 strrs +="<source src='"+resources[m].getStringValue("url")+"' type=\"video/mp4\"/>"
							strrs +="</video>";
						}				
				}

				$("#video").html(strrs);
			}	
			var fjHtml3 = '';
			if (resources == null || undefined == resources) {//任务附件
				$("#resources3").append(getResourcesNull(fjHtml3));
			} else {
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 5) {//任务附件
						fjHtml3 = getResources2(fjHtml3, resources[i]);
					}
				}
				if (fjHtml3 == null || fjHtml3 == '') {
					fjHtml3 = getResourcesNull(fjHtml3);
				}
				$("#resources3").append(fjHtml3);
			}

		}
	}
</script>

</html>
