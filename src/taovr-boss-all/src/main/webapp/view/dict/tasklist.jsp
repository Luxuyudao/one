<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
	String pageName = "任务类型管理";
%>
<head>
<meta charset="utf-8" />
<title>任务管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp" %>

</head>

<body>
	<div id="main-content" class="clearfix" data-page="task" sub-page="list">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="#">首页</a><span
					class="divider"><i class="icon-angle-right"></i> </span></li>
				<li></i> <a href="#">任务分类</a><span class="divider"></i>
				</span></li>

			</ul>
			<!--.breadcrumb-->
		</div>
		<!--#breadcrumbs-->
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>任务分类</h1>
			</div>
			<div class="row-fluid">
				<form class="form-inline bord1dd">
					<div class="form-group overhidden">
					<!-- 
						<div class="fl mar-t-15">
							<label for="">一级名称</label> <input type="text"
								class="form-control" placeholder="" id="name">
						</div>
						<button type="button"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button" id="search">查询</button>
					 -->
							
							<button type="button"
							class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
							data-toggle="button" id="add1">新增一级名称</button>
					</div>
				</form>
				<div class="row-fluid">
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<table id="table_bug_report"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="width:20%;">一级名称</th>
										<th style="width:20%;">二级名称</th>
										<th style="width:20%;">三级名称</th>
										<th style="width:40%;">操作</th>
									</tr>
								</thead>
								<tbody id="table_content">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			doSubmit();
		});
		
		
		$("#add1").click(function(){
			layer.open({
				type: 2,
				title: "新增任务分类",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["600px" , "360px"],
				content: ["/view/dict/add2Task.jsp","no"]
			});
		});
		
		
	});

	var renderPage = true;
	//分页查询表格
	doSubmit(); 
	function doSubmit(){
		var xco=new XCO();
		
		//查询条件
		var data=formPara(xco);
		var options ={
				url:"/tvr-system/gettasklist.xco",
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
		return xco;
	}

    
	function manage(data){
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var _dataList = data.getXCOListValue("data");
			var tdIndex = 1;
            $("#table_content").html("");
            if(_dataList){
            	var str = "";
				var tdIndex = 1;
				for ( var i = 0; i < _dataList.length; i++) {
					var childrenCount = _dataList[i].getObjectValue("childrenCount");
					var level = _dataList[i].getObjectValue("level");
					var id = _dataList[i].getObjectValue("id");
					if(level == 1){
						str+="<tr>";
						str+="   <td>"+_dataList[i].getObjectValue("name")+"</td>";
						str+="   <td></td>";
						str+="   <td></td>";
						str+="   <td><a href=\"javascript:add("+id+")\">新增下级</a>&nbsp;&nbsp;<a href=\"javascript:update("+id+","+level+")\">修改</a>&nbsp;&nbsp;<a href=\"javascript:del("+id+")\">删除</a></td>";
						str+="</tr>";
						if(childrenCount > 0){
							for(var j = i+1; j < _dataList.length; j++){
								var childrenCount2 = _dataList[j].getObjectValue("childrenCount");
								var level2 = _dataList[j].getObjectValue("level");
								var fid2 = _dataList[j].getObjectValue("fid");
								var id2 = _dataList[j].getObjectValue("id");
								if(level2 == 2 && fid2 == id){
									str+="<tr>";
									str+="   <td></td>";
									str+="   <td>"+_dataList[j].getObjectValue("name")+"</td>";
									str+="   <td></td>";
									str+="   <td><a href=\"javascript:add("+id2+")\">新增下级</a>&nbsp;&nbsp;<a href=\"javascript:update("+id2+","+level2+")\">修改</a>&nbsp;&nbsp;<a href=\"javascript:del("+id2+")\">删除</a></td>";
									str+="</tr>";
									if(childrenCount2 > 0){
										for(var k=j+1;k<_dataList.length;k++){
											var level3 = _dataList[k].getObjectValue("level");
											var fid3 = _dataList[k].getObjectValue("fid");
											var id3 = _dataList[k].getObjectValue("id");
											if(level3 == 3 && fid3 == id2){
												str+="<tr>";
												str+="   <td></td>";
												str+="   <td></td>";
												str+="   <td>"+_dataList[k].getObjectValue("name")+"</td>";
												str+="   <td><a href=\"javascript:update("+id3+")\">修改</a>&nbsp;&nbsp;<a href=\"javascript:del("+id3+","+level3+")\">删除</a></td>";
												str+="</tr>";
											}
										}
									}
								}
							}
						}
					}
				}
				//console.log();
				$("#table_content").html(str);
			}
		}
		
	}
	
	function add(id){
		layer.open({
			type: 2,
			title: "新增任务分类",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["600px" , "360px"],
			content: ["/view/dict/addTask.jsp?id="+id,"no"]
		});
	}
	
	function update(id,level){
		layer.open({
			type: 2,
			title: "修改任务分类",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["600px" , "360px"],
			content: ["/view/dict/editTask.jsp?id="+id+"&level="+level,"no"]
		});
	}
	
	function del(id){
		var data = new XCO();
		data.setIntegerValue("id",id);
		var options ={
				url:"/tvr-system/deleteTask.xco",
				data:data,
				success: function(data){
					if(data.getCode() != 0) {
						tvrAlert('doCallBack error:\n' + data);
					}else{
						tvrAlert("删除成功！");
						window.location.href="/view/dict/tasklist.jsp";
					}
				}
		};
		if(tvrConfirm("确定要删除该记录吗？")){
			$.doXcoRequest(options);
		}
	}
	
</script>
</html>