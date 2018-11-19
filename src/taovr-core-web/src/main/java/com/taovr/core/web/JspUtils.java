package com.taovr.core.web;

import java.net.URLDecoder;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;
import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.cache.helper.RedisCacheHelper;

import cn.gatherlife.rpc.RpcClient;

public class JspUtils {

	private static Logger	logger	= Logger.getLogger(JspUtils.class);

	/**
	 * 获取TokenUser
	 */
	public static XCO getSystemTokenUser(HttpServletRequest request) {
		try {
			String token = null;
			Cookie cookies[] = request.getCookies();
			Cookie sCookie = null;
			for (int i = 0; i < cookies.length; i++) {
				sCookie = cookies[i];
				if (sCookie != null) {
					if (Constant.SYSTEM_COOKIE_NAME_TOKEN.equalsIgnoreCase(sCookie.getName())) {
						token = sCookie.getValue();
						break;
					}
				}
			}

			if (null == token) {
				return null;
			}

			token = URLDecoder.decode(token, "utf-8");
			JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");

			String xml = jedisClient.get(Constant.SYSTEM_USER_TOKEN_PREFIX + token);
			XCO tokenUser = XCO.fromXML(xml);
			return tokenUser;
		} catch (Throwable e) {
			logger.error(e);
		}

		return null;
	}

	/**
	 * 由用户id 平台 获取用户信息
	 */
	public static XCO getPlateformUserById(long user_id) {
		try {
			XCO request = new XCO();
			request.setLongValue("userid", user_id);
			XCO result = RpcClient.call("http://all.demo1.service/tvr-user/getUser", request);
			return result;
		} catch (Throwable e) {
			logger.error(e);
		}
		return null;
	}

	public static XCO getPlatformTokenUser(HttpServletRequest request) {
		try {
			String token = null;
			Cookie cookies[] = request.getCookies();
			Cookie sCookie = null;
			for (int i = 0; i < cookies.length; i++) {
				sCookie = cookies[i];
				if (sCookie != null) {
					if (Constant.PLATFORM_COOKIE_NAME_TOKEN.equalsIgnoreCase(sCookie.getName())) {
						token = sCookie.getValue();
						break;
					}
				}
			}

			if (null == token) {
				return null;
			}

			// System.out.println("A:" + token);

			token = URLDecoder.decode(token, "utf-8");

			// System.out.println("B:" + token);

			JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");

			// System.out.println("C:" + Constant.PLATFORM_USER_TOKEN_PREFIX +
			// token);

			String xml = jedisClient.get(Constant.PLATFORM_USER_TOKEN_PREFIX + token);

			// System.out.println("D:" + xml);

			XCO tokenUser = XCO.fromXML(xml);
			return tokenUser;
		} catch (Throwable e) {
			logger.error(e);
		}

		return null;
	}

	public static String getImageVerifyKey() {
		String uuid = UUID.randomUUID().toString();
		uuid = Constant.IMG_VERIFY_CODE_KEY + uuid.replaceAll("-", "").substring(0, 30);
		System.out.println(uuid);
		return uuid;
	}
}
