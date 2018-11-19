<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>账单列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../common/left.jsp"%>
</head>
<body>
	<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="Itemlist">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/finance/index.jsp">财务中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
				<li>财务中心</li>
			</ul>
		</div>
		<div id="page-content" class="clearfix">
			<div class="page-header position-relative crumbs-nav">
				<h1>账单列表</h1>
			</div>
			<!--/page-header-->
			<div class="row-fluid">
				<div class="row-fluid">
					<form class="form-inline bord1dd">
                    <span>所属仓库：</span><span>01</span>-->
						<div class="form-group overhidden">

							<div class="fl mar-t-15">
								<label for="" class="fl" style="margin-top:3px;">起始日期</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="id-date-picker-1"
										data-date-format="dd-mm-yyyy" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>
							<div class="fl mar-t-15">
								<label for="" class="fl" style="margin-top:3px;">结束日期</label>
								<div style="width:160px;" class="ml5 input-append date fl">
									<input class="span10 date-picker" id="id-date-picker-1"
										data-date-format="dd-mm-yyyy" type="text"> <span
										class="add-on"><i class="icon-calendar"></i> </span>
								</div>
							</div>
							<div class="fl mar-t-15">
								<label for="">顾问名称 </label> <input type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">雇主名称</label> <input type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">金额范围</label> <input type="text"
									class="form-control" placeholder="">&nbsp&nbsp&nbsp
								至&nbsp&nbsp&nbsp <input type="text" class="form-control"
									placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">项目编号</label> <input type="text"
									class="form-control" placeholder="">
							</div>
							<div class="fl mar-t-15">
								<label for="">项目状态</label> <select
									class="form-control marg0  wid80 vm">
									<option>-状态-</option>
									<option>代付款</option>
									<option>已完成</option>
								</select>
							</div>
							<button type="button"
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
										<th>项目编号</th>
										<th>创建时间</th>
										<th>项目名称</th>
										<th>雇主</th>
										<th>项目顾问</th>
										<th>合约金额</th>
										<th>项目状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table_content">
								</tbody>
							</table>
							<div class="pagination fr">
								<ul id="pagination_1"></ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="heyue" class="modal hide fade goodsModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">《华电项目合同》</h3>
			</div>
			<div class="modal-body">
				<div class="content-in pos-r">同编号：_ 劳 动 合 同 书 甲方： 乙方：

					根据《中华人民共和国劳动法》及有关法律法规，经甲乙双方平等自愿协商一致，同意签订本合同，共同遵守本合同所列条款。 一、 劳动合同期限
					第一条 本合同为 期限劳动合同，合同期自 年 月 日起至 _ 年 月 日止，共计 个月。 第二条 本合同试用期自 年 月 日起至 年
					月 日。 第三条 若乙方开始工作时间与约定时间不一致，以实际到岗之日为合同起始时间建立劳动关系。 二、 工作内容和工作地点 第四条
					根据甲方工作需要，乙方同意从事 岗位工作，乙方的工作地点为甲方的经营场所。 第五条
					在合同有效期内，甲方根据公司业务需要及乙方的技能、工作业绩等，在与乙方充分协商的基础上，可以调整乙方的工作岗位、工作内容和工作地点。
					第六条
					在合同有效期内，甲方调整乙方的工作岗位、工作地点、工作内容时，不再与乙方另外签订劳动合同，只需在原订合同上进行相应的变更说明；乙方应履行新任岗位工作职责、工作内容和相关协议，待原订合同期满后，再按照新任岗位、工作地点签订合同。
					三、 工作时间和休息休假 第七条
					甲方依法制定员工工时、休息和休假制度；乙方须遵守甲方依法制定的工时、休息和休假制度，并按照规定上下班。 第八条
					乙方依法享有的婚丧假、女职工产假等，按照甲方依法制定的相关规章制</div>

			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>

			</div>
		</div>
</body>

<script type="text/javascript">
	function getMyProjectList(_start, _pageSize) {
		var xco = new XCO();
		xco.setIntegerValue("start", _start);
		xco.setIntegerValue("pageSize", _pageSize);
		var options = {
			url : "http://x.boss.taovr.com/tvr-project/getProjectListP60.xco",
			data : xco,
			success : getMyProjectListCallBack
		};
		$.doXcoRequest(options);
	}

	var renderPage = true;
	function getMyProjectListCallBack(data) {
		if (data.getCode() != 0) {
			tvrAlert('doCallBack error:\n' + data);
		} else {
			var total = data.getIntegerValue("total");
			var keyOptions = [ 'project_sn', //项目编号
			 function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    }, //创建时间
			'project_name', //项目名称
			'employer_name', //雇主	
			'adviser_name', //项目顾问				
			function(item) {
				return parseInt(item.get('real_amount')) / 100;
			}, //合约金额	
			//项目状态	
			function(item) {

				if (item.get('project_state') == 0) {
					var aHtml = '无效';
					return aHtml;
				}
				if (item.get('project_state') == 10) {
					var aHtml = '待审核';
					return aHtml;
				}
				if (item.get('project_state') == 20) {
					var aHtml = '已审核';
					return aHtml;
				}
				if (item.get('project_state') == 30) {
					var aHtml = '待签约';
					return aHtml;
				}
				if (item.get('project_state') == 40) {
					var aHtml = '代付款';
					return aHtml;
				}
				if (item.get('project_state') == 50) {
					var aHtml = '实施中';
					return aHtml;
				}
				if (item.get('project_state') == 60) {
					var aHtml = '待验收';
					return aHtml;
				}
				if (item.get('project_state') == 70) {
					var aHtml = '待结案';
					return aHtml;
				}
				if (item.get('project_state') == 100) {
					var aHtml = '已完成';
					return aHtml;
				}

			},//操作				
			function(item) {
				var aHtml = '';
				aHtml += '<a>预览合约</a>  <a>雇主账单</a>  <a>顾问账单</a> <a>服务商账单</a>';

				return aHtml;
			},//操作
			];
			var datalist = data.getXCOListValue("projects");
			renderTable("#table_content", datalist, keyOptions);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getMyProjectList,
						globle_page_size);
			}
		}
	}
	getMyProjectList(0, globle_page_size);
</script>
</html>
