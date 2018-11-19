package com.taovr.core.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

	public static void clearAllCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String domain) {
		clearCookie(response, request, cookieName, domain);
	}

	public static void clearCookie(HttpServletResponse response, HttpServletRequest request, String cookieName, String domain) {
		Cookie cToken = new Cookie(cookieName, null);
		cToken.setDomain(domain);
		cToken.setPath(Constant.COOKIE_PATH);
		cToken.setMaxAge(0);
		response.addCookie(cToken);
	}

	/**
	 * 获取Token
	 */
	public static String getToken(HttpServletRequest request, String cookieName) {
		Cookie cookies[] = request.getCookies();
		Cookie sCookie = null;
		for (int i = 0; i < cookies.length; i++) {
			sCookie = cookies[i];
			if (sCookie != null) {
				if (cookieName.equalsIgnoreCase(sCookie.getName())) {
					return sCookie.getValue();
				}
			}
		}
		return null;
	}
}
