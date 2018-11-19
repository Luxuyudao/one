<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
	String pageName = "用户列表";
%>
<head>
<meta charset="utf-8" />
<title>用户列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>

</head>

<body>
		<div id="main-content" class="clearfix" data-page="systemuser" sub-page="list">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="#">用户列表</a><span class="divider"></i>
					</span></li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>用户列表</h1>
				</div>
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">管理员名称</label> <input type="text"
									class="form-control" placeholder="" id="name">
							</div>
							
							<div class="fl mar-t-15">
								<label for="">状态</label> 
								<select class="form-control w160" id="state">
                                  <option value="">-请选择-</option>
                                  <option value="0">停用</option>
                                  <option value="1">启用</option>
                                </select>
							</div>
							
							<button type="button"
								class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
								data-toggle="button" id="search">查询</button>
						</div>
					</form>
					<div class="row-fluid">
						<div class="row-fluid mar-t-15">
							<div class="span12">
								<table id="table_bug_report"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th width="10%">编号</th>
											<th width="20%">管理员名称</th>
											<th width="30%">管理员描述</th>
											<th width="15%">状态</th>
											<th width="25%">操作</th>
										</tr>
									</thead>
									<tbody id="table_content">
										
									</tbody>
								</table>
								<div class="fl">
	                                <button type="button"
										class="btn fl btn-small btn-danger btn-sub" style="margin-left:0px;"
											data-toggle="button" id="addUserBtn">添加管理员
									</button>
	                            </div>
								<jsp:include page="../common/page.jsp"/>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- PAGE CONTENT BEGINS HERE -->
	</div>
	
</body>
<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			doSubmit(0,globle_page_size);
		});
		
		$("#addUserBtn").on("click", function(){
			layer.open({
				type: 2,
				title: "添加用户",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["900px" , "620px"],
				content: "/view/systemuser/addsystemuser.jsp"
			});

		});
	});

	var renderPage = true;
	//分页查询表格
	doSubmit(0,globle_page_size); 
	function doSubmit(start,pageSize){
		var xco=new XCO();
		
		//查询条件
		var data=formPara(xco);

		xco.setIntegerValue("start",start);
		xco.setIntegerValue("pageSize",pageSize);
			var options ={
				url:"/tvr-system/getSysUserList.xco",
				data:data,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function formPara(xco){
		var name = $("#name").val();
		if(name){
			xco.setStringValue("name",name);
		}
		var state = $("#state").val();
		if(state){
			xco.setStringValue("state",state);
		}
		return xco;
	}

    
	function manage(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("data");
			var tdIndex = 1;
			var keyOptions = [
					function(item){
						return tdIndex++;
					},//编号
					'name',
					'manager_desc', //描述
					function(item) {//状态
						return checkState(item.get('state'));
					}, 
					function(item) {//操作
						return checkUrl(item.get('id'),item.get('name'),item.get('state'));
					}
			];
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total),doSubmit, globle_page_size);
			}
		}
		
	}
	
	function checkState(state){
		if(state == 0){
			return "停用";
		}else{
			return "启用";
		}
	}
	
	function checkUrl(id,name,state){
		if(state == 1){
			return "<a href='javascript:void(0);' class='mar-r-5' onclick='javascript:shezhi("+id+");'>设置</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:dongjie("+id+","+state+");'>禁用</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:del("+id+");'>删除</a><a href='javascript:void(0);' onclick='javascript:initPwd("+id+",\""+name+"\");'>初始化密码</a>";
		}else{
			return "<a href='javascript:void(0);' class='mar-r-5' onclick='javascript:shezhi("+id+");'>设置</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:dongjie("+id+","+state+");'>启用</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:del("+id+");'>删除</a><a href='javascript:void(0);' onclick='javascript:initPwd("+id+",\""+name+"\");'>初始化密码</a>";
		}
	}
	
	//初始化密码
	function initPwd(id,name){
		if(tvrConfirm("你确定要初始化"+name+"的密码？")){
			var xco = new XCO();
			if(id){
				xco.setIntegerValue("id",id);
			}else{
				tvrAlert("该用户 不存在请先添加用户");
				return;
			}
			var options ={
					url:"/tvr-system/initSystemUserPwd.xco",
					data:xco,
					success: function(xco){
						if (xco.getCode() != 0) {
							tvrAlert('doCallBack error:\n' + xco);
						}else{
							tvrAlert("密码初始化成功：123456");
						}
					}
			};
			$.doXcoRequest(options);
		}
	}
	
	//删除用户
	function del(id){
		if(confirm("你确定要删除该记录？")){
			var xco = new XCO();
			if(id){
				xco.setIntegerValue("id",id);
			}else{
				alert("该用户 不存在请先添加用户");
				return;
			}
			var options ={
					url:"/tvr-system/deleteSysUser.xco",
					data:xco,
					success: function(xco){
						if (xco.getCode() != 0) {
							alert('doCallBack error:\n' + xco);
						}else{
							alert("删除成功！！");
							window.location = window.location.href;
						}
					}
			};
			$.doXcoRequest(options);
		}
	}
	
	function shezhi(id){
		layer.open({
				type: 2,
				title: "设置系统用户",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["900px" , "620px"],
				content: "/view/systemuser/addsystemuser.jsp?id="+id
			});
		//window.location.href="/view/user/addUser.jsp?user_id="+user_id;
	}
	
	function dongjie(id,state){
		var str = state == 1 ?"你确定要停用该用户吗？":"你确定要启用该用户吗？";
		var flag = state == 1 ?0:1;
		if(tvrConfirm(str)){
			var xco=new XCO();
			xco.setIntegerValue("id", id);
			xco.setIntegerValue("state", flag);
			var options ={
						url:"/tvr-system/updateUserState.xco",
						data:xco,
						success: dongjiemanage
			};
			$.doXcoRequest(options);
		}
	}
	
	//冻结成功
	function dongjiemanage(xco){
		if (xco.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + xco);
		}else{
			window.location = window.location.href;
		}
	}
</script>
</html>