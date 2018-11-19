package com.taovr.core.web;

import java.io.Writer;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;
import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.AbstractPermissionFilter;
import org.xson.web.RequestContext;
import org.xson.web.cache.helper.RedisCacheHelper;

public class SystemUserFilter extends AbstractPermissionFilter {

	private static Logger	log			= Logger.getLogger(SystemUserFilter.class);

	private String[]		excludeList	= { "/userlogin", "/userexit", "/syslogin", "/sysexit" };

	protected boolean inExclude(String url) {
		for (int i = 0; i < excludeList.length; i++) {
			if (excludeList[i].equals(url)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean permissionCheck(String permission, RequestContext requestContext) {

		// String url = requestContext.getUrl();
		// if (inExclude(url)) {
		// return true;
		// }

		boolean result = false;
		try {
			// 获取token
			String token = CookieUtil.getToken(requestContext.getRequest(), Constant.SYSTEM_COOKIE_NAME_TOKEN);
			if (null == token) {
				return false;
			}

			token = URLDecoder.decode(token, "utf-8");

			JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");

			// 获取内容
			String xml = jedisClient.get(Constant.SYSTEM_USER_TOKEN_PREFIX + token);
			if (null == xml) {
				return false;
			}
			XCO tokenUser = XCO.fromXML(xml);
			// TODO 判断权限

			CacheUtil.redisPut(jedisClient, Constant.SYSTEM_USER_TOKEN_PREFIX + token, tokenUser.toXMLString(), Constant.REDIS_COOKIE_TOKEN_EXPIRE);

			// 放入内容
			requestContext.getAttach().put("SYSTEM_USER", tokenUser);
			result = true;
		} catch (Throwable e) {
			log.error("权限验证失败:", e);
		}
		return result;
	}

	@Override
	public void authFailed(RequestContext requestContext) {
		try {
			if (requestContext.isAjax()) {
				HttpServletResponse response = requestContext.getResponse();
				response.setContentType("text/xml;charset=utf-8");
				response.setCharacterEncoding("UTF-8");
				Writer write = response.getWriter();
				write.write(XCOUtil.getResult(Constant.ERROR_CODE_AUTH_FAILED, "请登录后访问").toXMLString());
				write.close();
			} else {
				requestContext.getResponse().sendRedirect("http://www.baidu.com");
			}
		} catch (Throwable e) {
			log.error(e);
		}
	}
}
