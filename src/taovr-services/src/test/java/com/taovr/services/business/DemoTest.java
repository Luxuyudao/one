package com.taovr.services.business;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.xson.common.object.XCO;

import com.taovr.services.business.service.CommonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application_context.xml")
public class DemoTest {

	@Autowired
	private CommonService commonService;

	@Test
	public void test01() {
		XCO xco = new XCO();
		xco.setLongValue("user_id", 1);
		xco.setStringValue("user_name", "向三");
		xco.setStringValue("context", "测试内容");
		Object resutl = commonService.execute("tvr-test.insertXxx", xco);
		System.out.println(resutl);
	}

	@Test
	public void test02() {
		XCO xco = new XCO();
		xco.setLongValue("id", 1);
		Object resutl = commonService.execute("tvr-test.getXxx1", xco);
		System.out.println(resutl);
	}

	@Test
	public void test03() {
		XCO xco = new XCO();
		Object resutl = commonService.execute("tvr-test.getXxx2", xco);
		System.out.println(resutl);
	}

	@Test
	public void test04() {
		XCO xco = new XCO();
		xco.setLongValue("id", 1);
		Object resutl = commonService.execute("tvr-test.getXxx3", xco);
		System.out.println(resutl);
	}
	@Test
	public void test5() {

		XCO xco = new XCO();
		xco.setLongValue("user_id", 3);
		xco.setStringValue("user_name", "lisi");
		xco.setStringValue("context", "ggggg");
		Object object = commonService.execute("tvr-test.insertmysql", xco);
		System.out.println(object);

	}
	@Test
	public void test6(){
		XCO xco= new XCO();
		Object object = commonService.execute("tvr-test.getMysql", xco);
		System.out.println(object);
	}
	@Test
	public void test7(){
	 XCO xco=new XCO();
	 Object object=commonService.execute("tvr-test.getMysqlList", xco);
	 System.out.println(object);
	}
	@Test
	public void test8(){
		XCO xco = new XCO();
		Object object =commonService.execute("tvr-test.getMy", xco);
		System.out.println(object);
		
	}

}
