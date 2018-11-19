<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>用户注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>

</head>

<body>
		<div id="main-content" class="clearfix">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="#">用户注册</a><span class="divider"></i>
					</span></li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>前台用户注册</h1>
				</div>
				<div class="row-fluid mar-t-15">
        			<div class="span12">
						<form class="form-inline bord1dd form-add1">
							<div class="form-group" >
				              <label class="mar-t-15">*手机号</label>
				              <input type="text" class="form-control  mar-t-15 wid310"  placeholder="" id="mobile_phone">
				            </div>
				            <div class="form-group" >
				              <label class="mar-t-15">*密码</label>
				              <input type="password" class="form-control  mar-t-15 wid310"  placeholder="" id="pwd1">
				            </div>
				            <div class="form-group" >
				              <label class="mar-t-15">*确认密码</label>
				              <input type="password" class="form-control  mar-t-15 wid310"  placeholder="" id="pwd2">
				            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
        <div >
          <div class="tc" style="margin-top:20px;">             
            <button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-undo mr10"></i>提交注册</button>
          </div>
        </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		$("#ok").click(function(){
			var xco=new XCO();
			var mobile_phone = $("#mobile_phone").val();
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			
			if(mobile_phone){
				xco.setStringValue("phone", mobile_phone);
			}else{
				tvrAlert("请输入手机号！！");
				return false;
			}
			
			if(pwd1){
				xco.setStringValue("pwd1", pwd1);
			}else{
				tvrAlert("请输入密码！！");
				return false;
			}
			
			if(pwd2){
				xco.setStringValue("pwd2", pwd2);
			}else{
				tvrAlert("请输入确认密码！！");
				return false;
			}
			
			if(pwd1 != pwd2){
				tvrAlert("两次输入的密码不一样！！");
				return false;
			}
			
			var options ={
					url:"/tvr-system/register.xco",
					data:xco,
					success: function(result){
						if(result.getCode() != 0) {
							tvrAlert('doCallBack error:\n' + result);
						}else{
							tvrAlert("注册成功！");
						}
					}
			};
			$.doXcoRequest(options);
		});
		
	});
</script>
</html>