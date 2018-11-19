<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>加盟申请</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<%@ include file="left.jsp" %>
	</head>
	<body>
		
		<div id="main-content" class="clearfix" data-page="user" sub-page="">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i>
						<a href="#">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
					<li>加盟申请</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>加盟申请</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div style="width:70%;">
									<div class="form-group mar-t-15"">
										<span style="margin-left:160px;font-size:18px;color:red;">1、资质认证-->2、账户验证-->3、案例证明-->4、加盟成功</span>
									</div>
									<div class="form-group mar-t-15"">
										<label class="mar-t-15">我要成为</label> 
										<select class="form-control" id="select_to">
											<option value="2">服务商</option>
											<option value="1">顾问</option>
										</select> 
									</div>
									<div class="form-group mar-t-15"">
										<label class="mar-t-15" style="margin-left:60px;">成为<span id="selectto" style="color:red;">服务商</span>的条件：</label> 
									</div>
									<div class="form-group mar-t-15">
										<label style="margin-left:160px;text-align:left">1、需通过身份认证</label> 
										<span id="shenfenrenzheng"><a class="float_right" href="###" data-value="" id="shenfen">未认证</a></span>
									</div>
									<!-- <div class="form-group mar-t-15">
										<label style="margin-left:160px;text-align:left">2、需绑定银行卡</label> 
										<a class="float_right" href="###" data-value="" id="yinhangka">未认证</a>
									</div> -->
									<div class="form-group mar-t-15">
										<label style="margin-left:160px;text-align:left">2、需通过职业资质认证</label> 
										<a class="float_right" href="###" data-value="" id="zhiye">未认证</a>
									</div>
									<div class="form-group mar-t-15">
										<label style="margin-left:160px;text-align:left">3、案例证明</label>
										<a class="float_right" href="###" data-value="" id="anli">未认证</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button id="tijiao_btn" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>提交申请
						</button>
						<button id="back" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-undo   mr10"></i>返回
						</button>
					</div>
				</div>
			</div>		
		</div>
	</body>
    
	 <script type="text/javascript">
	 	$(function(){
	 		//提交申请
	 		$("#tijiao_btn").click(function(){
	 			if($("#shenfen").attr("data-value") != 100){
	 				jAlert("实名认证未通过","错误提示");
	 				return;
	 			}
	 			if($("#zhiye").attr("data-value") != 100){
	 				jAlert("职业资质认证未通过","错误提示");
	 				return;
	 			}
	 			if($("#anli").attr("data-value") != 100){
	 				jAlert("案例认证未通过","错误提示");
	 				return;
	 			}
	 			var txt = $("#select_to").find("option:selected").text();
	 			
	 			var xco = new XCO();
	 			xco.setIntegerValue("dtype",$("#select_to").val());
				var options = {
					url : "/tvr-user/updateAllCert.xco",
					data : xco,
					success : waitAduitCallBack
				};
	 			
	 			jConfirm("确认要加盟为【"+txt+"】吗？","确认框",function(r){
	 				if(r){
		 				$.doXcoRequest(options);
	 				}
	 			});
	 		})
	 		
	 		
			$("#select_to").on("change",function(){
				$("#selectto").text($(this).find("option:selected").text());
			});

			/* $("#zhiye").click(function(){
				if($("#shenfen").attr("data-value") != 100){
					jAlert("请先实名认证","错误提示");
	 				return;
				}else if($(this).attr("data-value") != 100){
					window.location.href="personal_information.jsp?tz_type=1";
				}
			}); 
			$("#anli").click(function(){
				if($("#shenfen").attr("data-value") != 100){
					jAlert("请先实名认证","错误提示");
	 				return;
				}else if($("#zhiye").attr("data-value") != 100){
					jAlert("请先职业资质认证","错误提示");
	 				return;
				}else if($(this).attr("data-value") != 100){
					window.location.href="submit_case.jsp?project_role="+$("#select_to").val();
				}
			});*/
			
			$("#back").click(function(){
				window.location.href="http://employer.demo1.com/index.jsp";
			});
		});
	 	
	 	function waitAduitCallBack(data){
	 		if(data.getCode()!=0){
	 			jAlert('doCallBack error:\n' + data,"错误提示");
	 		}else{
	 			jAlert("加盟认证提交成功，请等待运营人员审核！","成功提示",function(r){
	 				window.location.href="http://employer.demo1.com/index.jsp";
	 			});
	 		}
	 			
	 	}
	 	
	 	function queryAduit(){
	 		var xco = new XCO();
			var options = {
				url : "/tvr-user/userAuditInfo.xco",
				data : xco,
				success : queryAduitCallBack
			};
			$.doXcoRequest(options);
	 	};
	 	
	 	function queryAduitCallBack(data){
	 		if(data.getCode()!=0){
	 			jAlert('doCallBack error:\n' + data,"错误提示");
	 		}else{
	 			var userAudit = data.get("data");
	 			if(userAudit){
	 				var shenfen = userAudit.getIntegerValue("cert_audit");
	 				var yinhangka = userAudit.getIntegerValue("card_audit");
	 				var anli = userAudit.getIntegerValue("case_audit");
	 				var zhiye = userAudit.getIntegerValue("prof_audit");
	 				if(shenfen == 10){
	 					$("#shenfen").text("新提交(审核中)");
	 					$("#shenfen").attr("data-value",10);
	 				}else if(shenfen == 20){
	 					$("#shenfen").text("重新提交(审核中)");
	 					$("#shenfen").attr("data-value",20);
	 				}else if(shenfen == 30){
	 					$("#shenfen").text("未通过");
	 					$("#shenfen").attr("data-value",30);
	 					$("#shenfen").attr("href","authentication.jsp?userid="+userid+"&flag=1&type="+ce_type);
	 					//aHtml+='<a href="authentication.jsp?userid='+userid+'&type='+datas[0].getIntegerValue("cert_type")+'">未通过</a>';
	 				}else if(shenfen == 100){
	 					$("#shenfen").text("(已认证)审核通过");
	 					$("#shenfen").attr("data-value",100);
	 				}else{
	 					$("#shenfen").attr("href","authentication.jsp?userid="+userid+"&flag=1");
	 				}
	 				
	 				if(anli == 10){
	 					$("#anli").text("新提交(审核中)");
	 					$("#anli").attr("data-value",10);
	 				}else if(anli == 20){
	 					$("#anli").text("重新提交(审核中)");
	 					$("#anli").attr("data-value",20);
	 				}else if(anli == 30){
	 					$("#anli").text("未通过");
	 					$("#anli").attr("data-value",30);
	 					$("#anli").attr("href","update_case.jsp?project_case_sn="+_project_case_sn);
	 				}else if(anli == 100){
	 					$("#anli").text("(已认证)审核通过");
	 					$("#anli").attr("data-value",100);
	 				}else{
	 					$("#anli").attr("href","submit_case.jsp?project_role="+$("#select_to").val());
	 				}
	 				
	 				if(zhiye == 10){
	 					$("#zhiye").text("新提交(审核中)");
	 					$("#zhiye").attr("data-value",10);
	 				}else if(zhiye == 20){
	 					$("#zhiye").text("重新提交(审核中)");
	 					$("#zhiye").attr("data-value",20);
	 				}else if(zhiye == 30){
	 					$("#zhiye").text("未通过");
	 					$("#zhiye").attr("data-value",30);
	 					$("#zhiye").attr("href","personal_information.jsp?tz_type=1&bj_type=1");
	 				}else if(zhiye == 100){
	 					$("#zhiye").text("(已认证)审核通过");
	 					$("#zhiye").attr("data-value",100);
	 				}else{
	 					$("#zhiye").attr("href","personal_information.jsp?tz_type=1");
	 				}
	 				
	 			}
	 			//审核记录为空
	 			else{
	 				$("#shenfen").attr("href","authentication.jsp?userid="+userid+"&flag=1");
	 				$("#zhiye").attr("href","personal_information.jsp?tz_type=1");
	 				$("#anli").attr("href","submit_case.jsp?project_role="+$("#select_to").val());
	 			}
	 		}
	 	}
	 	
	 	var userid='';
	 	var ce_type = '';
	 	var _project_case_sn=''
	 	getMyCaseList(0,10);
	 	getUser();
		function getUser() {
			var xco = new XCO();
			var options = {
				url : "/tvr-user/myauditinfo.xco",
				data : xco,
				success : getUserCallBack
			};
			$.doXcoRequest(options);
		}
		
		function getUserCallBack(data) {
			if (data.getCode() != 0) {
				tvrAlert('doCallBack error:\n' + data);
			} else {
				userid=data.getLongValue("user_id");
				if(data.getStringValue("cert_cert_type")){
					ce_type = data.getStringValue("cert_cert_type");
				}
				queryAduit();
			}
			
		};
		
		/*------------------------获取案例ID-------------------------*/
		function getMyCaseList(_start, _pageSize) {
			var xco = new XCO();
			xco.setIntegerValue("start", _start);
			xco.setIntegerValue("pageSize", _pageSize);
			var options = {
				url : "/tvr-project/getMyCaseListP61.xco",
				data : xco,
				success : getMyCaseListCallBack
			};
			$.doXcoRequest(options);
		}
		var renderPage = true;
		function getMyCaseListCallBack(data) {
			if (data.getCode() != 0) {
				jAlert('doCallBack error:\n' + data,"错误提示");
			} else {
				var total = data.getIntegerValue("total");
				var datalist = data.getXCOListValue("cases");
				if(total!=0){
					_project_case_sn=datalist[0].getStringValue("project_case_sn");
				}
				queryAduit();
			}
		}
	 </script>
	 
</html>