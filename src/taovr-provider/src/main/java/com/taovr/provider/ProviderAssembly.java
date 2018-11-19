package com.taovr.provider;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class ProviderAssembly {

	public void updateTaskP22(RequestContext requestContext) {
		//XCO arg = (XCO) requestContext.getArg();
		//XCO systemUser = (XCO) requestContext.getAttach().get("SYSTEM_USER");
		//arg.setLongValue("user_name", systemUser.getLongValue("user_name"));
		
		
		XCO arg = (XCO) requestContext.getArg();
		XCO user = (XCO) requestContext.getAttach().get("PLATFORM_USER");
		arg.setStringValue("user_name", user.getStringValue("nick_name"));
	}
}
