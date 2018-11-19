package com.taovr.web.boss;

import org.xson.common.object.XCO;
import org.xson.web.RequestContext;

public class BossAssembly {

	public void insertProject1(RequestContext requestContext) {
		XCO arg = (XCO) requestContext.getArg();
		XCO systemUser = (XCO) requestContext.getAttach().get("SYSTEM_USER");
		arg.setLongValue("behalf_id", systemUser.getLongValue("user_id"));
	}
}
