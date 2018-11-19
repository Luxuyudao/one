<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>客户服务</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" href="css/ace-skins.min.css" />
<!--[if lt IE 9]>
    <link rel="stylesheet" href="css/ace-ie.min.css" />
    <![endif]-->
<!-- 自己的样式-->
<link rel="stylesheet" href="libs/css/header.css">
<link rel="stylesheet" href="libs/css/style.css">
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

.float_left{
	float:left;
}
.float_right{
	float:right;
}
.margin_left{
	margin-left:30px;
}
.margin_right{
	margin-right:30px;
}
.clear{
	clear:both;
}
.padding_left{
	padding-left:30px;
}
.padding{
	padding-left:15px;
}
.padding2{
	padding:20px 20px;
}
.padding_right{
	padding-right:30px;
}
.div-inline{ 
	display:inline-block;
} 
.width{
	width:350px;
}
.margin_top{
	margin-top:5px;
}
.align_left{
	text-align:left;
}
.bg_eee{
	background-color:#eee;
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
</head>
<body>
<div class="navbar navbar-inverse" style="margin-bottom:0px;">
  <div class="navbar-inner">
    <div class="container-fluid"> <a class="brand" href="#"><small><i class="icon-leaf logo"></i>淘VR后台管理系统</small> </a>
      <ul class="nav ace-nav pull-right">
        
        <li class="light-blue user-profile"> <a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown"> <img alt="Jason's Photo" src="avatars/user.jpg" class="nav-user-photo" /> <span id="user_info"> <small>欢迎,</small>张三 </span> <i class="icon-caret-down"></i> </a>
          <ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
            <li><a href="#"><i class="icon-cog"></i>个人设置</a></li>
            <li><a href="#"><i class="icon-user"></i>个人概况</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="icon-off"></i> 退出系统</a></li>
          </ul>
        </li>
      </ul>
      <!--/.ace-nav--> 
    </div>
    <!--/.container-fluid--> 
  </div>
  <!--/.navbar-inner--> 
</div>
<!--/.navbar-->
<div class="container-fluid" id="main-container"> <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
  
  <div id="sidebar">
    <!-- #sidebar-shortcuts -->
    <ul class="nav nav-list">
     <li><a href="项目中心.html" class="dropdown-toggle" ><i class="icon-desktop"></i><span>项目中心</span> <b class="arrow icon-angle-down"></b> </a>
        <ul class="submenu">
          <li><a href="项目中心.html"><i class="icon-double-angle-right"></i>项目中心</a></li>
          <li><a href="项目中心-项目验收.html"><i class="icon-double-angle-right"></i>项目验收</a></li>
          <li><a href="项目中心-应付账款.html"><i class="icon-double-angle-right"></i>应付账款</a></li>
        </ul>
     </li>
	 <li><a href="客户服务.html" class="dropdown-toggle" ><i class="icon-edit"></i><span>账户设置</span> <b class="arrow icon-angle-down"></b> </a>
        <ul class="submenu">
          <li><a href="账户设置-添加案例.html"><i class="icon-double-angle-right"></i>添加案例</a></li>
          <li><a href="账户设置-个人信息.html"><i class="icon-double-angle-right"></i>个人信息</a></li>
          <li><a href="账户设置-账户安全.html"><i class="icon-double-angle-right"></i>账户安全</a></li>
        </ul>
     </li>
	 <li><a href="客户服务.html" class="dropdown-toggle" ><i class="icon-calendar"></i><span>客户服务</span> <b class="arrow icon-angle-down"></b> </a>
        <ul class="submenu">
          <li><a href="客户服务.html"><i class="icon-double-angle-right"></i>客户服务</a></li>
          <li><a href="客户服务-交易纠纷.html"><i class="icon-double-angle-right"></i>交易纠纷</a></li>
          <li><a href="客户服务-客户建议.html"><i class="icon-double-angle-right"></i>客户建议</a></li>
        </ul>
     </li>
     <li><a href="widgets.html"><i class="icon-list-alt"></i><span>应付账款</span> </a> </li>
    </ul>
    <!--/.nav-list-->
    
    <div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
  </div>
  <!--/#sidebar-->
  
  <div id="main-content" class="clearfix">
    <div id="breadcrumbs">
      <ul class="breadcrumb">
        <li><i class="icon-home"></i> <a href="#">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
        <li>客户服务</li>
      </ul>
      <!--.breadcrumb--> 
      
    </div>
    <!--#breadcrumbs-->
    
    <div id="page-content" class="clearfix">
      <div class="page-header position-relative crumbs-nav">
        <h1>客户服务</h1>
      </div>
      <!--/page-header-->
      <div class="row-fluid"> 
        <!-- PAGE CONTENT BEGINS HERE -->
      
		<div class="row-fluid">
			<div class="row-fluid mar-t-15">
				<div class="span12">
				<table id="table_bug_report" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>时间</th>
							<th>项目编号</th>
							<th>项目名称</th>
							<th>行业分类</th>
							<th>项目周期</th>
							<th>项目金额</th>
							<th>服务类型</th>
							<th>项目顾问</th>
							<th>全部状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td><span>2016-09-18 12:22:32</span></td>
						<td><span>16091812223201</span></td>
						<td><span>华北电池智能安防系统</span></td>
						<td><span>VR虚拟现实</span></td>
						<td><span>6个月</span></td>	
						<td><span>800000元</span></td>
						<td><span>咨询</span></td>
						<td><span>王麻子</span></td>
						<td><span>未签约</span></td>
						<td>
							<a class="blue" href="客户服务-交易纠纷.html">投诉</a>
							<a class="blue" href="客户服务-客户建议.html">建议</a>
						</td>
					</tr>
					<tr>
						<td><span>2016-09-18 12:22:32</span></td>
						<td><span>16091812223201</span></td>
						<td><span>华北电池智能安防系统</span></td>
						<td><span>VR虚拟现实</span></td>
						<td><span>6个月</span></td>	
						<td><span>800000元</span></td>
						<td><span>咨询</span></td>
						<td><span>王麻子</span></td>
						<td><span>已取消</span></td>
						<td>
							<a class="blue" href="客户服务-交易纠纷.html">投诉</a>
							<a class="blue" href="客户服务-客户建议.html">建议</a>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="pagination fr">
					<ul>
					<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
                </ul>
				</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- PAGE CONTENT BEGINS HERE -->
</div>
<!-- basic scripts --> 
<script src="js/jquery-1.11.1.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<!-- page specific plugin scripts --> 

<!--[if lt IE 9]>
            <script type="text/javascript" src="js/excanvas.min.js"></script>
            <![endif]--> 

<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script> 
<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script> 
<script type="text/javascript" src="js/jquery.slimscroll.min.js"></script> 
<script type="text/javascript" src="js/jquery.easy-pie-chart.min.js"></script> 
<script type="text/javascript" src="js/jquery.sparkline.min.js"></script> 
<!-- ace scripts --> 
<script src="js/ace-elements.min.js"></script> 
<script src="js/ace.min.js"></script> 
<!-- inline scripts related to this page --> 


</body>
</html>
