package com.taovr.web.user;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;
import org.xson.thirdparty.redis.JedisClient;
import org.xson.web.RequestContext;
import org.xson.web.cache.helper.RedisCacheHelper;

import cn.gatherlife.rpc.RpcClient;

import com.taovr.core.web.XCOUtil;

public class UserController {
	
	static Logger	log	= Logger.getLogger(UserController.class);
	
	/**
	 * 修改密码发送短信验证码
	 */
	public void sendSms(RequestContext requestContext){//
		XCO xco = (XCO) requestContext.getArg();
		String img_vcode = xco.getStringValue("img_vcode");
		JedisClient jedisClient = RedisCacheHelper.getJedisClient("redisCache");
		String rediskey = jedisClient.get(xco.getStringValue("img_key"));
		if(img_vcode.equals(rediskey)){
			XCO result = RpcClient.call("http://all.demo1.service/smsService/sendSms", xco);
			requestContext.setResult(result);
		}else{
			requestContext.setResult(XCOUtil.getResult(11, "图片验证码错误"));
		}
	}
}
