package com.taovr.core.web;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class SystemCommonAssembly {

	public void addUserInfo(RequestContext requestContext) {
		XCO arg = (XCO) requestContext.getArg();

		XCO systemUser = (XCO) requestContext.getAttach().get("SYSTEM_USER");

		arg.setLongValue("user_id", systemUser.getLongValue("user_id"));
		arg.setStringValue("user_name", systemUser.getStringValue("user_name"));
		arg.setIntegerValue("role", systemUser.getIntegerValue("role"));

		arg.setXCOValue("tokenUser", systemUser);
	}
}
