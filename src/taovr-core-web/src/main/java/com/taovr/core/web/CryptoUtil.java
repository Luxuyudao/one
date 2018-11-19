package com.taovr.core.web;

import com.taovr.password.DefaultPasswordEncoder;
import com.taovr.password.PasswordEncoder;

/**
 * 加密解密算法
 */
public class CryptoUtil {

	/**
	 * 加密算法
	 */
	public static String encryption(String encStr) {
		PasswordEncoder passwordEncoder = DefaultPasswordEncoder.getDefaultInstance();
		return passwordEncoder.encodePassword(encStr);
	}

	public static boolean isValid(String pwd1, String pwd2) {
		PasswordEncoder passwordEncoder = DefaultPasswordEncoder.getDefaultInstance();
		return passwordEncoder.isValidPassword(pwd1, pwd2);
	}

	/**
	 * 解密算法
	 */
	public static String Decrypt(String deccStr) {
		throw new RuntimeException("Not supported yet");
	}
}
