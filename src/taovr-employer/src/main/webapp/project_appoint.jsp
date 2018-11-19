<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>项目签约</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp" %>
</head>
<body>  
  <div id="main-content" class="clearfix" data-page="projectcenter" sub-page="index">
    <div id="breadcrumbs">
      <ul class="breadcrumb">
        <li>
		<i class="icon-home"></i><a href="index.jsp">项目中心</a><span class="divider"><i class="icon-angle-right"></i></span>
		</li>
		<li>项目签约</li>
      </ul>
      <!--.breadcrumb--> 
    </div>
    <!--#breadcrumbs-->
    
    <div id="page-content" class="clearfix">
      <div class="page-header position-relative crumbs-nav">
        <h1>项目签约</h1>
      </div>
      <!--/page-header-->
      <div class="row-fluid"> 
         <!-- PAGE CONTENT BEGINS HERE -->
      <div class="row-fluid mar-t-15">
        <div class="span12">
          <form class="form-inline bord1dd form-add1">
			<div class="form-group">
              <label>项目编号</label>
              <span id="project_sn"></span>
            </div>
			<div class="form-group mar-t-15">
              <label>项目甲方</label>
              <span id="employer_name"></span>
            </div>
			<div class="form-group mar-t-15">
              <label>项目乙方</label>
              <span>北京犀牛数码科技有限公司</span>
            </div>
			<div class="form-group mar-t-15">
              <label class="div-inline">项目名称</label>
			  <span id="project_name"> </span>
            </div>
			<div class="form-group mar-t-15">
              <label>项目顾问</label>
              <span id="adviser_name"></span>
            </div>
			<div class="form-group mar-t-15">
              <label>行业分类</label>
              <span id="project_catg_name"></span>
            </div>
            <div class="form-group mar-t-15">
              <label>需求描述</label>
			  <p class="wid310 div-inline" id="project_desc"></p>
            </div>
            
			<div class="form-group mar-t-15">
              <label>实施日期</label>
			  <span id="proj_plan_start_time"></span><span>&nbsp;至&nbsp;</span><span id="proj_plan_end_time"></span>
            </div>
            <div class="form-group mar-t-15">
              <label>项目金额</label>
			  <span id="budget_amount" ></span><span>元</span>
            </div>
			<div class="form-group mar-t-15">
              <label>项目协议</label>
			  <span id="contract"></span><a href="#" style="margin-left:10px;" id="contract_url" target="_blank">预览协议</a>
            </div>
			<div class="form-group mar-t-15">
			 <label></label>
			<label>
				<input id="check_xy" name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox">
				<span class="lbl"> 我已阅读本协议，并同意</span>
			</label>
            </div>
          </form>
        </div>
      </div>
	  <div class="tc mar-t-20">             
         <button id="tj_btn" type="button" class="btn btn-submit" data-toggle="button" disabled="disabled"><i class=" icon-ok mr10"></i>提交</button>
		 <button type="button" class="btn btn-submit" data-toggle="button" onClick="javascript :back();"><i class=" icon-undo mr10"></i>取消</button>
      </div>
	  </div>
	</div>
	<!-- PAGE CONTENT BEGINS HERE -->
   </div>
</body>
	<script type="text/javascript">
	function back(){
		window.location.href="http://employer.demo1.com/index.jsp";
	};
	$(document).ready(function(){
		$("#check_xy").change(function(){
			if($("#check_xy").is(':checked')){
				$("#tj_btn").removeAttr("disabled");
			}else{
				$("#tj_btn").attr({"disabled":"disabled"});
			}
		});
		$("#tj_btn").click(function(){
			var xco=new XCO();
			xco.setStringValue("project_sn", $("#project_sn").text());
			var options = {
				url: "/project-operate/updateProjectP9.xco",
				data: xco,
				success: getUpdateProject9
			};
			$.doXcoRequest(options);
		});
	});
	
		function getUpdateProject9(data){
			if(data.getCode()!=0){
					jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
			}else{
				jAlert("签约成功！！","成功提示", function(r) {
					window.location.href="index.jsp";
				});
			}
		}
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
				var dataObject=data.getXCOValue("project");
				if(dataObject){
					$("#project_sn").text(dataObject.getStringValue("project_sn"));
					$("#employer_name").text(dataObject.getStringValue("employer_name"));
					$("#project_name").text(dataObject.getStringValue("project_name"));
					$("#proj_plan_start_time").text(dataObject.getStringValue("proj_plan_start_time"));
					$("#proj_plan_end_time").text(dataObject.getStringValue("proj_plan_end_time"));
					$("#adviser_name").text(dataObject.getStringValue("adviser_name"));
					$("#project_catg_name").text(dataObject.getStringValue("project_catg_name"));
					$("#project_desc").text(dataObject.getStringValue("project_desc"));
					$("#budget_amount").text(parseInt(dataObject.getStringValue('budget_amount')) / 100);
					$("#contract").text(dataObject.getStringValue("contract"));
					$("#contract_url").attr('href',dataObject.getStringValue("contract_url")); 
				}
			}
		}
		getMyProjectTaskList(getURLparam("project_sn"));
		
	</script>
</html>
