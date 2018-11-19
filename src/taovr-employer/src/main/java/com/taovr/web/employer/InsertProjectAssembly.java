package com.taovr.web.employer;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class InsertProjectAssembly {

	public void insertProject(RequestContext requestContext) {
		XCO arg = (XCO) requestContext.getArg();
		int behalf = arg.getIntegerValue("behalf");
		if (0 == behalf) {
			// 自己发布
			arg.setLongValue("employer_id", arg.getLongValue("user_id"));
			arg.setStringValue("employer_name", arg.getStringValue("user_name"));
		} else {
			// 代替发布的
			arg.setLongValue("behalf_id", arg.getLongValue("user_id"));
		}
	}
}
