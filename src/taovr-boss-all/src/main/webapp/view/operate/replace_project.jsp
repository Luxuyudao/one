<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "代发项目";
%>
<head>
<meta charset="utf-8" />
<title>代发项目</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/selectoption.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<script type="text/javascript" src="http://file.demo1.com/js/init_industry_catg.js"></script>
</head>
<body>

	<div id="main-content" class="clearfix" data-page="operate" sub-page="replaceproject">
		<div id="breadcrumbs">
			<ul class="breadcrumb">

				<li><i class="icon-home"></i><a href="http://manager.boss.demo1.com/view/operate/index.jsp">运营中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
				<li>代发项目</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>代发项目</h1>
			</div>
			<div class="row-fluid">
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="form-inline bord1dd form-add1">
							<div class="form-group">
								<label class="mar-t-15">*项目甲方</label>
								<input id="username" type="text" class="wid310" placeholder="" disabled="disabled">
								<button id="add_gz" type="button" class="btn btn-primary mr10"
									style="margin-top:10px;width: 120px;" data-toggle="button">
									<i class=" icon-plus"></i>新增雇主
								</button> 
								<input type="hidden" id="userid" value=""> 
							</div>
							<div class="form-group">
								<label class="mar-t-15">*项目顾问</label> <select
									class="form-control mar-t-15" style="width:325px;" id="adviser">
								</select>
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
								<label class="mar-t-15">*项目名称</label> <input id="project_name" type="text"
									class="form-control  mar-t-15 wid310" placeholder="">
							</div>

							<div class="form-group overhidden">
								<label class="mar-t-15">*项目周期</label> <input id="project_cycle" style="width:160px;" type="text"
									class="form-control  mar-t-15 wid155" placeholder=""> 
									<select class="form-control mar-t-15" style="width:145px;" id="cycle_unit_name">
									<option value="天">天</option>
									<option value="周">周</option>
									<option value="月">月</option>
									<option value="年">年</option>
									<option value="不确定">不确定</option>
								</select>
							</div>

							<div class="form-group">
								<label class="mar-t-15">*项目预算</label> <input id="budget_amount" type="text"
									class="form-control  mar-t-15" style="width:160px;" placeholder=""> 
								<select
									class="form-control mar-t-15" id="budget_type" style="width:145px;">
									<option value="1">可商议</option>
									<option value="2">元</option>
								</select>
							</div>
							
								<div class="form-group">
								<label class="mar-t-15">实施地址</label> <select id="proj_province"
									class="form-control mar-t-15" style="width:105px;">
								</select> 
								<select id="proj_city" class="form-control mar-t-15" style="width:105px;">
								</select> 
								<select id="proj_area" class="form-control mar-t-15" style="width:105px;">
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
									<form id="form1" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
						                <label class="mar-t-15 pull-left">
						                	<a class="btn-upload" href="javascript:void(0)">附件上传</a>
						                	<input class="inp-upload" type="file" id="file_up" name="file1" onchange="fileChange();"/>
						                </label>
						             
						                <div class=" overhidden formwrapper1">
						                  	  <p>最多可添加五个附件，格式必须为 rar、zip，每个大小不超过200M.</p>
							                  <ul class="wid310 unstyled" id="files">
							                  </ul>
						                </div>
					                 </form>
					            </div>					
						</div>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit" data-toggle="button">
						<i class=" icon-ok mr10"></i>提交
					</button>
					<a href="index.jsp"><button type="button" class="btn btn-submit" data-toggle="button">返回</button></a>
				</div>
			</div>
		</div>
		<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
</body>
<script type="text/javascript">
//获取顾问列表
	advisorlist();
	function advisorlist(){
		var data = new XCO();
		data.setIntegerValue("start", 0);
		data.setIntegerValue("pageSize", 10000);
		var options = {
			url : "/tvr-project/getAdvisorListP63.xco",
			data : data,
			success : advisorlistCallBack
		};
		$.doXcoRequest(options);
	}
	
	function advisorlistCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			var users = data.getXCOListValue("users");
			if(users){
				var str = "";
				for(var i=0;i<users.length;i++){
					str+="<option value="+users[i].getIntegerValue("user_id")+">"+users[i].getIntegerValue("nick_name")+"</option>"
				}
				$("#adviser").append(str);
			}
		}
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
	if(isFileRar(file_name)==1){
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

province_city_area.init();
init_industry_catg.init();

var array=new Array();

$(document).ready(function(){
		$(".btn-upload").on("click",function(){
			var file_up_length = $("#files > li").length;
			var arr_length = array.length;
			if(isFileFive(file_up_length)==1){
				return;
			}
			if(file_up_length > arr_length){
				jAlert("先上传再选择文件！","上传提示");
			}else{
				$(this).siblings("input").trigger("click");	
			}
		});
		
		$("#add_gz").click(function(){
			layer.open({
				type: 2,
				title: "新增雇主",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["800px" , "600px"],
				content: ["add_employer.jsp","no"]
			});
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
			
			xco.setStringValue("project_catg_id",project_catg_id);//项目分类ID
			xco.setStringValue("project_catg_name",project_catg_name);//项目分类名称
			xco.setStringValue("project_catg_path",project_catg_path);//项目分类名称
			xco.setStringValue("project_name",$("#project_name").val());//项目名称
			xco.setLongValue("employer_id",$("#userid").val());//用户ID
			xco.setStringValue("employer_name",$("#username").val());//用户名称
			xco.setLongValue("adviser_id",$("#adviser").val());//顾问ID
			xco.setStringValue("adviser_name",$("#adviser").find("option:selected").text());//顾问
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
			xco.setIntegerValue("behalf",1);//是否代建
			//xco.setLongValue("behalf_id","2");//代建人ID
			//xco.setXCOListValue("urlList", array);
			xco.setXCOListValue("urlList", getArray());
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
		jAlert('doCallBack error:\n' + data.getMessage,"错误提示");
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
//删除附件控件 （不管用）
function bindListener(){
     $("a[name=rmlink]").unbind().click(function(){
         $(this).parent().remove(); 
     })
}
</script>
</html>
