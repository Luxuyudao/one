<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "职业认证";
%>
<head>
<meta charset="utf-8" />
<title>职业详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="operate" sub-page="">
			<!--#breadcrumbs-->
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营中心</a><span class="divider"><i
							class="icon-angle-right"></i> </span></li>
					<li>职业详情</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>职业详情</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label></label><img id="user_img" alt="认证人照片" height="120" width="120" src="../../images/thumb-6.jpg">
								</div>
								<div class="form-group mar-t-15">
									<label>专业等级</label> <span id="major_level"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>公司名称</label> <span id="company_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>行业分类</label> <span id="project_catg_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>公司电话</label> <span id="company_phone"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>工作地址</label> <span id="address"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>能力标签</label> <span id="ability_tags"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>个人介绍</label> <span id="person_remark"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目经验</label> <span id="project_experience"></span>
								</div>
							</form>
						</div>
					</div>
		            
		            <div class="box border">
		              	<div class="box-title">
		                	<h4><i class="fa fa-table"></i>验收结果</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14" id="yanshou_result">
		              	
		             	</div>
		            </div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button"
							onClick="javascript :back();">返回</button>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
</body>
<script type="text/javascript">
	function back(){
		window.location.href="occupation.jsp";
	}
	function getProjectTask() {
		var xco = new XCO();
		xco.setLongValue("user_id",getURLparam("user_id"));
		var options = {
			url : "/tvr-system/getprojecttaglist2.xco",
			data : xco,
			success : selectUserEmployeByIdCallBack
		};
		$.doXcoRequest(options);
	}
	
	function selectUserEmployeByIdCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var employer=data.getXCOValue("employer");
			var data=data.getXCOListValue("data");
			$("#major_level").text(employer.getStringValue("major_level"));
			$("#company_name").text(employer.getStringValue("company_name"));
			$("#project_catg_name").text(employer.getStringValue("project_catg_name"));
			$("#company_phone").text(employer.getStringValue("company_phone"));
			$("#address").text(employer.getStringValue("company_province")+employer.getStringValue("company_city")+employer.getStringValue("company_area")+employer.getStringValue("company_addr"));
			$("#ability_tags").text(employer.getStringValue("ability_tags"));
			$("#person_remark").text(employer.getStringValue("person_remark"));
			$("#project_experience").text(employer.getStringValue("project_experience"));
			
			//渲染 验收
			if(!data){
				$("#yanshou_result").html("<span style=\"margin-left:40px;\">暂无</span>");
			}else{
				$("#yanshou_result").html("");
				var str="";
				for ( var i = 0; i < data.length; i++) {
					str+="<div class=\" form-group\">";
					str+="<label class=\"form-control\">"+data[i].getStringValue("create_time")+"</label>";
					str+="<span class=\"inlineBlock mb5 vm wid80\">"+checkAstate(data[i].get("through"))+"</span>";
					str+="<div class=\"inlineBlock  resultBox vm\">"+data[i].get("remark")+"</div>";
					str+="</div>";
				}
				$("#yanshou_result").html(str);
			}
		}
	}
	function checkAstate(state){
		if(state == 1){
			return "审核不通过";
		}else{
			return "审核通过";
		}
	}
	getProjectTask();
</script>
</html>
