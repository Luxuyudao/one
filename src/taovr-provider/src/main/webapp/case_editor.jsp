<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>编辑案例</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<%@ include file="left.jsp"%>
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/selectoption.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/init_industry_catg.js"></script>
</head>
<body>

		<div id="main-content" class="clearfix" data-page="user" sub-page="">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
				
					<li>编辑案例</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>编辑案例</h1>
				</div>
				<div class="box border">
	              	<div class="box-title">
	                	<h4><i class="fa fa-table"></i>未通过原因</h4>
	              	</div>
	              	<div class="form-inline bord1dd form-add1 font14" id="yanshou_result">
	              	
	             	</div>
	            </div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label class="mar-t-15">任务名称</label> <input
										id="project_case_name" type="text"
										class="form-control  mar-t-15 wid310" placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">任务内容</label>
									<textarea id="project_desc"
										class="form-control  mar-t-15 wid310" rows="4"></textarea>
								</div>

									<div class="form-group overhidden">
								<label class="mar-t-15">任务周期</label>
								 <input  style="width:120px" id="project_cycle" type="text" class="form-control  mar-t-15 wid155" placeholder="">
								  <select id="cycle_unit_name" class="form-control mar-t-15 wid155" style="width:190px">
									<option value="天">天</option>
									<option value="周">周</option>
									<option value="月">月</option>
									<option value="年">年</option>
									<option value="不确定">不确定</option>
								</select>
							</div>
								<div class="form-group">
									<label class="mar-t-15">参与人数</label> <input
										id="participants_num" type="text"
										class="form-control  mar-t-15 wid310" placeholder="">
								</div>
								<div class="form-group mar-t-15">
									<label>任务预算</label> <input id="budget_amount"
										type="text" class="form-control"
										placeholder=""><span class="mar-l-10">元</span>
								</div>
								<div class="form-group">
									<label class="mar-t-15">所属分类</label> 
									<select class="form-control mar-t-15" style="width:105px;" id="first">
									</select> 
									<select class="form-control mar-t-15" style="width:105px;" id="second">
									</select> 
									<select class="form-control mar-t-15 wid107" style="width:105px;" id="third">
									</select>
									<input id="project_catg" disabled type="hidden" class="form-control  mar-t-15 wid310" placeholder="">
								</div>

								<div class="form-group">
									<label class="mar-t-15">实施地址</label> 
									<select id="proj_province" class="form-control mar-t-15 wid107" style="width:105px">
									</select> 
									<select id="proj_city" class="form-control mar-t-15 wid107" style="width:105px">
									</select> 
									<select id="proj_area" class="form-control mar-t-15 wid107" style="width:105px">
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15"></label> <input id="proj_addr"
										type="text" class="form-control  mar-t-15 wid310"
										placeholder="">
								</div>
								<div class="form-group overhidden">
									<label class="fl mt20">开发时间</label>
									<div style="width:150px;"
										class="row-fluid mar-t-15 ml5 input-append date fl">
										<input id="start_time" class="span10 date-picker" id=""
											type="text" data-date-format="yyyy-mm-dd"> <span
											class="add-on"><i class="icon-calendar"></i> </span>
									</div>
									<span class="mt20 fl">&nbsp;至</span>
									<div style="width:150px;"
										class="row-fluid mar-t-15 ml5 input-append date fl">
										<input id="finish_time" class="span10 date-picker" id=""
											type="text" data-date-format="yyyy-mm-dd"> <span
											class="add-on"><i class="icon-calendar"></i> </span>
									</div>

								</div>
								<div class="form-group overhidden">
									<form id="form1" action="uploadVideo.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                <label class="mar-t-15 pull-left">
						                	<a id="btn-upload1" class="btn-upload" href="javascript:void(0)">视频上传</a>
						                	<input class="inp-upload" type="file" id="file_up1" name="file1" onchange="fileChange(1);"/>
						                </label>
						             
						                <div class=" overhidden formwrapper1">
						                  	  <p>只可添加1个附件，格式必须为 mp4，每个大小不超过200M.</p>
							                  <ul class="wid310 unstyled" id="files1">
							               
							                  </ul>
						                </div>
				                 </form>
				             	 </div>
				             	 <div class="form-group overhidden">
									<form id="form2" action="uploadImage.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                <label class="mar-t-15 pull-left">
						                	<a id="btn-upload2" class="btn-upload" href="javascript:void(0)">案例画册</a>
						                	<input class="inp-upload" type="file" id="file_up2" name="file1" onchange="fileChange(2);"/>
						                </label>
						             
						                <div class=" overhidden formwrapper1">
						                  	  <p>至少添加3个，最多可添加5个图片，格式必须为 jpg、png，每个大小不超过2M.</p>
							                  <ul class="wid310 unstyled" id="files2">
							                  	
							                  </ul>
						                </div>
					                 </form>
				             	 </div>
				             	 <div class="form-group overhidden">
									<form id="form4" action="uploadImage.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                <label class="mar-t-15 pull-left">
						                	<a id="btn-upload4" class="btn-upload" href="javascript:void(0)">案例封面</a>
						                	<input class="inp-upload" type="file" id="file_up4" name="file1" onchange="fileChange(4);"/>
						                </label>
						             
						                <div class=" overhidden formwrapper1">
						                  	  <p>最佳尺寸为 400x250(单位:像素)，图片尽量清晰，并能够体现案例特点，大小不超过2M.</p>
							                  <ul class="wid310 unstyled" id="files4">
							                  	
							                  </ul>
						                </div>
					                 </form>
				             	 </div>
				             	 <div class="form-group overhidden">
								<form id="form3" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
					                <label class="mar-t-15 pull-left">
					                	<a id="btn-upload3" class="btn-upload" href="javascript:void(0)">工程上传</a>
					                	<input class="inp-upload" type="file" id="file_up3" name="file1" onchange="fileChange(3);"/>
					                </label>
					             
					                <div class=" overhidden formwrapper1">
					                  	  <p>最多可添加五个附件，格式必须为 rar、zip，每个大小不超过200M.</p>
						                  <ul class="wid310 unstyled" id="files3">

						                  </ul>
					                </div>
				                 </form>
				              </div>
								<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
							</div>
							<div class="tc mar-t-20">
								<button id="tj_btn" type="button" class="btn btn-submit" data-toggle="button">提交</button>
								<button type="button" class="btn btn-submit" data-toggle="button" onclick="javascript:back();">返回</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
function back(){
	window.location.href="http://provider.demo1.com/mycase.jsp";
}
var project_case_sn=getURLparam('project_case_sn');
getMyCase(project_case_sn);
getCaseAuditList(project_case_sn);
var fileIndex1 = 0;
var fileIndex2 = 0;
var fileIndex3 = 0;
var fileIndex4 = 0;
function fileChange(num){
	if(num==1){
		var file_name = $("#file_up1").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFileVideo(file_name)==1){
			return;
		}
		$("#files1").append("<li class=\"overhidden mar-t-10\" id='file1_"+fileIndex1+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex1+"','"+num+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files1("+fileIndex1+")\"  class=\"fr\">上传</a></li>");
		fileIndex1++;
	}
	if(num==2){
		var file_name = $("#file_up2").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files2").append("<li class=\"overhidden mar-t-10\" id='file2_"+fileIndex2+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex2+"','"+num+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files2("+fileIndex2+")\"  class=\"fr\">上传</a></li>");
		fileIndex2++;
	}
	if(num==3){
		var file_name = $("#file_up3").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFileRar(file_name)==1){
			return;
		}
		$("#files3").append("<li class=\"overhidden mar-t-10\" id='file3_"+fileIndex3+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex3+"','"+num+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files3("+fileIndex3+")\"  class=\"fr\">上传</a></li>");
		fileIndex3++;
	}
	if(num==4){
		var file_name = $("#file_up4").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files4").append("<li class=\"overhidden mar-t-10\" id='file4_"+fileIndex4+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex4+"','"+num+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files4("+fileIndex4+")\"  class=\"fr\">上传</a></li>");
		fileIndex4++;
	}
}

var currentIndex1 = 0;
var currentIndex2 = 0;
var currentIndex3 = 0;
var currentIndex4 = 0;
var photo_type=0;//1.案例画册	2.案例封面
function upload_files1(index){
	currentIndex1 = index;
	$("#form1").submit();
}
function upload_files2(index){
	currentIndex2 = index;
	photo_type=1;
	$("#form2").submit();
}
function upload_files3(index){
	currentIndex3 = index;
	$("#form3").submit();
}
function upload_files4(index){
	currentIndex4 = index;
	photo_type=2;
	$("#form4").submit();
}

function getArray1(){
	var newArray1 = [];
	for(var i=0; i<array1.length; i++){
		if(array1[i].getIntegerValue("currentIndex") > -1){
			newArray1.push(array1[i]);
		}
	}
	return newArray1;
}

function getArray2(){
	var newArray2 = [];
	for(var i=0; i<array2.length; i++){
		if(array2[i].getIntegerValue("currentIndex") > -1){
			newArray2.push(array2[i]);
		}
	}
	return newArray2;
}

function getArray3(){
	var newArray3 = [];
	for(var i=0; i<array3.length; i++){
		if(array3[i].getIntegerValue("currentIndex") > -1){
			newArray3.push(array3[i]);
		}
	}
	return newArray3;
}
function getArray4(){
	var newArray4 = [];
	for(var i=0; i<array4.length; i++){
		if(array4[i].getIntegerValue("currentIndex") > -1){
			newArray4.push(array4[i]);
		}
	}
	return newArray4;
}

function del(index,num){
	if(num==1){
		$("#file1_" + index).remove();
		for(var i=0; i<array1.length; i++){
			if(index == array1[i].getIntegerValue("currentIndex")){
				array1[i].setIntegerValue("currentIndex", -1);
			}
		}
		document.getElementById("form1").reset();
	}
	if(num==2){
		$("#file2_" + index).remove();
		for(var i=0; i<array2.length; i++){
			if(index == array2[i].getIntegerValue("currentIndex")){
				array2[i].setIntegerValue("currentIndex", -1);
			}
		}
		document.getElementById("form2").reset();
	}
	if(num==3){
		$("#file3_" + index).remove();
		for(var i=0; i<array3.length; i++){
			if(index == array3[i].getIntegerValue("currentIndex")){
				array3[i].setIntegerValue("currentIndex", -1);
			}
		}
		document.getElementById("form3").reset();
	}
	if(num==4){
		$("#file4_" + index).remove();
		for(var i=0; i<array4.length; i++){
			if(index == array4[i].getIntegerValue("currentIndex")){
				array4[i].setIntegerValue("currentIndex", -1);
			}
		}
		document.getElementById("form4").reset();
	}
}

var array1=new Array();//视频
var array2=new Array();//画册
var array3=new Array();//文件
var array4=new Array();//文件
var project_role='';
$(document).ready(function(){
	$("#btn-upload1").click(function(){
		var file_up_length = $("#files1 > li").length;
		var arr_length = array1.length;
		if(isFileOne(file_up_length)==1){
			return;
		}
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	$("#btn-upload2").click(function(){
		var file_up_length = $("#files2 > li").length;
		var arr_length = array2.length;
		if(isFileFive(file_up_length)==1){
			return;
		}
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	$("#btn-upload4").click(function(){
		var file_up_length = $("#files4 > li").length;
		var arr_length = array4.length;
		if(isFileOne(file_up_length)==1){
			return;
		}
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	$("#btn-upload3").click(function(){
		var file_up_length = $("#files3 > li").length;
		var arr_length = array3.length;
		if(isFileFive(file_up_length)==1){
			return;
		}
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	
	$("#tj_btn").click(function(){
		var xco=new XCO();
		var project_catg = 0;
		var firstCode = $("#first").val();
		var secondCode = $("#second").val();
		var thirdCode = $("#third").val();
		if(thirdCode){
			project_catg = thirdCode;
		}else if(secondCode){
			project_catg = secondCode;
		}else{
			project_catg = firstCode;
		}
		
		var project_catg_name = "";
		var firstText = $("#first").find("option:selected").text();
		var secondText = $("#second").find("option:selected").text();
		var thirdText = $("#third").find("option:selected").text();
		if(firstText){
			project_catg_name=firstText;
		}
		if(secondText){
			project_catg_name=secondText;
		}
		if(thirdText){
			project_catg_name=thirdText;
		}
		
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
		xco.setStringValue("project_catg",project_catg);//项目分类名称
		xco.setStringValue("project_catg_name",project_catg_name);
		xco.setStringValue("project_catg_path",project_catg_path);
		
		xco.setStringValue("project_case_sn",project_case_sn);
		
		xco.setStringValue("project_case_name",$("#project_case_name").val());//项目名称
		xco.setStringValue("project_type",project_catg_name);//项目特征project_type
		xco.setIntegerValue("project_role",project_role);//项目角色project_role 1.专家  2.服务商
		
		xco.setIntegerValue("project_cycle",$("#project_cycle").val());//项目周期
		xco.setStringValue("cycle_unit",$("#cycle_unit_name").find("option:selected").text());//项目周期单位
		xco.setStringValue("cycle_unit_name",$("#cycle_unit_name").find("option:selected").text());//项目周期单位名称
		xco.setIntegerValue("budget_amount",parseInt($("#budget_amount").val())*100);//预算金额
		xco.setIntegerValue("participants_num",parseInt($("#participants_num").val()));//参与人数participants_num
		xco.setStringValue("proj_province",$("#proj_province").find("option:selected").text());//省
		xco.setStringValue("proj_province_code",$("#proj_province").val());//省编号
		xco.setStringValue("proj_city",$("#proj_city").find("option:selected").text());//市
		xco.setStringValue("proj_city_code",$("#proj_city").val());//市编号
		xco.setStringValue("proj_area",$("#proj_area").find("option:selected").text());//区
		xco.setStringValue("proj_area_code",$("#proj_area").val());//区编号
		xco.setStringValue("proj_addr",$("#proj_addr").val());//详细地址
		xco.setStringValue("start_time",$("#start_time").val());//项目开始时间
		xco.setStringValue("finish_time",$("#finish_time").val());//项目结束时间
		xco.setStringValue("project_desc",$("#project_desc").val());//需求描述
		if(project_role==1){
			xco.setIntegerValue("case_audit_type",getCaseAuditType(1,1));//顾问资质案例
		}
		if(project_role==2){
			xco.setIntegerValue("case_audit_type",getCaseAuditType(1,2));//服务商资质案例
		}
		
		xco.setXCOListValue("urlList1", getArray1());
		xco.setXCOListValue("urlList2", getArray2());
		xco.setXCOListValue("urlList3", getArray3());
		
		xco.setStringValue("case_image1",getArray4()[0].getStringValue("title"));
		xco.setStringValue("case_image1_url",getArray4()[0].getStringValue("url"));
		var options = {
			url: "/project-operate/updateProjectCaseP55.xco",
			data: xco,
			success: updateProjectCaseCallBack
		};
		jConfirm("确认重新提交该案例吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
	});

});

function updateProjectCaseCallBack(data){
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
	}else{
		jAlert("提交成功，工作人员会在2个工作日内完成审核工作。","提示",function(r){
			window.location.href="http://provider.demo1.com/mycase.jsp";
		});
	}
}
/* -----------------------------------------------------案例详情----------------------------------------------------------*/
function getMyCase(_project_case_sn){
	var xco=new XCO();
	xco.setStringValue("project_case_sn",_project_case_sn);
	
	var options = {
		url: "/tvr-project/getMyCase.xco",
		data: xco,
		success: getMyCaseCallBack
	};
	$.doXcoRequest(options);
}

function getMyCaseCallBack(data){
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data,"错误提示");
	}else{
		var cases=data.getXCOValue("case");
		var resources=data.getXCOListValue("resources");
		$("#project_case_name").val(cases.getStringValue("project_case_name"));//项目名称
		$("#project_desc").val(cases.getStringValue("project_desc"));//项目内容
		$("#project_cycle").val(cases.getStringValue("project_cycle"));//项目周期
		$("#cycle_unit_name").val(cases.getStringValue("cycle_unit"));//项目周期
		$("#participants_num").val(cases.getIntegerValue("participants_num"));//参与人数
		$("#budget_amount").val(parseInt(cases.getIntegerValue("budget_amount"))/100);//项目预算
		province_city_area.init(cases.getStringValue("proj_province_code"),cases.getStringValue("proj_city_code"),cases.getStringValue("proj_area_code"));//实施地址
		$("#proj_addr").val(cases.getStringValue("proj_addr"));
		var catgs=new Array();
		catgs=cases.getStringValue("project_catg_path").split(",");
		init_industry_catg.init(catgs[0],catgs[1],catgs[2]);
		$("#start_time").val(cases.getStringValue("start_time"))//开发时间
		$("#finish_time").val(cases.getStringValue("finish_time"))//结束时间
		
		var xco2 = new XCO();
		var title=cases.getStringValue("case_image1");
		var url=cases.getStringValue("case_image1_url");
		xco2.setStringValue("title", title);
		xco2.setStringValue("url", url);
		xco2.setStringValue("currentIndex", fileIndex4);
		array4.push(xco2);
		$("#files4").append("<li class=\"overhidden mar-t-10\" id='file4_"+fileIndex4+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex4+"','"+4+"')\"  class=\"fr\">删除</a> </li>");
		fileIndex4++;

		
		project_role=cases.getStringValue("project_role");
		
		if(resources!=null||undefined!=resources){
			for ( var i = 0; i < resources.length; i++) {
				if (resources[i].getIntegerValue("type") == 3) {
					var title=resources[i].getStringValue("title");
					var url=resources[i].getStringValue("url");
					var xco2 = new XCO();
					xco2.setStringValue("title", title);
					xco2.setStringValue("url", url);
					xco2.setStringValue("currentIndex", fileIndex1);
					array1.push(xco2);
					$("#files1").append("<li class=\"overhidden mar-t-10\" id='file1_"+fileIndex1+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex1+"','"+1+"')\"  class=\"fr\">删除</a> </li>");
					fileIndex1++;
				}
				if (resources[i].getIntegerValue("type") == 4) {
					var title=resources[i].getStringValue("title");
					var url=resources[i].getStringValue("url");
					var xco2 = new XCO();
					xco2.setStringValue("title", title);
					xco2.setStringValue("url", url);
					xco2.setStringValue("currentIndex", fileIndex2);
					array2.push(xco2);
					$("#files2").append("<li class=\"overhidden mar-t-10\" id='file2_"+fileIndex2+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex2+"','"+2+"')\"  class=\"fr\">删除</a> </li>");
					fileIndex2++;
				}
				if (resources[i].getIntegerValue("type") == 5) {
					var title=resources[i].getStringValue("title");
					var url=resources[i].getStringValue("url");
					var xco2 = new XCO();
					xco2.setStringValue("title", title);
					xco2.setStringValue("url", url);
					xco2.setStringValue("currentIndex", fileIndex3);
					array3.push(xco2);
					$("#files3").append("<li class=\"overhidden mar-t-10\" id='file3_"+fileIndex3+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+fileIndex3+"','"+3+"')\"  class=\"fr\">删除</a> </li>");
					fileIndex3++;
				}
			}
		}
	}
}
/*---------------------------------审核记录----------------------------------------------*/
	function getCaseAuditList(_projcet_case_sn){
		var xco=new XCO();
		xco.setStringValue("project_case_sn",_projcet_case_sn);
		
		var options = {
			url: "/tvr-project/getCaseAuditListP56.xco",
			data: xco,
			success: getCaseAuditListCallBack
		};
		$.doXcoRequest(options);
	}
	
	function getCaseAuditListCallBack(data){
		if(data.getCode()!=0){
			jAlert('doCallBack error:\n' + data,"错误提示");
		}else{
			var applies=data.getXCOListValue("data");
			if(!applies){
				$("#yanshou_result").html("<span style=\"margin-left:40px;\">暂无</span>");
			}else{
				$("#yanshou_result").html("");
				var str="";
				for ( var i = 0; i < applies.length; i++) {
					str+="<div class=\" form-group\">";
					str+="<label class=\"form-control\">"+applies[i].getStringValue("create_time")+"</label>";
					str+="<span class=\"inlineBlock mb5 vm wid80\">"+checkAstate(applies[i].get("through"))+"</span>";
					str+="<div class=\"inlineBlock mb5 vm\">"+applies[i].get("remark")+"</div>";
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


function uploadCallBack(data) {
		var xco = new XCO();
		xco.fromXML(data);
		if(0 == xco.getCode()){
			var results = xco.get("updateResult");
			for(i=0;i<results.length;i++){
				var xco1 = new XCO();
				$("#files1 > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				$("#files2 > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				$("#files3 > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				$("#files4 > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				xco1.setStringValue("title", results[i].get("filename"));
				xco1.setStringValue("url", results[i].get("url"));
				if(results[i].get("type")==3){//视频
					xco1.setIntegerValue("currentIndex", currentIndex1);
					array1.push(xco1);
				}
				if(results[i].get("type")==2){//画册
					if(photo_type==1){
						xco1.setIntegerValue("currentIndex", currentIndex2);
						array2.push(xco1);
					}
					if(photo_type==2){
						xco1.setIntegerValue("currentIndex", currentIndex4);
						array4.push(xco1);
					}
				}
				if(results[i].get("type")==1){//文件
					xco1.setIntegerValue("currentIndex", currentIndex3);
					array3.push(xco1);
				}
			}
			jAlert("上传成功！","提示");
		} 
		
	}

//添加附件
function addimg(num){ 
	var btn='';
	btn+='<div class="form-group mar-t-15">';
	btn+='<label></label>';
	btn+='<input id="file" type="file" name="file1">';
	btn+='<a name="rmlink"><i class="icon-trash" style="padding-bottom:5px;"></i></a>';
	btn+='</div>';
	if(num==1){
		$("#add_file1").append(btn);
	}
	if(num==2){
		$("#add_file2").append(btn);
	}
	if(num==3){
		$("#add_file3").append(btn);
	}
}
</script>
</html>
