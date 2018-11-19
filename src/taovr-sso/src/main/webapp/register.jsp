<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//String key = com.gatherlife.wms.web.util.JspUtils.getImageVerifyKey();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>项目管理云平台注册</title>
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
        <link rel="stylesheet" href="libs/css/login2.css">
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
			<h4 class="header lighter bigger text-center"><span class="">项目管理云平台注册</span></h4>
			
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
							<input type="password" id="pwd1" name="pwd1"  class="span12" placeholder="密&nbsp;&nbsp;&nbsp;码" />
							<i class="icon-lock"></i>
						</span>
						 <span class="help-inline red position-absolute" id="verpassword"></span>
                    </div>
					</label>
                    </div>
                    
                    <div class="controls position-relative">
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" id="pwd2" name="pwd2"  class="span12" placeholder="确认密码" />
							<i class="icon-lock"></i>
						</span>
						 <span class="help-inline red position-absolute" id="verpassword"></span>
                    </div>
					</label>
                    </div>
                    
					<div class="space"></div>
					
					<div class="row-fluid"> <button id="okBtn" class="span4 btn btn-small btn-primary" onclick="doLogin()">注册</button></div>
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
				var xco=new XCO();
				var mobile_phone = $("#mobile_phone").val();
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				
				if(mobile_phone){
					xco.setStringValue("phone", mobile_phone);
				}else{
					alert("请输入手机号！！");
					return false;
				}
				
				if(pwd1){
					xco.setStringValue("pwd1", pwd1);
				}else{
					alert("请输入密码！！");
					return false;
				}
				
				if(pwd2){
					xco.setStringValue("pwd2", pwd2);
				}else{
					alert("请输入确认密码！！");
					return false;
				}
				
				if(pwd1 != pwd2){
					alert("两次输入的密码不一样！！");
					return false;
				}
				
				var options ={
						url:"http://sso.demo1.com/register.xco",
						data:xco,
						success: function(result){
							if(result.getCode() != 0) {
								alert('doCallBack error:\n' + result);
							}else{
								alert("注册成功！");
							}
						}
				};
				$.doXcoRequest(options);
			}	
			
			
		</script>
	</body>
</html>