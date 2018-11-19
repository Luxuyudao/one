function XCO() {
	this.dateMap = new XCOHashMap();
	this.fieldList = new Array();
	this.fieldValueList = new Array();
	this.attachObject = new Object();
	
	this.getCode = function(){
		return this.dateMap.get('$$CODE').getValue();
	}
	
	this.getMessage = function(){
		return this.dateMap.get('$$MESSAGE').getValue();
	}
	this.get = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue();
		return value;
	}
	this.putItem = function(key, fieldValue){
		var oldValue = this.dateMap.put(key, fieldValue);
		if (oldValue == null) {
			this.fieldList.push(key);
			this.fieldValueList.push(fieldValue);
		} else {
			var index = 0;//this.fieldList.indexOf(key);
			for ( var i = 0; i < this.fieldList.length; i++) {
				if (this.fieldList[i] == key) {
					index = i;
					break;
				}
			}
			this.fieldValueList[index]= fieldValue;
		}
	}
	
	this.getObjectValue = function(field) {
		var fieldValue = this.dateMap.get(field);
		if (null != fieldValue && undefined != fieldValue) {
			return fieldValue.getValue();
		}
		return null;
	}
	this.setField = function(field,fieldValue) {
		this.putItem(field, fieldValue);
	}

	this.getField = function(field) {
		return this.dateMap.get(field);
	}
	this.exists = function(field) {
		return this.dateMap.containsKey(field);
	}
	this.isEmpty = function() {
		return this.dateMap.size() == 0;
	}
	this.keys = function() {
		return this.dateMap.keySet();
	}
	this.keysList = function() {
		return this.fieldList;
	}
	
	// ///set....
	
	this.setXCOValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new XCOField(field, fieldValue));
	}

	this.setXCOArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new XCOArrayField(field, fieldValue));
	}
	this.setXCOListValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new XCOListField(field, fieldValue));
	}
	this.setShortValue = function(field, fieldValue) {
		this.setField(field, new ShortField(field, fieldValue));
	}

	this.setShortArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new ShortArrayField(field, fieldValue));
	}

	this.setLongValue = function(field, fieldValue) {
		this.setField(field, new LongField(field, fieldValue));
	}

	this.setLongArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new LongArrayField(field, fieldValue));
	}

	this.setFloatValue = function(field, fieldValue) {
		this.setField(field, new FloatField(field, fieldValue));
	}

	this.setFloatArrayValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new FloatArrayField(field, fieldValue));
	}

	this.setDoubleValue = function(field, fieldValue) {
		this.setField(field, new DoubleField(field, fieldValue));
	}

	this.setDoubleArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new DoubleArrayField(field, fieldValue));
	}

	this.setCharValue = function(field, fieldValue) {
		this.setField(field, new CharField(field, fieldValue));
	}

	this.setCharArrayValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new CharArrayField(field, fieldValue));
	}


	this.setDateTimeValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new DateField(field, fieldValue));
	}

	this.setDateValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new SqlDateField(field, fieldValue));
	}

	this.setTimeValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new SqlTimeField(field, fieldValue));
	}

	this.setTimestampValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new TimestampField(field, fieldValue));
	}

	this.setBigIntegerValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new BigIntegerField(field, fieldValue));
	}


	this.setIntegerValue = function(field,  fieldValue) {
		this.setField(field, new IntegerField(field, fieldValue));
	}

	this.setIntegerArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new IntegerArrayField(field, fieldValue));
	}

	this.setStringValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new StringField(field, fieldValue));
	}

	this.setStringArrayValue = function(field,  fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		this.setField(field, new StringArrayField(field, fieldValue));
	}
	
	// ///get....
	
	this.getXCOValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue();
		return value;
	}

	this.getXCOArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue();
		return value;
	}
	this.getXCOListValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue) {
			return null;
		}
		var value = fieldValue.getValue();
		return value;
	}
	this.getShortValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("SHORT_TYPE");
		return value;
	}

	this.getShortArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("SHORT_ARRAY_TYPE");
		return value;
	}

	this.getLongValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("LONG_TYPE");
		return value;
	}

	this.getLongArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("LONG_ARRAY_TYPE");
		return value;
	}

	this.getFloatValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("FLOAT_TYPE");
		return value;
	}

	this.getFloatArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("FLOAT_ARRAY_TYPE");
		return value;
	}

	this.getDoubleValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("DOUBLE_TYPE");
		return value;
	}

	this.getDoubleArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("DOUBLE_ARRAY_TYPE");
		return value;
	}

	this.getCharValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("CHAR_TYPE");
		return value;
	}

	this. getCharArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("CHAR_ARRAY_TYPE");
		return value;
	}


	this.getDateTimeValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("DATE_TYPE");
		return value;
	}

	this.getDateValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("SQLDATE_TYPE");
		return value;
	}

	this.getTimeValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("SQLTIME_TYPE");
		return value;
	}

	this.getTimestampValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("TIMESTAMP_TYPE");
		return value;
	}

	this.getBigIntegerValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("BIGINTEGER_TYPE");
		return value;
	}


	this.getIntegerValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("INT_TYPE");
		return value;
	}

	this.getIntegerArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("INT_ARRAY_TYPE");
		return value;
	}

	this.getStringValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("STRING_TYPE");
		return value;
	}

	this.getStringArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return ;
		}
		var value = fieldValue.getValue("STRING_ARRAY_TYPE");
		return value;
	}
	
	
	this.xcoToxml = function(url,htmlObj) {
		var formNew = "<form id=\"hidForm\" method=\"post\" action=\"\" style=\"display:none\">"+
				  		"<input name=\"xml\" value=\"\" id=\"con\"/>"+
				  		"<input type=\"submit\" >"+
				  	"</form>";
		htmlObj.append(formNew);
		$("#hidForm").attr("action",url);
		$("#hidForm").find("#con").val(this.toString());
		$("#hidForm").submit();
	}

	this.toString = function() {
		return this.toXML();
	}
	// 字符串转化为xml
	this.fromXML = function(source){
	    var xmlDoc = null;
	    if (window.ActiveXObject) {
	        var ARR_ACTIVEX = ["MSXML4.DOMDocument","MSXML3.DOMDocument","MSXML2.DOMDocument","MSXML.DOMDocument","Microsoft.XmlDom"];
	        var XmlDomflag = false;
	        for (var i = 0;i < ARR_ACTIVEX.length && !XmlDomflag ;i++) {
	            try {
	                var objXML = new ActiveXObject(ARR_ACTIVEX[i]);
	                xmlDoc = objXML;
	                XmlDomflag = true;
	            } catch (e) {
	            }
	        }
	        if (xmlDoc) {  
	            xmlDoc.async = false;
	            xmlDoc.loadXML(source);
	        }
	    }else{
		   var parser=new DOMParser();
		   var xmlDoc=parser.parseFromString(source,"text/xml");
		}
//	    var xco = new XCO();
//	    xco.fromXML0(xmlDoc);
//	    return xco;
	    this.fromXML0(xmlDoc);
	}



	// 操作
	this.fromXML0 = function(xmlDoc){
		var elements;
		if(xmlDoc.getElementsByTagName("X").length >= 1){
			elements = xmlDoc.getElementsByTagName("X")[0].childNodes;
		}else{
			elements = xmlDoc.childNodes;
		}
		for (var i=0;i<elements.length;i++){
			var node = elements[i];
			var tag = node.tagName;
			if ("S"==tag) { // string
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new StringField(k, v));
			}else if ("I"==tag) { //
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new IntegerField(k, v));
			}else if ("L"==tag) { // long
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new LongField(k, v));
			} else if ("F"==tag) { // float
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new FloatField(k, v));
			} else if ("D"==tag) { // double
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new DoubleField(k, v));
			} else if ("C"==tag) { // char
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new CharField(k, v));
			} else if ("O"==tag) { // boolean
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new BooleanField(k, v));
			} else if ("X"==tag) { // xco
				var k = node.getAttribute("K");
				var xco = new XCO();
				xco.fromXML0(node);
				this.putItem(k, new XCOField(k, xco));
			}else if ("A"==tag) { // DateField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new DateField(k, v));
			}else if ("E"==tag) { // SqldateField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				if(v!=null){
					v+=" 12:00:00";
				}
				this.putItem(k, new SqldateField(k, v));
			}else if ("G"==tag) { // SqlTimeField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				if(v!=null){
					v="1970-01-01 "+V;
				}
				this.putItem(k, new SqlTimeField(k, v));
			}else if ("M"==tag) { // bigDicimal
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new LongField(k, v));
			}else if ("SA"==tag) { // string[]
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var i = 0;
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="S") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					array[i++] = child.getAttribute("K");
				}
				var fieldValue = new StringArrayField(k, array);
				this.putItem(k, fieldValue);
			}else if ("SL"==tag) {
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var i = 0;
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="S") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					array[i++] = child.getAttribute("K");
				}
				var fieldValue = new stringListField(k, array);
				this.putItem(k, fieldValue);
			}else if ("SS"==tag) { 
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var i = 0;
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="S") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					array[i++] = child.getAttribute("K");
				}
				var fieldValue = new StringSetField(k, array);
				this.putItem(k, fieldValue);
			}else if ("XL"==tag) { // xco list
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="X") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos.push(xco);
				}
				var fieldValue = new XCOListField(k, xcos);
				this.putItem(k, fieldValue);
			} else if ("XS"==tag) { // xco set
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="X") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos.push(xco);
				}
				var fieldValue = new XCOSetField(k, xcos);
				this.putItem(k, fieldValue);
			} else if ("IA"==tag) { // int[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new IntegerArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("LA"==tag) { // long[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new LongArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("FA"==tag) { // float[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new FloatArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("DA"==tag) { // double[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new DoubleArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("OA"==tag) { // boolean[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new BooleanArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("SA"==tag) { // string[]
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var i = 0;
				for (var j=0;j<childList.length;j++){
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="S") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					array[i++] = child.getAttribute("V");
				}
				var fieldValue = new StringArrayField(k, array);
				this.putItem(k, fieldValue);
			} else if ("XA"==tag) { // xco[]
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for (var i = 0; i < childList.length; i++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!childTag=="X") {
						throw new XCOException("Parse xml error: unexpected Tag name " + childTag + " under " + tag);
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos[i] = xco;
				}
				var fieldValue = new XCOArrayField(k, xcos);
				this.putItem(k, fieldValue);
			}else { // string
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new StringField(k, v));
			}
		}
	}
	
	
	this.toXMLString = function(key,builder) {
		if (null == key) {
			builder.append("<X>");
		} else {
			builder.append("<X K=\"" + key + "\">");
		}
		for (var i = 0, size = this.fieldValueList.length; i < size; i++) {
			this.fieldValueList[i].toXMLString(builder);
		}
		builder.append("</X>");
		return builder.toString();
	}
	this.toXML = function() {
		var builder = new XCOStringBuilder();
		builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		this.toXMLString(null, builder);
		return builder.toString();
	}
	
}// xco end


// Map定义
function XCOHashMap(){
	// 定义长度
	var length = 0;
	// 创建一个对象
	var obj = new Object();

	/**
	 * 判断Map是否为空
	 */
	this.isEmpty = function(){
		return length == 0;
	};

	/**
	 * 判断对象中是否包含给定Key
	 */
	this.containsKey=function(key){
		return (key in obj);
	};

	/**
	 * 判断对象中是否包含给定的Value
	 */
	this.containsValue=function(value){
		for(var key in obj){
			if(obj[key] == value){
				return true;
			}
		}
		return false;
	};

	/**
	 * 向map中添加数据
	 */
	this.put=function(key,value){
		var oldValue = null;
		if(!this.containsKey(key)){
			length++;
		}else{
			oldValue = obj[key];
		}
		obj[key] = value;
		return oldValue;
	};

	/**
	 * 根据给定的Key获得Value
	 */
	this.get=function(key){
		return this.containsKey(key)?obj[key]:null;
	};

	/**
	 * 根据给定的Key删除一个值
	 */
	this.remove=function(key){
		if(this.containsKey(key)&&(delete obj[key])){
			length--;
		}
	};

	/**
	 * 获得Map中的所有Value
	 */
	this.values=function(){
		var _values= new Array();
		for(var key in obj){
			_values.push(obj[key]);
		}
		return _values;
	};

	/**
	 * 获得Map中的所有Key
	 */
	this.keySet=function(){
		var _keys = new Array();
		for(var key in obj){
			_keys.push(key);
		}
		return _keys;
	};

	/**
	 * 获得Map的长度
	 */
	this.size = function(){
		return length;
	};

	/**
	 * 清空Map
	 */
	this.clear = function(){
		length = 0;
		obj = new Object();
	};
}
//异常定义
function XCOException(message) {  
    this.name = "XCOException";  
    this.message = message;
    this.toString = function () {  
		// note that name and message are properties of Error  
		return this.name + ": "+this.message;  
	}
}

//----------------------------field------------------------


function XCOStringBuilder() { 

	this.buf = [];

	this.append = function(str) {    
		this.buf.push(str);    
		return this;
	};

	this.toString = function() {   
		return this.buf.join("");
	}; 
	
	this.length = function() {   
		return this.buf.length;
	};    
} 


function BooleabField(){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	
	
	this.toXMLString=function(builder){		
		builder.append("<B K=\"");
		builder.append(this.name);
		builder.append("\"V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":\"").append(this.value).append("\"");
	};
	
}	

function StringField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<S K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(name).append("\"").append(":\"").append(value).append("\"");
	};
}

function IntegerField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};

	this.toXMLString=function(builder){
		builder.append("<I K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append(this.value);
	};
}
function BooleanField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<O K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append(this.value);
	};
}

function LongField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	this.toXMLString=function(builder){
		builder.append("<L K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append(this.value);
	};

}

function FloatField(name,value){
	this.name = name;
	thia.value = value;
	
	this.getValue=function(dataType){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<F K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append(this.value);
	};
		
}

function DoubleField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<D K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append(this.value);

	};
}

function DateField(name, value){

	this.name = name;
	this.value = value;
	
	this.getValue=function(){
//		return formatDate(this.value,0);
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<A K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
//		builder.append(formatDate(this.time,0));
		builder.append(this.time);
		builder.append("\"/>");
	
	};
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":\"").append(formatDate(this.time,0)).append("\"");
	}; 
	
}

function SqlTimeField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return formatDate(this.value,2);;
	};
	
	this.toXMLString=function(bulider){
		builder.append("<G K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(formatDate(this.time,2));
		builder.append("\"/>");
	};
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":\"").append(formatDate(this.time,2)).append("\"");
	};
}

function XCOField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		value.toXMLString(this.name, builder);
	};
	
	this.toJSONString=function(){
		builder.append("\"").append(name).append("\"").append(":").append(this.value.toJSONString());
	};
	
}
	
function SqldateField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		//转换时间
		formatDate(this.time,1);
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":\"").append(formatDate(this.time,1)).append("\"");
	};
		

	this.toXMLString=function(Builder) {
		builder.append("<E K=\"");
		builder.append(this.name);
		builder.append("\" K=\"");
		builder.append(formatDate(this.time,1));
		builder.append("\"/>");
	};
}		
	
function StringArrayField(name,value){
	this.name=name;
	this.value=value;
	
	this.getVlaue=function(){
		var arr=new Array();
		for(var i=0;i<value.length;i++){
			arr.push(value[i]);
		}
		return arr;	
	};

	
	this.toXMLString=function(builder){
		builder.append('<SA  K ='+name+'>');
		for(var i=0;i<value.length;i++){
			builder.append('"<S V='+value[i]+'"');
		}
		builder.append('</SA>');
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append('"'+this.value[i]+'"');
		}
		builder.append("]");
	};
}

function IntegerArrayField(name,value){
	this.name=name;
	this.value=value;

	this.getValue=function(value){
		var arr=new Array();
		for(var i=0;i<value.length;i++){
			arr.push(value[i]);
		}
		return arr;
	};

	this.toXMLString=function(builder){
		builder.append('<IA  K ="'+name+'"');
		for(var i=0;i<value.length;i++){
			builder.append('<I V="'+value[i]+'"/>');
		}
		builder.append('</IA>');
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	};
	
}

function doubleArrayField(name,value){
	this.name=name;
	this.value=value;
	getValue=function(value){
		var arr=new Array();
		for(var i=0;i<value.length;i++){
			arr.push(value[i]);
		}
		return arr;	
	};
	
	
	this.toXMLString=function(builder){
		builder.append('<DA  K ='+name+'');
		for(var i=0;i<value.length;i++){
			builder.append('<D V="'+parseInt(value[i])+'"/>');
		}
		builder.append('</DA>');
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	};
}	

function LongArrayField(name,value){
	this.name=name;
	this.value=value;
	
	this.getValue=function(value){
		var arr=new Array();
		for(var i=0;i<value.length;i++){
			arr.push(value[i]);
		}
		return arr;	
	};
	
	this.toXMLString=function(builder){
		builder.append('<LA  K ='+name+'');
		for(var i=0;i<value.length;i++){
			builder.append('<L V="'+parseLong(value[i])+'"/>');
		}
		builder.append('</LA>');
	};
	
	this.toJSONString=function(){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	};	
	
};

function stringListField(name,value){
	this.name=name;
	this.value=value;
	this.getValue=function(value){
		var arr=new Array();
		for(var i=0;i<value.length;i++){
			arr.push(value[i]);
		}
	return arr;	
	};
	
	this.toXMLString=function(builder){
		builder.append('<SL  K ='+name+'>');
		for(var i=0;i<value.length;i++){
			builder.append('<S V="'+value[i]+'"/>');
		}
		builder.append('</SL>');
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append('"'+this.value[i]+'"');
		}
		builder.append("]");
	};
}

function XCOListField(name,value){
	this.name = name;
	this.value = value;
	
	this.getValue=function(){
		return value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<XL K=\"" + this.name + "\">");
		for (var i = 0; i < value.length; i++) {
			value[i].toXMLString(null, builder);
		}
		builder.append("</XL>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i].toJSONString());
		}
		builder.append("]");
	};
	
}
function XCOArrayField(name,value){
	this.name = name;
	this.value = value;
	this.getValue=function(value){
		return value;
	};
	this.toXMLString=function(builder){
			builder.append("<XA K=\"" + this.name + "\">");
			for (var i = 0;  i < value.length; i++) {
				value[i].toXMLString(null, builder);
			}
			builder.append("</XA>");
	};		
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i].toJSONString());
		}
		builder.append("]");
	};	
}

function StringSetField(name,value){
	this.name=name;
	this.value=value;
	
	this.getValue=function(){
		return this.value;
	};
	
	this.toXMLString=function(builder){
		builder.append("<SS K=\"");
		builder.append(this.name);
		builder.append("\">");
		for (var i=0;i<value.length;i++) {
			builder.append("<S v=\"" + value[i] + "\"/>");
		}
		builder.append("</SS>");
	};
	
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i=0;i<value.length;i++) {
			if (i> 0) {
				builder.append(",");
			}
			builder.append("\"");
			builder.append(value[i]);
			builder.append("\"");
		}
		builder.append("]");
	};
}

function XcoSetField(name,value){
	this.name=name;
	this.value=value;
	
	this.getValue=function(){
		return value;
	};
	this.toXMLString=function(builder){
		builder.append("<XS k=\"" + this.name + "\">");
		for (var i=0;i<value.length;i++) {
			value[i].toXMLString(null, builder);
		}
		builder.append("</XS>");
	};
	this.toJSONString=function(builder){
		builder.append("\"").append(this.name).append("\"").append(":").append("[");
		for (var i=0;i<value.length;i++) {
			if (i> 0) {
				builder.append(",");
			}
			builder.append(xco.toJSONString());
		}
		builder.append("]");
	};

}

function   formatDate(time,type)   {   
		  var   now=new   Date(time);   
          var   year=now.getYear();   
          var   month=now.getMonth()+1;   
          var   date=now.getDate();   
          var   hour=now.getHours();   
          var   minute=now.getMinutes();   
          var   second=now.getSeconds();
          //0-util.date  1- sql.date 2-sql.time
          if(type==0){
        	  return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second;    
          };
          if(type==1){
        	  return   year+"-"+month+"-"+date;   
          };
          if(type==2){
        	  return  hour+":"+minute+":"+second;   
          }
         
}