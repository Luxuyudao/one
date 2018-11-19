<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务提交</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
<%@ include file="left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="project_list">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i><a href="http://provider.demo1.com/index.jsp">服务商中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>任务提交</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>任务提交</h1>
				</div>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>任务名称</label> <span id="task_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>项目顾问</label> <span id="adviser_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>任务周期</label> <span id="cycle"></span>
								</div>
	
								<div class="form-group mar-t-15">
									<label>任务酬劳</label> <span id="real_amount"></span><span>元</span>
								</div>
								<div class="form-group mar-t-15">
									<label>任务类型</label> <span id="task_type"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>实施地址</label> <span id="address"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>任务要求</label> <span id="task_desc"></span>
								</div>
								<div class="form-group overhidden">
					                <label class="mar-t-15 pull-left">任务附件</label>
					                <div class=" overhidden formwrapper1">
					                  <ul class="wid310 unstyled" id="resources1">
					                  
					                  </ul>
					                </div>
					            </div>
					            
							</form>
						</div>
					</div>
					<div class="box border mt20">
		              <div class="box-title">
		                <h4><i class="fa fa-table"></i>任务进度</h4>
		                <div class="tools"> <a href="#box-config" data-toggle="modal" class="config"> <i class="fa fa-cog"></i> </a> <a href="javascript:;" class="reload"> <i class="fa fa-refresh"></i> </a> <a href="javascript:;" class="collapse"> <i class="fa fa-chevron-up"></i> </a> <a href="javascript:;" class="remove"> <i class="fa fa-times"></i> </a> </div>
		              </div>
		              <div class="box-body" >
		                <table class="table bord1dd">
		                  <thead>
		                    <tr>
		                      <th width="14%">日报编号</th>
		                      <th width="25%">日期</th>
		                      <th width="35%">完成内容</th>
		                      <th width="13%">任务进度</th>
		                      <th width="8%">操作</th>
		                    </tr>
		                  </thead>
		                  <tbody id="table_log_content">
		                    
		                  </tbody>
		                </table>
		                <jsp:include page="page.jsp"></jsp:include>
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
				                	<a class="btn-upload" href="javascript:void(0)">添加附件</a>
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
							<iframe name="hidden_frame" id="hidden_frame"
								style="display: none;"></iframe>					            
		             	</div>
		            </div>
							
				<div class="tc mar-t-20">

					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button" disabled="disabled">提交</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript :history.back(-1);">关闭</button>
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
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
	var array = new Array();
	$(document).ready(function() {
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
		$("#tj_btn").click(function() {
			var xco = new XCO();
			xco.setStringValue("project_task_sn",getURLparam("project_task_sn"));
			xco.setXCOListValue("urlList", getArray());
			var options = {
				url : "/project-operate/updateTaskP27.xco",
				data : xco,
				success : getUpdateTaskCallBack
			};
			jConfirm("确认提交该任务吗？","确认框",function(r){
				if(r){
					$.doXcoRequest(options);
				}
			});
		});
	});

	function getUpdateTaskCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			jAlert("任务提交成功！","成功提示", function(r) {
			window.location.href="project_list.jsp";
		});
		}
	}
	getProjectTask(0,globle_page_size);
	function getProjectTask(_start,_pageSize) {
		var xco = new XCO();
		xco.setStringValue("project_task_sn", getURLparam("project_task_sn"));
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		var options = {
			url : "/tvr-project/getProjectTask4.xco",
			data : xco,
			success : getProjectTaskCallBack
		};
		$.doXcoRequest(options);
	}
	var renderPage = true;
	function getProjectTaskCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			var task = data.getXCOValue("task");//任务详情表
			var resources = data.getXCOListValue("resources");//附件表
			var total = data.getIntegerValue("total");
			var reports = data.getXCOListValue("reports");
			
			if(task.getIntegerValue('task_progress')!=100){
				$("#tj_btn").attr("disabled",true);
			}else{
				$("#tj_btn").attr("disabled",false);
			}
			
			$("#task_name").text(task.getStringValue("task_name"));// 任务名称
			$("#adviser_name").text(task.getStringValue("adviser_name"));//任务顾问
			$("#cycle").text(
					task.getIntegerValue("task_cycle")
							+ task.getStringValue("cycle_unit_name"));//任务周期
			$("#task_type").text(task.getStringValue("task_type"));//任务类型
			$("#real_amount").text(
					parseInt(task.getStringValue("real_amount")) / 100 + "元");//任务酬劳
			$("#address").text(
					task.getStringValue("task_province")
							+ task.getStringValue("task_city")
							+ task.getStringValue("task_area")
							+ task.getStringValue("task_addr"));//实施地址
			$("#task_desc").text(task.getStringValue("task_desc"));//任务要求
			var fjHtml = '';
			if (resources == null || undefined == resources) {//任务附件
				$("#resources1").append(getResourcesNull(fjHtml));
			} else {
				for ( var i = 0; i < resources.length; i++) {
					if (resources[i].getIntegerValue("type") == 2) {//任务需求附件
						fjHtml = getResources2(fjHtml, resources[i]);
					}
					if (resources[i].getIntegerValue("type") == 8) {//验收附件
						var title=resources[i].getStringValue("title");
						var url=resources[i].getStringValue("url");
						var xco2 = new XCO();
						xco2.setStringValue("title", title);
						xco2.setStringValue("url", url);
						xco2.setStringValue("currentIndex", fileIndex);
						array.push(xco2);
						$("#files").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+title+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a style=\"display:none;\" href=\"javascript:upload_files("+fileIndex+")\"  class=\"fr\">上传</a></li>");
						fileIndex++;
					}
				}
				if (fjHtml == null || fjHtml == '') {
					fjHtml = getResourcesNull(fjHtml);
				}
				$("#resources1").append(fjHtml);
			}
			
			
			var keyOptions = [
					'task_report_id',//日志编号
					function(item) {
						return dataFormat("yyyy-MM-dd hh:mm:ss", item
								.get("create_time"));
					}, 'report_desc',//内容
					function(item) {//任务进度
						return item.get('progress') + '%';
					}, function(item) {
				return checkUrl(item.get('task_report_id'));
			} ];

			renderTable("#table_log_content", reports, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),getProjectTask, globle_page_size);
			}
			
			
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

	function checkUrl(task_report_id){
		return '<a href="javascript:void(0);" onclick="tanchuang('+task_report_id+')">详情</a>';
	}
	function checkAstate(state){
		if(state == 1){
			return "审核不通过";
		}else{
			return "审核通过";
		}
	}
	function tanchuang(task_report_id){
		layer.open({
			type: 2,
			title: "日报详情",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["800px" , "550px"],
			content: ['project_report_case.jsp?task_report_id='+task_report_id]
		});
	}
</script>
</html>
