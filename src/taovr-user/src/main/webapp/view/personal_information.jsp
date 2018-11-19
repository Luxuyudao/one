<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>个人信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<%@ include file="left.jsp"%>
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
</head>
<body>
	<div id="main-content" class="clearfix"data-page="user"
		sub-page="anquan">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li><a href="账户设置-账户安全.html">账户安全</a><span class="divider"><i class="icon-angle-right"></i> </span></li>
				<li>个人信息</li>
			</ul>
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>个人信息</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="tabbable">
							<ul id="tab_ul"
								class="nav nav-tabs padding-12 tab-color-blue background-blue">
								<li id="li1" class="active"><a data-toggle="tab" href="#ji_ben">基本信息</a>
								</li>

								<li id="li2" class=""><a data-toggle="tab" href="#zhi_ye">职业信息</a>
								</li>
							</ul>

							<div class="tab-content form-inline form-add1">
								<div id="ji_ben" class="tab-pane active">
									
									<form class="form-inline bord1dd form-add1">
										<div class="form-group"> 
											<label>
												<img id="user_img" alt="150x150" height="120" width="120"src="../images/thumb-6.jpg">
											</label>
											<button id="#" type="button" class="btn btn-submit"data-toggle="button">
												上传头像
											</button>
										</div>
										<div class="form-group mar-t-15">
											<label>昵称</label> <span id="nick_name"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>性别</label> <span id="gender"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>生日</label> <span id="birthday"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>行业</label> <span id="industry"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>联系电话</label> <span id="contact_phone"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>联系地址</label> <span id="address"></span>
										</div>
										<div class="form-group mar-t-15">
											<label>邮箱地址</label> <span id="email"></span>
										</div>
									</form>
									<div class="tc mar-t-20">
										<button id="update" type="button" class="btn btn-submit" data-toggle="button">
											<i class=" icon-edit mr10"></i>修改
										</button>
									</div>
								</div>

								<div id="zhi_ye" class="tab-pane">	
									<div id="no_yy" class="form-group mar-t-15" style="display:none;">
						              	<label>未通过原因</label>
						              	<div id="yanshou_result">
						              		
						             	</div>
						            </div>							
									<div class="form-group mar-t-15">
										<label></label> 
										 <img id="user_img1" alt="认证人照片" height="250" width="210"src="../../images/thumb-6.jpg"/>	
									</div>
									<div id="up_photo" class="form-group overhidden">
											<form id="form1" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                	<label class="mar-t-15 pull-left">
						                		<a class="btn-upload" href="javascript:void(0)">上传照片</a>
						                		<input class="inp-upload" type="file" id="file_up" name="file1" onchange="fileChange();"/>
						               		 </label>
						             
						               		 <div class=" overhidden formwrapper1">
						                  	  	<p>最佳尺寸250*210上半身照片，格式为jpg或者png，大小不超过2M.</p>
							                  	<ul class="wid310 unstyled" id="files">
							                  	</ul>
						                	</div>
					                		 </form>
					               	  </div>	
									<div class="form-group">
										<label>审核状态</label>
										<span id="audit_state"></span> 	
									</div>
									
									
									<div class="form-group mar-t-15">
										<label>*专业等级</label> 
										<span id="major_level">暂无</span>	
									</div>
									<div class="form-group">
										<label class="mar-t-15">*公司名称</label> 
										<input id="company_name"  type="text" class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									
									<div class="form-group">
											<label class="mar-t-15">*行业分类</label> 
											<select class="form-control mar-t-15" style="width:105px;" id="first">
											</select> 
											<select class="form-control mar-t-15" style="width:105px;" id="second">
											</select> 
											<select class="form-control mar-t-15 wid107" style="width:105px;" id="third">
											</select>
											<input id="project_catg" disabled type="hidden" class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司电话</label> 
										<input id="company_phone"  type="text" class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司地址</label> 
										<select class="form-control mar-t-15 wid107" id="proj_province">
										</select> 
										<select class="form-control mar-t-15 wid107"id="proj_city">
										</select> 
										<select class="form-control mar-t-15 wid107"
											id="proj_area">
										</select>
									</div>
									<div class="form-group">
										<label class="mar-t-15"></label>
										<input id="addr" type="text" class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label id="ability" class="mar-t-15">能力标签</label> 
										<div  id="ability_tags">
											
										</div>
									</div>
									<div class="form-group">
										<label class="mar-t-15">个人介绍</label>
										<textarea id="person_remark" style="width:310px;height:100px;margin-top:30px;"></textarea>
									</div>
									<div class="form-group">
										<label class="mar-t-15">项目经验</label> 
										 <textarea id="project_experience" style="width:310px;height:100px;margin-top:20px;"></textarea>
									</div>
									<div class="tc mar-t-20">
										<button type="button" id="tj_btn" class="btn btn-submit" data-toggle="button">提交</button>
										<button type="button" id="back" class="btn btn-submit" data-toggle="button" style="display:none;" onclick="javascript:back()">返回</button>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
</body>
<script type="text/javascript" src="http://file.demo1.com/js/init_industry_catg.js"></script>
<script type="text/javascript">
var tz_type=getURLparam("tz_type");//跳转方式
if(tz_type==1){
	$("#zhi_ye").show();
	$("#ji_ben").hide();
	$("#li1").removeClass('active');
	$("#li2").attr('class','active');
	$("#back").show();
}
$("#li2").click(function(){
	$("#zhi_ye").show();
	$("#ji_ben").hide();
});
$("#li1").click(function(){
	$("#zhi_ye").hide();
	$("#ji_ben").show();
});
function back(){
	window.location.href="joinapply.jsp";
}

var prof_audit='';
queryAduit();//获取用户审核列表
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
		var aduit=data.getXCOValue("data");
		if(aduit!=null&&aduit!=undefined){
			prof_audit = aduit.getIntegerValue("prof_audit");
			$("#audit_state").text(getAuditState(prof_audit));
			if(prof_audit==0){
				$("#tj_btn").text("提交");
				province_city_area.init();
				init_industry_catg.init();
				getMyCareerInformation();	
			}else if(prof_audit==30){
				$("#tj_btn").text("修改");
				$("#no_yy").show();
				getMyCareerInformation();
				getProjectTask();
			}else if(prof_audit==100){
				$("#tj_btn").remove();
				$("#no_yy").remove();
				$("#up_photo").remove();
				getProjectTask();
				disAble();
			}else{
				$("#tj_btn").hide();
				$("#no_yy").show();
				$("#up_photo").hide();
				getProjectTask();
				disAble();
			}
		}else{
			$("#tj_btn").text("提交");
			province_city_area.init();
			init_industry_catg.init();
			getMyCareerInformation();	
		}
	}
}

	//隐藏禁用标签
	function disAble(){
		$("#company_name").attr("disabled",true);
		$("#first").attr("disabled",true);
		$("#second").attr("disabled",true);
		$("#third").attr("disabled",true);
		$("#company_phone").attr("disabled",true);
		$("#proj_province").attr("disabled",true);
		$("#proj_city").attr("disabled",true);
		$("#proj_area").attr("disabled",true);
		$("#addr").attr("disabled",true);
		$("#person_remark").attr("disabled",true);
		$("#project_experience").attr("disabled",true);
	}

	function getProjectTask() {
		var xco = new XCO();
		var options = {
			url : "/tvr-system/getprojecttaglist2.xco",
			data : xco,
			success : selectUserEmployeByIdCallBack
		};
		$.doXcoRequest(options);
	}
	
	function selectUserEmployeByIdCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var employer=data.getXCOValue("employer");
			var data=data.getXCOListValue("data");
			$("#major_level").text(employer.getStringValue("major_level"));
			$("#company_name").val(employer.getStringValue("company_name"));
			$("#company_phone").val(employer.getStringValue("company_phone"));
			province_city_area.init(employer.getStringValue("company_province_code"),employer.getStringValue("company_city_code"),employer.getStringValue("company_area_code"));
			var path=employer.getStringValue("project_catg_path").split(",");
			init_industry_catg.init(path[0],path[1],path[2]);
			$("#addr").val(employer.getStringValue("company_addr"));
			
			var ability_tags = employer.getStringValue("ability_tags");
			
			$("#person_remark").val(employer.getStringValue("person_remark"));
			$("#project_experience").val(employer.getStringValue("project_experience"));
			$("#user_img1").attr("src",employer.getStringValue("prof_photo_url"));
			if(prof_audit==10||prof_audit==20||prof_audit==100){
				$("#ability").append("<span>"+ability_tags+"</span>");
			}
			//渲染 验收
			if(!data){
				$("#yanshou_result").html("<span style=\"margin-left:40px;\">暂无</span>");
			}else{
				$("#yanshou_result").html("");
				var str="";
				for ( var i = 0; i < data.length; i++) {
					str+="<div class=\" form-group\">";
					str+="<label class=\"form-control\">"+data[i].getStringValue("create_time")+"</label>";
					str+="<span class=\"inlineBlock mb5 vm wid80\">"+checkAstate(data[i].get("through"))+"</span>";
					str+="<div class=\"inlineBlock mb5 vm\">"+data[i].get("remark")+"</div>";
					str+="</div>";
				}
				$("#yanshou_result").html(str);
			}
		}
	}
	function checkAstate(state){
		if(state == 1){
			return "审核不通过";
		}else{
			return "审核通过";
		}
	}
	
	//跳转个人信息修改页面
	$("#update").click(function(){
		window.location.href="update_info.jsp";
	});
	//获取个人信息列表
	function getMyProjectTaskList() {
		var xco = new XCO();
		var options = {
			url : "/tvr-user/getUser1.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			$("#nick_name").text(data.getStringValue("nick_name"));//昵称
			$("#gender").text(data.getStringValue("gender")); //性别
			$("#birthday").text(data.getStringValue("birthday")); //生日
			$("#industry").text(data.getStringValue("industry")); //行业
			$("#contact_phone").text(data.getStringValue("contact_phone")); //联系电话
			$("#address").text(data.getStringValue("user_province")+ data.getStringValue("user_city")+ data.getStringValue("user_area")+ data.getStringValue("user_addr")); //联系地址
			$("#email").text(data.getStringValue("email")); //邮箱地址	
			$("#user_img").attr('src', data.getStringValue("avatar"));
		}
	}
	getMyProjectTaskList();

	function getMyCareerInformation() {
		var xco = new XCO();
		xco.setIntegerValue("type",0);
		var options = {
			url : "/tvr-system/renderabilittagslist.xco",
			data : xco,
			success : function(data){
				if (data.getCode() != 0) {
					jAlert('doCallBack error:\n' + data,"错误提示");
				} else {
					renderCheckBox(data);
				}
			}
		};
		$.doXcoRequest(options);
	}

	function renderCheckBox(data){
		var datalist = data.getXCOListValue("data");
		var str = "<table  style=\"width:760px;border:solid 1px #add9c0;margin-left:200px;margin-bottom:40;\">";
			str += "<tr style=\"height:30px;\">";
		for(var i=1;i<=datalist.length;i++){
			if(i%6 == 0){
				str+="</tr><tr style=\"height:30px;\">";
			}else{
				str+="<td style=\"border:solid #add9c0; border-width:0px 1px 1px 0px;\"><input type=\"checkbox\" name=\"ability\" data-value="+datalist[i-1].getStringValue("name")+"><span class=\"lbl\" style=\"margin-left:10px;\">"+datalist[i-1].getStringValue("name")+"</span></td>";
			}
		}
		str+="</tr></table>"
		$("#ability_tags").append(str);
	}

//---------------------------------------提交职业信息-----------------------------------------------------------
	$("#tj_btn").click(function(){
		var xco=new XCO();
		var project_catg_id = 0;
		var firstCode = $("#first").val();
		var secondCode = $("#second").val();
		var thirdCode = $("#third").val();
		if(thirdCode){
			project_catg_id = thirdCode;
		}else if(secondCode){
			project_catg_id = secondCode;
		}else{
			project_catg_id = firstCode;
		}
		
		var project_catg_name = "";
		var firstText = $("#first").find("option:selected").text();
		var secondText = $("#second").find("option:selected").text();
		var thirdText = $("#third").find("option:selected").text();
		if(firstText){
			project_catg_name+=firstText+",";
		}
		if(secondText){
			project_catg_name+=secondText+",";
		}
		if(thirdText){
			project_catg_name+=thirdText+",";
		}
		project_catg_name = project_catg_name.substring(0, project_catg_name.length-1);
		
		var project_catg_path='';
		if(firstCode){
			project_catg_path += firstCode+",";
		}
		if(secondCode){
			project_catg_path += secondCode+",";
		}
		if(thirdCode){
			project_catg_path += thirdCode+",";
		}
		project_catg_path = project_catg_path.substring(0, project_catg_path.length-1);
		
		xco.setStringValue("project_catg_id",project_catg_id);//项目分类ID
		xco.setStringValue("project_catg_name",project_catg_name);//项目分类名称
		xco.setStringValue("project_catg_path",project_catg_path);//项目分类名称
		xco.setStringValue("company_name",$("#company_name").val())//公司名称
		xco.setStringValue("company_phone",$("#company_phone").val())//公司电话
		xco.setStringValue("company_province",$("#proj_province").find("option:selected").text());//省
		xco.setStringValue("company_province_code",$("#proj_province").val());//省编码
		xco.setStringValue("company_city",$("#proj_city").find("option:selected").text());//市
		xco.setStringValue("company_city_code",$("#proj_city").val());//市编码
		xco.setStringValue("company_area",$("#proj_area").find("option:selected").text());//区
		xco.setStringValue("company_area_code",$("#proj_area").val());//区编码
		xco.setStringValue("company_addr",$("#addr").val());//详细地址
		xco.setStringValue("person_remark",$("#person_remark").val())//个人描述
		
		xco.setStringValue("prof_photo_url", getArray()[0].getStringValue("url"));
		xco.setStringValue("prof_photo_name", getArray()[0].getStringValue("title"));
		var flag = "";
		var count = 0;
		$('input:checkbox').each(function (index, domEle) {
			if($(domEle).prop("checked")){
				count++;
				flag +=$(domEle).attr("data-value")+",";
			}
		});
		if(count == 0){
			jAlert("请选择能力标签","错误提示");
			return;
		}else{
			flag = flag.substring(0,flag.length-1);
		}
		xco.setStringValue("ability_tags",flag);//能力标签
		
		xco.setStringValue("project_experience",$("#project_experience").val())//项目经验
		var url='';
		if(prof_audit==0){
			url="/tvr-system/insertUserEmploye.xco";
		}
		if(prof_audit==30){
			url="/tvr-system/updateUserEmploye.xco";
		}
		var options = {
			url: url,
			data: xco,
			success: getInsertProject
		};
		jConfirm("确认提交该信息吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
		
	});
	
	function getInsertProject(data){
		if(data.getCode()!=0){
			jAlert('doCallBack error:\n',"错误提示");
		}else{	
			jAlert("发布成功！！","成功提示", function(r) {
				if(tz_type==1){
					window.location.href="joinapply.jsp";
				}else{
					location.reload();
				}
			});
		}
	}


//----------------------------------------------------文件上传----------------------------------------------------------------------------------
	$(".btn-upload").on("click",function(){
		var file_up_length = $("#files > li").length;
		var arr_length = array.length;
		if(isFileOne(file_up_length)==1){
			return;
		}
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	var array=new Array();
	var fileIndex = 0;
	function fileChange(){
		var file_name = $("#file_up").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files("+fileIndex+")\"  class=\"fr\">上传</a></li>");
		fileIndex++;
	};
	
	var currentIndex = 0;
	
	function upload_files(index){
		currentIndex = index;
		$("#form1").submit();
	}
	
	function getArray(){
		var newArray = [];
		for(var i=0; i<array.length; i++){
			if(array[i].getIntegerValue("currentIndex") > -1){
				newArray.push(array[i]);
			}
		}
		return newArray;
	}
	
	function del(index){
		$("#file_" + index).remove();
		for(var i=0; i<array.length; i++){
			if(index == array[i].getIntegerValue("currentIndex")){
				array[i].setIntegerValue("currentIndex", -1);
			}
		}
		document.getElementById("form1").reset();
	}

	function uploadCallBack(data) {
		var xco = new XCO();
		xco.fromXML(data);
		if(0 == xco.getCode()){
			var results = xco.get("updateResult");
			for(i=0;i<results.length;i++){
				var xco1 = new XCO();
				$("#files > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				})
				$("#user_img1").attr("src",results[i].get("url"));
				xco1.setStringValue("title", results[i].get("filename"));
				xco1.setStringValue("url", results[i].get("url"));
				xco1.setIntegerValue("currentIndex", currentIndex);
				array.push(xco1);
			}
			jAlert("上传成功！","提示");
		} 
		
	}

</script>
</html>
