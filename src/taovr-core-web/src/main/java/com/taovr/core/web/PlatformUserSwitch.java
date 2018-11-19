package com.taovr.core.web;

import java.net.URLDecoder;

import org.xson.common.object.XCO;
import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.RequestContext;
import org.xson.web.cache.helper.RedisCacheHelper;


public class PlatformUserSwitch {

	public void userSwitch(RequestContext requestContext) throws Throwable {

		String temp = requestContext.getRequest().getParameter("p");
		int position = Integer.parseInt(temp);

		XCO tokenUser = (XCO) requestContext.getAttach().get("PLATFORM_USER");
		tokenUser.setIntegerValue("position", position);

		String token = CookieUtil.getToken(requestContext.getRequest(), Constant.PLATFORM_COOKIE_NAME_TOKEN);
		token = URLDecoder.decode(token, "utf-8");
		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");
		CacheUtil.redisPut(jedisClient, Constant.PLATFORM_USER_TOKEN_PREFIX + token, tokenUser.toXMLString(), Constant.REDIS_COOKIE_TOKEN_EXPIRE);

		// 1:雇主, 2:顾问, 3:服务商
		if (2 == position) {
			requestContext.setView("http://advisor.demo1.com/index.jsp", false);
		} else if (3 == position) {
			requestContext.setView("http://provider.demo1.com/index.jsp", false);
		} else {
			requestContext.setView("http://employer.demo1.com/index.jsp", false);
		}
	}
}
