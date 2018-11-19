<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>编辑任务</title>
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
				<li></i> <a href="http://advisor.demo1.com/project_implement.jsp">项目执行</a><span class="divider"><i
						class="icon-angle-right"></i> </span>
				</li>
				<li>编辑任务</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>编辑任务</h1>
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
											<td class="center" id="project_sn"></td>
											<td class="center" id="employer_name"></td>
											<td class="center" id="project_name"></td>
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
									id="cycle_unit_name">
									<option value="天">天</option>
									<option value="周">周</option>
									<option value="月">月</option>
									<option value="年">年</option>
									<option value="不确定">不确定</option>
								</select>
							</div>
							<div class="form-group">
								<label class="mar-t-15">任务酬劳</label> <input id="budget_amount" type="text"
									class="form-control  mar-t-15 wid310" placeholder="">
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
					                  	  <p>最多可添加五个附件，格式必须为 rar、zip，每个大小不超过200M.</p>
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
				str+="<option  value="+list[i].getStringValue("id")+">"+list[i].getStringValue("name")+"</option>";
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
	var project_sn=getURLparam('project_sn');
	var project_task_sn=getURLparam('project_task_sn');
	getMyProjectTaskList(project_sn);
	getProjectTask(project_task_sn);
	getIdAndNameBySn(project_task_sn);
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
		$("#ts_btn").click(function(){
			layer.open({
				type: 2,
				title: "选择服务商",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["800px" , "600px"],
				content: ["push_range.jsp","no"]
			});
		});
		$("#fh_btn").click(function(){
			window.location.href="project_implement.jsp?project_sn="+project_sn;
		});
		$("#tj_btn").click(function(){
			var xco=new XCO();
			xco.setStringValue("task_name",$("#task_name").val());//任务名称
			xco.setStringValue("task_type",$("#task_type").find("option:selected").text());
			xco.setIntegerValue("task_cycle",$("#cycle").val());
			xco.setStringValue("cycle_unit",$("#cycle_unit_name").val());
			xco.setStringValue("cycle_unit_name",$("#cycle_unit_name").find("option:selected").text());
			xco.setIntegerValue("proposed_amount",parseInt($("#budget_amount").val())*100);
			xco.setIntegerValue("real_amount",parseInt($("#budget_amount").val())*100);
			xco.setIntegerValue("reward_type",1);
			xco.setStringValue("task_province",$("#proj_province").find("option:selected").text());
			xco.setStringValue("task_province_code",$("#proj_province").val());
			xco.setStringValue("task_city",$("#proj_city").find("option:selected").text());
			xco.setStringValue("task_city_code",$("#proj_city").val());
			xco.setStringValue("task_area",$("#proj_area").find("option:selected").text());
			xco.setStringValue("task_area_code",$("#proj_area").val());
			xco.setStringValue("task_addr",$("#task_addr").val());
			xco.setStringValue("task_desc",$("#task_desc").val());
			xco.setStringValue("providers",$("#fws_id").val());
			xco.setStringValue("project_task_sn",project_task_sn);
			
			xco.setXCOListValue("urlList", getArray());

			var options = {
				url : "/project-operate/updateProjectTaskP69.xco",
				data : xco,
				success : updateProjectTaskCallBack
			};
			jConfirm("确认提交该任务吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
				
			});
			
		});
	});
	
	function updateProjectTaskCallBack(data){
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			jAlert("编辑成功","提示",function(r){
				window.location.href="project_implement.jsp?project_sn="+project_sn;
			});
		}
	}
	//获取我的任务列表
	function getMyProjectTaskList(_project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", _project_sn);
		var options = {
			url : "/tvr-project/getProject1.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}

	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			$("#project_sn").text(data.getStringValue("project_sn"));
			$("#employer_name").text(data.getStringValue("employer_name"));
			$("#project_name").text(data.getStringValue("project_name"));
		}
	}

	function getProjectTask(_project_task_sn) {
		var xco = new XCO();
		xco.setStringValue("project_task_sn", _project_task_sn);
		var options = {
			url : "/tvr-project/getProjectTask2.xco",
			data : xco,
			success : getProjectTaskCallBack
		};
		$.doXcoRequest(options);
	}

	function getProjectTaskCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var task = data.getXCOValue("task");//任务详情表
			var resources = data.getXCOListValue("resources");//附件表

			$("#task_name").val(task.getStringValue("task_name"));
			//$("#adviser_name").val(task.getStringValue("adviser_name"));//服务商
			//$("#project_catg").val(task.getStringValue("task_type"));//行业分类
			$("#project_catg").find("option[text='"+task.getStringValue("task_type")+"']").attr("selected",true); 
			$("#cycle").val(task.getIntegerValue("task_cycle"));//任务周期
			$("#cycle_unit_name").val(task.getStringValue("cycle_unit_name"));//任务周期类型
			$("#budget_amount").val(parseInt(task.getIntegerValue("proposed_amount")) / 100);//任务预算
			selectoption.init("budget_type","budget_type",task.getStringValue("reward_type"));//任务预算类型
			province_city_area.init(task.getStringValue("task_province_code"),task.getStringValue("task_city_code"),task.getStringValue("task_area_code"));
			$("#task_addr").val(task.getStringValue("task_addr"));//详情
			$("#task_desc").text(task.getStringValue("task_desc"));
			
			//渲染任务类型
			//queryRenderlist(task.getStringValue("task_type"));
			
			var fjHtml = '';

			if (resources != null || undefined != resources) {//任务附件
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 2) {//任务需求附件
						var title=resources[i].getStringValue("title");
						var url=resources[i].getStringValue("url");
						var xco2 = new XCO();
						xco2.setStringValue("title", title);
						xco2.setStringValue("url", url);
						xco2.setIntegerValue("currentIndex", fileIndex);
						array.push(xco2);
						$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> </li>");
						fileIndex++;
					}
				}
			}

		}
	}
	function getIdAndNameBySn(_project_task_sn){
		var xco=new XCO();
		xco.setStringValue("project_task_sn",_project_task_sn);
		
		var options = {
			url : "/tvr-project/getIdAndNameBySn.xco",
			data : xco,
			success : getIdAndNameBySnCallBack
		};
		$.doXcoRequest(options);
	}
	
	function getIdAndNameBySnCallBack(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var providers=data.getXCOListValue("userlist");
			var provider_name='';
			var provider_id='';
			for(var i=0;i<providers.length;i++){
				provider_id+=providers[i].getStringValue("user_id");
				provider_id+=',';
				provider_name+=providers[i].getStringValue("nick_name");
				provider_name+='、';
			}
			$("#fws_name").val(provider_name.substring(0, provider_name.length - 1));
			$("#fws_id").val(provider_id.substring(0, provider_id.length - 1));
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
				});
				xco1.setStringValue("title", results[i].get("filename"));
				xco1.setStringValue("url", results[i].get("url"));
				xco1.setIntegerValue("currentIndex", currentIndex);
				array.push(xco1);
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
	$("#add_file").append(btn);
}
	
</script>
</html>
