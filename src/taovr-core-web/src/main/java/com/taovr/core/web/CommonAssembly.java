package com.taovr.core.web;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class CommonAssembly {

	public void addUserInfo(RequestContext requestContext) {
		XCO arg = (XCO) requestContext.getArg();
		if (null == arg) {
			arg = new XCO();
			requestContext.setArg(arg);
		}

		XCO user = (XCO) requestContext.getAttach().get("PLATFORM_USER");
		arg.setLongValue("user_id", user.getLongValue("user_id"));
		arg.setStringValue("mobile_phone", user.getStringValue("mobile_phone"));
		arg.setStringValue("nick_name", user.getStringValue("user_name"));
		arg.setStringValue("user_name", user.getStringValue("user_name"));

		arg.setXCOValue("tokenUser", user);
	}
}
