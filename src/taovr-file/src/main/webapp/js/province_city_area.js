/*******************************************************************
 * 1、页面调用       province_city_area.init();
 * 2、需要省地市回显   province_city_area.init(省编码,市级编码,县编码);
 *******************************************************************/

var province_city_area = {
		proviceCode:'',
		cityCode:'',
		areaCode:'',
		init:function(provice,city,area){
			if(provice){
				province_city_area.proviceCode = provice;
			};
			if(city){
				province_city_area.cityCode = city;
			};
			if(area){
				province_city_area.areaCode = area;
			}
			province_city_area.queryArea();
		},
		queryArea:function(area_code, area_level){
			var url = "/tvr-system/getAreaList.xco";
			var xco = new XCO();
			if (area_code != null) {
				xco.setStringValue("area_code", area_code);
			}
			if (area_level != null) {
				xco.setIntegerValue("area_level", area_level);
			}else{
				xco.setIntegerValue("area_level", 1);
			}
			var options = {
				url : url,
				data : xco,
				success : province_city_area.parsedata
			};
			$.doXcoRequest(options);
		},
		parsedata:function(xco){
			var total = xco.getObjectValue("total");
			var _dataList = xco.getXCOListValue("data");
			var len = _dataList.length;
			var level = _dataList[0].getObjectValue("area_level");
			var str = "<option value=0 >--请选择--</option>";
			for ( var i = 0; i < len; i++) {
				if(level == 1){
					if(province_city_area.proviceCode == _dataList[i].getObjectValue("area_code")){
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "' selected>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}else{
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "'>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}
				}
				if(level == 2){
					if(province_city_area.cityCode == _dataList[i].getObjectValue("area_code")){
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "' selected>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}else{
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "'>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}
				}
				if(level == 3){
					if(province_city_area.areaCode == _dataList[i].getObjectValue("area_code")){
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "' selected>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}else{
						str += "<option value='"+ _dataList[i].getObjectValue("area_code")+ "'>"+ _dataList[i].getObjectValue("area_name")+ "</option>";
					}
				}
				
			}
			if (level == 1) {
				$("#proj_province").html(str);
				$("#proj_city").html("<option value=0 >--请选择--</option>");
				$("#proj_area").html("<option value=0 >--请选择--</option>");
				$("#proj_province").bind("change",function() {
					var area_code = $(this).val();
					if (area_code != 0) {
						province_city_area.queryArea(area_code, 2);
					}
				});
				//触发查找市事件
				if(province_city_area.proviceCode){
					province_city_area.queryArea(province_city_area.proviceCode, 2);
				}
			}
			if (level == 2) {
				$("#proj_city").html(str);
				$("#proj_city").bind("change", function() {
					var area_code = $(this).val();
					if (area_code != 0) {
						province_city_area.queryArea(area_code, 3);
					}
				});
				//触发查找县区事件
				if(province_city_area.cityCode){
					province_city_area.queryArea(province_city_area.cityCode, 3);
				}
			}
			if (level == 3) {
				$("#proj_area").html(str);
			}
		}
}