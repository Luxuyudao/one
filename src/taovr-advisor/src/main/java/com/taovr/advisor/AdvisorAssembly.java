package com.taovr.advisor;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class AdvisorAssembly {

	public void insertTask(RequestContext requestContext) {
		//XCO arg = (XCO) requestContext.getArg();
		//XCO systemUser = (XCO) requestContext.getAttach().get("SYSTEM_USER");
		//arg.setLongValue("user_name", systemUser.getLongValue("user_name"));
		
		
		XCO arg = (XCO) requestContext.getArg();
		XCO user = (XCO) requestContext.getAttach().get("PLATFORM_USER");
		System.out.println("user.getLongValue(user_id)"+user.getLongValue("user_id"));
		arg.setLongValue("adviser_id", user.getLongValue("user_id"));
		arg.setStringValue("adviser_name", user.getStringValue("nick_name"));
	}
}
