package com.taovr.services.business.sms;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.xson.common.object.XCO;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 发送短信(网易云信)
 */
public class YunXinUtil {

	static Logger	log			= Logger.getLogger(YunXinUtil.class);

	static String	url			= "https://api.netease.im/sms/sendtemplate.action";
	static String	appKey		= "23657e9ae6e4eafb4689766c85c14f21";
	static String	appSecret	= "9156f56e9d1c";

	private static String getTplId(XCO request) {
		int type = request.getIntegerValue("type");
		if (1 == type) {
			return "3032352";
		} else if (1 == type) {
			return "3032352";
		}
		throw new RuntimeException("未知的短信类型: " + type);
	}

	/**
	 * 发短信
	 * 
	 * @param mobile
	 *            手机号
	 */
	public static boolean sendSms(XCO request) throws RuntimeException {
		boolean result = false;
		CloseableHttpClient httpClient = null;
		try {
			httpClient = HttpClients.createDefault();
			String url = "https://api.netease.im/sms/sendtemplate.action";
			HttpPost httpPost = new HttpPost(url);

			String nonce = System.nanoTime() + "";// 随机数
			String curTime = String.valueOf((new Date()).getTime() / 1000L);
			String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce, curTime);

			// 设置请求的header
			httpPost.addHeader("AppKey", appKey);
			httpPost.addHeader("Nonce", nonce);
			httpPost.addHeader("CurTime", curTime);
			httpPost.addHeader("CheckSum", checkSum);
			httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

			// 设置请求的参数
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			// nvps.add(new BasicNameValuePair("templateid",
			// request.getStringValue("tpl_id")));

			nvps.add(new BasicNameValuePair("templateid", getTplId(request)));

			nvps.add(new BasicNameValuePair("mobiles", "[" + request.getStringValue("mobile") + "]"));
			nvps.add(new BasicNameValuePair("params", "[" + request.getStringValue("tpl_value") + "]"));
			httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

			// 执行请求
			CloseableHttpResponse response = httpClient.execute(httpPost);

			String info = EntityUtils.toString(response.getEntity(), "utf-8");
			log.info("yunxin return info = " + info);
			JSONObject jsonObj = (JSONObject) JSON.parse(info);
			log.info("yunxin return jsonObj = " + info);

			if (jsonObj.getInteger("code") == 200) {
				result = true;
			}

			response.close();

		} catch (Throwable e) {
			log.error(e);
		} finally {
			if (null != httpClient) {
				try {
					httpClient.close();
				} catch (IOException e) {
					log.error(e);
				}
			}
		}
		return result;
	}

	public static void main(String[] args) {
		XCO xco = new XCO();
		xco.setStringValue("tpl_id", "3032352");
		xco.setStringValue("mobile", "13240170440");// 海燕
		xco.setStringValue("tpl_value", "666888");

		boolean x = sendSms(xco);
		System.out.println(x);
	}

}
