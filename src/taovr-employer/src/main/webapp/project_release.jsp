<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>发布需求</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/selectoption.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/init_industry_catg.js"></script>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_release">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="http://employer.demo1.com/">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li>发布需求</li>
				</ul>
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>发布需求</h1>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<div class="form-inline bord1dd form-add1" >
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
									<label class="mar-t-15">*项目名称</label> 
									<input id="project_name" type="text" class="form-control  mar-t-15 wid310" placeholder="">
									<label id="project_name_div" class="mar-t-15"></label>
								</div>
								<div class="form-group overhidden">
									<label class="mar-t-15">*项目周期</label> 
									<input id="project_cycle" type="text" class="form-control  mar-t-15" style="width:160px;" placeholder="">
									<select class="form-control mar-t-15 wid155" style="width:145px;" id="cycle_unit_name">
										<option value="天">天</option>
										<option value="周">周</option>
										<option value="月">月</option>
										<option value="年">年</option>
										<option value="不确定">不确定</option>
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15">*项目预算</label> <input id="budget_amount" type="text" class="form-control  mar-t-15" style="width:160px;" placeholder="">
									<select class="form-control mar-t-15" style="width:145px;" id="budget_type">
										
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15">*实施地址</label> 
									<select class="form-control mar-t-15" style="width:105px;" id="proj_province">
									</select> 
									<select class="form-control mar-t-15" style="width:105px;" id="proj_city">
									</select> 
									<select class="form-control mar-t-15 wid107" style="width:105px;" id="proj_area">
									</select>
								</div>
								<div class="form-group">
									<label class="mar-t-15"></label> <input id="proj_addr" type="text"
										class="form-control  mar-t-15 wid310" placeholder="">
								</div>
								<div class="form-group">
									<label class="mar-t-15">*需求描述</label>
									<textarea id="project_desc" class="form-control  mar-t-15 wid310" rows="4"></textarea>
								</div>
								<div class="form-group overhidden">
									<form id="form1" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                <label class="mar-t-15 pull-left">
						                	<a class="btn-upload" href="javascript:void(0)">附件上传</a>
						                	<input class="inp-upload" type="file" id="file_up" name="file1" onchange="fileChange();"/>
						                </label>
						             
						                <div class=" overhidden formwrapper1">
						                  	  <p>最多可添加五个附件，格式必须为 rar、zip，每个大小不超过200M.</p>
							                  <ul class="wid310 unstyled" id="files"><!-- 动态添加内容 --></ul>
						                </div>
					                 </form>
					              </div>								
							</div>
						</div>
					</div>
					<div class="tc mar-t-20">
						<button id="tijiao_btn" type="button" class="btn btn-submit" data-toggle="button">
							<i class=" icon-ok mr10"></i>提交
						</button>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
		<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
</body>
<script type="text/javascript">


var fileIndex = 0;
function fileChange(){
	var file_name = $("#file_up").val();
	if(isFileRar(file_name)==1){
		return false;
	}
	if(file_name.indexOf("\\") > -1){
		file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
	}
	//$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+file_name+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files()\"  class=\"fr\">上传</a></li>");
	if(file_name == ''){
		return;
	}
	$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files("+fileIndex+")\"  class=\"fr\">上传</a></li>");
	fileIndex++;
	//var len = $("#files > li").length;
	//if(len == 0){
	//}else{
	//	$("#files > li").each(function(){
	//		var file_name2 = $(this).children(":first").text();
	//		if(file_name2 == file_name){
	//			return false;
	//		}else{
	//			$("#files").append("<li class=\"overhidden mar-t-10\"> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del('"+file_name+"')\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files()\"  class=\"fr\">上传</a></li>");
	//		}
	//	});
	//}
}
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
	//alert(index);
	/*
	$("#files > li").each(function(){
		var file_name = $(this).children(":first").text();
		if(fileName == file_name){
			$(this).remove();
		}
	});
	for(i=0;i<array.length;i++){
		if(array[i].getStringValue("title") == fileName) {
		  array.splice(i, 1);
	      break;
		}
	};
	*/
	
	$("#file_" + index).remove();
	for(var i=0; i<array.length; i++){
		if(index == array[i].getIntegerValue("currentIndex")){
			array[i].setIntegerValue("currentIndex", -1);
		}
	}
	
	document.getElementById("form1").reset();
}


var array=new Array();
$(document).ready(function(){
	$(".btn-upload").on("click",function(){
		var file_up_length = $("#files > li").length;
		var arr_length = array.length;
		if(file_up_length > arr_length){
			jAlert("先上传再选择文件！","上传提示");
		}else{
			$(this).siblings("input").trigger("click");	
		}
	});
	
	province_city_area.init();
	init_industry_catg.init();
	selectoption.init("budget_type","budget_type",null,false);
	//selectoption.init("budget_type","budget_type","2");
	$("#tijiao_btn").click(function(){
		var xco=new XCO();
		xco.setStringValue("project_name",$("#project_name").val());//项目名称
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
		var firstCode = $("#first").val();
		var secondCode = $("#second").val();
		var thirdCode = $("#third").val();
		if(firstText){
			project_catg_name+=firstText+",";
		}
		if(secondText){
			project_catg_name+=secondText+",";
		}
		if(thirdText){
			project_catg_name+=thirdText+",";
		}
		project_catg_name = thirdText;//project_catg_name.substring(project_catg_name.lastIndexOf(","), project_catg_name.length-1);
		
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
		xco.setStringValue("project_catg_path",project_catg_path);//项目分类ids
		xco.setIntegerValue("project_cycle",parseInt($("#project_cycle").val()));//项目周期
		xco.setStringValue("cycle_unit",$("#cycle_unit_name").find("option:selected").text());//项目周期单位
		xco.setStringValue("cycle_unit_name",$("#cycle_unit_name").find("option:selected").text());//项目周期单位名称
		xco.setIntegerValue("budget_amount",parseInt($("#budget_amount").val())*100);//预算金额
		xco.setIntegerValue("budget_type",$("#budget_type").val());//预算金额类型
		xco.setStringValue("proj_province",$("#proj_province").find("option:selected").text());//省
		xco.setStringValue("proj_province_code",$("#proj_province").val());//省编号
		xco.setStringValue("proj_city",$("#proj_city").find("option:selected").text());//市
		xco.setStringValue("proj_city_code",$("#proj_city").val());//市编号
		xco.setStringValue("proj_area",$("#proj_area").find("option:selected").text());//区
		xco.setStringValue("proj_area_code",$("#proj_area").val());//区编号
		xco.setStringValue("proj_addr",$("#proj_addr").val());//详细地址
		xco.setStringValue("project_desc",$("#project_desc").val());//需求描述
		xco.setIntegerValue("behalf",0);//是否代建
		//xco.setXCOListValue("urlList", array);
		xco.setXCOListValue("urlList", getArray());
		//alert('a:' + getArray() + '\n' + array);
		
		/**/
		var options = {
			url: "/project-operate/insertProject.xco",
			data: xco,
			success: getInsertProject
		};
		jConfirm("确认要发布该项目吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
		
	});

});
function getInsertProject(data){
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
	}else{
		jAlert("发布成功！！","成功提示", function(r) {
			window.location.href="index.jsp";
		});
	}
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
			xco1.setStringValue("title", results[i].get("filename"));
			xco1.setStringValue("url", results[i].get("url"));
			xco1.setIntegerValue("currentIndex", currentIndex);
			array.push(xco1);
		}
		jAlert("上传成功！","提示");
		document.getElementById("form1").reset();
	} 
	
}
//添加附件
function addimg(){ 
	var btn='';
	btn+='<div class="form-group mar-t-15">';
	btn+='<label></label>';
	btn+='<input id="file" type="file" name="file1">';
	btn+='<a name="rmlink"><i class="icon-trash" style="padding-bottom:5px;"></i></a>';
	btn+='</div>';
	$("#add_file").append(btn);
}
//删除附件控件 （不管用）
function bindListener(){
     $("a[name=rmlink]").unbind().click(function(){
         $(this).parent().remove(); 
     })
}
</script>
</html>