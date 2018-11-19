<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "会员管理";
%>
<head>
<meta charset="utf-8" />
<title>会员资料信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>

<body>
	<div id="main-content" class="clearfix" >
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i>
					<a href="#">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
					<li>
					<a href="#">会员管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li>资料信息</li>
			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>资料信息</h1>
			</div>
			<div class="row-fluid"> 
		      <!-- PAGE CONTENT BEGINS HERE -->
		      <div class="row-fluid mar-t-15">
		        <div class="span12">
		          <form class="form-inline bord1dd form-add1">
		            <div class="form-group" style="margin-left:150px;">
						<a href="#" title="Photo Title" data-rel="colorbox" >
							<img alt="150x150" height="120" width="120" id="photo" src="${pageContext.request.contextPath}/images/thumb-6.jpg">
						</a>
					</div>
		            <div class="form-group">
		              <label class="mar-t-15">注册手机</label>
		              <label class="mar-t-15 " style="text-align:left;" id="phone"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
		              <label class="mar-t-15 " style="text-align:left;" id="username"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
		              <label class="mar-t-15 " style="text-align:left;" id="gender"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</label>
		              <label class="mar-t-15 " style="text-align:left;" id="birthday"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">行业分类</label>
		              <label class="mar-t-15 " style="text-align:left;" id="industry"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">联系电话</label>
		              <label class="mar-t-15 " style="text-align:left;" id="contact_phone"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">联系邮箱</label>
		              <label class="mar-t-15 " style="text-align:left;" id="email"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">工作地址</label>
		              <label class="mar-t-15 " style="text-align:left;" id="addr"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">会员状态</label>
		              <label class="mar-t-15 " style="text-align:left;" id="state"></label>
					<div>
					<div class="form-group">
		              <label class="mar-t-15">会员等级</label>
		              <label class="mar-t-15 " style="text-align:left;" id="grade"></label>
					<div>
		            <div class="form-group">
		              <label class="mar-t-15">注册时间</label>
		              <label class="mar-t-15 " style="text-align:left;" id="createtime"></label>
					<div>
		          </form>
		        </div>
		      </div>
		</div>	
	</div>
	<!-- PAGE CONTENT BEGINS HERE -->
	<div>
        <div class="span12">
          <div class="tc" style="margin-top:80px;">             
            <button type="button" class="btn btn-submit" data-toggle="button" id="stop"><i class=" icon-ban-circle mr10"></i>停用</button>
            <button type="button" class="btn btn-submit" data-toggle="button" id="start"><i class=" icon-ban-circle mr10"></i>启用</button>
            <!-- 
            <button type="button" class="btn btn-submit" data-toggle="button" id="dongjie"><i class=" icon-cloud mr10"></i>冻结</button>
             -->
            <button type="button" class="btn btn-submit" data-toggle="button" id="back"><i class=" icon-undo mr10"></i>返回</button>
          </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript">
	var ustate = getURLparam("state");
	if(ustate == 0){
		$("#stop").hide();
		$("#start").show();
	}else{
		$("#stop").show();
		$("#start").hide();
	}
	$(function(){
		//停用用户
		$("#stop").click(function(){
			var user_id = getURLparam("user_id");
			var phone = $("#phone").text();
			layer.open({
				type: 2,
				title: "停用用户",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["700px" , "450px"],
				content: ["/view/customer/stopInfo.jsp?user_id="+user_id+"&phone="+phone,"no"]
			});
		});
		
		//停用用户
		$("#start").click(function(){
			var xco = new XCO();
			xco.setIntegerValue("user_id", getURLparam("user_id"));
			xco.setIntegerValue("user_state", 1);
			var options ={
					url:"/tvr-user/userStop.xco",
					data:xco,
					success: function(result){
						if(result.getCode() != 0) {
							tvrAlert('doCallBack error:\n' + result);
						}else{
							tvrAlert("启用成功！");
					        parent.window.location.href="../../view/customer/userManage.jsp";
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
					        parent.layer.close(index);
						}
					}
			};
			if(tvrConfirm("确定要启用该用户?")){
				$.doXcoRequest(options);
			}
		});
		
		//冻结用户
		$("#dongjie").click(function(){
			var user_id = getURLparam("user_id");
			var phone = $("#phone").text();
			layer.open({
				type: 2,
				title: "冻结用户",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["700px" , "450px"],
				content: ["/view/customer/frozenInfo.jsp?user_id="+user_id+"&phone="+phone,"no"]
			});
		});
		//返回
		$("#back").click(function(){
			window.location.href="../../view/customer/userManage.jsp";
		})
		
	})
	
	
	queryUser();
	function queryUser(){
		var xco=new XCO();
		xco.setIntegerValue("userid", getURLparam("user_id"));
		var options ={
				url:"/tvr-user/getUser.xco",
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	//渲染单个对象
	function manage(xco){
		//$("#photo").attr("src",xco.getStringValue("avatar"));
		$("#phone").text(xco.getStringValue("mobile_phone"));
		$("#username").text(xco.getStringValue("nick_name"));
		$("#gender").text(xco.getStringValue("gender"));
		$("#birthday").text(xco.getStringValue("birthday"));
		$("#industry").text(xco.getStringValue("industry"));
		$("#contact_phone").text(xco.getStringValue("contact_phone"));
		$("#email").text(xco.getStringValue("email"));
		$("#addr").text(xco.getStringValue("user_addr"));
		var state = xco.getStringValue("user_state");
		if(state == 0){
			$("#state").text("停用");
		}else if(state == 1){
			$("#state").text("启用");
		}else{
			$("#state").text("冻结");
		}
		//$("#grade").text(xco.getStringValue("industry"));
		$("#createtime").text(xco.getStringValue("create_time"));
	}
	

	
</script>
</html>