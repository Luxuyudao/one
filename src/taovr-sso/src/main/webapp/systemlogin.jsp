<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String key = com.taovr.core.web.JspUtils.getImageVerifyKey();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>项目管理云平台后台登录</title>
		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		<!-- ace styles -->
		<link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
        <link rel="stylesheet" href="libs/css/login1.css">
</head>
<body class="login-layout">
	
		<div class="container-fluid">
			<div id="main-content">
				<div class="row-fluid">
					<div class="span12">
						
<div class="login-container">


<div class="row-fluid">
<div class="">
	<div id="login-box" class="visible widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header lighter bigger text-center"><span class="">项目管理云平台后台</span></h4>
			
			<div class="space-6"></div>
			
			<div>
				 <fieldset>
                     <div class="controls position-relative error">
                        <label>
                            <span class="block input-icon input-icon-right">
                                <!--<input type="text" class="span12" placeholder="供应商" />-->
                                <input data-original-title="Error info!"  placeholder="手机号" class="tooltip-error span12" name="mobile_phone" id="mobile_phone"  data-rel="tooltip" title="" data-trigger="focus" type="text">
                                <i class="icon-user"></i>
                            </span>
                            <span class="help-inline red position-absolute" id="verusername"></span>
                        </label>
                       
                    <div class="controls position-relative">
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" id="user_pwd" name="user_pwd"  class="span12" placeholder="密&nbsp;&nbsp;&nbsp;码" />
							<i class="icon-lock"></i>
						</span>
						 <span class="help-inline red position-absolute" id="verpassword"></span>
                    </div>
					</label>
                    </div>
                    <div class="controls position-relative">
                    <label>
						<span class="block" style="overflow:hidden;">
							<input type="text" class="span12 yzmInp pull-left" placeholder="验证码" id="verifyCode"/>
							<img class="yzmPic pull-right" src="<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>" onclick="verifyFun()" id="imgVer"/>
						</span>
					</label>
					<span class="help-inline red position-absolute" id="ver"></span>
                    </div>
                    
					<div class="space"></div>
					
					<div class="row-fluid"> <button id="okBtn" class="span4 btn btn-small btn-primary" onclick="doLogin()">登录</button></div>
				  </fieldset>
			</div>
		 </div><!--/widget-main-->
		
		
		<!-- <div class="toolbar clearfix text-center">
			登录
		 </div>-->
		</div><!--/widget-body-->
	</div><!--/login-box-->	
	
</div><!--/position-relative-->
	
</div>
</div>
					</div><!--/span-->
				</div><!--/row-->
			</div>
		</div><!--/.fluid-container-->
		<!-- basic scripts -->
		<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="/js/xco3.js"></script>
    	<script type="text/javascript" src="/js/jquery-xco.js"></script>
    	<script type="text/javascript" src="/js/public.js"></script>
		<script type="text/javascript">
			function doLogin(){
			    var mobile_phone=$("#mobile_phone").val();
			    var user_pwd=$("#user_pwd").val();
			    var verifyCode=$("#verifyCode").val();
				var xco=new XCO();
				xco.setStringValue("mobile_phone",$("#mobile_phone").val());
				xco.setStringValue("user_pwd",$("#user_pwd").val());
				xco.setStringValue("verifyCode",$("#verifyCode").val());
				 if(mobile_phone==''){
				   $("#verusername").html('请输入手机号');
				}else if(user_pwd==''){
				   $("#verpassword").html('请输入密码');
				
				}
				//else if(verifyCode==''){
				//   $("#ver").html('请输入验证码');
				//}
				else{
	  			var options ={
						url:"http://sso.boss.demo1.com/syslogin.xco",
						data:xco,
						success: manage
				};
				$.doXcoRequest(options);
				}
			}	
			function manage(data){
				if (data.getCode() != 0) {
					alert('doUserLoginCallBack:\n' + data);
				} else {
					var role = data.getXCOValue("data").getIntegerValue("role");
					if((role&1) == 1){
						//有管理员权限
						window.location.href="http://manager.boss.demo1.com/view/dict/industrylist.jsp";
					}else if((role&2) == 2){
						//有客服权限
						window.location.href="http://manager.boss.demo1.com/view/customer/index.jsp";
					}else if((role&4) == 4){
						//有运营权限
						window.location.href="http://manager.boss.demo1.com/view/operate/index.jsp";
					}else if((role&8) == 8){
						//有财务权限
						window.location.href="http://manager.boss.demo1.com/view/finance/index.jsp";
					}
				}
			}
			function verifyFun(){
				var imgVer = document.getElementById("imgVer");
				imgVer.src = '<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>&time ='+new Date();				
			}
			//回车键事件
			$(function(){
                $(document).keydown(function(event){
                   if(event.keyCode==13){
                    doLogin();
                   }
            }) }); 
          
			$("#mobile_phone").change(function() {
				var mobile_phone = $("#mobile_phone").val();
				if (mobile_phone == null) {
					$("#verusername").html('请输入手机号');
				} else {
					$("#verusername").html('');
				}

			});
			$("#user_pwd").change(function() {
				var user_pwd = $("#user_pwd").val();
				if (user_pwd == null) {
					 $("#verpassword").html('请输入密码');
				} else {
					$("#verpassword").html('');
				}

			});
			$("#verifyCode").change(function() {
				var verifyCode = $("#verifyCode").val();
				if (verifyCode == null) {
					$("#ver").html('请输入用户名');
				} else {
					$("#ver").html('');
				}

			});
		</script>
	</body>
</html>