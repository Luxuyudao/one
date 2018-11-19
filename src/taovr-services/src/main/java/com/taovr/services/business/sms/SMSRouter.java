package com.taovr.services.business.sms;

import org.xson.common.object.XCO;

public class SMSRouter {

	/**
	 * 发送短信 mobile: Y:String:手机号<br />
	 * tpl_value: Y:String:内容 <br />
	 * type: Y:Integer:短信类型 1:注册, 2:修改密码 <br />
	 * test: N:Integer:是否是测试[1:测试, 0:非测试] <br />
	 */
	public static boolean sendSms(XCO request) {

		if (request.exists("test") && (1 == request.getIntegerValue("test"))) {

			return true;
		}

		boolean result = false;

		result = YunXinUtil.sendSms(request);

		if (!result) {
			result = YunPianUtil.sendSms(request);
		}

		return result;
	}

	public static void main(String[] args) {
		XCO xco = new XCO();
		// xco.setStringValue("mobile", "15810283681");
		// xco.setStringValue("mobile", "13810252420");
		xco.setStringValue("mobile", "13366147836");// 小强
		// xco.setStringValue("mobile", "13240170440");// 海燕
		xco.setStringValue("tpl_value", "666888");
		xco.setIntegerValue("type", 1);
		xco.setIntegerValue("test", 1);
		boolean x = sendSms(xco);
		System.out.println(x);
	}
}
