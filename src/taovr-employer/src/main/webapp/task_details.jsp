<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>任务详情</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="left.jsp" %>
</head>
<body>
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="addproject">
			<!--#breadcrumbs-->
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><a href="http://employer.demo1.com/index.jsp">项目中心</a><span
						class="divider"><i class="icon-angle-right"></i> </span>
					</li>
					<li>任务详情</li>
				</ul>
			</div>
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>任务详情</h1>
				</div>
				<!--/page-header-->
				<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS HERE -->
					<div class="row-fluid mar-t-15">
						<div class="span12">
							<form class="form-inline bord1dd form-add1">
								<div class="form-group">
									<label>*任务名称</label> <span id="task_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务顾问</label> <span id="adviser_name"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务周期</label> <span id="cycle"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*任务类型</label> <span id="task_type"></span>
								</div>
								<div class="form-group mar-t-15">
									<label>*实施地址</label> <span id="address"></span>
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
		                <div class="box border">
		              	<div class="box-title">
		                	<h4><i class="fa fa-table"></i>验收附件</h4>
		              	</div>
		              	<div class="form-inline bord1dd form-add1 font14">
		              		<div class="form-group overhidden">
				                <label class="mar-t-15 pull-left"></label>
				                <div class=" overhidden formwrapper1">
				                  <ul class="wid310 mar-t-15 unstyled" id="resources2">
				                  </ul>
				                </div>
				            </div>
		             	</div>
		            </div>
					<div class="tc mar-t-20">
						<button type="button" class="btn btn-submit" data-toggle="button"
							onClick="javascript :history.back(-1);">返回</button>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT BEGINS HERE -->
		</div>
</body>
<script type="text/javascript">
	function getProjectTask( _start, _pageSize) {
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
			jAlert('doCallBack error:\n' + data,"错误提示");
		} else {
			var task = data.getXCOValue("task");//任务详情表
			var resources = data.getXCOListValue("resources");//附件表
			var applies = data.getXCOListValue("applies");//任务验收申请表
			var total = data.getIntegerValue("total");
			var reports = data.getXCOListValue("reports");
			$("#task_name").text(task.getStringValue("task_name")); 

			$("#adviser_name").text(task.getStringValue("adviser_name"));//任务顾问
			$("#cycle").text(
					task.getIntegerValue("task_cycle")
							+ task.getStringValue("cycle_unit_name"));//任务周期
			$("#task_type").text(task.getStringValue("task_type"));//任务类型
			$("#address").text(task.getStringValue("task_province")+task.getStringValue("task_city")+task.getStringValue("task_area")+task.getStringValue("task_addr"));//实施地址
			$("#task_desc").text(task.getStringValue("task_desc"));//任务要求
			var fjHtml = '';
			var fjHtml1 = '';
			if (resources == null || undefined == resources) {//任务附件
				$("#resources1").append(getResourcesNull(fjHtml));
				$("#resources2").append(getResourcesNull(fjHtml1));
			} else {
				for(var i=0; i<resources.length; i++){
					if(resources[i].getIntegerValue("type")==2){//任务附件
						fjHtml = getResources2(fjHtml,resources[i]);
					}
					if(resources[i].getIntegerValue("type")==8){//任务验收附件
						fjHtml1 = getResources2(fjHtml1,resources[i]);
					}		
				}
				if(fjHtml==null||fjHtml==''){
					fjHtml = getResourcesNull(fjHtml);
				}
				if(fjHtml1==null||fjHtml1==''){
					fjHtml1 = getResourcesNull(fjHtml1);
				}
				$("#resources1").append(fjHtml);
				$("#resources2").append(fjHtml1);
			}
			
			var keyOptions1 = [ 
				'task_report_id',//日志编号
				function(item){//任务进度
					return item.getStringValue('create_time');
				},
				'report_desc',//内容
				function(item){//任务进度
					return item.get('progress')+'%';
				},
				function(item) {//操作
					var task_report_id = item.get("task_report_id");
					var aHtml = '';
					//aHtml += '<a href="task_report_case.jsp?task_report_id='+task_report_id+'">详情</a>';
					aHtml += '<a href="javascript:void(0);" onclick="tanchuang('+item.get("task_report_id")+')">详情</a>';
					return aHtml;
				} 
			];
			renderTable("#table_log_content",reports,keyOptions1);
			if (renderPage) {
				renderPage = false;
				pageUtil('pagination_1', parseInt(total), getProjectTask,
						globle_page_size);
			};
			
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
					str+="<div class=\"inlineBlock  resultBox vm\">"+applies[i].get("remark")+"</div>";
					str+="</div>";
				}
				$("#yanshou_result").html(str);
			}
		}
	}
	function tanchuang(task_report_id){
		layer.open({
			type: 2,
			title: "日报详情",
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ["800px" , "450px"],
			content: ['task_report_case.jsp?task_report_id='+task_report_id]
		});
	}
	function checkAstate(state){
		if(state == 1){
			return "审核不通过";
		}else{
			return "审核通过";
		}
	}
	getProjectTask(0,globle_page_size);
</script>
</html>
