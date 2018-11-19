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
public class ProjectOperateTest {

	@Autowired
	private CommonService	commonService;

	@Test
	public void testP1() {
		XCO request = new XCO();

		int n = 2;

		request.setStringValue("project_name", "第" + n + "项目");
//		request.setLongValue("employer_id", 1);
//		request.setStringValue("employer_name", "高鹏");
		
		request.setLongValue("user_id", 1);
		request.setStringValue("user_name", "高鹏");

		request.setLongValue("project_catg_id", 13);
		request.setStringValue("project_catg_name", "三级分类");

		request.setIntegerValue("project_cycle", 30);
		request.setStringValue("cycle_unit", "天");
		request.setStringValue("cycle_unit_name", "天");

		request.setIntegerValue("budget_amount", 1000 * 100);
		request.setIntegerValue("budget_type", 2);

		request.setStringValue("proj_province", "北京");
		request.setStringValue("proj_city", "北京");
		request.setStringValue("proj_area", "朝阳区");
		request.setStringValue("proj_province_code", "10");
		request.setStringValue("proj_area_code", "1010");
		request.setStringValue("proj_city_code", "101010");
		request.setStringValue("proj_addr", "潘家园路100号");

		request.setStringValue("project_desc", "测试项目介绍");

		String[] urls = new String[] { "http://employer.taovr.com/images/thumb-6.jpg", "http://employer.taovr.com/images/thumb-6.jpg",
				"http://employer.taovr.com/images/thumb-6.jpg", "http://employer.taovr.com/images/thumb-6.jpg",
				"http://employer.taovr.com/images/thumb-6.jpg" };
		request.setStringArrayValue("urls", urls);

		Object result = commonService.execute("project-operate.insertProject", request);
		System.out.println(result);
	}
}
