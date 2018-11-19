<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>新增任务</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<%@ include file="left.jsp"%>
<script type="text/javascript" src="http://file.demo1.com/js/province_city_area.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/selectoption.js"></script>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="advisorcenter" sub-page="projectlist">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://advisor.demo1.com/index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>	
				<li>新增任务</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>新增任务</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="form-inline bord1dd form-add1">
							<div class="form-group overhidden">
								<table id="table_bug_report"
									class="table table-striped table-bordered table-hover"
									style="width:80%; margin-left:10%;">
									<thead>
										<tr>
											<th>项目编号</th>
											<th>项目甲方</th>
											<th>项目名称</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="center" id="td1"></td>
											<td class="center" id="td2"></td>
											<td class="center" id="td3"></td>
											<input type="hidden" id="#td4"/>
										</tr>
	
									</tbody>
								</table>
							</div>
								
							<div class="form-group">
								<label class="mar-t-15">任务名称</label> <input id="task_name" type="text"
									class="form-control  mar-t-15 wid310" placeholder="">
							</div>
							<div class="form-group">
								<label class="mar-t-15">服务商</label>
								<textarea id="fws_name" class="form-control  mar-t-15 wid310" rows="4" disabled="disabled"></textarea>
								<button id="ts_btn" type="button" class="btn btn-submit">推送范围</button>
								<input type="hidden" id="fws_id">
							</div>
							<div class="form-group overhidden">
								<label class="mar-t-15">任务周期</label> <input id="cycle" type="text"
									class="form-control  mar-t-15 wid155" placeholder="">
								<select class="form-control mar-t-15 wid155"
									id="cycle_type">
									<option value="天">天</option>
									<option value="周">周</option>
									<option value="月">月</option>
									<option value="年">年</option>
									<option value="不确定">不确定</option>
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15">任务酬劳</label> <input id="amount" type="text"
									class="form-control  mar-t-15 wid310" placeholder=""><span style=" height:32px;line-height:32px;overflow:hidden;vertical-align:middle;">元</span>
								<!-- <select class="form-control mar-t-15 wid155"
									id="amount_type">
								</select> -->
							</div>
							<div class="form-group">
								<label class="mar-t-15 ">任务类型</label> <select
									class="form-control mar-t-15 wid320" id="task_type">
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15">实施地址</label> <select id="proj_province"
									class="form-control mar-t-15 wid107">
								</select> 
								<select id="proj_city" class="form-control mar-t-15 wid107">
								</select> 
								<select id="proj_area" class="form-control mar-t-15 wid107">
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15"></label> <input id="task_addr"
									type="text" class="form-control  mar-t-15 wid310"
									placeholder="">
							</div>
							<div class="form-group">
								<label class="mar-t-15">任务内容</label>
								<textarea id="task_desc" class="form-control  mar-t-15 wid310" rows="4"></textarea>
							</div>
							<div class="form-group overhidden">
								<form id="form1" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
					                <label class="mar-t-15 pull-left">
					                	<a class="btn-upload" href="javascript:void(0)">附件上传</a>
					                	<input class="inp-upload" type="file" id="file_up" name="file1" onchange="fileChange();"/>
					                </label>
					             
					                <div class=" overhidden formwrapper1">
					                  	  <p>请压缩成rar或者zip格式后上传，最多可添加五个附件，每个大小不超过100M.</p>
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
								data-toggle="button">提交</button>
							<button type="button" class="btn btn-submit" onclick="javascript:back();"data-toggle="button"> 返回</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- 提交任务 -->
<script type="text/javascript">

function back(){
	window.location.href="project_implement.jsp?project_sn="+project_sn;
}
queryRenderlist();
function queryRenderlist(){
	var xco = new XCO();
	var options = {
		url : "/renderPage/getRenderTask.xco",
		data : xco,
		success : queryRenderlistCallBack
	};
	$.doXcoRequest(options);
}
function queryRenderlistCallBack(data){
	var str = "";
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data,"错误提示");
	}else{
		var list = data.getXCOListValue("data");
		for(var i=0;i<list.length;i++){
			str+="<option value="+list[i].getStringValue("id")+">"+list[i].getStringValue("name")+"</option>";
		}
		$("#task_type").append(str);
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
	$("#file_" + index).remove();
	for(var i=0; i<array.length; i++){
		if(index == array[i].getIntegerValue("currentIndex")){
			array[i].setIntegerValue("currentIndex", -1);
		}
	}
	
	document.getElementById("form1").reset();
}


var array=new Array();
var project_sn=getURLparam("project_sn");
var behalf=getURLparam("behalf");
//selectoption.init("amount_type","budget_type");
province_city_area.init();
getProject(project_sn);
$(document).ready(function(){
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
	$("#ts_btn").click(function(){
		layer.open({
			type: 2,
			title: "选择服务商",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["800px" , "660px"],
			content: ["push_range.jsp"]
		});
	});
	$("#tj_btn").click(function(){
		var xco=new XCO();
		xco.setStringValue("task_name",$("#task_name").val());//任务名称
		xco.setStringValue("project_sn",project_sn);//项目编号
		xco.setIntegerValue("task_level",1);//任务层级
		//xco.setLongValue("adviser_id",1);//顾问ID
		//xco.setStringValue("adviser_name","战三");//顾问名称
		xco.setStringValue("providers",$("#fws_id").val());//服务商ID
		xco.setStringValue("task_type",$("#task_type").find("option:selected").text());//任务类型
		var tcycle = $("#cycle").val();
		if(isNaN(tcycle)){
			jAlert("请输入数字!!","错误提示");
			return false;
		}else{
			xco.setIntegerValue("task_cycle",parseInt($("#cycle").val()));//任务周期
		}
		xco.setStringValue("cycle_unit",$("#cycle_type").find("option:selected").text());//任务周期单位
		xco.setStringValue("cycle_unit_name",$("#cycle_type").find("option:selected").text());//任务周期单位名称
		
		var td4Value = $("#td4").val();
		var tamount = $("#amount").val();
		if(td4Value < tamount){
			jAlert("任务酬劳不能大于项目已收款!","错误提示",function(){
				$("#amount").focus();
			});
			return false;
		}
		if(isNaN(tamount)){
			jAlert("请输入数字!!","错误提示");
			return false;
		}else{
			xco.setIntegerValue("proposed_amount",parseInt($("#amount").val())*100);//建议酬劳金额
			xco.setIntegerValue("real_amount",parseInt($("#amount").val())*100);//实际酬劳金额
		}
		xco.setIntegerValue("reward_type",2);//酬劳类型
		xco.setStringValue("task_province",$("#proj_province").find("option:selected").text());//省
		xco.setStringValue("task_province_code",$("#proj_province").val());
		xco.setStringValue("task_city",$("#proj_city").find("option:selected").text());//市
		xco.setStringValue("task_city_code",$("#proj_city").val());
		xco.setStringValue("task_area",$("#proj_area").find("option:selected").text());//区
		xco.setStringValue("task_area_code",$("#proj_area").val());
		xco.setStringValue("task_addr",$("#task_addr").val());//详细地址
		xco.setStringValue("task_desc",$("#task_desc").val());//任务描述
		if(behalf==1){
			xco.setIntegerValue("task_behalf",1);
		}
		xco.setXCOListValue("urlList", getArray());
		var options = {
			url : "/project-operate/insertTask.xco",
			data : xco,
			success : getInsertTaskCallBack
		};
		jConfirm("确认添加该任务吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
	});
});

function getInsertTaskCallBack(data){
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
	}else{
		jAlert("添加成功","提示",function(r){
			window.location.href="project_implement.jsp?project_sn="+project_sn;
		});
	}
}
function getProject(_project_sn) {
	var xco = new XCO();
	xco.setStringValue("project_sn", _project_sn);
	
	var options = {
		url : "/tvr-project/getProject1.xco",
		data : xco,
		success : getProjectCallBack
	};
	$.doXcoRequest(options);
}

function getProjectCallBack(data){
	if(data.getCode()!=0){
		jAlert('doCallBack error:\n' + data,"错误提示");
	}else{
		$("#td1").text(data.getStringValue("project_sn"));
		$("#td2").text(data.getStringValue("employer_name"));
		$("#td3").text(data.getStringValue("project_name"));
		$("#td4").val(data.getStringValue("received_amount"));
	}
}

function uploadCallBack(data) {
	var xco = new XCO();
	xco.fromXML(data);
	if (0 == xco.getCode()) {
		var results = xco.get("updateResult");
		for (i = 0; i < results.length; i++) {
			var xco1 = new XCO();
			$("#files > li").each(function(j,o){
				if($(o).find("span").text() == results[i].get("filename")){
					$(o).find("a").eq(1).hide();
				}
			});
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
