<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "职业认证";
%>
<head>
<meta charset="utf-8" />
<title>职业审核</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="operate" sub-page="">

			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li>职业审核</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>职业审核</h1>
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
		                	<h4><i class="fa fa-table"></i>审核</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14">
		              		<div class="form-group">
								<label style="margin-top:10px;">审核意见</label> <label
									class="inline" style="width:60px;"> <input
									name="through" type="radio" class="ace" value="2">
									<span class="lbl"> 通过</span> </label> &nbsp; &nbsp; &nbsp; <label
									class="inline" style="width:70px;"> <input
									name="through" type="radio" class="ace" value="1" checked> <span
									class="lbl"> 不通过</span> </label>
							</div>
							<div class="form-group">
								<label class="mar-t-15"></label>
								<textarea id="remark" class="form-control  mar-t-15 wid310"
									rows="4"></textarea>
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
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
</body>
<script type="text/javascript">
	function back(){
		window.location.href="occupation.jsp";
	}
	getProjectTask(0,globle_page_size);
	var user_employer_id=0;
	$(document).ready(function(){
		$("#tj_btn").click(function(){
			var xco=new XCO();
			var through = parseInt($('input:radio[name=through]:checked').val());
			if(through==2){//通过
				xco.setIntegerValue("audit_state",100);
			}else{//不通过
				xco.setIntegerValue("audit_state",30);
			}
			xco.setIntegerValue("through",through);
			xco.setLongValue("userid", getURLparam("user_id"));
			xco.setLongValue("user_employer_id", user_employer_id);
			xco.setStringValue("remark", $("#remark").val());
			
			
			var options = {
				url : "/tvr-system/auditProfession.xco",
				data : xco,
				success : auditProfessionCallBack
			};
			jConfirm("确认提交审核吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
	});
	
	function auditProfessionCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			jAlert("提交成功", "提示", function(r) {
				window.location.href = "occupation.jsp";
			});
		}
	}
	
	function getProjectTask() {
		var xco = new XCO();
		xco.setLongValue("user_id",getURLparam("user_id"));
		var options = {
			url : "/tvr-system/selectUserEmployeById.xco",
			data : xco,
			success : selectUserEmployeByIdCallBack
		};
		$.doXcoRequest(options);
	}
	
	function selectUserEmployeByIdCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			$("#major_level").text(data.getStringValue("major_level"));
			$("#company_name").text(data.getStringValue("company_name"));
			$("#project_catg_name").text(data.getStringValue("project_catg_name"));
			$("#company_phone").text(data.getStringValue("company_phone"));
			$("#address").text(data.getStringValue("company_province")+data.getStringValue("company_city")+data.getStringValue("company_area")+data.getStringValue("company_addr"));
			$("#ability_tags").text(data.getStringValue("ability_tags"));
			$("#person_remark").text(data.getStringValue("person_remark"));
			$("#project_experience").text(data.getStringValue("project_experience"));
			user_employer_id=data.getLongValue("user_employer_id");
		}
	}

</script>
</html>
