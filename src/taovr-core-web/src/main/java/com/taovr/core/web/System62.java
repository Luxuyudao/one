package com.taovr.core.web;

import java.util.HashMap;
import java.util.Map;

public class System62 {

	private static final char[]						CHARS		= { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g',
			'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

	private static final Map<Character, Integer>	CHARMAP		= new HashMap<Character, Integer>(64, 1.0F);

	private static final int						BASE		= CHARS.length;

	private static final int						LONG_SIZE	= 64;

	static {
		for (int i = 0; i < BASE; i++) {
			CHARMAP.put(CHARS[i], i);
		}
	}

	public static String to62Hex(long val) throws Exception {
		char[] buf = new char[LONG_SIZE];
		int charPos = LONG_SIZE;
		while ((val / BASE) > 0) {
			buf[--charPos] = CHARS[(int) (val % BASE)];
			val /= BASE;
		}
		buf[--charPos] = CHARS[(int) (val % BASE)];
		return new String(buf, charPos, (LONG_SIZE - charPos));
	}

}
