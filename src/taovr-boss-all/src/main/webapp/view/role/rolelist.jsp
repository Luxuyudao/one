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
		<div id="main-content" class="clearfix" data-page="role" sub-page="list">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="#">首页</a><span
						class="divider"><i class="icon-angle-right"></i> </span></li>
					<li></i> <a href="#">系统角色</a><span class="divider"></i>
					</span></li>

				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>系统角色管理</h1>
				</div>
				<div class="row-fluid">
					<form class="form-inline bord1dd">
						<div class="form-group overhidden">
							<div class="fl mar-t-15">
								<label for="">角色名称</label> <input type="text"
									class="form-control" placeholder="" id="role_name">
							</div>
							<!-- 
							<div class="fl mar-t-15">
								<label for="">状态</label> 
								<select class="form-control w160" id="state">
                                  <option value="">-请选择-</option>
                                  <option value="0">停用</option>
                                  <option value="1">启用</option>
                                </select>
							</div>
							 -->
							
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
											<th width="20%">角色名称</th>
											<th width="30%">角色描述</th>
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
											data-toggle="button" id="addrolebtn">添加角色
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
			//layer.alert("见到你真的很高兴");
			doSubmit(0,globle_page_size);
		});
		
		$("#addrolebtn").on("click", function(){
			layer.open({
				type: 2,
				title: "添加角色",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["850px" , "460px"],
				content: "/view/role/addrole.jsp"
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
				url:"/tvr-system/getRoleList.xco",
				data:data,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function formPara(xco){
		var role_name = $("#role_name").val();
		if(role_name){
			xco.setStringValue("role_name",role_name);
		}
		
		//var state = $("#state").val();
		//if(state){
		//	xco.setStringValue("state",state);
		//}
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
					'role_name',
					'role_desc', //描述
					function(item) {//状态
						return checkState(item.get('state'));
					}, 
					function(item) {//操作
						return checkUrl(item.get('role_id'),item.get('state'));
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
	
	function checkUrl(role_id,state){
		if(state == 1){
			return "<a href='javascript:void(0);' class='mar-r-5' onclick='javascript:look("+role_id+");'>查看</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:edit("+role_id+");'>编辑</a><a href='javascript:void(0);' onclick='javascript:opt("+role_id+");'>权限</a>";
		}else{
			return "<a href='javascript:void(0);' class='mar-r-5' onclick='javascript:look("+role_id+");'>查看</a><a href='javascript:void(0);' class='mar-r-5' onclick='javascript:edit("+role_id+");'>编辑</a>";
		}
	}
	
	//删除
    function del(role_id){
    	var xco=new XCO();
		xco.setIntegerValue("role_id", role_id);
		var options ={
				url:"/tvr-system/deleteRole.xco",
				data:xco,
				success: function(result){
					if(result.getCode() != 0) {
						tvrAlert('doCallBack error:\n' + result);
					}else{
						tvrAlert("删除成功！");
				        window.location.reload();
					}
				}
		};
		if(tvrConfirm("确定要删除该角色?")){
			$.doXcoRequest(options);
		}
    }
	
	//查看
    function look(role_id){
		//window.location.href="/view/role/lookrole.jsp?role_id="+role_id;
		layer.open({
			type: 2,
			title: "查看角色",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["850px" , "420px"],
			content: "/view/role/lookrole.jsp?role_id="+role_id
		});
    }
    
    //编辑
    function edit(role_id){
		layer.open({
			type: 2,
			title: "编辑角色",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["850px" , "440px"],
			content: "/view/role/editrole.jsp?role_id="+role_id
		});
    }
    
    //权限
    function opt(role_id,type){
        window.location.href="/view/role/pcopt.jsp?role_id="+role_id;	
    }
	
</script>
</html>