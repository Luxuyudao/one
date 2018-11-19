package com.taovr.core.web;

import org.xson.common.object.XCO;

public class XCOUtil {
	
	public static XCO setResult(XCO xco, int code, String message,XCO result) {
		xco.setIntegerValue("$$CODE", code);
		if (null != message) {
			xco.setStringValue("$$MESSAGE", message);
		}
		if(null!=result){
			xco.setXCOValue("data", result);
		}
		return xco;
	}
	
	public static XCO setResult(XCO xco, int code, String message) {
		xco.setIntegerValue("$$CODE", code);
		if (null != message) {
			xco.setStringValue("$$MESSAGE", message);
		}
		return xco;
	}

	public static XCO getResult(int code, String message) {
		XCO xco = new XCO();
		setResult(xco, code, message);
		return xco;
	}

	public static XCO getResult(int code) {
		XCO xco = new XCO();
		setResult(xco, code, null);
		return xco;
	}
	
	public static XCO getResult(int code,XCO result) {
		XCO xco = new XCO();
		setResult(xco, code, null,result);
		return xco;
	}
}
