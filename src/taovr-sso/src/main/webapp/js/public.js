
// 简单FORM参数采集
function simpleFormCollect(request, keyOptions){
	for(var k=0; k<keyOptions.length; k++){
		var item = keyOptions[k];
		var _itemKey = item.itemKey;
		var _type = item.type;
		var _xcoKey = item.xcoKey;
		var _ignore = item.ignore;
		if(undefined == _xcoKey){
			_xcoKey = _itemKey;
		}
		if(undefined == _type){
			_type = 'string';
		}
		if(undefined == _ignore){
			_ignore = true;
		}
		var _temp = $('#' + _itemKey).val();
		if(!_ignore || (_temp != '' && undefined != _temp)){
			setXCORequest(request, _type, _xcoKey, _temp);
		}
	}
}

function setXCORequest(request, type, key, val){
	if('int' == type){
		request.setIntegerValue(key, parseInt(val));
	} else if('long' == type){
		request.setLongValue(key, parseInt(val));
	} else if('string' == type){
		request.setStringValue(key, val);
	} else if('date' == type){
		request.setDateTimeValue(key, val);
	}
}

function renderTable(container, dataList, keyOptions, trClass, noclear){
	if(!noclear)$(container).empty();
		
	var html = '';
	var _trClass = '';
	if(undefined != trClass){
		_trClass = ' ' + trClass;
	}

	if(null == dataList || undefined == dataList){
		return;
	}

	for(var i=0; i<dataList.length; i++){
		var dataItem = dataList[i];
		
		html += '<tr'+ _trClass +'>';
		for(var k=0; k<keyOptions.length; k++){
			var dataKey = keyOptions[k];
			if('string' == typeof(dataKey)){
				html += '<td>'+ dataItem.get(dataKey) +'</td>';
			} else if('function' == typeof(dataKey)) {
				html += '<td>'+ dataKey(dataItem) +'</td>';
			} else if('object' == typeof(dataKey)) {
				var _key = dataKey.key;
				var _td = dataKey.td;
				var _handler = dataKey.handler;
				if(undefined != _key && undefined != _td){
					html += '<td '+ _td +'>'+ dataItem.get(_key) +'</td>';
				} else if(undefined != _handler && undefined != _td) {
					html += '<td '+ _td +'>'+ _handler(dataItem) +'</td>';
				} else {
					html += '<td>请不要这样使用</td>';
				}
			}
		}
		html += '</tr>';
	}
	$(container).append(html);
	//alert(html);
}
//填充详情信息
function showInfo(request, showOptions,isInput){
	for(var k=0; k<showOptions.length; k++){
		var item = showOptions[k];
		var _itemKey = item.itemKey;
		var _xcoKey = item.xcoKey;
		var _defaultVal = item.defaultVal;
		var _func = item.function;
		if(_itemKey.indexOf("#")<0 && _itemKey.indexOf(".")<0 ){
			_itemKey = "#"+_itemKey;
		}
		if(undefined == _xcoKey){//#.
			_xcoKey = _itemKey.substr(1,_itemKey.length);
		}
		if(undefined == _defaultVal){
			_defaultVal = '-';
		}
		var _temp = request.get(_xcoKey);
		
		if(undefined != _func){
			if(isInput){
				$(_itemKey).val(_func(_temp));
			}else{
				$(_itemKey).html(_func(_temp));
			}
		}else{
			if(_temp == null || undefined == _temp){
				_temp = _defaultVal
			}
			if(isInput){
				$(_itemKey).val(_temp);
			}else{
				$(_itemKey).html(_temp);
			}
		}
	}
}

function getURLparam(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}


function dataFormat(fmtCode,date){  
	var result,d,arr_d;  

	var patrn_now_1=/^y{4}-M{2}-d{2}\sh{2}:m{2}:s{2}$/;  
	var patrn_now_11=/^y{4}-M{1,2}-d{1,2}\sh{1,2}:m{1,2}:s{1,2}$/;  

	var patrn_now_2=/^y{4}\/M{2}\/d{2}\sh{2}:m{2}:s{2}$/;  
	var patrn_now_22=/^y{4}\/M{1,2}\/d{1,2}\sh{1,2}:m{1,2}:s{1,2}$/;  

	var patrn_now_3=/^y{4}年M{2}月d{2}日\sh{2}时m{2}分s{2}秒$/;  
	var patrn_now_33=/^y{4}年M{1,2}月d{1,2}日\sh{1,2}时m{1,2}分s{1,2}秒$/;  

	var patrn_date_1=/^y{4}-M{2}-d{2}$/;  
	var patrn_date_11=/^y{4}-M{1,2}-d{1,2}$/;  

	var patrn_date_2=/^y{4}\/M{2}\/d{2}$/;  
	var patrn_date_22=/^y{4}\/M{1,2}\/d{1,2}$/;  

	var patrn_date_3=/^y{4}年M{2}月d{2}日$/;  
	var patrn_date_33=/^y{4}年M{1,2}月d{1,2}日$/;  

	var patrn_time_1=/^h{2}:m{2}:s{2}$/;  
	var patrn_time_11=/^h{1,2}:m{1,2}:s{1,2}$/;  
	var patrn_time_2=/^h{2}时m{2}分s{2}秒$/;  
	var patrn_time_22=/^h{1,2}时m{1,2}分s{1,2}秒$/;  

	if(!fmtCode){
		fmtCode="yyyy/MM/dd hh:mm:ss";
	}  
	if(date){  
		d=new Date(date);  
		if(isNaN(d)){  
			msgBox("时间参数非法\n正确的时间示例:\nThu Nov 9 20:30:37 UTC+0800 2006\n或\n2006/      10/17");  
			return;
		}  
	}else{  
		d=new Date();  
	}  

	if(patrn_now_1.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"-"+arr_d.MM+"-"+arr_d.dd+" "+arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}  
	else if(patrn_now_11.test(fmtCode)) {  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"-"+arr_d.MM+"-"+arr_d.dd+" "+arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}  
	else if(patrn_now_2.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"/"+arr_d.MM+"/"+arr_d.dd+" "+arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}else if(patrn_now_22.test(fmtCode)){  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"/"+arr_d.MM+"/"+arr_d.dd+" "+arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}else if(patrn_now_3.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"年"+arr_d.MM+"月"+arr_d.dd+"日"+" "+arr_d.hh+"时"+arr_d.mm+"分"+arr_d.ss+"秒";  
	}else if(patrn_now_33.test(fmtCode)) {  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"年"+arr_d.MM+"月"+arr_d.dd+"日"+" "+arr_d.hh+"时"+arr_d.mm+"分"+arr_d.ss+"秒";  
	}else if(patrn_date_1.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"-"+arr_d.MM+"-"+arr_d.dd;  
	}else if(patrn_date_11.test(fmtCode)) {  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"-"+arr_d.MM+"-"+arr_d.dd;  
	}else if(patrn_date_2.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"/"+arr_d.MM+"/"+arr_d.dd;  
	}else if(patrn_date_22.test(fmtCode)) {  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"/"+arr_d.MM+"/"+arr_d.dd;  
	}else if(patrn_date_3.test(fmtCode)) {  
		arr_d=splitDate(d,true);  
		result=arr_d.yyyy+"年"+arr_d.MM+"月"+arr_d.dd+"日";  
	}else if(patrn_date_33.test(fmtCode)) {  
		arr_d=splitDate(d);  
		result=arr_d.yyyy+"年"+arr_d.MM+"月"+arr_d.dd+"日";  
	}else if(patrn_time_1.test(fmtCode)){  
		arr_d=splitDate(d,true);  
		result=arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}else if(patrn_time_11.test(fmtCode)){  
		arr_d=splitDate(d);  
		result=arr_d.hh+":"+arr_d.mm+":"+arr_d.ss;  
	}else if(patrn_time_2.test(fmtCode)){  
		arr_d=splitDate(d,true);  
		result=arr_d.hh+"时"+arr_d.mm+"分"+arr_d.ss+"秒";  
	}else if(patrn_time_22.test(fmtCode)){  
		arr_d=splitDate(d);  
		result=arr_d.hh+"时"+arr_d.mm+"分"+arr_d.ss+"秒";  
	}else{  
		msgBox("没有匹配的时间格式!");  
		return;  
	}  
	return result;  
};  
function splitDate(d,isZero){  
	var yyyy,MM,dd,hh,mm,ss;  
	if(isZero){  
		yyyy=d.getFullYear();  
		MM=(d.getMonth()+1)<10?"0"+(d.getMonth()+1):d.getMonth()+1;  
		dd=d.getDate()<10?"0"+d.getDate():d.getDate();  
		hh=d.getHours()<10?"0"+d.getHours():d.getHours();  
		mm=d.getMinutes()<10?"0"+d.getMinutes():d.getMinutes();  
		ss=d.getSeconds()<10?"0"+d.getSeconds():d.getSeconds();  
	}else{  
		yyyy=d.getFullYear();  
		MM=d.getMonth()+1;  
		dd=d.getDate();  
		hh=d.getHours();  
		mm=d.getMinutes();  
		ss=d.getSeconds();    
	}  
	return {"yyyy":yyyy,"MM":MM,"dd":dd,"hh":hh,"mm":mm,"ss":ss};    
}  

function msgBox(msg){  
	window.alert(msg);  
}
