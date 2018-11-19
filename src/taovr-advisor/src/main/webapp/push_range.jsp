<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8" />
<title>推送范围</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="http://file.demo1.com/jalert/jquery.alerts.css">

<!--[if IE 7]>
    <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
    <![endif]-->
<!-- page specific plugin styles -->

<!-- ace styles -->
<link rel="stylesheet" href="css/ace.min.css" />
<link rel="stylesheet" href="css/ace-responsive.min.css" />
<link rel="stylesheet" href="css/ace-skins.min.css" />
<!--[if lt IE 9]>
    <link rel="stylesheet" href="css/ace-ie.min.css" />
    <![endif]-->
<!-- 自己的样式-->
<link rel="stylesheet" href="libs/css/header.css">
<link rel="stylesheet" href="libs/css/style.css">
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
<div id="page-content" class="clearfix">
	<div class="row-fluid">
		<form class="form-inline bord1dd">
			<!--<span>货架编号：</span><span>01</span>
                    <span>所属仓库：</span><span>01</span>-->
			<div class="form-group overhidden">
				<div class="fl mar-t-15">
					<label for="">服务商名称</label> <input id="user_name" type="text"
						class="form-control" placeholder="">
				</div>
				<div class="fl mar-t-15">
					<label for="">行业分类</label> <input id="industry" type="text"
						class="form-control" placeholder="">
				</div>
				<div class="fl mar-t-15">
					<label for="">服务商等级</label> <input type="text" class="form-control"
						placeholder="">
				</div>
				<button id="cx_btn" type="button"
					class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub"
					data-toggle="button">查询</button>
			</div>
		</form>
	</div>
	<div class="row-fluid">
		<div class="row-fluid mar-t-15">
			<div class="span12">
				<table id="table_bug_report"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>全选</th>
							<th>ID</th>
							<th>服务商名称</th>
							<th>等级</th>
							<th>分类</th>
						</tr>
					</thead>
					<tbody id="user_table">
						<!-- <tr>
							<td class="center"><label> <input type="checkbox"
									class="ace-checkbox-2"> <span class="lbl"></span> </label></td>
							<td class="center">1</td>
							<td class="center">中石化</td>
							<td class="center">钻石</td>
							<td class="center">教育</td>
						</tr>
						<tr>
							<td class="center"><label> <input type="checkbox"
									class="ace-checkbox-2"> <span class="lbl"></span> </label></td>
							<td class="center">1</td>
							<td class="center">中石化</td>
							<td class="center">钻石</td>
							<td class="center">教育</td>
						</tr> -->
					</tbody>
				</table>
				<div class="pagination fr">
					<ul id="pagination_1">
					</ul>
				</div>
			</div>
		</div>
		<div class="tc mar-t-20">
			<button id="select" type="button" class="btn btn-submit"
				data-toggle="button">
				<i></i>提交
			</button>
			<button type="button" class="btn btn-submit" data-toggle="button"
				onclick="closeWin()">
				<i></i>关闭
			</button>
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
	var renderPage = true;
	function getProviderList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		xco.setStringValue("user_name", $("#user_name").val());
		xco.setStringValue("industry", $("#industry").val());
		var options = {
			url : "/tvr-project/getProviderListP42.xco",
			data : xco,
			success : getProviderListCallBack
		};
		$.doXcoRequest(options);
	}
	function getProviderListCallBack(data) {
		if (data.getCode() != 0) {
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var total = data.getIntegerValue("total");
			var datalist = data.getXCOListValue("users");
			var keyOptions = [
					function(item) {
						var selectbox = '';
						//selectbox += '<label>';
						selectbox += '<input type="checkbox" class="ace-checkbox-2" value="';
						selectbox += item.getStringValue("user_id");
						selectbox += '"><span class="lbl"></span>';
						//selectbox += '</label>';
						return selectbox;
					}, 'user_id', 'nick_name', function(item) {
						return '钻石';
					}, 'industry', ];
			renderTable("#user_table", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getProviderList,
						globle_page_size);
			}
		}
	}
	getProviderList(0, globle_page_size);
	$(function() {
		$("#cx_btn").click(function() {
			renderPage = true
			getProviderList(0, globle_page_size);
		});
		$("#select").click(function() {
			var id="";
			var str = "";
			$("input:checkbox:checked").each(function(index, element) {
				if ($(element).prop("checked")) {
					id += $(element).val() + ",";
					str += $(element).parent().next().next().text()+ "、";
				}
			});
			
			if (str == "") {
				alert("请选择要添加的服务商！！！");
				return;
			} else {
				parent.$('#fws_id').val(id.substring(0, id.length - 1));
				parent.$('#fws_name').val(str.substring(0, str.length - 1));
				jAlert("添加成功","提示",function(r){
					closeWin();
				});
				
			}
		})
	});
	//关闭弹窗
	function closeWin() {
		//parent.window.location.href="/view/team/teamlist.jsp";
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	}
</script>
</html>