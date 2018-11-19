<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>顾问中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>

<body>
	<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://advisor.demo1.com/index.jsp
				">顾问中心</a><span
					class="divider"></span></li>
			</ul>
		</div>

		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>顾问中心</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid padding indexBox">
					<div class="div-inline">
						<a href="#" title="Photo Title" data-rel="colorbox"> <img
							alt="150x150" height="120" width="120" src="<%=photo%>">
						</a>
					</div>
					<div class="div-inline margin_left">
						<div>
							<span style="font-size:20px; font-weight:bold;"><%=user_name%></span>
						</div>
						<div class="mar-t-15">
							<a class="blue user-level position-relative"
								href="javascript:vord(0);"><i
								class="level level1 position-absolute"></i>钻石会员</a> <a href="#"><img
								src="img/weikaitong.png"> </a>
						</div>
						<div class="margin_top overhidden">
							<a class="blue pull-left" href="javascript:vord(0);">账户安全:</a> <span
								class="s-level s-level1 pull-left"></span> <span
								class="pull-left t-level1">较高</span>
						</div>
					</div>
						<div class="div-inline margin_left">
                           <ul class="ucountList unstyled overhidden" style="width:650px">
								<li>
									<a href="#" class="position-relative">
										<i class="ucount icon3 position-absolute"></i>
	                                       <span>待审核<em class="countNum" id="state10">0</em></span>
									</a>
								</li>
	                            <li>
									<a href="#" class="position-relative">
										<i class="ucount icon2 position-absolute"></i>
	                                       <span>待验收<em class="countNum" id="state60">0</em></span>
									</a>
	                            </li>
	                            <li>
									<a href="#" class="position-relative">
										<i class="ucount icon1 position-absolute"></i>
		                                      <span>待支付<em class="countNum" id="state40">0</em></span>
									</a>
	                            </li>
	                            <li>
									<a href="#" class="position-relative">
										<i class="ucount icon4 position-absolute"></i>
			                                     <span>待评价<em class="countNum">0</em></span>
									</a>
	                             </li>
                           </ul>    
						</div>	
					<div class="bord1dd div-inline margin_left userInfo bg_eee ">
						<div>
							余<span class="mlem">额：</span> <span>0</span> <span>元</span>
						</div>
						<div>
							V&nbsp;<span class="mlem">币：</span> <span>85</span> <span>个</span>
						</div>
						<div>
							<span>体验券：</span> <span>1</span> <span>张</span>
						</div>
					</div>
				</div>

				<form class="form-inline bord1dd mar-t-15">
					<div class="form-group overhidden">
						<div class="fl mar-t-15">
							<label for="">项目编号</label> <input id="project_sn" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">项目名称</label> <input id="project_name" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label for="">雇主</label> <input id="employer_name" type="text"
								class="form-control wid140" placeholder="">
						</div>
						<div class="fl mar-t-15">
							<label>状态</label> <select id="project_state" type="text"
								class="form-control wid140" placeholder="">
								<option value="1">全部</option>
								<option value="20">已审核</option>
								<option value="30">待签约</option>
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
				<div class="row-fluid">
					<div class="row-fluid ">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width="12%">时间</th>
										<th width="10%">项目编号</th>
										<th width="18%">项目名称</th>
										<th width="18%">雇主</th>
										<th width="11%">项目工期</th>
										<th width="11%">项目金额</th>
										<th width="10%">全部状态</th>
										<th width="10%">操作</th>
									</tr>
								</thead>
								<tbody id="table_content">
								</tbody>
							</table>
							<jsp:include page="page.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	 	//获取个状态数目
	 		employerProjectStats();
	 	function employerProjectStats(){
			var xco = new XCO();
			var options = {
				url: "/tvr-project/getAdvisorProjectStatsP35.xco",
				data: xco,
				success: employerProjectStatsCallBack
			};
			$.doXcoRequest(options);
	 	}
	 	
	 	function employerProjectStatsCallBack(data){
	 		if(data.getCode() != 0){
				jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var values=data.getXCOListValue("data");
				if(values){
					for(var i=0;i<values.length;i++){
						var state10 = values[i].getStringValue("project_state");
						if(state10 == "10"){
							$("#state10").text(values[i].getStringValue("state_count"))
						}
						var state60 = values[i].getStringValue("project_state");
						if(state60 == "60"){
							$("#state60").text(values[i].getStringValue("state_count"))
						}
						var state40 = values[i].getStringValue("project_state");
						if(state40 == "40"){
							$("#state40").text(values[i].getStringValue("state_count"))
						}
					}
				}
			}
	 	}
	var renderPage = true;
	$(document).ready(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getAdvisorProjectList(0, globle_page_size);
		});
	});
	function getAdvisorProjectList(_start, _pageSize) {
		var xco = new XCO();
		//xco.setLongValue("user_id", 1);
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("project_sn", $("#project_sn").val());//项目编号
		xco.setStringValue("project_name", $("#project_name").val());//项目名称
		xco.setStringValue("employer_name", $("#employer_name").val());//雇主名称
		if ($("#project_state").val() != 1) {
			xco.setIntegerValue("project_state", $("#project_state").val());//状态
		}
		var options = {
			url : "/tvr-project/getMyProjectListP36.xco",
			data : xco,
			success : getAdvisorProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	function getAdvisorProjectListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("projects");
			var keyOptions = [
			 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },//时间
					
					'project_sn',
					'project_name',
					'employer_name',
					function(item) {
						return item.get('project_cycle')
								+ item.get('cycle_unit_name')
					}, 
					function(item) {
						return parseInt(item.get('budget_amount')) / 100 + "元";
					}, 
					function(item) {
						return getProjectState(item.get('project_state'));
					}, 
					function(item) {
						var project_sn = item.get("project_sn");
						var state = item.get("project_state");
						var aHtml = "";
						aHtml += '<a href="project_details.jsp?project_sn='+project_sn+'">详情</a>';
						if(state == 10){
							
						}
						if(state == 20){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="submit_contract.jsp?project_sn='+project_sn+'">签约</a>';
						}else if(state == 30){
							
						}else if(state == 40){
							
						}else if(state == 50){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_acceptance.jsp?project_sn='+project_sn+'">提交</a>';
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_implement.jsp?project_sn='+project_sn+'">执行</a>';
						}else if(state == 60){
							
						}else if(state == 70){
							
						}else if(state == 100){
								aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
								aHtml += '<a href="project_appoint.jsp?project_sn='+project_sn+'">评价</a>';
						}
						return aHtml;
					}
				];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),
						getAdvisorProjectList, globle_page_size);
			}
		}
	}
	getAdvisorProjectList(0, globle_page_size);
	
	 
</script>
</html>