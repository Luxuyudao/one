<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%
		String pageName = "账单列表";
%>
<head>
<meta charset="utf-8" />
<title>账单列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<%@ include file="../common/left.jsp"%>
</head>
<body>
  <div id="main-content" class="clearfix" data-page="projectcenter" sub-page="billlist">
    <div id="breadcrumbs">
      <ul class="breadcrumb">
        <li><i class="icon-home"></i> <a href="http://manager.boss.demo1.com/view/finance/index.jsp">财务中心</a><span
					class="divider"><i class="icon-angle-right"></i> </span>
				</li>
        <li>应付账款</li>
      </ul>
    </div>    
    <div id="page-content" class="clearfix">
      <div class="page-header position-relative crumbs-nav">
        <h1>账单列表</h1>
      </div>
      <div class="row-fluid"> 
        <div class="row-fluid">
          <form class="form-inline bord1dd">
          <div class="form-group overhidden">
            <div class="fl mar-t-15">
				<label for="">账单名称</label>
				<input id="bill_title" type="text" class="form-control"  placeholder="">
            </div>
            <div class="fl mar-t-15">
				<label for="">付款用户</label>
				<input  id="out_user_name" type="text" class="form-control"  placeholder="">
            </div>
            <div class="fl mar-t-15">
				<label for=""  class="fl" style="margin-top:3px;">预计支付日期</label>
				<div style="width:160px;" class="ml5 input-append date fl">
					<input  id="plan_time" class="span10 date-picker" id="id-date-picker-1" data-date-format="dd-mm-yyyy" type="text">
					<span class="add-on"><i class="icon-calendar"></i></span> 
				</div>
            </div>
			<div class="fl mar-t-15">
				<label for=""  class="fl" style="margin-top:3px;">支付成功日期</label>
				<div style="width:160px;" class="ml5 input-append date fl">
					<input id="finish_time" class="span10 date-picker" id="id-date-picker-1" data-date-format="dd-mm-yyyy" type="text">
					<span class="add-on"><i class="icon-calendar"></i></span> 
				</div>
            </div>
            <button id="cx_btn" type="button" class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub" data-toggle="button">查询</button>
          </div>
        </form>
      </div>
      <div class="row-fluid">
        <div class="row-fluid mar-t-15">
          <div class="span12">
             <table id="table_bug_report" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>    
                  <th>账单编号</th>
                  <th>账单名称</th>
                  <th>付款用户</th>
                  <th>收款用户</th>
				  <th>支付金额</th>
				  <th>预计支付日期</th>
				  <th>支付成功日期</th>
				  <th>状态</th>
				  <th>备注</th>
				   <th>操作</th>
                </tr>
              </thead>
              
              <tbody id="table_content">
              
              </tbody>
            </table>
			<div class="pagination fr">
                <ul>
                <ul id="pagination_1"></ul>
                </ul>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

	 <script type="text/javascript">
	 	var renderPage = true;
		$(document).ready(function() {
			$("#cx_btn").click(function() {
				renderPage = true
				getMyProjectList(0, globle_page_size);
			});
		});	 
		function getMyProjectList(_start, _pageSize) {
			var xco = new XCO();
			xco.setIntegerValue("start", _start);
			xco.setIntegerValue("pageSize", _pageSize);
			xco.setStringValue("bill_title", $("#bill_title").val());//账单名称
				xco.setStringValue("out_user_name", $("#out_user_name").val());//付款用户
			var options = {
				url: "/tvr-finance/getBillListF1.xco",
				data: xco,
				success: getMyProjectListCallBack
			};
			$.doXcoRequest(options);
		}
		var renderPage = true;
		
		function checkUrl(item) {
			return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuang("
					+ item.get("bill_sn") + ")\">确认付款</a>";
			}
			function checkUrl2(item) {
			return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuang2("
				+ item.get("bill_sn") + ")\">确认付款</a>";
			}
			function checkUrl3(item) {
			return "<a herf=\"javascript:void(0)\"; onclick=\"tanchuang3("
				+ item.get("bill_sn") + ")\">确认付款</a>";
			}
			function tanchuang(bill_sn) {
						layer.open({
							type : 2,
							title : "确认付款",
							maxmin : true,
							shadeClose : true, //点击遮罩关闭层
							area : [ "800px", "600px" ],
							content : [ "employerpayment.jsp?bill_sn=" + bill_sn]
						});
					}
		    function tanchuang2(bill_sn) {
						layer.open({
						type : 2,
						title : "确认付款",
						maxmin : true,
						shadeClose : true, //点击遮罩关闭层
						area : [ "800px", "600px" ],
						content : [ "advisorpayment.jsp?bill_sn=" + bill_sn ]
					});
					}
			function tanchuang3(bill_sn) {
						layer.open({
							type : 2,
							title : "确认付款",
							maxmin : true,
							shadeClose : true, //点击遮罩关闭层
							area : [ "800px", "600px" ],
							content : [ "serviceproviderpayment.jsp?bill_sn=" + bill_sn]
						});
					}
		function getMyProjectListCallBack(data){
			if(data.getCode() != 0){
				jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var total = data.getIntegerValue("total");
				var keyOptions = [
					'bill_sn',   //账单编号
					'bill_title',		//账单名称
					'out_user_name',  //付款用户
					
					'in_user_name',	//收款用户	
					function(item){
						return parseInt(item.get('bill_amount')) / 100+"元";
					},				//支付金额		
					function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("plan_time"));
				    },			//预计支付时间
				    function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("finish_time"));
				    },
					function(item){
						if(item.get('bill_state')==0){
								var aHtml = '无效';
								return aHtml;	
						}
						if(item.get('bill_state')==10){
								var aHtml = '未支付';
								return aHtml;	
						}
						if(item.get('bill_state')==20){
								var aHtml = '支付中';
								return aHtml;	
						}
						if(item.get('bill_state')==30){
								var aHtml = '支付失败';
								return aHtml;	
						}
						
						if(item.get('bill_state')==100){
								var aHtml = '支付成功';
								return aHtml;	
						}
					
					},
								
					
						'remark',
									//备注
					function(item){
								if(item.get('bill_state')==10){
											if(item.get('bill_type')==1){  //雇主账单
												return checkUrl(item);
											}
											if(item.get('bill_type')==2){	//专家账单
												return checkUrl2(item);
											}
											if(item.get('bill_type')==3){	//服务商账单
												return checkUrl3(item);
											}
										return "";
									}
						return "";
					},//操作
				];
				
					
				var datalist = data.getXCOListValue("bills");
				renderTable("#table_content", datalist, keyOptions);
				if(renderPage){
		           	renderPage = false;
		           	pageUtil('pagination_1', parseInt(total), getMyProjectList, globle_page_size);
				}				
			}
		}
		getMyProjectList(0, globle_page_size);
	 </script>
</html>
