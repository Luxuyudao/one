package com.taovr.web.user;

import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;
import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.RequestContext;
import org.xson.web.cache.helper.RedisCacheHelper;

import cn.gatherlife.rpc.RpcClient;

import com.taovr.core.web.CacheUtil;
import com.taovr.core.web.Constant;
import com.taovr.core.web.CookieUtil;
import com.taovr.core.web.CryptoUtil;
import com.taovr.core.web.DESUtil;
import com.taovr.core.web.MD5Util;
import com.taovr.core.web.XCOUtil;

public class LoginController {

	static Logger	log	= Logger.getLogger(LoginController.class);

	/**
	 * 获取平台用户信息
	 */
	private XCO getPlatformUser(XCO xco) {
		XCO request = new XCO();
		request.setStringValue("phone", xco.getStringValue("mobile_phone"));
		XCO result = RpcClient.call("http://all.demo1.service/tvr-user/getUserByCon", request);

		if (null == result || !result.exists("user_id")) {
			return XCOUtil.getResult(11, "用户名密码错误");
		}

		String pwd1 = xco.getStringValue("user_pwd");
		String pwd2 = result.getStringValue("user_pwd");

		if (CryptoUtil.isValid(pwd1, pwd2)) {
			return result;
		}

		return XCOUtil.getResult(11, "用户名密码错误");
	}

	/**
	 * 获取系统用户信息
	 */
	private XCO getSystemUser(XCO xco) {
		XCO request = new XCO();
		request.setStringValue("phone", xco.getStringValue("mobile_phone"));
		// request.setStringValue("pwd", xco.getStringValue("user_pwd"));
		XCO result = RpcClient.call("http://all.demo1.service/tvr-system/getSysUserByCon", request);
		// return result;

		if (null == result || !result.exists("id")) {
			return XCOUtil.getResult(11, "用户名密码错误");
		}

		String pwd1 = xco.getStringValue("user_pwd");
		String pwd2 = result.getStringValue("pwd");

		if (CryptoUtil.isValid(pwd1, pwd2)) {
			return result;
		}

		return XCOUtil.getResult(11, "用户名密码错误");
	}

	/**
	 * 系统登录 0: 成功<br />
	 * 11: 验证码错误<br />
	 * 12: 用户名密码错误<br />
	 * 13: 当前用户不合法<br />
	 */
	public void sysLogin(RequestContext context) throws Exception {
		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");

		XCO arg = (XCO) context.getArg();
		// 1. 验证码(通过JSessionID, Redis) // TODO

		// 2. 访问数据库
		XCO user = getSystemUser(arg);

		// 3. check user
		// if (null == user || !user.exists("id")) {
		// context.setResult(XCOUtil.getResult(11, "用户名密码错误"));
		// return;
		// }
		if (0 != user.getCode()) {
			context.setResult(user);
			return;
		}

		if (1 != user.getIntegerValue("state")) {
			context.setResult(XCOUtil.getResult(13, "当前用户不合法"));
			return;
		}

		// 4. 组装数据
		XCO tokenUser = new XCO();
		tokenUser.setLongValue("user_id", user.getLongValue("id"));
		tokenUser.setStringValue("user_name", user.getStringValue("name"));
		tokenUser.setIntegerValue("role", user.getIntegerValue("role"));
		// tokenUser.setIntegerValue("platform_user", 0);// 是否是平台用户

		// 5. 合成token
		String token = DESUtil.encrypt(MD5Util.MD5(tokenUser.toXMLString() + System.nanoTime()), Constant.DES_KEY);

		// 6. 放入redis
		CacheUtil.redisPut(jedisClient, Constant.SYSTEM_USER_TOKEN_PREFIX + token, tokenUser.toXMLString(), Constant.REDIS_COOKIE_TOKEN_EXPIRE);

		// 7. 处理Cookie
		// processUserLoginCookie(context.getRequest(), context.getResponse(),
		// token, Constant.SYS_DOMAIN);
		CookieUtil.clearAllCookies(context.getRequest(), context.getResponse(), Constant.SYSTEM_COOKIE_NAME_TOKEN, Constant.SYS_DOMAIN);
		Cookie tokenCookie = new Cookie(Constant.SYSTEM_COOKIE_NAME_TOKEN, URLEncoder.encode(token, "utf-8"));
		tokenCookie.setDomain(Constant.SYS_DOMAIN);
		tokenCookie.setPath(Constant.COOKIE_PATH);
		tokenCookie.setMaxAge(Constant.COOKIE_MAXAGE);
		context.getResponse().addCookie(tokenCookie);

		XCO result = new XCO();
		result.setIntegerValue("role", user.getIntegerValue("role"));
		// 8. 设置Result
		context.setResult(XCOUtil.getResult(0, result));
	}

	public void sysExit(RequestContext context) throws Exception {
		String token = CookieUtil.getToken(context.getRequest(), Constant.SYSTEM_COOKIE_NAME_TOKEN);
		if (null == token) {
			return;
		}
		token = URLDecoder.decode(token, "utf-8");

		// TODO: 需要判断用户ID

		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");
		jedisClient.del(Constant.SYSTEM_USER_TOKEN_PREFIX + token);

		// 清除cookie值
		String domain = Constant.SYS_DOMAIN;
		CookieUtil.clearAllCookies(context.getRequest(), context.getResponse(), Constant.SYSTEM_COOKIE_NAME_TOKEN, domain);

		context.setResult(XCOUtil.getResult(0));
	}

	/**
	 * 返回结果<br />
	 * 0: 成功<br />
	 * 11: 验证码错误<br />
	 * 12: 用户名密码错误<br />
	 * 13: 当前用户不合法<br />
	 */
	public void userLogin(RequestContext context) throws Throwable {

		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");

		XCO arg = (XCO) context.getArg();
		// 1. 验证码(通过JSessionID, Redis) // TODO

		// 2. 访问数据库
		XCO user = getPlatformUser(arg);

		// 3. check user
		// if (null == user || !user.exists("user_id")) {
		// context.setResult(XCOUtil.getResult(11, "用户名密码错误"));
		// return;
		// }
		if (0 != user.getCode()) {
			context.setResult(user);
			return;
		}

		if (1 != user.getIntegerValue("active_state") || 1 != user.getIntegerValue("user_state")) {
			context.setResult(XCOUtil.getResult(13, "当前用户不合法"));
			return;
		}

		// 4. 组装数据
		XCO tokenUser = new XCO();
		tokenUser.setLongValue("user_id", user.getLongValue("user_id"));
		tokenUser.setStringValue("mobile_phone", user.getStringValue("mobile_phone"));
		tokenUser.setStringValue("nick_name", user.getStringValue("nick_name"));
		tokenUser.setStringValue("user_name", user.getStringValue("nick_name"));
		// tokenUser.setIntegerValue("platform_user", 1);// 是否是平台用户

		// 5. 合成token
		String token = DESUtil.encrypt(MD5Util.MD5(tokenUser.toXMLString() + System.nanoTime()), Constant.DES_KEY);

		// 6. 放入redis
		CacheUtil.redisPut(jedisClient, Constant.PLATFORM_USER_TOKEN_PREFIX + token, tokenUser.toXMLString(), Constant.REDIS_COOKIE_TOKEN_EXPIRE);

		// 7. 处理Cookie
		// processUserLoginCookie(context.getRequest(), context.getResponse(),
		// token, Constant.USER_DOMAIN);
		// 7.1 清除cookie值
		CookieUtil.clearAllCookies(context.getRequest(), context.getResponse(), Constant.PLATFORM_COOKIE_NAME_TOKEN, Constant.USER_DOMAIN);
		// 7.2 设置cookie值
		Cookie tokenCookie = new Cookie(Constant.PLATFORM_COOKIE_NAME_TOKEN, URLEncoder.encode(token, "utf-8"));
		tokenCookie.setDomain(Constant.USER_DOMAIN);
		tokenCookie.setPath(Constant.COOKIE_PATH);
		tokenCookie.setMaxAge(Constant.COOKIE_MAXAGE);
		// add cookie
		context.getResponse().addCookie(tokenCookie);

		XCO result = new XCO();
		result.setIntegerValue("is_employer", user.getIntegerValue("is_employer"));
		result.setIntegerValue("is_advisor", user.getIntegerValue("is_advisor"));
		result.setIntegerValue("is_providers", user.getIntegerValue("is_providers"));
		// 8. 设置Result
		context.setResult(XCOUtil.getResult(0, result));
	}

	public void userExit(RequestContext context) throws Throwable {

		String token = CookieUtil.getToken(context.getRequest(), Constant.PLATFORM_COOKIE_NAME_TOKEN);
		if (null == token) {
			return;
		}
		token = URLDecoder.decode(token, "utf-8");

		// TODO: 需要判断用户ID

		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");
		jedisClient.del(Constant.PLATFORM_USER_TOKEN_PREFIX + token);

		// 清除cookie值
		String domain = Constant.USER_DOMAIN;
		CookieUtil.clearAllCookies(context.getRequest(), context.getResponse(), Constant.PLATFORM_COOKIE_NAME_TOKEN, domain);

		context.setResult(XCOUtil.getResult(0));
	}

	/**
	 * Cookie相关的操作
	 */
	// private void processUserLoginCookie1(HttpServletRequest request,
	// HttpServletResponse response, String tokenValue, String domain) throws
	// Exception {
	// // String domain = Constant.USER_DOMAIN;
	// // 清除cookie值
	// CookieUtil.clearAllCookies(request, response, domain);
	//
	// Cookie tokenCookie = new Cookie(Constant.COOKIE_NAME_TOKEN,
	// URLEncoder.encode(tokenValue, "utf-8"));
	// tokenCookie.setDomain(domain);
	// tokenCookie.setPath(Constant.COOKIE_PATH);
	// tokenCookie.setMaxAge(Constant.COOKIE_MAXAGE);
	//
	// // add cookie
	// response.addCookie(tokenCookie);
	// }

	public void register(RequestContext context) throws Exception {
		XCO arg = (XCO) context.getArg();
		XCO result = RpcClient.call("http://all.demo1.service/userService/registerUser", arg);
		context.setResult(XCOUtil.getResult(0));
	}

}
