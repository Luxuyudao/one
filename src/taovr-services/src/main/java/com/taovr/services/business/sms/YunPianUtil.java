package com.taovr.services.business.sms;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 发送短信
 */
public class YunPianUtil {

	static Logger	log				= Logger.getLogger(YunPianUtil.class);
	static String	apikey			= "c1bed64de4e664e12217b670cf4268fc";
	static String	URI_SEND_SMS	= "http://yunpian.com/v1/sms/tpl_send.json";
	static String	ENCODING		= "UTF-8";

	private static String getTplId(XCO request) {
		int type = request.getIntegerValue("type");
		if (1 == type) {
			return "733707";
		} else if (1 == type) {
			return "733707";
		}
		throw new RuntimeException("未知的短信类型: " + type);
	}

	/**
	 * 发短信
	 */
	public static boolean sendSms(XCO request) throws RuntimeException {
		boolean result = false;
		SmsHttpUtil httpUtil = new SmsHttpUtil();
		try {
			Map<String, String> paramMap = new HashMap<String, String>(4);
			// paramMap.put("apikey", ConstantConfig.apikey);
			paramMap.put("apikey", apikey);
			// paramMap.put("text", text);
			paramMap.put("mobile", request.getStringValue("mobile"));
			// 模板ID
			paramMap.put("tpl_id", getTplId(request));
			// 模板填充值
			String tpl_value = URLEncoder.encode("#code#", ENCODING) + "=" + URLEncoder.encode(request.getStringValue("tpl_value"), ENCODING);
			paramMap.put("tpl_value", tpl_value);
			// String info =
			// "{\"code\":0,\"msg\":\"OK\",\"result\":{\"count\":1,\"fee\":1,\"sid\":640973190}}";
			// String info =
			// httpUtil.sendPostRequest(ConstantConfig.URI_SEND_SMS, paramMap);
			String info = httpUtil.sendPostRequest(URI_SEND_SMS, paramMap);
			log.info("yunpian return info = " + info);
			JSONObject jsonObj = (JSONObject) JSON.parse(info);
			log.info("yunpian return jsonObj = " + info);

			// NoteReturnDto returnDto = new NoteReturnDto();
			if (jsonObj.getInteger("code") == 0) {
				// returnDto.setResult(true);
				return true;
			}
		} catch (Throwable e) {
			log.error(e);
		}
		return result;
	}

	public static void main(String[] args) {
		XCO xco = new XCO();
		// xco.setStringValue("mobile", "15810283681");
		// xco.setStringValue("mobile", "13810252420");
		// xco.setStringValue("mobile", "13366147836");//小强
		xco.setStringValue("mobile", "13240170440");// 海燕
		xco.setStringValue("tpl_id", "733707");
		xco.setStringValue("tpl_value", "666888");
		sendSms(xco);
	}

}
