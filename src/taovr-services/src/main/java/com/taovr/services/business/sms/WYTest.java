package com.taovr.services.business.sms;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class WYTest {

	// 23657 e9ae6e 4eafb4689 766c85c 14f21
	// 9156f56 e9d1c

	public static void main(String[] args) throws Exception {

		// DefaultHttpClient httpClient = new DefaultHttpClient();
		CloseableHttpClient httpClient = HttpClients.createDefault();
		String url = "https://api.netease.im/sms/sendtemplate.action";
		HttpPost httpPost = new HttpPost(url);

		// String appKey = "94kid09c9ig9k1loimjg012345123456";
		String appKey = "23657e9ae6e4eafb4689766c85c14f21";
		// String appSecret = "123456789012";
		String appSecret = "9156f56e9d1c";
		String nonce = System.nanoTime() + "";// 随机数
		String curTime = String.valueOf((new Date()).getTime() / 1000L);
		// 参考计算CheckSum的java代码
		String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce, curTime);

		// 设置请求的header
		httpPost.addHeader("AppKey", appKey);
		httpPost.addHeader("Nonce", nonce);
		httpPost.addHeader("CurTime", curTime);
		httpPost.addHeader("CheckSum", checkSum);
		httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		// 设置请求的参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		// nvps.add(new BasicNameValuePair("accid", "helloworld"));
		nvps.add(new BasicNameValuePair("templateid", "3032352"));
		nvps.add(new BasicNameValuePair("mobiles", "[" + "15810283681" + "]"));
		nvps.add(new BasicNameValuePair("params", "[" + "666888" + "]"));
		httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

		// 执行请求
		HttpResponse response = httpClient.execute(httpPost);

		// 打印执行结果
		System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
	}
}
