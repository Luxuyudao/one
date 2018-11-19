<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>交易纠纷</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="user" sub-page="anquan">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i>
				</span>
				</li>
				<li><a href="客户服务.html">客户服务</a><span class="divider"><i
						class="icon-angle-right"></i>
				</span>
				</li>
				<li>交易纠纷</li>
			</ul>
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>交易纠纷</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group mar-t-15">
								<label>项目编号</label> <span id="project_sn"></span>
							</div>
							<div class="form-group mar-t-15">
								<label>项目顾问</label> <span id="adviser_name"></span>
							</div>
							<div class="form-group">
								<label class="mar-t-15 ">投诉类型</label> <select
									class="form-control mar-t-15 wid320" id="form-field-select-1">
									<option value="完成质量问题">完成质量问题</option>
									<option value="需求理解问题">需求理解问题</option>
									<option value="项目工期问题">项目工期问题</option>
									<option value="顾问专业问题">顾问专业问题</option>
									<option value="项目金额问题">项目金额问题</option>
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15">问题描述</label>
								<textarea class="form-control  mar-t-15 wid310" rows="4"></textarea>
							</div>
							<div class="form-group mar-t-15">
								<label>证据上传</label> <span>为了能够更快更好地解决问题，请您上传与顾问沟通的记录图片，每张图片大小不超过5M</span>
							</div>
							<div class="form-group">
								<label></label> <input type="file" id="id-input-file-2" />
							</div>
							<div class="form-group">
								<label></label> <input type="file" id="id-input-file-2" />
							</div>
							<div class="form-group">
								<label class="mar-t-15">联系人</label> <input type="text"
									class="form-control  mar-t-15 wid310" placeholder="">
							</div>
							<div class="form-group">
								<label class="mar-t-15">手机号码</label> <input type="text"
									class="form-control  mar-t-15 wid310" placeholder="">
							</div>
						</form>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button type="button" class="btn btn-submit" data-toggle="button">
						<i class=" icon-ok mr10"></i>提交
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	//获取我的任务列表
	function getMyProjectTaskList(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "http://user.demo1.com/tvr-project/getProject1.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {

			$("#project_sn").text(data.getStringValue("project_sn"));//项目编号
			$("#adviser_name").text(data.getStringValue("adviser_name")); //项目顾问

		}
	}

	getMyProjectTaskList("1");
</script>
</html>
