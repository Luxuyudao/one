/**
 * HashMap
 * 
 * @returns {XCOHashMap}
 */
function XCOHashMap() {
	// 定义长度
	var length = 0;
	// 创建一个对象
	var obj = new Object();

	/**
	 * 判断Map是否为空
	 */
	this.isEmpty = function() {
		return length == 0;
	};

	/**
	 * 判断对象中是否包含给定Key
	 */
	this.containsKey = function(key) {
		return (key in obj);
	};

	/**
	 * 判断对象中是否包含给定的Value
	 */
	this.containsValue = function(value) {
		for ( var key in obj) {
			if (obj[key] == value) {
				return true;
			}
		}
		return false;
	};

	/**
	 * 向map中添加数据
	 */
	this.put = function(key, value) {
		var oldValue = null;
		if (!this.containsKey(key)) {
			length++;
		} else {
			oldValue = obj[key];
		}
		obj[key] = value;
		return oldValue;
	};

	/**
	 * 根据给定的Key获得Value
	 */
	this.get = function(key) {
		return this.containsKey(key) ? obj[key] : null;
	};

	/**
	 * 根据给定的Key删除一个值
	 */
	this.remove = function(key) {
		if (this.containsKey(key) && (delete obj[key])) {
			length--;
		}
	};

	/**
	 * 获得Map中的所有Value
	 */
	this.values = function() {
		var _values = new Array();
		for ( var key in obj) {
			_values.push(obj[key]);
		}
		return _values;
	};

	/**
	 * 获得Map中的所有Key
	 */
	this.keySet = function() {
		var _keys = new Array();
		for ( var key in obj) {
			_keys.push(key);
		}
		return _keys;
	};

	/**
	 * 获得Map的长度
	 */
	this.size = function() {
		return length;
	};

	/**
	 * 清空Map
	 */
	this.clear = function() {
		length = 0;
		obj = new Object();
	};
}

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

// ///////////////////////////

function XCOUtil() {

	this.arrayToString = function(array) {
		var builder = new XCOStringBuilder();
		for ( var i = 0; i < array.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(array[i]);
		}
		return builder.toString();
	}

	this.encodeTextForXML = function(str) {
		var text = '';
		for ( var i = 0; i < str.length; i++) {
			var k = str.charAt(i);
			switch (k) {
			case "&":
				text += "&amp;";
				break;
			case ">":
				text += "&gt;";
				break;
			case "<":
				text += "&lt;";
				break;
			case '"':
				text += "&quot;";
				break;
			case "\r":
				text += "&#xd;";
				break;
			case "\n":
				text += "&#xa;";
				break;
			default:
				text += k;
			}
		}
		return text;
	}
	
	this.encodeTextForJSON = function(str) {
		if (str == null) {
			return null;
		}
		str = str.replace("\\", "\\\\");
		str = str.replace("\"", "\\\\\"");
		return str;
	}

	this.getDateTimeString = function(date) {
		return this.format(date, "yyyy-MM-dd HH:mm:ss");
	}

	this.getDateString = function(date) {
		return this.format(date, "yyyy-MM-dd");
	}

	this.getTimeString = function(date) {
		return this.format(date, "HH:mm:ss");
	}

	this.parseDateTime = function(str) {
		return new Date(Date.parse(str.replace(/-/g, "/")));
	}

	this.parseDate = function(str) {
		return new Date(Date.parse(str.replace(/-/g, "/")));
	}

	this.parseTime = function(str) {
		return new Date(Date.parse(("1970-01-01 " + str).replace(/-/g, "/")));
	}

	this.format = function(date, fmt) {
		var o = {
			"M+" : date.getMonth() + 1,
			"d+" : date.getDate(),
			"H+" : date.getHours(),
			"m+" : date.getMinutes(),
			"s+" : date.getSeconds(),
			"q+" : Math.floor((date.getMonth() + 3) / 3),
			"S" : date.getMilliseconds()
		};
		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		}
		for ( var k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
			}
		}
		return fmt;
	}

	this.parseBoolean = function(str) {
		if('true' == str){
			return true;
		} else if('false' == str){
			return false;
		}else{
			return new Boolean(str);
		}
	}
}

var __xcoUtil = new XCOUtil();

// ///////////////////////////

function XCO() {

	this.dateMap = new XCOHashMap();
	this.fieldList = new Array();
	this.fieldValueList = new Array();
	this.attachObject = new Object();

	this.getCode = function() {
		return this.get('$$CODE');
	}

	this.getMessage = function() {
		return this.get('$$MESSAGE');
	}

	this.get = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return null;
		}
		var value = fieldValue.getValue();
		return value;
	}

	this.putItem = function(key, fieldValue) {
		var oldValue = this.dateMap.put(key, fieldValue);
		if (oldValue == null) {
			this.fieldList.push(key);
			this.fieldValueList.push(fieldValue);
		} else {
			var index = 0;// this.fieldList.indexOf(key);
			for ( var i = 0; i < this.fieldList.length; i++) {
				if (this.fieldList[i] == key) {
					index = i;
					break;
				}
			}
			this.fieldValueList[index] = fieldValue;
		}
	}

	this.getObjectValue = function(field) {
		return this.get(field);
	}

	this.setField = function(field, fieldValue) {
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
			return;
		}
		this.setField(field, new XCOField(field, fieldValue));
	}

	this.setXCOArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new XCOArrayField(field, fieldValue));
	}

	this.setXCOListValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new XCOListField(field, fieldValue));
	}

	this.setXCOSetValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new XCOSetField(field, fieldValue));
	}

	this.setShortValue = function(field, fieldValue) {
		this.setField(field, new ShortField(field, fieldValue));
	}

	this.setShortArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new ShortArrayField(field, fieldValue));
	}

	this.setIntegerValue = function(field, fieldValue) {
		this.setField(field, new IntegerField(field, fieldValue));
	}

	this.setIntegerArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new IntegerArrayField(field, fieldValue));
	}

	this.setLongValue = function(field, fieldValue) {
		this.setField(field, new LongField(field, fieldValue));
	}

	this.setLongArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new LongArrayField(field, fieldValue));
	}

	this.setFloatValue = function(field, fieldValue) {
		this.setField(field, new FloatField(field, fieldValue));
	}

	this.setFloatArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new FloatArrayField(field, fieldValue));
	}

	this.setDoubleValue = function(field, fieldValue) {
		this.setField(field, new DoubleField(field, fieldValue));
	}

	this.setDoubleArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new DoubleArrayField(field, fieldValue));
	}

	this.setCharValue = function(field, fieldValue) {
		this.setField(field, new CharField(field, fieldValue));
	}

	this.setCharArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new CharArrayField(field, fieldValue));
	}

	this.setDateTimeValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new DateField(field, fieldValue));
	}

	this.setDateValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new SqlDateField(field, fieldValue));
	}

	this.setTimeValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new SqlTimeField(field, fieldValue));
	}

	this.setTimestampValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new TimestampField(field, fieldValue));
	}

	this.setBigIntegerValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new BigIntegerField(field, fieldValue));
	}
	
	this.setBigDecimalValue = function(field, fieldValue)  {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new BigDecimalField(field, fieldValue));
	}

	this.setStringValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new StringField(field, fieldValue));
	}

	this.setStringArrayValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new StringArrayField(field, fieldValue));
	}

	this.setStringListValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new StringListField(field, fieldValue));
	}

	this.setStringSetValue = function(field, fieldValue) {
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		this.setField(field, new StringSetField(field, fieldValue));
	}

	// ///get....

	this.getXCOValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue();
		return value;
	}

	this.getXCOArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
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

	this.getXCOSetValue = function(field) {
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
			return;
		}
		var value = fieldValue.getValue("SHORT_TYPE");
		return value;
	}

	this.getShortArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("SHORT_ARRAY_TYPE");
		return value;
	}

	this.getIntegerValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("INT_TYPE");
		return value;
	}

	this.getIntegerArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("INT_ARRAY_TYPE");
		return value;
	}

	this.getLongValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("LONG_TYPE");
		return value;
	}

	this.getLongArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("LONG_ARRAY_TYPE");
		return value;
	}

	this.getFloatValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("FLOAT_TYPE");
		return value;
	}

	this.getFloatArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("FLOAT_ARRAY_TYPE");
		return value;
	}

	this.getDoubleValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("DOUBLE_TYPE");
		return value;
	}

	this.getDoubleArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("DOUBLE_ARRAY_TYPE");
		return value;
	}

	this.getCharValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("CHAR_TYPE");
		return value;
	}

	this.getCharArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("CHAR_ARRAY_TYPE");
		return value;
	}

	this.getDateTimeValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("DATE_TYPE");
		return value;
	}

	this.getDateValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("SQLDATE_TYPE");
		return value;
	}

	this.getTimeValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("SQLTIME_TYPE");
		return value;
	}

	this.getTimestampValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("TIMESTAMP_TYPE");
		return value;
	}

	this.getBigIntegerValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("BIGINTEGER_TYPE");
		return value;
	}

	this.getStringValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("STRING_TYPE");
		return value;
	}

	this.getStringArrayValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("STRING_ARRAY_TYPE");
		return value;
	}

	this.getStringListValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("STRING_LIST_TYPE");
		return value;
	}

	this.getStringSetValue = function(field) {
		var fieldValue = this.getField(field);
		if (null == fieldValue || undefined == fieldValue) {
			return;
		}
		var value = fieldValue.getValue("STRING_SET_TYPE");
		return value;
	}

	// ////////////////

	/**
	 * 字符串转化为XML
	 */
	this.fromXML = function(source) {
		var xmlDoc = null;
		if (window.ActiveXObject) {
			var ARR_ACTIVEX = [ "MSXML4.DOMDocument", "MSXML3.DOMDocument",
					"MSXML2.DOMDocument", "MSXML.DOMDocument",
					"Microsoft.XmlDom" ];
			var XmlDomflag = false;
			for ( var i = 0; i < ARR_ACTIVEX.length && !XmlDomflag; i++) {
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
		} else {
			var parser = new DOMParser();
			var xmlDoc = parser.parseFromString(source, "text/xml");
		}
		this.fromXML0(xmlDoc);
	}

	// 操作
	this.fromXML0 = function(xmlDoc) {
		var elements = xmlDoc.childNodes;
		for ( var i = 0; i < elements.length; i++) {
			var node = elements[i];
			if (node.nodeType != 1) continue;
			var tag = node.tagName;
			if ("S" == tag) { // string
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new StringField(k, v));
			} else if ("I" == tag) { //
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new IntegerField(k, parseInt(v)));
			} else if ("L" == tag) { // long
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new LongField(k, parseInt(v)));
			} else if ("F" == tag) { // float
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new FloatField(k, parseFloat(v)));
			} else if ("D" == tag) { // double
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new DoubleField(k, parseFloat(v)));
			} else if ("C" == tag) { // char
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new CharField(k, v.charAt(0)));
			} else if ("O" == tag) { // boolean
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new BooleanField(k, __xcoUtil.parseBoolean(v)));
			} else if ("X" == tag) { // xco
				var k = node.getAttribute("K");
				var xco = new XCO();
				xco.fromXML0(node);
				this.putItem(k, new XCOField(k, xco));
			} else if ("A" == tag) { // DateField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new DateField(k, __xcoUtil.parseDateTime(v)));
			} else if ("E" == tag) { // SqldateField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new SqlDateField(k, __xcoUtil.parseDate(v)));
			} else if ("G" == tag) { // SqlTimeField
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new SqlTimeField(k, __xcoUtil.parseTime(v)));
			} else if ("K" == tag) { // bigInteger
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new BigIntegerField(k, v)); // TODO:
			} else if ("M" == tag) { // bigDicimal
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new BigDecimalField(k, v)); // TODO:
			}

			// String
			else if ("SA" == tag) { // string[]
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var q = 0;
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "S")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					array[q++] = child.getAttribute("V");
				}
				var fieldValue = new StringArrayField(k, array);
				this.putItem(k, fieldValue);
			} else if ("SL" == tag) { // string list
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var q = 0;
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "S")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					array[q++] = child.getAttribute("V");
				}
				var fieldValue = new StringListField(k, array);
				this.putItem(k, fieldValue);
			} else if ("SS" == tag) { // string set
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var array = new Array();
				var q = 0;
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "S")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					array[q++] = child.getAttribute("V");
				}
				var fieldValue = new StringSetField(k, array);
				this.putItem(k, fieldValue);
			}
			// XCO
			else if ("XA" == tag) { // xco[]
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "X")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos.push(xco);
				}
				var fieldValue = new XCOArrayField(k, xcos);
				this.putItem(k, fieldValue);
			} else if ("XL" == tag) { // xco list
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "X")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos.push(xco);
				}
				var fieldValue = new XCOListField(k, xcos);
				this.putItem(k, fieldValue);
			} else if ("XS" == tag) { // xco set
				var k = node.getAttribute("K");
				var childList = node.childNodes;
				var xcos = new Array();
				for ( var j = 0; j < childList.length; j++) {
					var child = childList[j];
					var childTag = child.tagName;
					if (!(childTag == "X")) {
						throw "Parse xml error: unexpected Tag name "
								+ childTag + " under " + tag;
					}
					var xco = new XCO();
					xco.fromXML0(child);
					xcos.push(xco);
				}
				var fieldValue = new XCOSetField(k, xcos);
				this.putItem(k, fieldValue);
			}

			// other array
			else if ("IA" == tag) { // int[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new IntegerArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("LA" == tag) { // long[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new LongArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("FA" == tag) { // float[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new FloatArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			} else if ("DA" == tag) { // double[]
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				var fieldValue = new DoubleArrayField(k, null);
				fieldValue.setValue(v);
				this.putItem(k, fieldValue);
			}

			// else if ("OA" == tag) { // boolean[]
			// var k = node.getAttribute("K");
			// var v = node.getAttribute("V");
			// var fieldValue = new BooleanArrayField(k, null);
			// fieldValue.setValue(v);
			// this.putItem(k, fieldValue);
			// }

			else { // 最后的兼容
				var k = node.getAttribute("K");
				var v = node.getAttribute("V");
				this.putItem(k, new StringField(k, v));
			}
		}
	}

	this.toXMLString = function(key, builder) {
		if (null == key) {
			builder.append("<X>");
		} else {
			builder.append("<X K=\"" + key + "\">");
		}
		for ( var i = 0, size = this.fieldValueList.length; i < size; i++) {
			this.fieldValueList[i].toXMLString(builder);
		}
		builder.append("</X>");
	}

	this.toXML = function() {
		var builder = new XCOStringBuilder();
		builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		this.toXMLString(null, builder);
		return builder.toString();
	}

	this.toJSONString = function() {
		var builder = new XCOStringBuilder();
		builder.append("{");
		for ( var i = 0, size = this.fieldValueList.length; i < size; i++) {
			if (i > 0) {
				builder.append(",");
			}
			this.fieldValueList[i].toJSONString(builder);
		}
		builder.append("}");
		return builder.toString();
	}

	this.toJSON = function() {
		var json = this.toJSONString();
		return eval("(" + json + ")");
	}

	/**
	 * 有问题: 模拟FORM提交
	 */
	this.xcoToxml = function(url, htmlObj) {
		var formNew = "<form id=\"hidForm\" method=\"post\" action=\"\" style=\"display:none\">"
				+ "<input name=\"xml\" value=\"\" id=\"con\"/>"
				+ "<input type=\"submit\" >" + "</form>";
		htmlObj.append(formNew);
		$("#hidForm").attr("action", url);
		$("#hidForm").find("#con").val(this.toString());
		$("#hidForm").submit();
	}

	this.toString = function() {
		return this.toXML();
	}

}// xco end

// ----------------------------field------------------------

function StringField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<S K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.encodeTextForXML(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(name).append("\"").append(":\"").append(
				__xcoUtil.encodeTextForXML(this.value)).append("\"");
	}
}

function IntegerField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<I K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				this.value);
	}
}

function BooleanField(name, value) {
	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<O K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				this.value);
	}
}

function LongField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<L K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				this.value);
	}
}

function FloatField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(dataType) {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<F K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				this.value);
	}
}

function DoubleField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<D K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				this.value);
	}
}

function BigIntegerField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<K K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":\"")
				.append(this.value).append("\"");
	}
}

function BigDecimalField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<M K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(this.value);
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":\"")
				.append(this.value).append("\"");
	}
}

function DateField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(dataType) {
		if ('STRING_TYPE' == dataType) {
			return __xcoUtil.getDateTimeString(this.value);
		}
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<A K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.getDateTimeString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":\"")
				.append(__xcoUtil.getDateTimeString(this.value)).append("\"");
	}
}

function SqlTimeField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(dataType) {
		if ('STRING_TYPE' == dataType) {
			return __xcoUtil.getTimeString(this.value);
		}
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<G K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.getTimeString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":\"")
				.append(__xcoUtil.getTimeString(this.value)).append("\"");
	}
}

function SqlDateField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(dataType) {
		if ('STRING_TYPE' == dataType) {
			return __xcoUtil.getDateString(this.value);
		}
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<E K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.getDateString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":\"")
				.append(__xcoUtil.getDateString(this.value)).append("\"");
	}
}

function XCOField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		this.value.toXMLString(this.name, builder);
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(name).append("\"").append(":").append(
				this.value.toJSONString());
	}
}

// ///////////////////////// Array Field

function StringArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getVlaue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<SA K=\"");
		builder.append(this.name);
		builder.append("\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			builder.append("<S V=\""
					+ __xcoUtil.encodeTextForXML(this.value[i]) + "\"/>");
		}
		builder.append("</SA>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append("\"");
			builder.append(__xcoUtil.encodeTextForJSON(this.value[i]));
			builder.append("\"");
		}
		builder.append("]");
	}
}

function IntegerArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(value) {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<IA K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.arrayToString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	}

	this.setValue = function(val) {
		if (null == val) {
			return;
		}
		var array = val.split(",");
		this.value = [];
		for ( var i = 0; i < array.length; i++) {
			this.value.push(parseInt(array[i]));
		}
	}
}

function FloatArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(value) {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<FA K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.arrayToString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	}

	this.setValue = function(val) {
		if (null == val) {
			return;
		}
		var array = val.split(",");
		this.value = [];
		for ( var i = 0; i < array.length; i++) {
			this.value.push(parseFloat(array[i]));
		}
	}
}

function DoubleArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(value) {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<DA K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.arrayToString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	}

	this.setValue = function(val) {
		if (null == val) {
			return;
		}
		var array = val.split(",");
		this.value = [];
		for ( var i = 0; i < array.length; i++) {
			this.value.push(parseFloat(array[i]));
		}
	}
}

function LongArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(value) {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<LA K=\"");
		builder.append(this.name);
		builder.append("\" V=\"");
		builder.append(__xcoUtil.arrayToString(this.value));
		builder.append("\"/>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i]);
		}
		builder.append("]");
	}

	this.setValue = function(val) {
		if (null == val) {
			return;
		}
		var array = val.split(",");
		this.value = [];
		for ( var i = 0; i < array.length; i++) {
			this.value.push(parseInt(array[i]));
		}
	}
}

function XCOArrayField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function(value) {
		return value;
	}

	this.toXMLString = function(builder) {
		builder.append("<XA K=\"" + this.name + "\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			value[i].toXMLString(null, builder);
		}
		builder.append("</XA>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i].toJSONString());
		}
		builder.append("]");
	}
}

// ///////////////////////// List

function StringListField(name, value) {
	this.name = name;
	this.value = value;

	this.getValue = function() {
		return value;
	}

	this.toXMLString = function(builder) {
		builder.append("<SL K=\"");
		builder.append(this.name);
		builder.append("\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			builder.append("<S V=\""
					+ __xcoUtil.encodeTextForXML(this.value[i]) + "\"/>");
		}
		builder.append("</SL>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append('"' + this.value[i] + '"');
		}
		builder.append("]");
	};
}

function XCOListField(name, value) {
	this.name = name;
	this.value = value;

	this.getValue = function() {
		return value;
	}

	this.toXMLString = function(builder) {
		builder.append("<XL K=\"" + this.name + "\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			this.value[i].toXMLString(null, builder);
		}
		builder.append("</XL>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i].toJSONString());
		}
		builder.append("]");
	}

}

// ///////////////////////// Set Field

function StringSetField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return this.value;
	}

	this.toXMLString = function(builder) {
		builder.append("<SS K=\"");
		builder.append(this.name);
		builder.append("\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			builder.append("<S V=\""
					+ __xcoUtil.encodeTextForXML(this.value[i]) + "\"/>");
		}
		builder.append("</SS>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append("\"");
			builder.append(__xcoUtil.encodeTextForJSON(this.value[i]));
			builder.append("\"");
		}
		builder.append("]");
	}
}

function XCOSetField(name, value) {

	this.name = name;
	this.value = value;

	this.getValue = function() {
		return value;
	}

	this.toXMLString = function(builder) {
		builder.append("<XS K=\"" + this.name + "\">");
		for ( var i = 0, length = this.value.length; i < length; i++) {
			this.value[i].toXMLString(null, builder);
		}
		builder.append("</XS>");
	}

	this.toJSONString = function(builder) {
		builder.append("\"").append(this.name).append("\"").append(":").append(
				"[");
		for ( var i = 0; i < this.value.length; i++) {
			if (i > 0) {
				builder.append(",");
			}
			builder.append(this.value[i].toJSONString());
		}
		builder.append("]");
	}
}
