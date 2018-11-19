<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.xson.common.object.XCO" %>
<!-- SIDEBAR -->

<div id="sidebar" class="sidebar sidebar-fixed">
  <div class="sidebar-menu nav-collapse">
    <!-- SIDEBAR MENU -->
   
    <!-- /SIDEBAR MENU --> 
  </div>
</div>
	<!-- basic styles -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<!--[if IE 7]>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-ie7.min.css" />
	    <![endif]-->
<!-- page specific plugin styles -->

<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
<!--[if lt IE 9]>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-ie.min.css" />
	    <![endif]-->
<!-- 自己的样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">
<!-- basic scripts -->
<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
<script src="http://file.demo1.com/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->

<!--[if lt IE 9]>
<script type="text/javascript" src="http://file.demo1.com/js/excanvas.min.js"></script>
<![endif]-->

<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
<script src="http://file.demo1.com/jalert/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="http://file.demo1.com/jalert/jquery.alerts.js" type="text/javascript"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/bootstrap-datepicker.min.js" charset="utf-8"></script>
<script type="text/javascript" src="http://file.demo1.com/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/date.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/daterangepicker.min.js"></script>
<!-- ace scripts -->
<script src="http://file.demo1.com/js/ace-elements.min.js"></script>
<script src="http://file.demo1.com/js/ace.min.js"></script>

<script type="text/javascript" src="http://file.demo1.com/js/xco3.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>

<script type="text/javascript" src="http://file.demo1.com/layer/layer.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>
    
   <%
		response.setHeader("Cache-Control","no-store");  
		response.setDateHeader("Expires", 0);  
		response.setHeader("Pragma","no-cache");  
		long user_id = 0;
		String user_name = "";
		XCO xco = com.taovr.core.web.JspUtils.getPlatformTokenUser(request); 
		if(null == xco){
			return;
		}else{
			try{
				user_id = (long) xco.getLongValue("user_id");
				user_name = (String) xco.getStringValue("nick_name");
			} catch (Exception e){
				return;
			}
		}
		
		//获取用户
		XCO plateUser = com.taovr.core.web.JspUtils.getPlateformUserById(user_id);
		String photo = 	plateUser.getStringValue("avatar");
		int is_employer = plateUser.getIntegerValue("is_employer");
		int is_advisor = plateUser.getIntegerValue("is_advisor");
		int is_providers = plateUser.getIntegerValue("is_providers");
	%>
<!-- /SIDEBAR -->
	
	<div class="navbar navbar-inverse" style="margin-bottom:0px;">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="#"><small><i class="icon-leaf logo"></i>项目管理云平台</small> </a>
				
				<ul class="nav ace-nav pull-right">

					<li class="light-blue user-profile"><a
						class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
							<img alt="Jason's Photo" src="${pageContext.request.contextPath}/avatars/user.jpg"
							class="nav-user-photo" /> <span id="user_info"> <small>欢迎,</small><%=user_name %>
						</span> <i class="icon-caret-down"></i> </a>
						<ul id="user_menu"
							class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a href="#"><i class="icon-cog"></i> 个人设置</a>
							</li>
							<li><a href="#"><i class="icon-user"></i> 个人概况</a>
							</li>
							<li class="divider"></li>
							<li><a href="javascript:doPlateExit();"><i class="icon-off"></i> 退出系统</a>
							</li>
						</ul>
					</li>
				</ul>
				 
				<div class="fr" style="margin:8px 10px 0px 10px;height: 35px;">
					<select class="form-control" style="width:110px;" id="state">
						<%
							if(is_employer == 1){
						%>
						<option value="1">我是雇主</option>
						<% 		
							}
						%>
                      
                      	<%
							if(is_advisor == 1){
						%>
						<option value="2">我是顾问</option>
						<% 		
							}
						%>
						<%
							if(is_providers == 1){
						%>
						<option value="3">我是服务商</option>
						<% 		
							}
						%>
                    </select>
				</div>
				 
				<!--/.ace-nav-->
			</div>
			<!--/.container-fluid-->
		</div>
		<!--/.navbar-inner-->
	</div>
	<!--/.navbar-->

	<div class="container-fluid" id="main-container">
		<a href="#" id="menu-toggler"><span></span> </a>
		<!-- menu toggler -->

		<div id="sidebar">
			<!-- #sidebar-shortcuts -->
			<ul class="nav nav-list ">
				<li  class="has-sub" data-page="projectcenter">
					<a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span>项目中心</span> <b class="arrow icon-angle-down"></b> </a>
					<ul class="submenu">
						<li class="has-sub-sub" sub-page="index">
							<a href="index.jsp"><i class="icon-double-angle-right"></i>雇主中心</a>
						</li>
						<li class="has-sub-sub" sub-page="project_release">
							<a href="project_release.jsp"><i class="icon-double-angle-right"></i>发布需求</a>
						</li>
						<li class="has-sub-sub" sub-page="project_receipt">
							<a href="project_receipt.jsp"><i class="icon-double-angle-right"></i>项目账单</a>
						</li>
						<li class="has-sub-sub" sub-page="#">
							<a href="#"><i class="icon-double-angle-right"></i>交易记录</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="nav nav-list">
				<li class="has-sub" data-page="person_center">
					<a href="http://user.demo1.com/" class="dropdown-toggle"><i class="icon-reorder"></i><span>账户设置</span> <b class="arrow icon-angle-down"></b> </a>
					<ul class="submenu">
						<li class="has-sub-sub" sub-page="person_info">
							<a href="http://user.demo1.com/view/personal_information.jsp"><i class="icon-double-angle-right"></i>个人信息</a>
						</li>
						<li class="has-sub-sub" sub-page="addproject">
							<a href="http://user.demo1.com/view/account_security.jsp"><i class="icon-double-angle-right"></i>账户安全</a>
						</li>
						<li class="has-sub-sub" sub-page="addproject">
							<a href="http://user.demo1.com/"><i class="icon-double-angle-right"></i>账号绑定</a>
						</li>
						<li class="has-sub-sub" sub-page="addproject">
							<a href="http://user.demo1.com/"><i class="icon-double-angle-right"></i>我的级别</a>
						</li>
						<li class="has-sub-sub" sub-page="addproject">
							<a href="http://user.demo1.com/"><i class="icon-double-angle-right"></i>我的钱包</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="nav nav-list">
				<li class="has-sub" data-page="projectcenter">
					<a href="#" class="dropdown-toggle"><i class="icon-share"></i><span>客户服务</span> <b class="arrow icon-angle-down"></b> </a>
					<ul class="submenu">
						<li class="has-sub-sub" sub-page="addproject">
							<a href="#"><i class="icon-double-angle-right"></i>交易纠纷</a>
						</li>
						<li class="has-sub-sub" sub-page="addproject">
							<a href="#"><i class="icon-double-angle-right"></i>客户建议</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="nav nav-list">
				<li class="has-sub" data-page="projectcenter">
					<a href="#" class="dropdown-toggle"><i class="icon-retweet"></i><span>信息</span> <b class="arrow icon-angle-down"></b> </a>
				</li>
			</ul>
			<!--/.nav-list-->

			<div id="sidebar-collapse">
				<i class="icon-double-angle-left"></i>
			</div>
		</div>
		<!--/#sidebar-->
		<script type="text/javascript">
			/*-----------------------------------------------------------------------------------*/
			/*	Sidebar active
			/*-----------------------------------------------------------------------------------*/
			$(function(){
				var curPage = $('#main-content').attr('data-page');
				var curSubPage = $('#main-content').attr('sub-page');
				$('#sidebar > ul > li').each(function(i, o) {
		            var dataPage=$(o).attr('data-page');
					if(dataPage==curPage){
						$(o).addClass('active open');
						var subLi = $(o).find(".has-sub-sub")
						subLi.each(function(i, o) {
							var subPage = $(o).attr("sub-page");
							if(subPage==curSubPage){
								$(o).addClass('active');
								return false;
							}
						})
						return false;
					}
		        });
			});
			
			function doPlateExit() {
				window.location.href="http://sso.demo1.com/platformout.jsp";
			};
			
			$(function(){
				$("#state").change(function(){ 
					var state = $("#state").val();
					if(state == 1){
						window.location.href="http://employer.demo1.com/tvr-user.xco?p=1";
						//window.location.href="http://employer.demo1.com/index.jsp";
					}
					if(state == 2){
						window.location.href="http://advisor.demo1.com/tvr-user.xco?p=2";
					}
					if(state == 3){
						window.location.href="http://provider.demo1.com/tvr-user.xco?p=3";
					}
				})
			});
			
		</script>
		<style>
			/*提交按钮样式 */
			
			.btn-sub {
				padding: 5px 35px;
				vertical-align: bottom;
				margin-left: 10px;
			}
			
			.create-btn {
				padding: 40px 35px 1px;
				line-height: 140px;
			}
			
			.float_left {
				float: left;
			}
			
			.float_right {
				float: right;
			}
			
			.margin_left {
				margin-left: 30px;
			}
			
			.margin_right {
				margin-right: 30px;
			}
			
			.clear {
				clear: both;
			}
			
			.padding_left {
				padding-left: 30px;
			}
			
			.padding {
				padding-left: 15px;
			}
			
			.padding2 {
				padding: 20px 20px;
			}
			
			.padding_right {
				padding-right: 30px;
			}
			
			.div-inline {
				display: inline-block;
			}
			
			.width {
				width: 350px;
			}
			
			.margin_top {
				margin-top: 5px;
			}
			
			.align_left {
				text-align: left;
			}
			
			.bg_eee {
				background-color: #eee;
			}
			/* 备注文本框*/
			
			input.remark {
				width: 540px;
			}
			
			table>tbody>tr>td {
				vertical-align: middle !important;
			}
			
			table>tbody>tr>td>label>input {
				width: 50px;
				margin-bottom: 0 !important;
			}
			
			table>tbody>tr>td>label>select {
				width: 80px;
				margin-bottom: 0 !important;
			}
		</style>