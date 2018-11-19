<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String pageName = "角色列表";
%>
<head>
<meta charset="utf-8" />
<title>系统角色</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>
</head>
<body>
	<div id="main-content" class="clearfix">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
                <li><i class="icon-home"></i> <a href="#">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
                <li><a href="#">系统管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
                <li><a href="#">角色管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
                <li><a href="#">角色权限分配</a><span class="divider"></span></li>
            </ul><!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>角色权限管理</h1>
			</div>
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS HERE -->
                <div class="row-fluid mar-t-15">
                    <div class="well well-small">
                        <div class="mar-r-15 dis-i-b">
                        	 角色名称：<span id="role_name">---</span>
                        </div>
                    </div>
                </div>
				<div class="row-fluid">
                    <div class="row-fluid mar-t-15">
                        <div class="span12">
                            <span class="dis-i-b mar-b-20">角色权限</span>
                            <table id="table_bug_report" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>模块</th>
                                    <th>功能</th>
                                </tr>
                                </thead>
                                <tbody id="content">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
	<!-- PAGE CONTENT BEGINS HERE -->
	<div>
        <div>
          <div class="tc" style="margin-top:20px;">             
            <button type="button" class="btn btn-submit" data-toggle="button" id="ok"><i class=" icon-ok mr10"></i>提交</button>
            <button type="button" class="btn btn-submit" data-toggle="button" id="back"><i class=" icon-undo mr10"></i>返回</button>
          </div>
        </div>
    </div>
    <div style="margin-top:50px;">
        
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		$("#back").click(function(){
			window.location.href="/view/role/rolelist.jsp";
		});
		//确定
		$("#ok").click(function(){
			var xco = new XCO();
			xco.setStringValue("role_id", getURLparam("role_id"));//getURLparam("role_id")
			var flag = '';
			var count=0;
			$('input:checkbox').each(function (index, domEle) {
				if($(domEle).prop("checked")){
					count++;
					if($(domEle).attr("data-fid").substring(0,2) === 'tr'){
						flag +=$(domEle).attr("data-fid").substring(2)+",";
					}else{
						flag +=$(domEle).attr("data-fid")+",";
					}
					flag +=$(domEle).val()+",";
				}
			});
			flag = filterRepeatStr(flag);
			if(count == 0){
				tvrAlert("请选择权限！！！");
				return;
			}else{
				xco.setStringValue("flag",flag);
			}
			var url='';
			url="/tvr-system/saveOpt.xco";
			var options ={
				url:url,
				data:xco,
				success: function(data){
					if (data.getCode() != 0) {
						tvrAlert('doCallBack error:\n' + data);
					} else {
						tvrAlert("保存权限成功!!");
						window.location.href="/view/role/rolelist.jsp";
					}
				}
			};
			$.doXcoRequest(options);
		});
	});
	
	selectOpt();
	
	function selectOpt(){
		var xco=new XCO();
		xco.setIntegerValue("role_id", getURLparam("role_id"));
		var url="/tvr-system/findRoleModelList.xco";
			var options ={
				url:url,
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);	
	};
	
	function manage(xco){
		if (xco.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + xco);
		} else {
			var role=xco.getXCOListValue("role");
			if(role){
				$("#role_name").html(role.getObjectValue("role_name"));
			}
			
			$("#content").html("");
			var modelist=xco.getXCOListValue("modelist");
			var modelist2=xco.getXCOListValue("modelist2");
			var modelist3=xco.getXCOListValue("modelist3");
			var str = '';
			var arr = new Array();
			if(modelist){
				for(var i=0,j=modelist.length;i<j;i++){
					var model_id = 'tr'+modelist[i].getObjectValue("module_id");
					str +='<tr id='+model_id+'>'
						+'<td rowspan='+modelist[i].getObjectValue("count")+'  class=\"var-align\">'+modelist[i].getObjectValue("module_name")+'</td>';
					if(modelist2){
						for(var m=0,n=modelist2.length;m<n;m++){
							if(modelist2[m].getObjectValue("f_id") == modelist[i].getObjectValue("module_id")){
								var tid = 'td'+modelist2[m].getObjectValue("module_id");
								arr.push(modelist2[m].getObjectValue("module_id"));
								str += '<td><label>'+modelist2[m].getObjectValue("module_name")+'<input type=\"checkbox\" id='+tid+' data-fid='+model_id+' value='+modelist2[m].getObjectValue("module_id")+'>'
										+'<span class=\"lbl center\"  style=\"margin-top: -4px;margin-left: 15px;\"></span></label>'
										+'</td>';
								break;
							}
						}
					
					}
					str+='</tr>';
				}
			}
			$("#content").html(str);
			for(var a=0,b=modelist2.length;a<b;a++){
				var strtr = '';
				var num = modelist2[a].getObjectValue("module_id");
				if(!(arr.indexOf(num) > -1)){
					var ttid = 'td'+modelist2[a].getObjectValue("module_id");
					strtr += '<tr><td><label>'+modelist2[a].getObjectValue("module_name")+'<input type=\"checkbox\" id='+ttid+' data-fid='+modelist2[a].getObjectValue("f_id")+'  value='+modelist2[a].getObjectValue("module_id")+'>'
										+'<span class=\"lbl center\"  style=\"margin-top: -4px;margin-left: 15px;\"></span></label>'
										+'</td></tr>';
					$("#tr"+modelist2[a].getObjectValue("f_id")).after(strtr);
				}
			}
			
			//选择
			if(modelist3){
				for(var aa=0;aa<modelist3.length;aa++){
					$("#td"+modelist3[aa].getObjectValue("module_id")).attr("checked","checked"); 
				}
			}
		}
	}
	
	function filterRepeatStr(str){
		var ar2 = str.split(",");
		var array = new Array();
		var j=0
		for(var i=0;i<ar2.length;i++){ 
			if((array == "" || array.toString().match(new RegExp(ar2[i],"g")) == null)&&ar2[i]!=""){ 
				array[j] =ar2[i]; 
				array.sort(function(a,b){return a-b});
				j++;
			}
		}
		return array.toString();
	}
</script>
</html>