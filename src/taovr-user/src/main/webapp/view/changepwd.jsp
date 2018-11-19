<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String key = com.taovr.core.web.JspUtils.getImageVerifyKey();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>修改密码</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="user"
		sub-page="anquan">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
					<li><a href="#">账户安全</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li>密码修改</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>密码修改</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="form-inline bord1dd form-add1" >
								<div class="form-group">
									<label class="">手机号码</label> 
									<span id="phone_num" type="text" class="form-control" ></span>
								</div>
								<div class="form-group">
									<label class="mar-t-15">请填写图片验证码</label>
									<input id="img_vcode" type="text" class="form-control  mar-t-15" placeholder="">
									<img class="yzmPic" style="margin-top:10px;" src="http://sso.demo1.com/jcaptcha/verify.do?key=<%=key %>" onclick="verifyFun()" id="imgVer"/>
									<input id="img_key" type="hidden" value="<%=key %>" class="form-control  mar-t-15" placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">请填写手机验证码</label>
									<input id="phone_vcode" type="text" class="form-control  mar-t-15" placeholder="">
									<button id="ts_btn" type="button" class="btn" style="margin-top:15px;">免费获取验证码</button>
								</div>
								<div class="form-group">
									<label class="mar-t-15">请输入新密码</label>
									<input id="pwd1" type="password" class="form-control  mar-t-15" placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">请再次输入新密码</label>
									<input id="pwd2" type="password" class="form-control  mar-t-15" placeholder="">
								</div>
							</div>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button id="tijiao_btn" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>提交
						</button>
						<button id="back" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>返回
						</button>
					</div>
				</div>
			</div>
	</div>

</body>
<script type="text/javascript">
	var userid='';
	getUser();
	function getUser() {
		var xco = new XCO();
		var options = {
			url : "/tvr-user/getUser1.xco",
			data : xco,
			success : getUserCallBack
		};
		$.doXcoRequest(options);

	}
	
	function getUserCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			$("#phone_num").text(data.getStringValue("mobile_phone"));
		}
		
	}
	
	
	function verifyFun(){
		var imgVer = document.getElementById("imgVer");
		imgVer.src = 'http://sso.demo1.com/jcaptcha/verify.do?key=<%=key %>&time ='+new Date();	
		$("#img_key").val(<%=key %>);
	}
	
	$(function(){
		$("#ts_btn").click(function(){
			var img_vcode = $("#img_vcode").val();
			var phone_num = $.trim($("#phone_num").text());
			if(img_vcode){
				time(this);
				var xco = new XCO();
				xco.setStringValue("img_vcode",img_vcode);
				xco.setStringValue("phone_num",phone_num);
				xco.setStringValue("img_key",$("#img_key").val());
				xco.setIntegerValue("send_type",2);
				var options = {
					url: "/sendSms.xco",
					data: xco,
					success: sendCallBack
				};
				$.doXcoRequest(options);
			}else{
				jAlert("请输入图片验证码!","警告提示",function(r){
					$("#img_vcode").focus();
				});
				return;
			}
		});
		
		
		$("#back").click(function(){
			window.location.href="account_security.jsp";
		});
		$("#tijiao_btn").click(function(){
			var phone_num = $("#phone_num").val();
			var phone_vcode = $("#phone_vcode").val();
			var img_vcode = $("#img_vcode").val();
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			
			var xco = new XCO();
			xco.setIntegerValue("ce_type",2);
			if(phone_num){
				xco.setStringValue("phone",phone_num);
			}
			if(img_vcode){
				xco.setStringValue("img_vcode",img_vcode);
			}else{
				jAlert("请输入图片验证码!","警告提示",function(r){
					$("#img_vcode").focus();
				});
				return;
			}
			
			if(phone_vcode){
				xco.setStringValue("phone_vcode",phone_vcode);
			}else{
				jAlert("请输入手机验证码!","警告提示",function(r){
					$("#phone_vcode").focus();
				});
				return;
			}
			
			if(pwd1){
				xco.setStringValue("pwd1",pwd1);
			}else{
				jAlert("请输入新密码!","警告提示",function(r){
					$("#pwd1").focus();
				});
				return;
			}
			
			if(pwd2){
				xco.setStringValue("pwd2",pwd2);
			}else{
				jAlert("请再次输入新密码!","警告提示",function(r){
					$("#pwd2").focus();
				});
				return;
			}
			
			if(pwd2 != pwd1){
				jAlert("两次密码输入不一致!!","警告提示",function(r){
					$("#pwd2").focus();
				});
				return;
			}
			
			var options = {
				url: "/user_updatepwd/user_updatepwd.xco",
				data: xco,
				success: manage
			};
			
			$.doXcoRequest(options);
		});
	});
	
	function sendCallBack(data){
		if(data.getCode() != 0){
			jAlert(data.getMessage(),"错误提示",function(r){
				wait = 0;
			});
			//$("#ts_btn").text("免费获取验证码");
		}else{
			
		}
	}
	
	function manage(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data.getMessage());
		} else {
			jAlert("修改成功","提示",function(r){
				window.location.href="account_security.jsp";
			});
		}
	};
	
	var wait=60;  
	function time(o) {  
        if (wait == 0) {  
            o.removeAttribute("disabled");            
            $(o).text("免费获取验证码");
            //o.value="免费获取验证码";  
            wait = 60;  
        } else {  
            o.setAttribute("disabled", true); 
            $(o).text("重新发送(" + wait + ")");
            //o.value="重新发送(" + wait + ")";  
            wait--;  
            setTimeout(function() {  
                time(o)  
            },  
            1000)  
        }  
	}  
	//document.getElementById("ts_btn").onclick=function(){time(this);}  

</script>
</html>
