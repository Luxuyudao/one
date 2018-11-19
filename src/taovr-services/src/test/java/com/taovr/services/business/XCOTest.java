package com.taovr.services.business;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.xson.common.object.XCO;

import com.taovr.services.business.service.CommonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application_context.xml")
public class XCOTest {

	public static String readFileByLines(String fileName) {
		StringBuilder builder = new StringBuilder();
		File file = new File(fileName);
		BufferedReader reader = null;
		try {
			System.out.println("以行为单位读取文件内容，一次读一整行：");
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			// int line = 1;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				// System.out.println("line " + line + ": " + tempString);
				// line++;
				builder.append(tempString.trim());
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		return builder.toString();
	}

	@Autowired
	private CommonService	commonService;

	@Test
	public void test01() {
		// System.out.println("xxxxxxxxxxxxxxxxxxx");
		String xml = readFileByLines("C:\\Users\\Administrator\\Desktop\\bug.xml");
		System.out.println(xml);
		XCO xco = XCO.fromXML(xml);
		commonService.execute("project-operate.insertProjectCaseP32", xco);
	}

	@Test
	public void test02() {
		XCO request = new XCO();
		Object result = commonService.execute("tvr-test.getXxx", request);
		System.out.println(result);
	}
	
	@Test
	public void test03() {
		XCO request = new XCO();
		request.setStringValue("project_sn", "1111111111111");
		Object result = commonService.execute("tvr-project.getProject1", request);
		System.out.println(result);
	}
	
	@Test
	public void test04() {
		XCO request = new XCO();
		request.setStringValue("project_sn", "2016102501");
		Object result = commonService.execute("tvr-project.getProject4", request);
		System.out.println(result);
	}
	
	@Test
	public void test05() {
		XCO request = new XCO();
		request.setIntegerValue("start", 0);//{start}, #{pageSize}
		request.setIntegerValue("pageSize", 5);//{start}, #{pageSize}
		//request.setStringValue("project_sn", "2016102501");
		request.setLongValue("user_id", 1);
		Object result = commonService.execute("tvr-project.getMyCanGrabTaskListP20", request);
		System.out.println(result);
	}

}
