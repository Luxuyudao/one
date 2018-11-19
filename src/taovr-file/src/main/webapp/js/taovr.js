var tvr_project_state = [
    [10, '待审核'],
    [20, '已审核'],
    [30, '待签约'],
    [40, '待付款'],
    [50, '实施中'],
    [60, '待验收'],
    [70, '待结案'],
    [100, '已完成'],
];
var tvr_case_state = [
     [0, '无效'],
     [10, '新提交(审核中)'],
     [20, '重新提交(审核中)'],
     [30, '未通过'],
     [100,'已通过'],
 ];
var tvr_task_state = [
 	 [10, '未审核'],
 	 [20, '已审核'],
 	 [30, '实施中'],
 	 [40, '待初验'],
 	 [50, '待终验'],
 	 [60, '待付款'],
 	 [70, '待结案'],
 	 [100, '已完成'],
  ];
var case_audit_type=[
     [1,2,10],//服务商资质案例
     [1,1,20],//顾问资质案例
     [2,2,30],//服务商新增案例
     [2,1,40],//顾问新增案例
 ];
var case_audit_type_state=[
     [10,'服务商资质案例'],//服务商资质案例
     [20,'顾问资质案例'],//顾问资质案例
     [30,'服务商新增案例'],//服务商新增案例
     [40,'顾问新增案例'],//顾问新增案例
 ];
var tvr_bill_title_state=[
      [1,'项目款'],
      [2,'顾问费'],
      [3,'服务费'],
  ];

  var tvr_bill_state=[
      [0,'无效'],
      [10,'未支付'],
      [20,'支付中'],
      [30,'支付失败'],
      [100,'支付成功'],
  ];
var audit_state=[
	[0, '未认证'],
	[10, '新提交(审核中)'],
	[20, '重新提交(审核中)'],
	[30, '未通过'],
	[100,'已通过'],
];

function getAuditState(state){
 	var stateDesc = '';
 	for(var i = 0; i < audit_state.length; i++){
 		if(state == audit_state[i][0]){
 			stateDesc = audit_state[i][1];
 			break;
 		}
 	}
 	return stateDesc;
 }
//账单名称生成
  function getBillTitleState(project_name,state){
  	var stateDesc=project_name+'-';
  	for(var i=0;i<tvr_bill_title_state.length;i++){
  		if(state==tvr_bill_title_state[i][0]){
  			stateDesc+=tvr_bill_title_state[i][1];
  			break;
  		}
  	}
  	return stateDesc;
  }

  function getBillState(state){
  	var stateDesc='';
  	for(var i=0;i<tvr_bill_state.length;i++){
  		if(state==tvr_bill_state[i][0]){
  			stateDesc=tvr_bill_state[i][1];
  			break;
  		}
  	}
  	return stateDesc;
  }
function getCaseAuditTypeState(state){
 	var stateDesc = '';
 	for(var i = 0; i < case_audit_type_state.length; i++){
 		if(state == case_audit_type_state[i][0]){
 			stateDesc = case_audit_type_state[i][1];
 			break;
 		}
 	}
 	return stateDesc;
 }
function getCaseAuditType(in_page,role){//in_page:[1.]
	var type='';
	for(var i=0;i<case_audit_type.length;i++){
		if(in_page==case_audit_type[i][0]&&role==case_audit_type[i][1]){
			type=case_audit_type[i][2];
			break;
		}
	}
	return type;
}
 function getCaseState(state){
 	var stateDesc = '';
 	for(var i = 0; i < tvr_case_state.length; i++){
 		if(state == tvr_case_state[i][0]){
 			stateDesc = tvr_case_state[i][1];
 			break;
 		}
 	}
 	return stateDesc;
 }
 function getTaskState(state){
 	var stateDesc = '';
 	for(var i = 0; i < tvr_task_state.length; i++){
 		if(state == tvr_task_state[i][0]){
 			stateDesc = tvr_task_state[i][1];
 			break;
 		}
 	}
 	return stateDesc;
 }
 function getTaskCtrlState(ctrl_state,state,mark){
 	var stateDesc = '';
 	if(ctrl_state == 1){
 		if(mark==0){
 			stateDesc = getTaskState(state);
 		}
 		if(mark==1){
 			if(state==10){
 				stateDesc='待审核(未通过)';
 			}
 			if(state==30){
 				stateDesc='实施中(被驳回)';
 			}
 			if(state==40){
 				stateDesc='待初验(被驳回)';
 			}
 		}
 	}
 	if(ctrl_state == 2){
 		stateDesc = '已取消';
 	}
 	if(ctrl_state == 3){
 		stateDesc = '已终止';
 	}
 	return stateDesc;
 }
 
 function getTaskCtrlState2(ctrl_state,state,mark){
	 	var stateDesc = '';
	 	if(ctrl_state == 1){
	 		if(mark==0){
	 			stateDesc = getTaskState(state);
	 		}
	 		if(mark==1){
	 			if(state==10){
	 				stateDesc='待审核(未通过)';
	 			}
	 			if(state==30){
	 				stateDesc='实施中(被驳回)';
	 			}
	 		}
	 	}
	 	if(ctrl_state == 2){
	 		stateDesc = '已取消';
	 	}
	 	if(ctrl_state == 3){
	 		stateDesc = '已终止';
	 	}
	 	return stateDesc;
	 }

var tvr_examine_state=[
    [1,'未通过'],
    [2,'通过'],
];

var globle_page_size = 5;

function tvrAlert(msg){
	jAlert(msg, '警告框');
}

function tvrConfirm(msg){
	var flag = false;
	jConfirm(msg,"确认框", function(r) {
	    flag = r;
	});
	return flag;
}
//编辑附件
function getResources(fjHtml,resource){
	fjHtml += '<div class="form-group">';
	fjHtml += '	<label></label>';
	fjHtml += '	<a href="' + resource.getStringValue("url")
				+ '">' + resource.getStringValue("title")
				 + '</a>';
	fjHtml += '</div>';
	return fjHtml;
}

//编辑附件
function getResources2(fjHtml,resource){
	
	fjHtml += '<li class="overhidden mar-t-10" >';
	fjHtml += '<span class="fl">';
	fjHtml += ""+resource.getStringValue("title")+"";
	fjHtml += '</span>';
	fjHtml += '<a href="/down.xco?id='+ resource.getLongValue("res_id") +'"style="margin-left:10%">下载</a>';
	fjHtml += '</li>';
	return fjHtml;
}

//没有附件
function getResourcesNull(fjHtml){
	fjHtml += '<div class="form-group">';
	fjHtml += '	<label></label>';
	fjHtml += '	<span>暂无</span>';
	fjHtml += '</div>';
	return fjHtml;
}

function getExamineState(state){
	var stateDesc='';
	for(var i=0;i<tvr_examine_state.length;i++){
		if(state==tvr_examine_state[i][0]){
			stateDesc=tvr_examine_state[i][1];
			break;
		}
	}
	return stateDesc;
}

function getProjectState(state){
	var stateDesc = '';
	for(var i = 0; i < tvr_project_state.length; i++){
		if(state == tvr_project_state[i][0]){
			stateDesc = tvr_project_state[i][1];
			break;
		}
	}
	return stateDesc;
}

////判断浏览器是否支持H5视频播放
function checkVideo() {
    if (!!document.createElement('video').canPlayType) {
        var vidTest = document.createElement("video");
        oggTest = vidTest.canPlayType('video/ogg; codecs="theora, vorbis"');
        if (!oggTest) {
            h264Test = vidTest.canPlayType('video/mp4; codecs="avc1.42E01E, mp4a.40.2"');
            if (!h264Test) {
                return false;
            }
            else {
                if (h264Test == "probably") {
                }
                else {
                    alert("该浏览器不支持播放该视频")
                }
            }
        }
        else {
            if (oggTest == "probably") {
            }
            else {
                 alert("该浏览器不支持播放该视频")
            }
        }
    }
    else {
        alert("该浏览器不支持播放该视频")
    }
}

//上传文件个数不超过一个
function isFileOne(length){
	if(length==1){
		jAlert("文件上传个数不能超过一个！","错误提示");
		return 1;
	}
	return 0;
}
//上传文件个数不超过五个
function isFileFive(length){
	if(length==5){
		jAlert("文件上传个数不能超过五个！","错误提示");
		return 1;
	}
	return 0;
}
//判断文件格式是否是MP4
function isFileVideo(str){
	var prfix = '';
	if(str.indexOf(".") > -1){
		prefix = $.trim(str.substring(str.lastIndexOf(".")+1,str.length));
		if(prefix.toUpperCase() != "MP4"){
			jAlert("请上传mp4格式的视频文件","错误提示");
			return 1;
		}
	}
	return 0;
}
//判断文件格式是否是图片
function isFilePhoto(str){
	var prfix = '';
	if(str.indexOf(".") > -1){
		prefix = $.trim(str.substring(str.lastIndexOf(".")+1,str.length));
		if(prefix.toUpperCase() != "JPG"&&prefix.toUpperCase() != "PNG"){
			jAlert("请上传jpg或png格式的图片文件","错误提示");
			return 1;
		}
	}
	return 0;
}
//判断文件格式是否是文档
function isFileText(str){
	var prfix = '';
	if(str.indexOf(".") > -1){
		prefix = $.trim(str.substring(str.lastIndexOf(".")+1,str.length));
		if(prefix.toUpperCase() != "PDF"&&prefix.toUpperCase() != "DOC"&&prefix.toUpperCase() != "DOCX"){
			jAlert("请上传pdf、doc或docx格式的文件","错误提示");
			return 1;
		}
	}
	return 0;
}
//判断文件格式是否是压缩文件
function isFileRar(str){
	var prfix = '';
	if(str.indexOf(".") > -1){
		prefix = $.trim(str.substring(str.lastIndexOf(".")+1,str.length));
		if(prefix.toUpperCase() != "RAR"&&prefix.toUpperCase() != "ZIP"){
			jAlert("请上传rar或zip格式的图片文件","错误提示");
			return 1;
		}
	}
	return 0;
}