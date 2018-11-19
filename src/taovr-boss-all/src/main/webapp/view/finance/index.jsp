<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
		String pageName = "项目列表";
%>
<head>
<meta charset="utf-8" />
<title>财务中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/finance/index.jsp">财务中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				
			</ul>

		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>财务中心</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid">
					<form class="form-inline bord1dd">
					
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
							
								<label>项目编号</label> 
								<input id="project_sn" type="text"
									class="form-control" size="3">
							</div>	
							<div class="fl mar-t-15">
								<label for="" class="fl" style="margin-top:3px;">开始时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="start_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
								<label for="" class="fl" style="margin-top:3px;">结束时间</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="end_time"
										data-date-format="yyyy-mm-dd" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>
						
							
							<div class="fl mar-t-15">
								<label for="">项目名称</label> <input id="project_name" type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">金额范围</label> <input id="start_real_amount" type="text"
									class="form-control wid140"  placeholder="">&nbsp&nbsp&nbsp
								至&nbsp&nbsp&nbsp <input id="end_real_amount" type="text" class="form-control wid140"
									placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">项目状态</label> <select id="project_state"
									class="form-control marg0  wid80 vm">
									<option value="1">全部</option>
									<option value="40">代付款</option>
									<option value="50">实施中</option>
									<option value="60">待验收</option>
									<option value="70">待结案</option>
									<option value="80">已完成</option>
								</select>
							</div>
							<button id="cx_btn" type="button"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button">查询</button>
						</div>
					</form>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>项目编号</th>
										<th>创建时间</th>
										<th>项目名称</th>
										<th>雇主</th>
										<th>项目顾问</th>
										<th>合约金额</th>
										<th>项目状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table_content">
								</tbody>
							</table>
							<div class="pagination fr">
								<ul id="pagination_1"></ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


</body>

<script type="text/javascript">
	var renderPage = true;
		$(document).ready(function() {
			$("#cx_btn").click(function() {
				renderPage = true
				getMyProjectList(0, globle_page_size);
			});
		});
		
	function getMyProjectList(_start, _pageSize) {
	
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_states",'40,50,60,70,100');
		xco.setStringValue("project_sn", $("#project_sn").val());//项目编号
		xco.setStringValue("project_name", $("#project_name").val());//项目名称
		if ($("#project_state").val() != 1) {
			xco.setIntegerValue("project_state", $("#project_state").val());//状态
		}
		xco.setStringValue("start_time", $("#start_time").val());//开始时间
		xco.setStringValue("end_time", $("#end_time").val());//开始时间
		if($("#start_real_amount").val()!=''&&$("#start_real_amount").val()!=null){
			xco.setIntegerValue("start_real_amount", parseInt($("#start_real_amount").val())*100);//金额
		}
		if($("#end_real_amount").val()!=''&&$("#end_real_amount").val()!=null){
			xco.setIntegerValue("end_real_amount",  parseInt($("#end_real_amount").val())*100);//金额
		}
		var options = {
			url : "/tvr-project/getProjectListP60.xco",
			data : xco,
			success : getMyProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	var renderPage = true;
	function getMyProjectListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [ 'project_sn', //项目编号
			 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    }, //创建时间
			'project_name', //项目名称
			'employer_name', //雇主	
			'adviser_name', //项目顾问				
			function(item) {
				return parseInt(item.get('real_amount')) / 100;
			}, //合约金额	
			//项目状态	
			function(item) {
				return getProjectState(item.get('project_state'));
			},//操作				
			function(item) {
				var project_sn = item.get("project_sn");
				var aHtml = '';
				
				aHtml +='<a href="'+item.get("contract_url")+'" target="_Blank">预览合约</a>  ';
				aHtml +='<a href="employerbill.jsp?project_sn='+project_sn+'">雇主账单</a>  ' ;
				aHtml +='<a href="serviceprovidersettlement.jsp?project_sn='+project_sn+'">服务商账单</a>  ';
				if(item.get('project_state')==70){
					aHtml +='<a href="advisorbill.jsp?project_sn='+project_sn+'">顾问账单</a>  ';
				}
				return aHtml;
			},//操作
			];
			var datalist = data.getXCOListValue("projects");
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getMyProjectList,
						globle_page_size);
			}
		}
	}
	getMyProjectList(0, globle_page_size);
	//项目实施
	
</script>
</html>
