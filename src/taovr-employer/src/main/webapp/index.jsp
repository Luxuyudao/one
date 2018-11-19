<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>雇主中心</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<%@ include file="left.jsp" %>
	</head>
	<body>
		
		
		<div id="main-content" class="clearfix" data-page="projectcenter" sub-page="index">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i>
						<a href="http://employer.demo1.com/index.jsp">首页</a><span class="divider"></span></li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative crumbs-nav">
					<h1>雇主中心</h1>
				</div>
				<div class="row-fluid">
				
				 <div class="indexBox">
				    <div class="div-inline" style="height:122px;width:122px;"> 
					    <a href="#" title="Photo Title" data-rel="colorbox"> <img alt="150x150" height="120" width="120" src="<%=photo %>"> </a> 
				    </div>
		            <div class="div-inline margin_left">
						<div> 
							<span style="font-size:20px; font-weight:bold;"><%=user_name%></span> 
						</div>
						<div class="mar-t-15"> 
							<a class="blue user-level position-relative" href="javascript:vord(0);">
								<i class="level level1 position-absolute"></i>钻石会员
							</a> 
							<a href="#">
								<img src="img/weikaitong.png">
							</a> 
						</div>
						<div class="margin_top overhidden"> 
							<a class="blue pull-left" href="javascript:vord(0);">账户安全:</a> 
							<span class="s-level s-level1 pull-left"></span> 
							<span class="pull-left t-level1">较高</span> 
						</div>
						
					</div>
					<div class="div-inline margin_left">
						<div> <a class="btn btn-info" href="project_release.jsp">发布需求</a> </div>
						<div class="mar-t-10"> <a class="btn btn-info" id="getMoney"  href="http://user.demo1.com/view/joinapply.jsp">我要赚钱</a> </div>
		            </div>
		            <div class="bord1dd div-inline userInfo bg_eee pull-right">
						<div> 余<span class="mlem">额：</span> <span>0</span> <span>元</span> </div>
						<div> V&nbsp;<span class="mlem">币：</span> <span>85</span> <span>个</span> </div>
						<div> <span>体验券：</span> <span>1</span> <span>张</span> </div>
		            </div>
		            <div class="div-inline pull-right" style="margin-top:30px;">
						<ul class="ucountList unstyled overhidden">
		                    <li> <a href="#" class="position-relative"> <i class="ucount icon3 position-absolute"></i> <span>待审核<em class="countNum" id="state10">0</em></span> </a> </li>
		                    <li> <a href="#" class="position-relative"> <i class="ucount icon2 position-absolute"></i> <span>待验收<em class="countNum" id="state60">0</em></span> </a> </li>
		                    <li> <a href="#" class="position-relative"> <i class="ucount icon1 position-absolute"></i> <span>待支付<em class="countNum" id="state40">0</em></span> </a> </li>
		                    <li> <a href="#" class="position-relative"> <i class="ucount icon4 position-absolute"></i> <span>待评价<em class="countNum">0</em></span> </a> </li>
		                </ul>
					</div>
		        </div>
		        	<!-- 
		        	<div id="">
			        	<video controls="controls" autoplay="autoplay">
						  <source src="/i/movie.ogg" type="video/ogg" />
						  <source src="http://file.demo1.com/video/20161110/Q27UYBD2rOk07Vi.mp4" type="video/mp4" />
							Your browser does not support the video tag.
						</video>
						<
						var type = $.browse()
						>
		        	<div>
		        	 -->
					<form class="form-inline bord1dd mar-t-15">
			          <div class="form-group overhidden">
			         	<div class="fl mar-t-15">
			            <label for="">项目编号</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="project_sn">
			            </div>
			            <div class="fl mar-t-15">
			            <label for="">项目名称</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="project_name">
			            </div>
			            <div class="fl mar-t-15">
			            <label for="">项目顾问</label>
			            <input type="text" class="form-control wid140"  placeholder="" id="adviser_name">
			            </div>
			            <div class="fl mar-t-15">
			            <label>状态</label>
			            <select type="text" class="form-control wid140"  placeholder="" id="project_state">
			              <option value="">全部</option>
			              <option value="0">无效</option>
			              <option value="10">待审核</option>
			              <option value="20">已审核</option>
			              <option value="30">待签约</option>
			              <option value="40">待付款</option>
			              <option value="50">实施中</option>
			              <option value="60">待验收</option>
			              <option value="70">待结案</option>
			              <option value="100">已完成</option>
			            </select>
			            </div>
			            <button type="button" class="btn mar-t-15 ml15 fl btn-small btn-danger btn-sub" id="search" data-toggle="button">查询</button>
			          </div>
			        </form>
			        <div class="row-fluid">
						<div class="row-fluid ">
							<div class="span12">
								<table id="table_bug_report" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th  width="12%">时间</th>
											<th  width="10%">项目编号</th>
											<th  width="18%">项目名称</th>
											<th  width="18%">项目顾问</th>
                                            <th  width="11%">项目工期</th>
                                            <th  width="11%">项目金额</th>
											<th  width="10%">状态</th>
											<th width="10%">操作</th>
										</tr>
									</thead>
									<tbody id="table_content">
									
									</tbody>
								</table>
								<jsp:include page="page.jsp"></jsp:include>
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
				
				renderPage = true;
				getMyProjectList(0,globle_page_size);
			});
		});
	 	
	 	//获取个状态数目
	 	employerProjectStats();
	 	function employerProjectStats(){
			var xco = new XCO();
			var options = {
				url: "/tvr-project/getEmployerProjectStatsP16.xco",
				data: xco,
				success: employerProjectStatsCallBack
			};
			$.doXcoRequest(options);
	 	}
	 	
	 	function employerProjectStatsCallBack(data){
	 		if(data.getCode() != 0){
				jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var values=data.getXCOListValue("data");
				if(values){
					for(var i=0;i<values.length;i++){
						var state10 = values[i].getStringValue("project_state");
						if(state10 == "10"){
							$("#state10").text(values[i].getStringValue("state_count"))
						}
						var state60 = values[i].getStringValue("project_state");
						if(state60 == "60"){
							$("#state60").text(values[i].getStringValue("state_count"))
						}
						var state40 = values[i].getStringValue("project_state");
						if(state40 == "40"){
							$("#state40").text(values[i].getStringValue("state_count"))
						}
					}
				}
			}
	 	}
	 	
	 	getStateHide();
	 	
	 	 function getStateHide() {
			var data = new XCO();
			var options = {
				url: "/tvr-user/getUser1.xco",
				data: data,
				success: getStateHideCallBack
			};
			$.doXcoRequest(options);
		}
		 
		function getStateHideCallBack(data){
			if(data.getCode() != 0){
				jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var is_ad = data.getIntegerValue("is_advisor");
				var is_pr = data.getIntegerValue("is_providers");
				if((is_ad|is_pr) == 1){
					$("#getMoney").hide();
				}
				
			}
		}

	 
		 function getMyProjectList(_start, _pageSize) {
			var xco = new XCO();
			
			//查询条件
			var data=formPara(xco);
			data.setIntegerValue("start", _start);
			data.setIntegerValue("pageSize", _pageSize);
			var options = {
				url: "/tvr-project/getMyProjectListP15.xco",
				data: data,
				success: getMyProjectListCallBack
			};
			$.doXcoRequest(options);
		}
		 
		 //查询条件
		function formPara(xco){
			var project_sn = $("#project_sn").val();
			if(project_sn){
				xco.setIntegerValue("project_sn",project_sn);
			}
			var project_name = $("#project_name").val();
			if(project_name){
				xco.setStringValue("project_name",project_name);
			}
			var employer_name = $("#adviser_name").val();
			if(employer_name){
				xco.setStringValue("adviser_name",employer_name);
			}
			var project_state = $("#project_state").val();
			if(project_state){
				xco.setIntegerValue("project_state",project_state);
			}
			return xco;
		}
		
		var renderPage = true;
		function getMyProjectListCallBack(data){
			if(data.getCode() != 0){
				jAlert('doCallBack error:\n' + data,"错误提示");
			}else{
				var total = data.getIntegerValue("total");
				var keyOptions = [
				    function(item){
				    	return dataFormat("yyyy-MM-dd hh:mm:ss",item.get("create_time"));
				    },
					'project_sn',
					'project_name',
					'adviser_name',
					function(item){
						return item.get('project_cycle') + item.get('cycle_unit_name')
					},					
					function(item){
						return parseInt(item.get('budget_amount')) / 100+"元";
					},					
					function(item){
						return getProjectState(item.get('project_state'));
					},					
					function(item){
						var project_sn = item.get("project_sn");
						var state = item.get("project_state");
						var aHtml = "";
						aHtml += '<a href="project_details.jsp?project_sn='+project_sn+'">详情</a>';
						if(state == 10){
							
						}else if(state == 20){
							
						}else if(state == 30){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_appoint.jsp?project_sn='+project_sn+'">签约</a>';
						}else if(state == 40){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_receipt.jsp?project_sn='+project_sn+'">项目账单</a>';
						}else if(state == 50){
							
						}else if(state == 60){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="project_check.jsp?project_sn='+project_sn+'">验收</a>';
						}else if(state == 70){
							
						}else if(state == 100){
							aHtml +='&nbsp;&nbsp;&nbsp;&nbsp;';
							aHtml += '<a href="#?project_sn='+project_sn+'">评价</a>';
						}else{
							
						}
						return aHtml;
					},
				];
				var datalist = data.getXCOListValue("projects");
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