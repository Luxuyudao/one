package com.taovr.core.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class FileController {

	public static String	base_upload_path	= "D:/webSite/taovr-file/";
	// public static String base_upload_path = "/webSite/taovr-file/";
	public static String	file_path			= base_upload_path + "file/";
	public static String	image_path			= base_upload_path + "image/";
	public static String	video_path			= base_upload_path + "video/";

	public static String	base_url			= "http://file.taovr.com/";
	public static String	file_url			= base_url + "file/";
	public static String	image_url			= base_url + "image/";
	public static String	video_url			= base_url + "video/";

	public static int		file_max_size		= 1024 * 1024 * 100;
	public static int		image_max_size		= 1024 * 1024 * 5;
	public static int		video_max_size		= 1024 * 1024 * 200;

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
			file_path = base_upload_path + "file/";
			image_path = base_upload_path + "image/";
			video_path = base_upload_path + "video/";
			System.out.println("重新设置Linux文件上传路径:" + base_upload_path);
		}

		System.out.println("FileController static....:" + base_upload_path);
	}

	public String getDatePath(Date date) {
		DateFormat fmt = new SimpleDateFormat("yyyyMMdd");
		return fmt.format(date);
	}

	public String gerRandomFileName(Date date) throws Exception {
		return System62.to62Hex(date.getTime()) + System62.to62Hex(System.nanoTime());
	}

	public void uploadFile(RequestContext context) throws Exception {
		try {
			List<XCO> updateResult = upload0(context, file_path, file_url, file_max_size, 1);
			uploadSuccess(updateResult, context);
		} catch (Exception e) {
			uploadFail(e, context);
		}
		System.out.println("CCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
	}

	public void uploadImage(RequestContext context) throws Exception {
		try {
			List<XCO> updateResult = upload0(context, image_path, image_url, image_max_size, 2);
			uploadSuccess(updateResult, context);
		} catch (Exception e) {
			uploadFail(e, context);
		}
	}

	public void uploadVideo(RequestContext context) throws Exception {
		try {
			List<XCO> updateResult = upload0(context, video_path, video_url, video_max_size, 3);
			uploadSuccess(updateResult, context);
		} catch (Exception e) {
			uploadFail(e, context);
		}
	}

	private void uploadSuccess(List<XCO> updateResult, RequestContext context) throws Exception {

		XCO xco = new XCO();
		xco.setIntegerValue("$$CODE", 0);
		xco.setXCOListValue("updateResult", updateResult);

		System.out.println(xco);

		HttpServletResponse response = context.getResponse();
		response.setContentType("text/html;charSet=utf-8");
		response.setCharacterEncoding("UTF-8");
		Writer write = response.getWriter();
		write.write("<script>parent.uploadCallBack('" + xco.toXMLString() + "');</script>");
		write.close();
	}

	private void uploadFail(Exception e, RequestContext context) {
		try {
			e.printStackTrace();
			XCO xco = new XCO();
			xco.setIntegerValue("$$CODE", -1);
			xco.setStringValue("$$MESSAGE", "文件上传失败");

			// Thread.currentThread().sleep(1000 * 5);

			HttpServletResponse response = context.getResponse();
			response.setContentType("text/html;charSet=utf-8");
			response.setCharacterEncoding("UTF-8");
			Writer write = response.getWriter();
			write.write("<script>parent.uploadCallBack('" + xco.toXMLString() + "');</script>");
			write.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	private List<XCO> upload0(RequestContext context, String path, String url, int maxSize, int type) throws Exception {
		List<XCO> updateResult = new ArrayList<XCO>();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		upload.setFileSizeMax(maxSize);
		upload.setSizeMax(maxSize * 5);

		Date now = new Date();

		List<FileItem> list = upload.parseRequest(context.getRequest());
		for (FileItem item : list) {
			if (!item.isFormField()) {
				String filename = item.getName();// 得到上传的文件名称
				if (filename == null || filename.trim().equals("")) {
					continue;
				}
				filename = filename.substring(filename.lastIndexOf("\\") + 1);
				String fileExt = filename.substring(filename.lastIndexOf(".") + 1);
				String saveName = gerRandomFileName(now) + "." + fileExt;
				String datePath = getDatePath(now);
				File directory = new File(path + datePath);
				if (!directory.exists()) {
					directory.mkdirs();
				}

				// 获取item中的上传文件的输入流
				InputStream in = item.getInputStream();
				FileOutputStream out = new FileOutputStream(new File(directory, saveName));
				byte buffer[] = new byte[1024];
				int len = 0;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				in.close();
				out.close();
				item.delete();

				XCO xco = new XCO();
				xco.setStringValue("filename", filename);
				xco.setIntegerValue("type", type);
				xco.setStringValue("url", url + datePath + "/" + saveName);
				updateResult.add(xco);
			}
		}

		return updateResult;
	}

}
