<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>新增日报</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/header11.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/libs/css/style11.css">
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

.margin {
	margin-left: 145px;
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

	<div id="main-content" class="clearfix">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="form-inline bord1dd form-add1">
					<div class="form-group">
						<label>*工作日期</label> <span id="time"></span>
					</div>
					<div class="form-group mar-t-15">
						<label>*已完成进度</label> <select class="form-control w60"
							id="progress_state">
							<option value="0">未选择</option>
							<option value="10">10%</option>
							<option value="20">20%</option>
							<option value="30">30%</option>
							<option value="40">40%</option>
							<option value="50">50%</option>
							<option value="60">60%</option>
							<option value="70">70%</option>
							<option value="80">80%</option>
							<option value="90">90%</option>
							<option value="100">100%</option>
						</select>
					</div>
					<div class="form-group">
						<label class="mar-t-15">*完成内容</label>
						<textarea id="desc" class="form-control  mar-t-15 wid310" rows="4"></textarea>
					</div>
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


				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">提交</button>

					<button type="button" class="btn btn-submit" data-toggle="button" onclick="closeWin();">关闭</button>
				</div>
			</div>
		</div>
	</div>
<script src="http://file.demo1.com/js/jquery-1.11.1.min.js"></script>
<script src="http://file.demo1.com/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://file.demo1.com/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery.sparkline.min.js"></script>
<!-- ace scripts -->
<script src="http://file.demo1.com/js/ace-elements.min.js"></script>
<script src="http://file.demo1.com/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
<script src="http://file.demo1.com/jalert/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="http://file.demo1.com/jalert/jquery.alerts.js" type="text/javascript"></script>
</body>
<script type="text/javascript" src="http://file.demo1.com/js/xco3.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jquery-xco.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/taovr.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/public.js"></script>
<script type="text/javascript" src="http://file.demo1.com/layer/layer.js"></script>
<script type="text/javascript" src="http://file.demo1.com/js/jqPaginator.js"></script>
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
	var mydate = new Date();
	var t = mydate.toLocaleDateString();
	var array = new Array();
	var project_sn = getURLparam("project_sn");
	var project_task_sn = getURLparam("project_task_sn");
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
		
		$("#time").text(t);
		$("#tj_btn").click(function() {
			var xco = new XCO();
			xco.setStringValue("project_sn",project_sn);
			xco.setStringValue("project_task_sn",project_task_sn);
			xco.setIntegerValue("progress",parseInt($("#progress_state").val()));
			xco.setStringValue("report_desc",$("#desc").val());
			xco.setXCOListValue("urlList", getArray());
			var options = {
				url : "/project-operate/insertTaskReportP29.xco",
				data : xco,
				success : getInsertTaskReportCallBack
			};
			$.doXcoRequest(options);
		});
	});

	function getInsertTaskReportCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data.getMessage(),"错误提示");
		} else {
			jAlert("提交成功！！", "成功提示", function(r) {
				parent.window.location.reload();
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
				parent.layer.close(index);
			});

		}
	}
	
	function closeWin(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
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
				})
				xco1.setStringValue("title", results[i].get("filename"));
				xco1.setStringValue("url", results[i].get("url"));
				xco1.setIntegerValue("currentIndex", currentIndex);
				array.push(xco1);
			}
			jAlert("上传成功！","提示");
		}
	}
	//添加附件
	function addimg() {
		var btn = '';
		btn += '<div class="form-group mar-t-15">';
		btn += '<label></label>';
		btn += '<input id="file" type="file" name="file1">';
		btn += '<a name="rmlink"><i class="icon-trash" style="padding-bottom:5px;"></i></a>';
		btn += '</div>';
		$("#add_file").append(btn);
	}
</script>
</html>
