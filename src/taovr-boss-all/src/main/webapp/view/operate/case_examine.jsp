<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
	String pageName = "案例管理";
%>
<head>
<meta charset="utf-8" />
<title>案例审核</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="operate"
		sub-page="casereview">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><a href="运营人员中心.html">运营管理</a><span class="divider"><i
						class="icon-angle-right"></i> </span>
				</li>
				<li><a href="#">案例审核</a><span class="divider"></span>
				</li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>案例审核</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="form-inline bord1dd form-add1">
							<div class="form-group mar-t-15">
								<label>*项目名称</label> <span id="project_case_name"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*行业分类</label> <span id="project_catg"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>*项目描述</label> <span id="project_desc"></span>
							</div>

							<div class="form-group overhidden">
								<label class="mar-t-15 pull-left">项目预览</label>
								<div class="form-group" id="video"></div>
							</div>
							<div class="form-group overhidden">
								<label class="mar-t-15 pull-left">*项目画册</label>
								<div class="form-group" id="dss"></div>
							</div>
							<div class="form-group overhidden">
								<label class="mar-t-15 pull-left">*项目文件</label>
								<div class=" overhidden formwrapper1">
									<ul class="wid310 unstyled" id="resources3">

									</ul>
								</div>
							</div>
							<div style="margin:10px 20px;"></div>
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
				</div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">
						<i class=" icon-ok mr10"></i>提交
					</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript:back();">返回</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function back() {
		window.location.href = "http://manager.boss.demo1.com/view/operate/case_review.jsp";
	}
	var project_case_sn = '';
	$(document).ready(function() {
		$("#tj_btn").click(function() {
			var xco = new XCO();
			var through = parseInt($('input:radio[name=through]:checked').val());
			xco.setStringValue("project_case_sn",project_case_sn);
			xco.setIntegerValue("through",through);
			xco.setStringValue("remark", $("#remark").val());
			xco.setLongValue("uid", uid);
			xco.setIntegerValue("case_d_type",case_d_type);
			if (through == 2) {
				xco.setIntegerValue("audit_state", 100);
			} 
			else {
				xco.setIntegerValue("audit_state", 30);
			}
	
			var options = {
				url : "/project-operate/updateProjectCaseP11.xco",
				data : xco,
				success : getUpdateProjectCaseCallBack
			};
			jConfirm("确认提交审核吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
	
		});
	});
			
	function getUpdateProjectCaseCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			jAlert("提交成功", "提示", function(r) {
				window.location.href = "case_review.jsp";
			});
		}
		
	}
	
	function getMyCase(_project_case_sn) {
		var xco = new XCO();
		xco.setStringValue("project_case_sn", _project_case_sn);
		var options = {
			url : "/tvr-project/getMyCase.xco",
			data : xco,
			success : getMyCaseCallBack
		};
		$.doXcoRequest(options);
	}
	var uid = 0;
	var case_d_type = 0;
	function getMyCaseCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data, "错误提示");
		} else {
			var cases = data.getXCOValue("case");
			var resources = data.getXCOListValue("resources");
			$("#project_case_name").text(cases.getStringValue('project_case_name'));
			$("#project_catg").text(cases.getStringValue('project_catg'));
			$("#project_desc").text(cases.getStringValue('project_desc'));
			uid = cases.getLongValue('user_id');
			case_d_type = cases.getIntegerValue('case_audit_type');
			project_case_sn = cases.getStringValue('project_case_sn');
			if (resources) {
				var strrs = "";
				for ( var m = 0; m < resources.length; m++) {
					if (resources[m].getIntegerValue("type") == 4) {//任务附件
						strrs += "<img src='"+ resources[m].getStringValue("url")+ "' width=\"150\" height=\"150\" />";
					}
				}
				$("#dss").html(strrs);
			}
			checkVideo();//判断浏览器是否支持H5视频播放
			if (resources) {
				var strrs = "";
				for ( var m = 0; m < resources.length; m++) {
					if (resources[m].getIntegerValue("type") == 3) {//任务附件
						strrs += "<video  width=\"350\" height=\"250\"  controls=\"controls\">"
						strrs += "<source src='"
								+ resources[m].getStringValue("url")
								+ "' type=\"video/ogg\"/>"
						strrs += "<source src='"
								+ resources[m].getStringValue("url")
								+ "' type=\"video/mp4\"/>"
						strrs += "</video>";
					}
				}

				$("#video").html(strrs);
			}
			var wjfjHtml = '';//项目文件

			if (resources == null || undefined == resources) {
				$("#resources3").append(getResourcesNull(wjfjHtml));
			} else {
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 5) {//项目文件附件
						wjfjHtml = getResources2(wjfjHtml, resources[i]);
					}
				}

				if (wjfjHtml == null || wjfjHtml == '') {
					wjfjHtml = getResourcesNull(wjfjHtml);
				}
				$("#resources3").append(wjfjHtml);
			}
		}
	}
	getMyCase(getURLparam("project_case_sn"));
</script>
</html>
