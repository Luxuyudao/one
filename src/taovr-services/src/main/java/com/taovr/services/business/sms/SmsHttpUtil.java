package com.taovr.services.business.sms;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class SmsHttpUtil {

	/**
	 * 发送Get请求
	 * 
	 * @param url
	 *            请求地址
	 * @param paramMap
	 *            参数集合
	 * @return JSON信息
	 * @throws Throwable
	 */
	@SuppressWarnings("unchecked")
	public <T> T sendGetRequest(String url, Map<String, String> paramMap) throws Throwable {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			List<NameValuePair> nvList = getParamList(paramMap);

			URIBuilder uriBuilder = new URIBuilder(url);
			if (null != nvList) {
				uriBuilder.addParameters(nvList);
			}
			URI uri = uriBuilder.build();

			HttpGet httpget = new HttpGet(uri);
			printRequestHead(httpget);
			// Response
			CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				printResponseHead(response);
				int status = response.getStatusLine().getStatusCode();
				if (status != 200) {
					throw new Exception("Unexpected response status: " + status);
				}
				HttpEntity entity = response.getEntity();
				return (T) EntityUtils.toString(entity);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
	}

	/**
	 * 发送POST请求
	 * 
	 * @param url
	 *            请求地址
	 * @param paramMap
	 *            参数集合
	 * @return JSON信息
	 * @throws Throwable
	 */
	@SuppressWarnings("unchecked")
	public <T> T sendPostRequest(String url, Map<String, String> paramMap) throws Throwable {
		CloseableHttpClient httpclient = HttpClients.createDefault();

		URI uri = null;
		try {
			uri = new URI(url);
		} catch (URISyntaxException e) {
			throw e;
		}
		try {
			HttpPost httpost = new HttpPost(uri);
			// 设置参数
			HttpEntity paramEntity = getPostParamEntiry(paramMap);
			if (null != paramEntity) {
				httpost.setEntity(paramEntity);
			}
			printRequestHead(httpost);
			CloseableHttpResponse response = httpclient.execute(httpost);
			try {
				printResponseHead(response);
				int status = response.getStatusLine().getStatusCode();
				if (status != 200) {
					throw new Exception("Unexpected response status: " + status);
				}
				HttpEntity entity = response.getEntity();
				return (T) EntityUtils.toString(entity);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
	}

	private AbstractHttpEntity getPostParamEntiry(Map<String, String> map) {
		if (null == map || 0 == map.size())
			return null;
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		for (Map.Entry<String, String> entry : map.entrySet()) {
			formparams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, Consts.UTF_8);
		return entity;
	}

	private List<NameValuePair> getParamList(Map<String, String> map) {
		if (null == map || 0 == map.size())
			return null;
		List<NameValuePair> nvList = new ArrayList<NameValuePair>();
		for (Map.Entry<String, String> entry : map.entrySet()) {
			nvList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return nvList;
	}

	private void printRequestHead(HttpRequestBase request) {
		System.out.println("--------------------请求头--------------------");
		Header[] headers = request.getAllHeaders();
		for (int i = 0; i < headers.length; i++) {
			System.out.println(headers[i]);
		}
		if (request instanceof HttpPost) {
			try {
				((HttpPost) request).getEntity().writeTo(System.out);
				System.out.println();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void printResponseHead(CloseableHttpResponse response) {
		System.out.println("--------------------响应头--------------------");
		System.out.println(response.getStatusLine());
		Header[] headers = response.getAllHeaders();
		for (int i = 0; i < headers.length; i++) {
			System.out.println(headers[i]);
		}
	}

}
