/*******************************************************************
 * 1、页面调用       province_city_area.init();
 * 2、需要分类回显   province_city_area.init(一级分类,二级分类,三级分类);
 *******************************************************************/

var init_task_catg = {
		firstCode:'',
		secondCode:'',
		thirdCode:'',
		init:function(first,second,third){
			if(first){
				this.firstCode = first;
			};
			if(second){
				this.secondCode = second;
			};
			if(third){
				this.thirdCode = third;
			};
			this.queryArea();
		},
		queryArea:function(fid, level){
			var url = "/file/rendtasklist.xco";
			var xco = new XCO();
			if (fid != null) {
				xco.setIntegerValue("fid", fid);
			}
			if (level != null) {
				xco.setIntegerValue("level", level);
			}else{
				xco.setIntegerValue("level", 1);
			}
			var options = {
				url : url,
				data : xco,
				success : init_task_catg.parsedata
			};
			$.doXcoRequest(options);
		},
		parsedata:function(xco){
			var total = 0;
			if(xco.getObjectValue("total")){
				total = xco.getObjectValue("total");
			};
			var len  = 0;
			var level = 0;
			var _dataList = {};
			if(xco.getXCOListValue("data")){
				_dataList = xco.getXCOListValue("data");
				len = _dataList.length;
				level = _dataList[0].getObjectValue("level");
			}
			var str = "<option value='0' >--请选择--</option>";
			if(total > 0){
				for ( var i = 0; i < len; i++) {
					if(level == 1){
						if(init_task_catg.firstCode == _dataList[i].getObjectValue("id")){
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "' selected>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}else{
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "'>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}
					}
					if(level == 2){
						if(init_task_catg.cityCode == _dataList[i].getObjectValue("id")){
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "' selected>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}else{
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "'>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}
					}
					if(level == 3){
						if(init_task_catg.areaCode == _dataList[i].getObjectValue("id")){
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "' selected>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}else{
							str += "<option value='"+ _dataList[i].getObjectValue("id")+ "'>"+ _dataList[i].getObjectValue("name")+ "</option>";
						}
					}
					
				}
			}
			if (level == 1) {
				$("#first").html(str);
				$("#second").html("<option value=0 >--请选择--</option>");
				$("#third").html("<option value=0 >--请选择--</option>");
				$("#first").bind("change",function() {
					var fid = $(this).val();
					if (fid != 0) {
						init_task_catg.queryArea(fid, 2);
					}
				});
				//触发查找市事件
				if(init_task_catg.firstCode){
					init_task_catg.queryArea(init_task_catg.firstCode, 2);
				}
			}
			if (level == 2) {
				$("#second").html(str);
				$("#second").bind("change", function() {
					var fid = $(this).val();
					if (fid != 0) {
						init_task_catg.queryArea(fid, 3);
					}
				});
				//触发查找县区事件
				if(init_task_catg.thirdCode){
					init_task_catg.queryArea(init_task_catg.thirdCode, 3);
				}
			}
			if (level == 3) {
				$("#third").html(str);
			}
		}
}