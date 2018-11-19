package com.taovr.core.web;

import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.XcoWebException;
import org.xson.web.cache.CacheException;
import org.xson.web.util.SerializeUtil;

public class CacheUtil {

	protected static String	keyEncode	= "UTF-8";

	public static void redisPut(JedisClient jedisClient, Object key, Object value, Integer time) {
		System.out.println("redisPut Object........................");
		try {
			String result = jedisClient.set(parseKey(key).getBytes(keyEncode), SerializeUtil.serialize(value), "nx".getBytes(keyEncode),
					"ex".getBytes(keyEncode), time.intValue());
			System.out.println(result);
			if (!"OK".equalsIgnoreCase(result)) {
				jedisClient.set(parseKey(key).getBytes(keyEncode), SerializeUtil.serialize(value), "xx".getBytes(keyEncode),
						"ex".getBytes(keyEncode), time.intValue());
			}
		} catch (Throwable e) {
			throw new XcoWebException(e);
		}
	}

	protected static String parseKey(Object key) {
		if (null == key) {
			throw new CacheException("cache key does not allow null");
		}
		if (key instanceof String) {
			return (String) key;
		}
		return key.toString();
	}

	public static void redisPut(JedisClient jedisClient, String key, String value, Integer time) {
		System.out.println("redisPut String........................");
		try {
			String result = jedisClient.set(key, value, "nx", "ex", time.intValue());
			if (!"OK".equalsIgnoreCase(result)) {
				jedisClient.set(key, value, "xx", "ex", time.intValue());
			}
		} catch (Throwable e) {
			throw new XcoWebException(e);
		}
	}
}
