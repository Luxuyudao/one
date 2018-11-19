package com.taovr.core.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

import cn.gatherlife.rpc.RpcClient;

public class DownloadController {

	public static String	base_upload_path	= "D:/webSite/taovr-file/";
	public static String	base_url			= "http://file.taovr.com/";

	static {
		boolean linux = true;
		String os_name = System.getProperty("os.name");
		if (null != os_name) {
			if (os_name.toUpperCase().indexOf("WINDOWS") > -1) {// Windows
				linux = false;
			}
		}

		if (linux) {
			base_upload_path = "/webFile/taovr-file/";
			System.out.println("重新设置Linux文件下载路径:" + base_upload_path);
		}

		System.out.println("DownloadController static....:" + base_upload_path);
	}

	public void download(RequestContext context) throws Exception {

		XCO arg = (XCO) context.getArg();

		XCO reqXco = new XCO();
		reqXco.setLongValue("id", arg.getLongValue("id"));
		XCO resource = RpcClient.call("http://all.demo1.service/tvr-project/getResourcesP70", reqXco);

		String title = resource.getStringValue("title");
		String url = resource.getStringValue("url");

		String path = url.substring(base_url.length()).trim();
		// String filePath = this.getServletContext().getRealPath("/");// 获取真实路径
		// String downloadFilename = "中文是没有问题的.jpg";// 在下载框默认显示的文件名
		// 对默认下载的文件名编码。不编码的结果就是，在客户端下载时文件名乱码
		//String downloadFilename = URLEncoder.encode(title, "UTF-8");
		File file = new File(base_upload_path + path);

		if (file.exists()) {
			HttpServletResponse response = context.getResponse();
			HttpServletRequest request = context.getRequest();
			// 写明要下载的文件的大小
			response.setContentLength((int) file.length());

			String user_agent = request.getHeader("User-Agent");
			//logger.info("用户浏览器类型：user_agent=[{}]", user_agent);
			if (user_agent.toUpperCase().contains("MSIE")) {
				//logger.info("IE浏览器下载");
				//headers.setContentDispositionFormData("attachment", URLEncoder.encode(title, "utf-8"));
				response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(title, "utf-8"));// 设置在下载框默认显示的文件名
			} else {
				//headers.setContentDispositionFormData("attachment", new String(title.getBytes("utf-8"), "iso-8859-1"));
				response.setHeader("Content-Disposition", "attachment;filename=" + new String(title.getBytes("utf-8"), "iso-8859-1"));// 设置在下载框默认显示的文件名
			}

			//response.setHeader("Content-Disposition", "attachment;filename=" + downloadFilename);// 设置在下载框默认显示的文件名
			response.setContentType("application/octet-stream");// 指明response的返回对象是文件流
			// 读出文件到response
			// 这里是先需要把要把文件内容先读到缓冲区
			// 再把缓冲区的内容写到response的输出流供用户下载
			FileInputStream fileInputStream = new FileInputStream(file);
			BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
			byte[] b = new byte[bufferedInputStream.available()];
			bufferedInputStream.read(b);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(b);
			bufferedInputStream.close();
			outputStream.flush();
			outputStream.close();
		}
	}
}
