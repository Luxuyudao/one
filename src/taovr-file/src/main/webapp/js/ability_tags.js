/*******************************************************************
 * 1、页面调用       ability_tags.init(render);
 * 2、需要分类回显    ability_tags.init(类型分类,names);
 *******************************************************************/

var ability_tags = {
		type:0,
		names:'',
		render:'',
		init:function(render,type,names){
			if(type){
				this.type=type;
			}
			if(names){
				this.names = names;
			};
			if(render){
				this.render = render;
			}
			this.queryArea();
		},
		queryArea:function(){
			var url = "/tvr-system/renderabilittagslist.xco";
			var xco = new XCO();
			xco.setIntegerValue("type", this.type);
			var options = {
				url : url,
				data : xco,
				success : ability_tags.parsedata
			};
			$.doXcoRequest(options);
		},
		parsedata:function(xco){
			var _dataList = {};
			var len = 0;
			if(xco.getXCOListValue("data")){
				_dataList = xco.getXCOListValue("data");
				len = _dataList.length;
			}
			var str = "";
			if(len > 0){
				for ( var i = 0; i < len; i++) {
					str+="<input type=\"checkbox\" style=\"margin-left:10px;\" id='"+_dataList[i].getObjectValue("id")+"' value='"+_dataList[i].getObjectValue("name")+"'>";
					str+=""+_dataList[i].getObjectValue("name")+"";
				}
			}
			console.log(str);
			$("#aa").append(str);
		}
}