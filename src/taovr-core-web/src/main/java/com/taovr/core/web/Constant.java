package com.taovr.core.web;

/**
 * 常量项
 */
public class Constant {

	public static final String	DES_KEY						= "demo1.com";

	// cookie生命周期,以秒为单位。参数为负数代表关闭浏览器时清除cookie,参数为0时代表删除cookie,参数为正数时代表cookie存在多少秒。
	// private static final int COOKIE_MAXAGE = 60 * 60 * 24 * 365 * 5;
	public static final int		COOKIE_MAXAGE				= 60 * 60 * 24 * 365;
	// 设置路径,只有设置该cookie路径及其子路径可以访问
	public static final String	COOKIE_PATH					= "/";
	// private static final String CLEAR_COOKIE_VALUE = "";
	// private static final int CLEAR_COOKIE_MAXAGE = 0;

	// public static final String COOKIE_NAME_TOKEN = "token";

	public static final String	PLATFORM_COOKIE_NAME_TOKEN	= "ptoken";
	public static final String	SYSTEM_COOKIE_NAME_TOKEN	= "stoken";

	public static final String	USER_DOMAIN					= ".demo1.com";
	public static final String	SYS_DOMAIN					= ".boss.demo1.com";

	// redis中的令牌过期时间
	public static final int		REDIS_COOKIE_TOKEN_EXPIRE	= 60 * 60;				// 1小时

	public static final String	PLATFORM_USER_TOKEN_PREFIX	= "UT:";
	public static final String	SYSTEM_USER_TOKEN_PREFIX	= "ST:";

	public final static int		IMG_VERIFY_EFFECTIVE_TIME	= 60 * 10;
	public final static String	IMG_VERIFY_CODE_KEY			= "IV";

	// 认证失败
	public static final int		ERROR_CODE_AUTH_FAILED		= -3;

	public static void main(String[] args) {
		System.out.println("PLATFORM_USER".toUpperCase());
		System.out.println("PLATFORM_USER".toLowerCase());
	}
}
