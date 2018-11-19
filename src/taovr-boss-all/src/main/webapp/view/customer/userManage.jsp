<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String pageName = "会员管理";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>会员管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>

</head>

<body>
		<div id="main-content" class="clearfix" data-page="customer" sub-page="list">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="#">会员管理</a><span class="divider"></i>
					</span></li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>会员管理</h1>
				</div>
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">手机号</label> <input type="text"
									class="form-control" placeholder="" id="mobile_phone">
							</div>
							<!--  
							<div class="fl mar-t-15">
								<label for="">姓名</label> <input type="text"
									class="form-control" placeholder="" id="nick_name">
							</div>
							
							-->
							
							<div class="fl mar-t-15">
								<label for="">状态</label> 
								<select class="form-control w160" id="user_state">
                                  <option value="">-请选择-</option>
                                  <option value="0">停用</option>
                                  <option value="1">启用</option>
                                  <option value="2">冻结</option>
                                </select>
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
											<th>姓名</th>
											<th>性别</th>
											<th>注册手机</th>
											<th>邮箱</th>
											<th>工作地址</th>
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
				url:"/tvr-user/getUserlistu11.xco",
				data:data,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function formPara(xco){
		var mobile_phone = $("#mobile_phone").val();
		if(mobile_phone){
			xco.setStringValue("phone",mobile_phone);
		}
		//var nick_name = $("#nick_name").val();
		//if(nick_name){
		//	xco.setStringValue("nick_name",nick_name);
		//}
		var user_state = $("#user_state").val();
		if(user_state){
			xco.setIntegerValue("user_state",user_state);
		}
		return xco;
	}

    
	function manage(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("data");
			var tdIndex = 1;
			var keyOptions = [
					function(item){
						return tdIndex++;
					},//编号
					'nick_name',//姓名
					'gender',//性别
					'mobile_phone', //手机号
					'email', //手机号
					'user_addr', //工作地址
					function(item) {//项目预算
						return checkState(item.get('user_state'));
					}, 
					function(item) {
						return checkUrl(item.get('user_id'),item.get('user_state'));
					}, 
			];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),doSubmit, globle_page_size);
			}
		}
		
	}
	
	function checkState(state){
		if(state == 0){
			return "停用";
		}else if(state == 1){
			return "启用";
		}else{
			return "冻结";
		}
	}
	
	function checkUrl(user_id,state){
		return '<a href="/view/customer/viewUser.jsp?user_id='+user_id+'&state='+state+'">查看</a>';
	}
</script>
</html>