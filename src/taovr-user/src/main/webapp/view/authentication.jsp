<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>实名认证</title>
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
				<li><i class="icon-home"></i> <a href="http://user.demo1.com/view/personal_information.jsp">账户设置</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li><a href="http://user.demo1.com/view/account_security.jsp">账户安全</a><span class="divider"><i
						class="icon-angle-right"></i> </span></li>
				<li>实名认证</li>
			</ul>
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>实名认证</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
				<div class="row-fluid mar-t-15">
					<div class="span12">
						<div class="tabbable">
							<ul id="tab_ul"
								class="nav nav-tabs padding-12 tab-color-blue background-blue">
								<li class="active"><a data-toggle="tab" href="#ge_ren">个人认证</a>
								</li>

								<li class=""><a data-toggle="tab" href="#qi_ye">企业认证</a>
								</li>
							</ul>

							<div class="tab-content form-inline form-add1">
								<div id="ge_ren" class="tab-pane active">
									<div class="form-group">
										<label class="mar-t-15">真实姓名</label> <input id="cert_name"
											type="text" class="form-control  mar-t-15 wid310"
											placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">证件号码</label> <input
											id="cert_number" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group overhidden">
										<form id="form1" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
							                <label class="mar-t-15 pull-left">上传证件</label>
							             
							                <div class=" overhidden formwrapper1">
							                  	  <a id="btn-upload1" class="btn-upload" href="javascript:void(0)">上传手持身份证照片</a>
							                	  <input class="inp-upload" type="file" id="file_up1" name="file1" onchange="fileChange(1);"/>
								                  <ul class="wid310 unstyled" id="files1">
								                  	<!-- 
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                  	 -->
								                  </ul>
								                 
							                </div>
						                 </form>
						              </div>
									  <div class="form-group overhidden">
										<form id="form2" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
							                <label class=" pull-left"></label>
							             
							                <div class=" overhidden formwrapper1">
							                  	  <a id="btn-upload2" class="btn-upload" href="javascript:void(0)">上传身份证背面照片</a>
							                	  <input class="inp-upload" type="file" id="file_up2" name="file1" onchange="fileChange(2);"/>
								                  <ul class="wid310 unstyled" id="files2">
								                  	<!-- 
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                  	 -->
								                  </ul>
								                 
							                </div>
						                 </form>
						              </div>
								</div>

								<div id="qi_ye" class="tab-pane">
									<div class="form-group">
										<label class="mar-t-15">公司全称</label> <input id="cert_name1" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">营业执照注册号</label> <input id="cert_number1" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">法定代表人</label> <input id="co_leal_person" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">联系人名</label> <input id="co_contact_name" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">联系电话</label> <input id="co_contact_phone" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司网址</label> <input id="co_web" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司邮箱</label> <input id="co_email" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司电话</label> <input id="co_phone" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group">
										<label class="mar-t-15">公司地址</label> <select
											class="form-control mar-t-15 wid107" id="proj_province">
										</select> <select class="form-control mar-t-15 wid107"
											id="proj_city">
										</select> <select class="form-control mar-t-15 wid107"
											id="proj_area">
										</select>
									</div>
									<div class="form-group">
										<label class="mar-t-15"></label> <input id="addr" type="text"
											class="form-control  mar-t-15 wid310" placeholder="">
									</div>
									<div class="form-group overhidden">
										<form id="form3" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
							                <label class="mar-t-15 pull-left">上传联系人证件</label>
							             
							                <div class=" overhidden formwrapper1">
							                  	  <a id="btn-upload3" class="btn-upload" href="javascript:void(0)">上传手持身份证照片</a>
							                	  <input class="inp-upload" type="file" id="file_up3" name="file1" onchange="fileChange(3);"/>
								                  <ul class="wid310 unstyled" id="files3">
								                  	<!-- 
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                  	 -->
								                  </ul>
								                 
							                </div>
						                 </form>
						              </div>
									  <div class="form-group overhidden">
										<form id="form4" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
							                <label class=" pull-left"></label>
							             
							                <div class=" overhidden formwrapper1">
							                  	  <a id="btn-upload4" class="btn-upload" href="javascript:void(0)">上传身份证背面照片</a>
							                	  <input class="inp-upload" type="file" id="file_up4" name="file1" onchange="fileChange(4);"/>
								                  <ul class="wid310 unstyled" id="files4">
								                  	<!-- 
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                  	 -->
								                  </ul>
								                 
							                </div>
						                 </form>
						              </div>
									<div class="form-group overhidden">
										<form id="form5" action="/uploadFile.xco" enctype="multipart/form-data" method="post" target="hidden_frame">
							                <label class="mar-t-15 pull-left">营业执照副本电子版</label>
							             
							                <div class=" overhidden formwrapper1">
							                  	  <a id="btn-upload5" class="btn-upload" href="javascript:void(0)">上传营业执照副本</a>
							                	  <input class="inp-upload" type="file" id="file_up5" name="file1" onchange="fileChange(5);"/>
								                  <ul class="wid310 unstyled" id="files5">
								                  	<!-- 
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                    <li class="overhidden mar-t-10"> <span class="fl">素材照片.jpg</span> <a href="#" class="fr">删除</a> </li>
								                  	 -->
								                  </ul>
								                 
							                </div>
						                 </form>
						              </div>
									<div class="form-group mar-t-15">
										<label></label> <span>*照片格式为JPG、PNG，小于5m</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tc mar-t-20">
					<button id="tj_btn" type="button" class="btn btn-submit"
						data-toggle="button">提交</button>
					<button type="button" class="btn btn-submit" data-toggle="button"
						onClick="javascript :back();">返回</button>
				</div>
			</div>
		</div>
	</div>
	<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>
</body>
<script type="text/javascript">
function back(){
	if(getURLparam("flag") == 1){
		window.location.href="joinapply.jsp";
	}else{
		window.location.href="account_security.jsp";
	}
	//history.go(-1);
}


var fileIndex = 0;
function fileChange(num){
	if(num==1){
		var file_name = $("#file_up1").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files1").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files1("+fileIndex+")\"  class=\"fr\">上传</a></li>");
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
		$("#files2").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files2("+fileIndex+")\"  class=\"fr\">上传</a></li>");
	}
	if(num==3){
		var file_name = $("#file_up3").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files3").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files3("+fileIndex+")\"  class=\"fr\">上传</a></li>");
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
		$("#files4").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files4("+fileIndex+")\"  class=\"fr\">上传</a></li>");
	}
	if(num==5){
		var file_name = $("#file_up5").val();
		if(file_name.indexOf("\\") > -1){
			file_name = file_name.substring(file_name.lastIndexOf("\\")+1,file_name.length);
		}
		if(file_name == ''){
			return;
		}
		if(isFilePhoto(file_name)==1){
			return;
		}
		$("#files5").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+file_name+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a> <a href=\"javascript:upload_files5("+fileIndex+")\"  class=\"fr\">上传</a></li>");
	}
	fileIndex++;
}

var currentIndex = 0;
var uploadType = 0;
function upload_files1(index){
	currentIndex = index;
	uploadType=1;//个人正面照
	$("#form1").submit();
	if($("#files1>li").length==1){
		$("#btn-upload1").hide();
	}
}

function upload_files2(index){
	currentIndex = index;
	uploadType=2;//个人反面照
	$("#form2").submit();
	if($("#files2>li").length==1){
		$("#btn-upload2").hide();
	}
	
}

function upload_files3(index){
	currentIndex = index;
	uploadType=3;//企业正面照
	$("#form3").submit();
	if($("#files3>li").length==1){
		$("#btn-upload3").hide();
	}
}

function upload_files4(index){
	currentIndex = index;
	uploadType=4;//企业反面照
	$("#form4").submit();
	if($("#files4>li").length==1){
		$("#btn-upload4").hide();
	}
}

function upload_files5(index){
	currentIndex = index;
	uploadType=5;//企业营业执照照
	$("#form5").submit();
	if($("#files5>li").length==1){
		$("#btn-upload5").hide();
	}
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
	if($("#files1>li").length<1){
		$("#btn-upload1").show();
	}
	if($("#files2>li").length<1){
		$("#btn-upload2").show();
	}
	if($("#files3>li").length<1){
		$("#btn-upload3").show();
	}
	if($("#files4>li").length<1){
		$("#btn-upload4").show();
	}
	if($("#files5>li").length<1){
		$("#btn-upload5").show();
	}
	document.getElementById("form1").reset();
	document.getElementById("form2").reset();
	document.getElementById("form3").reset();
	document.getElementById("form4").reset();
	document.getElementById("form5").reset();
}





var array=new Array();//身份证正面
var userid=getURLparam("userid");
var type=getURLparam("type");
if(type==null){
	province_city_area.init();
}
var user_cert_id='';
var phone='';
	function getUser() {
		var xco = new XCO();
		xco.setLongValue("userid", userid);

		var options = {
			url : "/tvr-user/getUser.xco",
			data : xco,
			success : getUserCallBack
		};
		$.doXcoRequest(options);

	}
	function getUserCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			phone=data.getStringValue("mobile_phone");
			if(type!=null){
				getUserlist(phone);
			}
		}
		
	}
	getUser();
	function getUserlist(_phone){
		var xco = new XCO();
		xco.setStringValue("phone", _phone);
		xco.setIntegerValue("start", 0);
		xco.setIntegerValue("pageSize", 10);
		var options = {
			url : "/tvr-user/getUserlistu13.xco",
			data : xco,
			success : getUserlistCallBack
		};
		$.doXcoRequest(options);
	}
	
	function getUserlistCallBack(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var datas=data.getXCOListValue("data");
			user_cert_id=datas[0].getLongValue("user_cert_id");
			if(type==1){
				$("#cert_name").val(datas[0].getStringValue("cert_name"));
				$("#cert_number").val(datas[0].getStringValue("cert_number"));
				var pip_url = datas[0].getStringValue("pip_url");
				pip_url = pip_url.substring(pip_url.lastIndexOf("/")+1,pip_url.length);
				$("#files1").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+pip_url+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a></li>");
				var xco1 = new XCO();
				xco1.setStringValue("url", datas[0].getStringValue("pip_url"));
				xco1.setIntegerValue("currentIndex", fileIndex);
				xco1.setIntegerValue("uploadType", 1);
				array.push(xco1);
				
				fileIndex++;
				
				var nip_url = datas[0].getStringValue("nip_url");
				nip_url = nip_url.substring(nip_url.lastIndexOf("/")+1,nip_url.length);
				$("#files2").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+nip_url+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a></li>");
				var xco2 = new XCO();
				xco2.setStringValue("url", datas[0].getStringValue("nip_url"));
				xco2.setIntegerValue("currentIndex", fileIndex);
				xco2.setIntegerValue("uploadType", 2);
				array.push(xco2);
				$("#btn-upload1").hide();
				$("#btn-upload2").hide();
			}
			if(type==2){
				$("#cert_name1").val(datas[0].getStringValue("cert_name"));
				$("#cert_number1").val(datas[0].getStringValue("cert_number"));
				$("#co_phone").val(datas[0].getStringValue("co_phone"));
				$("#co_leal_person").val(datas[0].getStringValue("co_leal_person"));
				$("#co_contact_name").val(datas[0].getStringValue("co_contact_name"));
				$("#co_contact_phone").val(datas[0].getStringValue("co_contact_phone"));
				$("#co_web").val(datas[0].getStringValue("co_web"));
				$("#co_email").val(datas[0].getStringValue("co_email"));
				$("#addr").val(datas[0].getStringValue("addr"));
				province_city_area.init(datas[0].getStringValue("province_code"),datas[0].getStringValue("city_code"),datas[0].getStringValue("area_code"));
				
				var pip_url = datas[0].getStringValue("pip_url");
				pip_url = pip_url.substring(pip_url.lastIndexOf("/")+1,pip_url.length);
				$("#files3").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+pip_url+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a></li>");
				var xco3 = new XCO();
				xco3.setStringValue("url", datas[0].getStringValue("pip_url"));
				xco3.setIntegerValue("currentIndex", fileIndex);
				xco3.setIntegerValue("uploadType", 3);
				array.push(xco3);
				$("#btn-upload3").hide();
				fileIndex++;
				
				var nip_url = datas[0].getStringValue("nip_url");
				nip_url = nip_url.substring(nip_url.lastIndexOf("/")+1,nip_url.length);
				$("#files4").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+nip_url+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a></li>");
				var xco4 = new XCO();
				xco4.setStringValue("url", datas[0].getStringValue("nip_url"));
				xco4.setIntegerValue("currentIndex", fileIndex);
				xco4.setIntegerValue("uploadType", 4);
				array.push(xco4);
				$("#btn-upload4").hide();
				fileIndex++;
				
				var co_bus_url = datas[0].getStringValue("pip_url");
				co_bus_url = co_bus_url.substring(co_bus_url.lastIndexOf("/")+1,co_bus_url.length);
				$("#files5").append("<li class=\"overhidden mar-t-10\" id='file_"+fileIndex+"'> <span class=\"fl\">"+co_bus_url+"</span> <a style=\"margin-left:10px;\" href=\"javascript:del("+fileIndex+")\"  class=\"fr\">删除</a></li>");
				var xco5 = new XCO();
				xco5.setStringValue("url", datas[0].getStringValue("pip_url"));
				xco5.setIntegerValue("currentIndex", fileIndex);
				xco5.setIntegerValue("uploadType", 5);
				array.push(xco5);
				$("#btn-upload5").hide();
			}
		}
	}
$(document).ready(function(){
	$("#btn-upload1").on("click",function(){
		$(this).siblings("input").trigger("click");	
	});
	$("#btn-upload2").on("click",function(){
		$(this).siblings("input").trigger("click");	
	});
	$("#btn-upload3").on("click",function(){
		$(this).siblings("input").trigger("click");	
	});
	$("#btn-upload4").on("click",function(){
		$(this).siblings("input").trigger("click");	
	});
	$("#btn-upload5").on("click",function(){
		$(this).siblings("input").trigger("click");	
	});

	if(type==1){
		$("#ge_ren").attr('class','active').siblings().removeClass('active');
		$("#tab_ul").remove();
		$("#qi_ye").remove();
	}
	if(type==2){
		$("#qi_ye").attr('class','active').siblings().removeClass('active');
		$("#tab_ul").remove();
		$("#ge_ren").remove();
	}
	
});
$("#tj_btn").click(function(){
	var xco=new XCO();
	xco.setLongValue("user_id",userid);
	xco.setStringValue("mobile_phone",phone);
	if($("#ge_ren").is('.active')){//个人认证
		xco.setIntegerValue("cert_type",1);
		xco.setStringValue("cert_name",$("#cert_name").val());//姓名
		xco.setStringValue("cert_number",$("#cert_number").val());//身份证号
	}
	if($("#qi_ye").is('.active')){//企业认证
		xco.setIntegerValue("cert_type",2);
		xco.setStringValue("cert_name",$("#cert_name1").val());//公司名
		xco.setStringValue("cert_number",$("#cert_number1").val());//营业证号
		xco.setStringValue("co_phone",$("#co_phone").val());//公司电话
		xco.setStringValue("co_leal_person",$("#co_leal_person").val());//法定代表人
		xco.setStringValue("co_contact_name",$("#co_contact_name").val());//联系人姓名
		xco.setStringValue("co_contact_phone",$("#co_contact_phone").val());//联系人电话
		xco.setStringValue("co_web",$("#co_web").val());//公司网址
		xco.setStringValue("co_email",$("#co_email").val());//公司邮箱
		
		xco.setStringValue("province",$("#proj_province").find("option:selected").text());//省
		xco.setStringValue("province_code",$("#proj_province").val());//省编码
		xco.setStringValue("city",$("#proj_city").find("option:selected").text());//市
		xco.setStringValue("city_code",$("#proj_city").val());//市编码
		xco.setStringValue("area",$("#proj_area").find("option:selected").text());//区
		xco.setStringValue("area_code",$("#proj_area").val());//区编码
		xco.setStringValue("addr",$("#addr").val());//详细地址
	}
	for(var i=0;i<getArray().length;i++){
		var type_num = getArray()[i].getStringValue("uploadType")
		if(type_num==1){
			xco.setStringValue("pip_url",getArray()[i].getStringValue("url"));//正面图片路径
		}
		if(type_num==2){
			xco.setStringValue("nip_url",getArray()[i].getStringValue("url"));//反面图片路径
		}
		if(type_num==3){
			xco.setStringValue("pip_url",getArray()[i].getStringValue("url"));//正面图片路径
		}
		if(type_num==4){
			xco.setStringValue("nip_url",getArray()[i].getStringValue("url"));//反面图片路径
		}
		if(type_num==5){
			xco.setStringValue("co_bus_url",getArray()[i].getStringValue("url"));//营业执照
		}
	}
	var url = "";
	if(type==null){
		if($("#ge_ren").is('.active')){
			url = "/tvr-user/insertCert.xco";
		}else{
			url = "/tvr-user/insertCert2.xco";
		}
		var options = {
			url : url,
			data : xco,
			success : insertCertCallBack
		};
		jConfirm("确认提交认证审核吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
	}else{
		if($("#ge_ren").is('.active')){
			url = "/tvr-user/updateCert.xco";
		}else{
			url = "/tvr-user/updateCert2.xco";
		}
		xco.setIntegerValue("audit_state",20);
		xco.setLongValue("user_cert_id",user_cert_id);
		
		var options = {
			url : url,
			data : xco,
			success : updateCertCallBack
		};
		jConfirm("确认提交认证审核吗？","确认框",function(r){
			if(r){
				$.doXcoRequest(options);
			}
		});
	}
});

function insertCertCallBack(data){
	if (data.getCode() != 0) {
		tvrAlert('doCallBack error:\n' + data);
	} else {
		jAlert("提交成功","成功提示",function(r){
			if(getURLparam("flag") == 1){
				window.location.href="joinapply.jsp";
			}else{
				window.location.href="account_security.jsp";
			}
		});
		
	}
}

function updateCertCallBack(data){
	if (data.getCode() != 0) {
		tvrAlert('doCallBack error:\n' + data);
	} else {
		if(getURLparam("flag") == 1){
			window.location.href="joinapply.jsp";
		}else{
			window.location.href="account_security.jsp";
		}
	}
}

function uploadCallBack(data) {
	var xco = new XCO();
	xco.fromXML(data);
	if(0 == xco.getCode()){
		var results = xco.get("updateResult");
		for (i = 0; i < results.length; i++) {
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
			$("#files5 > li").each(function(j,o){
				if($(o).find("span").text() == results[i].get("filename")){
					$(o).find("a").eq(1).hide();
				}
			});
			xco1.setStringValue("url", results[i].get("url"));
			xco1.setIntegerValue("currentIndex", currentIndex);
			xco1.setIntegerValue("uploadType", uploadType);
			array.push(xco1);
		}
		jAlert("上传成功！","提示");
	} 
	
}

</script>
</html>
