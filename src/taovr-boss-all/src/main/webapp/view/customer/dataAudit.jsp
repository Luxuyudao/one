<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
	String pageName = "资质审核";
%>
<head>
<meta charset="utf-8" />
<title>资料审核</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>

</head>

<body>
		<div id="main-content" class="clearfix" data-page="dataaudit" sub-page="list">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="#">资质认证审核</a><span class="divider"></i>
					</span></li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>资质认证审核</h1>
				</div>
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">姓名</label> <input type="text"
									class="form-control" placeholder="" id="cert_name">
							</div>
							
							<div class="fl mar-t-15">
								<label for="">认证类型</label> 
								<select class="form-control w160" id="cert_type">
                                  <option value="">-请选择-</option>
                                  <option value="1">个人</option>
                                  <option value="2">企业</option>
                                </select>
							</div>
							<div class="fl mar-t-15">
								<label for="">审核状态</label> 
								<select class="form-control w160" id="audit_state">
                                  <option value="">-请选择-</option>
                                  <option value="25">审核中</option>
                                  <option value="30">审核未通过</option>
                                  <option value="100">审核通过</option>
                                </select>
							</div>
							<div class="fl mar-t-15">
								<label for=""  class="fl" style="margin-top:3px;">起始日期</label>
								<div style="width:230px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="starttime" data-date-format="yyyy-mm-dd" type="text">
									<span class="add-on"><i class="icon-calendar"></i></span> 
								</div>
				            </div>
							<div class="fl mar-t-15">
								<label for=""  class="fl" style="margin-top:3px;">结束日期</label>
								<div style="width:230px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="endtime" data-date-format="yyyy-mm-dd" type="text">
									<span class="add-on"><i class="icon-calendar"></i></span> 
								</div>
				            </div>
				            
				            <div class="fl mar-t-15">
								<label for="">证件号</label> <input type="text"
									class="form-control" placeholder="" id="cert_number">
							</div>
							<div class="fl mar-t-15">
								<label for="">手机号</label> <input type="text"
									class="form-control" placeholder="" id="mobile_phone">
							</div>
							
							<button type="button"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button" id="search">查询</button>
						</div>
					</form>
					<div class="row-fluid">
						<div class="row-fluid mar-t-15">
							<div class="span12">
								<table id="table_bug_report"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>编号</th>
											<th>认证类型</th>
											<th>注册手机</th>
											<th>姓名</th>
											<th>证件号</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="table_content">
										
									</tbody>
								</table>
								<jsp:include page="../common/page.jsp"/>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>
	
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(function() {
			$('.date-picker').datepicker();
			$('#timepicker1').timepicker({
				minuteStep : 1,
				showSeconds : true,
				showMeridian : false
			});

		});
	</script>
</body>

<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			doSubmit(0,globle_page_size);
		});
	});

	var renderPage = true;
	//分页查询表格
	doSubmit(0,globle_page_size); 
	function doSubmit(start,pageSize){
		var xco=new XCO();
		
		//查询条件
		var data=formPara(xco);

		xco.setIntegerValue("start",start);
		xco.setIntegerValue("pageSize",pageSize);
			var options ={
				url:"/tvr-user/getUserlistu13.xco",
				data:data,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function formPara(xco){
		var cert_name = $("#cert_name").val();
		if(cert_name){
			xco.setStringValue("cert_name",cert_name);
		}
		var cert_type = $("#cert_type").val();
		if(cert_type){
			xco.setStringValue("cert_type",cert_type);
		}
		var audit_state = $("#audit_state").val();
		if(audit_state){
			xco.setStringValue("audit_state",audit_state);
		}
		var starttime = $("#starttime").val();
		if(starttime){
			xco.setStringValue("starttime",starttime);
		}
		var endtime = $("#endtime").val();
		if(endtime){
			xco.setStringValue("endtime",endtime);
		}
		var cert_number = $("#cert_number").val();
		if(cert_number){
			xco.setStringValue("cert_number",cert_number);
		}
		var mobile_phone = $("#mobile_phone").val();
		if(mobile_phone){
			xco.setStringValue("phone",mobile_phone);
		}
		return xco;
	}

    
	function manage(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("data");
			var keyOptions = [
					'user_cert_id',//编号
					function(item) {//认证类型
						return checkType(item.get('cert_type'));
					},
					'mobile_phone', //手机号
					'cert_name', //手机号
					'cert_number', //工作地址
					function(item) {//状态
						return checkState(item.get('audit_state'));
					}, 
					function(item) {//操作
						return checkUrl(item.get('user_cert_id'),item.get('cert_type'),item.get('audit_state'));
					}
			];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),doSubmit, globle_page_size);
			}
		}
		
	}
	
	function checkType(state){
		if(state == 1){
			return "个人";
		}else{
			return "公司";
		}
	}
	
	function checkState(state){
		if(parseInt(state) < 30){
			return "待审核";
		}else if(state == 30){
			return "审核未通过";
		}else{
			return "已通过";
		}
	}
	
	function checkUrl(user_cert_id,type,state){
		if(state == 100 || state == 30){
			return "已审核";
		}else{
			if(type == 1){
				return '<a href="/view/customer/auditUser.jsp?user_cert_id='+user_cert_id+'">审核</a>';
			}else{
				return '<a href="/view/customer/auditComp.jsp?user_cert_id='+user_cert_id+'">审核</a>';
			}
		}
	}
</script>
</html>