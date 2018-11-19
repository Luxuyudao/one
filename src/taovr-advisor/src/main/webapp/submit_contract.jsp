<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>提交合约</title>
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
		<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="projectlist">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="http://advisor.demo1.com/index.jsp">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="http://advisor.demo1.com/project_list.jsp">项目列表</a><span class="divider"><i
							class="icon-angle-right"></i> </span></li>
					<li>提交合约</li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>提交合约</h1>
				</div>
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>项目编号</label> <span id="project_sn"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>雇主名称</label> <span id="employer_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目名称</label>
									<span id="project_name"></span>
								</div>
								<div class="form-group">
									<label class="mar-t-15">行业分类</label> 
									<select class="form-control mar-t-15" style="width:105px;" id="first">
									</select> 
									<select class="form-control mar-t-15" style="width:105px;" id="second">
									</select> 
									<select class="form-control mar-t-15 wid107" style="width:105px;" id="third">
									</select>
									<input id="project_catg" disabled type="hidden" class="form-control  mar-t-15 wid310" placeholder="">
								</div>
								<div class="form-group overhidden">
									<label class="mar-t-15">项目周期</label> <input id="cycle" type="text"
										class="form-control  mar-t-15 wid155" placeholder="">
									<select class="form-control mar-t-15 wid155"
										id="cycle_unit_name">
										<option value="天">天</option>
										<option value="周">周</option>
										<option value="月">月</option>
										<option value="年">年</option>
										<!-- <option value="不确定">不确定</option> -->
									</select>
								</div>
								<div class="form-group mar-t-15">
									<label>启动时间</label>
									<div style="width:15%;"
										class="row-fluid input-append date">
										<input id="start_time" class="span10 date-picker" id=""
											type="text" data-date-format="yyyy-mm-dd"> <span
											class="add-on"><i class="icon-calendar"></i> </span>
									</div>
									<span>至</span>
									<span id="end_time" style="margin-left:10px"></span>
								</div>
								<div class="form-group">
									<label class="mar-t-15">项目预算</label> <input id="budget_amount" type="text"
										class="form-control  mar-t-15 wid155" placeholder="">
									<select class="form-control mar-t-15 wid155" id="budget_type">
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15">实施地址</label> <select
										class="form-control mar-t-15 wid107" id="proj_province">
									</select> <select class="form-control mar-t-15 wid107" id="proj_city">
									</select> <select class="form-control mar-t-15 wid107" id="proj_area">
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15"></label> <input id="proj_addr"
										type="text" class="form-control  mar-t-15 wid310"
										placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">需求描述</label>
									<textarea id="project_desc"
										class="form-control  mar-t-15 wid310" rows="4"></textarea>
								</div>
								<div class="form-group overhidden">
								<form id="form2" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
					                <label class="mar-t-15 pull-left">
					                	<a id="btn-upload2" class="btn-upload" href="javascript:void(0)">项目附件</a>
					                	<input class="inp-upload" type="file" id="file_up2" name="file1" onchange="fileChange2();"/>
					                </label>
					             
					                <div class=" overhidden formwrapper1">
					                  	  <p>最多可添加五个附件，格式必须为 rar、zip，每个大小不超过200M.</p>
						                  <ul class="wid310 unstyled" id="files2">
						                  	<!-- 
						                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
						                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
						                  	 -->
						                  </ul>
					                </div>
				                 </form>
				              </div>
								<div class="form-group overhidden">
								<form id="form1" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
					                <label class="mar-t-15 pull-left">
					                	<a id="btn-upload" class="btn-upload" href="javascript:void(0)">项目合约</a>
					                	<input class="inp-upload" type="file" id="file_up" name="file1" onchange="fileChange();"/>
					                </label>
					             
					                <div class=" overhidden formwrapper1">
					                  	  <p>最多可添加一份合约.</p>
						                  <ul class="wid310 unstyled" id="files">
						                  	<!-- 
						                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
						                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
						                  	 -->
						                  </ul>
					                </div>
				                 </form>
				              </div>
								<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
							</div>
							<div class="tc mar-t-20">
									<button id="tj_btn" type="button" class="btn btn-submit"
										data-toggle="button">提交合约</button> 
									<button type="button" class="btn btn-submit"
										data-toggle="button">取消需求</button> 
									<button type="button" class="btn btn-submit"
										data-toggle="button" onClick="javascript :back();">返回</button> 
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

</body>
<script type="text/javascript">
function back(){
	window.location.href="project_list.jsp";
}
var fileIndex = 0;
function fileChange(){
	var file_name = $("#file_up").val();
	if(file_name.indexOf("\\") > -1){
		file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
	}
	if(file_name == ''){
		return;
	}
	if(isFileText(file_name)==1){
		return;
	}
	$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files("+fileIndex+")\"  class=\"fr\">上传</a></li>");
	fileIndex++;
}

var fileIndex2 = 0;
function fileChange2(){
	var file_name = $("#file_up2").val();
	if(file_name.indexOf("\\") > -1){
		file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
	}
	if(file_name == ''){
		return;
	}
	if(isFileRar(file_name)==1){
		return;
	}
	$("#files2").append("<li class=\"overhidden mar-t-10\" id='file2_"+fileIndex2+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del2("+fileIndex2+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files2("+fileIndex2+")\"  class=\"fr\">上传</a></li>");
	fileIndex2++;
}

var currentIndex = 0;
var up_type=0;//1.合约  2.项目附件
function upload_files(index){
	up_type=1;
	currentIndex = index;
	$("#form1").submit();
}
var currentIndex2 = 0;
function upload_files2(index){
	up_type=2;
	currentIndex2 = index;
	$("#form2").submit();
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
function getArray2(){
	var newArray = [];
	for(var i=0; i<array2.length; i++){
		if(array2[i].getIntegerValue("currentIndex") > -1){
			newArray.push(array2[i]);
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
function del2(index){
	$("#file2_" + index).remove();
	for(var i=0; i<array2.length; i++){
		if(index == array2[i].getIntegerValue("currentIndex")){
			array2[i].setIntegerValue("currentIndex", -1);
		}
	}
	
	document.getElementById("form2").reset();
}
	var array = new Array();
	var array2 = new Array();
	var end_time='';
	
	
	$(document).ready(function(){
		$("#btn-upload").on("click",function(){
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
		$("#btn-upload2").on("click",function(){
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
			
			xco.setStringValue("project_catg_id",project_catg_id);
			xco.setStringValue("project_catg_name",project_catg_name);
			xco.setStringValue("project_catg_path",project_catg_path);
			xco.setIntegerValue("project_cycle",parseInt($("#cycle").val()));
			xco.setStringValue("cycle_unit",$("#cycle_unit_name").find("option:selected").text());
			xco.setStringValue("cycle_unit_name",$("#cycle_unit_name").find("option:selected").text());
			xco.setIntegerValue("real_amount",parseInt($("#budget_amount").val())*100);
			xco.setIntegerValue("budget_type",$("#budget_type").val());
			xco.setStringValue("proj_province",$("#proj_province").find("option:selected").text());
			xco.setStringValue("proj_province_code",$("#proj_province").val());
			xco.setStringValue("proj_city",$("#proj_city").find("option:selected").text());
			xco.setStringValue("proj_city_code",$("#proj_city").val());
			xco.setStringValue("proj_area",$("#proj_area").find("option:selected").text());
			xco.setStringValue("proj_area_code",$("#proj_area").val());
			xco.setStringValue("proj_addr",$("#proj_addr").val());
			xco.setStringValue("contract",getArray()[0].getStringValue("title"));
			xco.setStringValue("contract_url",getArray()[0].getStringValue("url"));
			xco.setStringValue("project_desc",$("#project_desc").val());
			xco.setStringValue("proj_plan_start_time",$("#start_time").val());
			xco.setStringValue("proj_plan_end_time",end_time);
			xco.setStringValue("project_sn",project_sn);
			xco.setXCOListValue("urlList",getArray2());
			var options = {
			url: "/project-operate/updateProjectP38.xco",
			data: xco,
			success: getUpdateProject
		};
		jConfirm("确认提交该合约吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
	});
	$("#cycle").change(function(){
		if($("#start_time").val()!=''){
			end_time=addDays($("#start_time").val(),jsDays());
			$("#end_time").text(end_time);
		}
	});
	$("#cycle_unit_name").change(function(){
		if($("#start_time").val()!=''){
			end_time=addDays($("#start_time").val(),jsDays());
			$("#end_time").text(end_time);
		}
	});
	$("#start_time").change(function(){
		end_time=addDays($("#start_time").val(),jsDays());
		$("#end_time").text(end_time);
	});
});
	function getUpdateProject(data){
		if(data.getCode()!=0){
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		}else{
			jAlert("提交成功","提示",function(r){
				window.location.href="project_list.jsp";
			});
		}
	}
	function jsDays(){
		var days=0;
		if($("#cycle_unit_name").find("option:selected").text()=='天'){
			days=parseInt($("#cycle").val());
		}
		if($("#cycle_unit_name").find("option:selected").text()=='周'){
			days=parseInt($("#cycle").val())*7;
		}
		if($("#cycle_unit_name").find("option:selected").text()=='月'){
			days=parseInt($("#cycle").val())*30;
		}
		if($("#cycle_unit_name").find("option:selected").text()=='年'){
			days=parseInt($("#cycle").val())*365;
		}
		return days;
	}
	//日期加上天数后的新日期.
	function addDays(date,days){
		var nd = new Date(date);
		  nd = nd.valueOf();
		  nd = nd + days * 24 * 60 * 60 * 1000;
		  nd = new Date(nd);
		var y = nd.getFullYear();
		var m = nd.getMonth()+1;
		var d = nd.getDate();
		if(m <= 9) m = "0"+m;
		if(d <= 9) d = "0"+d; 
		var cdate = y+"-"+m+"-"+d;
		return cdate;
	}
	var project_sn = getURLparam("project_sn");
		getProject(project_sn);
	function getProject(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "/tvr-project/getProject2.xco",
			data : xco,
			success : getProjectCallBack
		};
		$.doXcoRequest(options);
	}
	function getProjectCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var project = data.getXCOValue("project");
			var resources = data.getXCOListValue("resources");
			$("#project_sn").text(project.getStringValue("project_sn"));//项目编号
			$("#employer_name").text(project.getStringValue("employer_name"));//雇主名称
			$("#project_name").text(project.getStringValue("project_name"));//项目名称
			//$("#project_catg").val();//行业分类
			var catgs=new Array();
			catgs=project.getStringValue("project_catg_path").split(",");
			init_industry_catg.init(catgs[0],catgs[1],catgs[2]);
			$("#cycle").val(project.getIntegerValue("project_cycle"));//项目周期
			$("#cycle_unit_name").val(project.getStringValue("cycle_unit_name"));//项目周期类型
			$("#budget_amount").val(parseInt(project.getIntegerValue("budget_amount")) / 100);//项目预算
			selectoption.init("budget_type","budget_type",project.getIntegerValue("budget_type"));//项目预算类型
			//$("#budget_type").val();
			province_city_area.init(project.getStringValue("proj_province_code"),project.getStringValue("proj_city_code"),project.getStringValue("proj_area_code"));
			$("#proj_addr").val(project.getStringValue("proj_addr"));//详情
			$("#project_desc").text(project.getStringValue("project_desc"));
 			if(resources!=null||undefined!=resources){
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 1) {//项目需求附件
						var title=resources[i].getStringValue("title");
						var url=resources[i].getStringValue("url");
						var xco2 = new XCO();
						xco2.setStringValue("title", title);
						xco2.setStringValue("url", url);
						xco2.setIntegerValue("currentIndex", fileIndex2);
						array2.push(xco2);
						$("#files2").append("<li class=\"overhidden mar-t-10\" id='file2_"+fileIndex2+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del2("+fileIndex2+")\"  class=\"fr\">删除</a> </li>");
						fileIndex2++;
					}
				}
			}
		}
	}
	
	function uploadCallBack(data) {
		var xco = new XCO();
		xco.fromXML(data);
		if(0 == xco.getCode()){
			var results = xco.get("updateResult");
			for(i=0;i<results.length;i++){
				var xco1=new XCO();
				$("#files > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				$("#files2 > li").each(function(j,o){
					if($(o).find("span").text() == results[i].get("filename")){
						$(o).find("a").eq(1).hide();
					}
				});
				if(up_type==1){
					xco1.setStringValue("title", results[i].get("filename"));
					xco1.setStringValue("url", results[i].get("url"));
					xco1.setIntegerValue("currentIndex", currentIndex);
					array.push(xco1);
				}
				if(up_type==2){
					xco1.setStringValue("title", results[i].get("filename"));
					xco1.setStringValue("url", results[i].get("url"));
					xco1.setIntegerValue("currentIndex", currentIndex2);
					array2.push(xco1);
				}
				
			}
			jAlert("上传成功！","提示");
		} 
	}
	
</script>
</html>
