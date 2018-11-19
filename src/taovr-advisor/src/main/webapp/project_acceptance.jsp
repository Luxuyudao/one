<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>项目验收</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix"data-page="advisorcenter" sub-page="projectlist">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="http://advisor.demo1.com/index.jsp">顾问中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li>项目验收</li>
			</ul>
			<!--.breadcrumb-->

		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>项目详情</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>项目编号</label> <span id="project_sn"></span>
								</div>
	
								<div class="form-group mar-t-15">
									<label>项目名称</label> <span id="project_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目甲方</label> <span id="employer_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目乙方</label> <span>北京汇生活网络科技有限公司</span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目周期</label> <span id="project_cycle"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目预算</label> <span id="real_amount"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>行业分类</label> <span id="project_catg_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label class="div-inline">需求描述</label>
									<p class="wid310 div-inline" id="project_desc"></p>
								</div>
								<div class="form-group overhidden">
					                <label class="mar-t-15 pull-left">项目附件</label>
					                <div class=" overhidden formwrapper1">
					                  <ul class="wid310 unstyled" id="resources1">
					                  
					                  </ul>
					                </div>
					            </div>
							</form>
							<div class="box border">
				              <div class="box-title">
				                <h4><i class="fa fa-table"></i>项目合约</h4>
				              </div>
				              <div class="form-inline bord1dd form-add1" id="project_content">
				                <a class="ml15" href="#" id="heyueUrl" target="_blank"></a><a href="#" class="ml15" id="downloadUrl" target="_blank">下载</a>
				              </div>
				            </div>
						</div>
					</div>
					<div class="box border mt20">
		              <div class="box-title">
		                <h4><i class="fa fa-table"></i>项目进度</h4>
		                <div class="tools"> <a href="#box-config" data-toggle="modal" class="config"> <i class="fa fa-cog"></i> </a> <a href="javascript:;" class="reload"> <i class="fa fa-refresh"></i> </a> <a href="javascript:;" class="collapse"> <i class="fa fa-chevron-up"></i> </a> <a href="javascript:;" class="remove"> <i class="fa fa-times"></i> </a> </div>
		              </div>
		              <div class="box-body" >
		                <table id="task_table" class="table bord1dd">
		                  <thead>
		                    <tr>
		                      <th width="14%">任务编号</th>
		                      <th width="50%">任务名称</th>
		                      <th width="15%">任务状态</th>
		                      <th width="13%">任务进度</th>
		                      <th width="8%">操作</th>
		                    </tr>
		                  </thead>
		                  <tbody id="table_task_content">
		                    
		                  </tbody>
		                </table>
		              </div>
		            </div>
		            <div class="box border">
		              	<div class="box-title">
		                	<h4><i class="fa fa-table"></i>验收结果</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14" id="yanshou_result">
		              	
		             	</div>
		            </div>
		            <div class="box border mt20">
		              	<div class="box-title">
		                	<h4><i class="fa fa-table"></i>本次验收</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14">
		              		<div class="form-group overhidden">
								<form id="form1" action="uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
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
							<iframe name="hidden_frame" id="hidden_frame"
								style="display: none;"></iframe>
		             	</div>
		            </div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button" disabled="disabled">提交</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript :back();">返回</button>
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


	var project_sn = getURLparam("project_sn");
	getMyProjectTaskList(project_sn);
	var array = new Array();
	$(document).ready(function() {
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
		$("#tj_btn").click(function() {
			var xco = new XCO();
			xco.setStringValue("project_sn", $("#project_sn").text());
			xco.setXCOListValue("urlList", getArray());

			var options = {
				url : "/project-operate/updateProjectP48.xco",
				data : xco,
				success : getInsertProject
			};
			jConfirm("确认验收此项目吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
	});

	function getInsertProject(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			jAlert("验收成功","提示",function(r){
				window.location.href="project_list.jsp";
			});
		}
	}
	//获取我的任务列表
	function getMyProjectTaskList(project_sn) {
		var xco = new XCO();
		xco.setStringValue("project_sn", project_sn);
		var options = {
			url : "/tvr-project/getProject4.xco",
			data : xco,
			success : getMyProjectTaskListCallBack
		};
		$.doXcoRequest(options);
	}
	var isprogress100=0;
	function getMyProjectTaskListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var project = data.getXCOValue("project");
			var resources = data.getXCOListValue("resources");
			var tasks = data.getXCOListValue("tasks");
			$("#project_sn").text(project.getStringValue("project_sn"));
			$("#employer_name").text(project.getStringValue("employer_name"));
			$("#project_name").text(project.getStringValue("project_name"));
			$("#project_cycle").text(project.getStringValue("project_cycle"));
			$("#real_amount").text(project.getStringValue("real_amount"));
			$("#project_catg_name").text(project.getStringValue("project_catg_name"));
			$("#project_desc").text(project.getStringValue("project_desc"));
			$("#heyueUrl").text(project.getStringValue("contract"));
			$("#downloadUrl").attr("href",project.getStringValue("contract_url"));
			var fjHtml = '';
 			if(resources==null||undefined==resources){
				$("#resources1").append(getResourcesNull(fjHtml));
			}else{
				for(var i=0; i<resources.length; i++){
					if(resources[i].getIntegerValue("type")==1){//项目需求附件
						fjHtml = getResources2(fjHtml,resources[i]);
					}	
					if (resources[i].getIntegerValue("type") == 9) {//任务需求附件
						var title=resources[i].getStringValue("title");
						var url=resources[i].getStringValue("url");
						var xco2 = new XCO();
						xco2.setStringValue("title", title);
						xco2.setStringValue("url", url);
						xco2.setIntegerValue("currentIndex", fileIndex);
						array.push(xco2);
						$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a style=\"display:none;\" href=\"javascript:upload_files("+fileIndex+")\"  class=\"fr\">上传</a></li>");
						fileIndex++;
					}
				}
				if(fjHtml==null||fjHtml==''){
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}	

			var keyOptions1 = [ 'project_task_sn',//任务编号
			'task_name',//任务名称
			function(item) {//任务状态
				if((item.get('task_progress')!=100&&item.get('task_ctrl_state')==1)||(item.get('task_state')<60&&item.get('task_ctrl_state')==1)){
					isprogress100++;
				}
				if(isprogress100==0){
					$("#tj_btn").attr("disabled",false);
				}else{
					$("#tj_btn").attr("disabled",true);
				}
				return getTaskCtrlState(item.get("task_ctrl_state"),item.get("task_state"),item.get("task_notpass_mark"));
			}, function(item) {//任务进度
				return item.get('task_progress')+'%';
			},
			function(item) {//操作
				var aHtml = '';
				aHtml += '<a href="task_details.jsp?project_task_sn='+item.get("project_task_sn")+'">详情</a>';
				return aHtml;
			}, ];
			
			renderTable("#table_task_content", tasks, keyOptions1);
			
			//渲染 验收
			var applies=data.getXCOListValue("applies");
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
