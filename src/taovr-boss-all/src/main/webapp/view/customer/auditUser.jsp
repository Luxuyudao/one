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
		<div id="main-content" class="clearfix" data-page="customer" sub-page="dataaudit">
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
					<h1>个人资质认证审核</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group mar-t-15">
									<label>姓名</label>
									<span id="cert_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>身份证号</label>
									<span id="cert_number"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>证件照片</label>
								</div>
								<div class="form-group">
									<label></label>
									<img src="${pageContext.request.contextPath}/images/thumb-6.jpg" width="150" height="150" id="pip_url"/>
									<img src="${pageContext.request.contextPath}/images/thumb-6.jpg" width="150" height="150" id="nip_url" class="mar-l-15" />
								</div>
								
								<div class="form-group" style="margin-top:30px;">
									<label>审核意见</label>
									<label class="inline" style="width:7%;text-align:left;">
				  						<input name="form-field-radio" type="radio" class="ace" value="1" >
				  						<span class="lbl"> 通过</span>
									 </label>
									<label class="inline" style="width:7%;text-align:left;">
				  						<input name="form-field-radio" type="radio" class="ace" value="0" checked>
				  						<span class="lbl"> 不通过</span>
				 					</label>
								</div>
								<div class="form-group">
									<label></label>
									<textarea class="form-control  mar-t-15 wid310" rows="4" id="reason"></textarea>
								</div>
							</form>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-ok mr10"></i>提交</button>
						<button type="button" class="btn btn-submit" data-toggle="button" id="back"><i class=" icon-undo mr10"></i>返回</button>
					</div>
				</div>
			</div>	
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>
</body>

<script type="text/javascript">
	queryUser();
	function queryUser(){
		var xco=new XCO();
		xco.setIntegerValue("user_cert_id", getURLparam("user_cert_id"));
		var options ={
				url:"/tvr-user/getOneCert.xco",
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	//渲染单个对象
	function manage(xco){
		$("#cert_name").text(xco.getStringValue("cert_name"));
		$("#cert_number").text(xco.getStringValue("cert_number"));
		$("#pip_url").attr("src",xco.getStringValue("pip_url"));
		$("#nip_url").attr("src",xco.getStringValue("nip_url"));
	}
	
	$(function(){
		$("#ok").click(function(){
			var data = new XCO();
			data.setIntegerValue("user_cert_id",getURLparam("user_cert_id"));
			
			var pass = $('input:radio[name=form-field-radio]:checked').val();
				//$("input[name='form-field-radio']").val();
			if(pass){
				data.setStringValue("through",pass);
			}else{
				tvrAlert("请选择审核通过还是不通过！");
				return false;
			}
			
			if(pass == 0){
				data.setIntegerValue("audit_state",30);
			}else{
				data.setIntegerValue("audit_state",100);
			}
			var reason = $("#reason").val();
			if(reason){
				data.setStringValue("remark",reason);
			}else{
				tvrAlert("请填写审核原因！");
				return false;
			}

			var options ={
					url:"/tvr-user/auditCert.xco",
					data:data,
					success: function(data){
						if(data.getCode() != 0) {
							tvrAlert('doCallBack error:\n' + data);
						}else{
							jAlert("审核成功！","提示",function(r){
								window.location.href="dataAudit.jsp";
							});
						}
					}
			};
			jConfirm("确认提交审核吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
			
		});
		
		$("#back").click(function(){
			window.location.href="/view/customer/dataAudit.jsp";
		})
		
	})
</script>
</html>