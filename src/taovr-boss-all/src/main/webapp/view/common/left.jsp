<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.xson.common.object.XCO"%>
<%@ page import="java.util.*" %>
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
	    <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
	    <![endif]-->
<!-- page specific plugin styles -->

<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
<!--[if lt IE 9]>
	    <link rel="stylesheet" href="css/ace-ie.min.css" />
	    <![endif]-->
<!-- 自己的样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
<!-- -->
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
<script type="text/javascript">
	$(function() {
		$('.date-picker').datepicker();
		$('#timepicker1').timepicker({
			minuteStep : 1,
			showSeconds : true,
			showMeridian : false
		});

	});
	
	function doSysExit() {
		window.location.href="http://sso.boss.demo1.com/systemout.jsp";
	}
</script>
<!-- /SIDEBAR -->
<%
	response.setHeader("Cache-Control","no-store");  
	response.setDateHeader("Expires", 0);  
	response.setHeader("Pragma","no-cache");  

	int role_id = 0;
	String user_name = "";
	XCO xco = com.taovr.core.web.JspUtils.getSystemTokenUser(request); 
	if(null == xco){
		return;
	}else{
		try{
			role_id = (int) xco.getIntegerValue("role");
			user_name = (String) xco.getStringValue("user_name");
		} catch (Exception e){
			return;
		}
	}
%>
<div class="navbar navbar-inverse" style="margin-bottom:0px;">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="#"><small><i
					class="icon-leaf logo"></i>项目管理云平台</small> </a>
			<ul class="nav ace-nav pull-right">
				<li class="light-blue user-profile"><a
					class="user-menu dropdown-toggle"  href="#" data-toggle="dropdown">
						<img alt="Jason's Photo"
						src="http://file.demo1.com/avatars/user.jpg"
						class="nav-user-photo" /> <span id="user_info"> <small>欢迎,</small><span id="user_name"><%=user_name %></span>
					</span> <i class="icon-caret-down"></i> </a>
					<ul id="user_menu"
						class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
						<!-- 
						<li><a href="#"><i class="icon-cog"></i> 个人设置</a></li>
						 -->
						<li><a href="####" id="updateBtn"><i class="icon-user"></i> 密码修改</a></li>
						<li class="divider"></li>
						<li><a href="javascript:doSysExit();"><i class="icon-off"></i> 退出系统</a></li>
					</ul></li>
			</ul>
			<!-- 
				<small>
					<li class="light-blue user-profile" style="margin-top:5px;">
						 <a class="user-menu dropdown-toggle"  href="#" data-toggle="dropdown">
							<img alt=""src="${pageContext.request.contextPath}/avatars/user.jpg" class="nav-user-photo" /> 
							<span id="user_info" style="color:white;"> 欢迎,<%=user_name %></span> 
							<i class="icon-caret-down"></i> 
						</a>
						<ul id="user_menu"
							class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a href="#"><i class="icon-cog"></i> 个人设置</a></li>
							<li><a href="#"><i class="icon-user"></i> 个人概况</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-off"></i> 退出系统</a></li>
						</ul>
					</li>
				</small>
			 -->
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
		<ul class="nav nav-list">
			<%
			Map<String, LinkedHashMap<String, String>> leftNav = com.taovr.core.web.StaticController.getUserModuleByRole(role_id);
			if(null == leftNav){
				return;
			}
			for(Map.Entry<String, LinkedHashMap<String, String>> entry : leftNav.entrySet()){
				String iconClass = " class='icon-reorder'";
				String key = entry.getKey();
				if("行业分类".equals(key)){
					iconClass = " class='icon-reorder'";
				}else if("任务类型".equals(key)){
					iconClass = " class='icon-share'";
				}else if("角色管理".equals(key)){
					iconClass = " class='icon-retweet'";
				}else if("用户管理".equals(key)){
					iconClass = " class='icon-spinner'";
				}else if("系统字典".equals(key)){
					iconClass = " class='icon-warning-sign'";
				}else if("系统设置".equals(key)){
					iconClass = " class='icon-wrench'";
				}else if("个人中心".equals(key)){
					iconClass = " class='icon-building'";
				}else if("财务中心".equals(key)){
					iconClass = " class='icon-cog'";
				}else if("客服中心".equals(key)){
					iconClass = " class='icon-dashboard'";
				}else if("运营中心".equals(key)){
					iconClass = " class='icon-book'";
				}else if("报表管理".equals(key)){
					iconClass = " class='icon-inbox'";
				}else if("日志管理".equals(key)){
					iconClass = " class='icon-hdd'";
				}else if("能力标签".equals(key)){
					iconClass = " class='icon-bar-chart'";
				}
				
				LinkedHashMap<String, String> subMap = entry.getValue();
				String liClass = "";
				if(null != subMap.get(pageName)){
					liClass = " class=\"active open\"";
				}
			%>	
				<li<%=liClass %>>
	                <a href="#" class="dropdown-toggle">
	                    <i <%=iconClass %>></i>
	                    <span><%=key %></span>
	                    <b class="arrow icon-angle-down"></b>
	                </a>
	                <ul class="submenu">
			<%
				for(Map.Entry<String, String> subEntry : subMap.entrySet()){
					String subLiClass = ""; 
					if(liClass.length() > 0 && subEntry.getKey().equalsIgnoreCase(pageName)){
						subLiClass = " class=\"active\"";
					}
			%>	
				<li<%=subLiClass %>><a href="<%=subEntry.getValue() %>"><i class="icon-double-angle-right"></i><%=subEntry.getKey() %></a></li>
			<%
				}
			%>
			 </ul>
            </li>
            <%
			}
            %>	
		</ul>
			
			
		<!-- 
			<li class="has-sub" data-page="customer"><a href="#"
				class="dropdown-toggle"><i class="icon-desktop"></i><span>客服中心</span>
					<b class="arrow icon-angle-down"></b> </a>
				<ul class="submenu">
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>信息管理</a></li>
					<li class="has-sub-sub" sub-page="usermanage"><a
						href="userManage.jsp"><i class="icon-double-angle-right"></i>会员管理</a>
					</li>
					<li class="has-sub-sub" sub-page="dataaudit"><a
						href="dataAudit.jsp"><i class="icon-double-angle-right"></i>资质认证审核</a>
					</li>
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>交易纠纷</a></li>
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>客户建议</a></li>
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>消息管理</a></li>
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>聊天记录</a></li>
					<li class="has-sub-sub" sub-page=""><a href="#"><i
							class="icon-double-angle-right"></i>在线交流</a></li>
				</ul></li>
		</ul>
		<!--/.nav-list-->

		<div id="sidebar-collapse">
			<i class="icon-double-angle-left"></i>
		</div>
	</div>
	<!--/#sidebar-->
	<script type="text/javascript">
	   $("#updateBtn").click(function(){
        var url = "/view/common/modifypwd.jsp";
      	layer.open({
				type: 2,
				title: "修改密码",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["600px" , "340px"],
				content: url
			});
      });
		/*-----------------------------------------------------------------------------------*/
		/*	Sidebar active
			$(function() {
			var curPage = $('#main-content').attr('data-page');
			var curSubPage = $('#main-content').attr('sub-page');
			$('#sidebar > ul > li').each(function(i, o) {
				var dataPage = $(o).attr('data-page');
				if (dataPage == curPage) {
					$(o).addClass('active open');
					var subLi = $(o).find(".has-sub-sub")
					subLi.each(function(i, o) {
						var subPage = $(o).attr("sub-page");
						if (subPage == curSubPage) {
							$(o).addClass('active');
							return false;
						}
					})
					return false;
				}
			});
		})
		/*-----------------------------------------------------------------------------------*/
		
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