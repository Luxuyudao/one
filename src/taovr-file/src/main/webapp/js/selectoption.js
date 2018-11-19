/********************************************************************
 * 初始化 数据字段 下拉项
 ********************************************************************/
var selectoption = {
		
		renderId:   "",//页面渲染ID
		
		groupKey:  "",//数据字典groupKey
		
		selectValue:"",//当前选择项的值
		
		isSelect:true,//是否带--请选择--  默认带
		
		init:function(renderId,groupKey,selectValue,isSelect){
			if(renderId){
				this.renderId = renderId;
			}else{
				console.error("select render Id cannot be empty!");
				return;
			}
			if(groupKey){
				this.groupKey = groupKey;
			}else{
				console.error("select datadict's group_key cannot be empty!");
				return;
			}
			this.selectValue = selectValue;
			if(null!=isSelect){
				this.isSelect = isSelect;
			}
			this.queryData(groupKey);
		},
		
		queryData:function(groupKey){
			var url = "/tvr-system/getdictList.xco";
			var xco = new XCO();
			xco.setStringValue("group_key", groupKey);
			var options = {
					url : url,
					data : xco,
					success : selectoption.parsedata
			};
			$.doXcoRequest(options);
		},
		
		parsedata:function(data){
			if (data.getCode() != 0) {
				console.error("init select is fail!");
				return;
			} else {
				var list = data.get("data");
				var total = data.get("total");
				if(selectoption.isSelect){
					$("#"+selectoption.renderId).append("<option value=''>--请选择--</option>")
				}
				if(total>0){
					for(var i=0;i<list.length;i++){
						$("#"+selectoption.renderId).append("<option value='"+list[i].get("dict_key")+"' "+(list[i].get("dict_key")==selectoption.selectValue?"selected":"")+">"+list[i].get("value")+"</option>");
					}
				}
			}
		}
}