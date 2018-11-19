package com.taovr.services.business.service;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import com.taovr.core.web.CryptoUtil;
import com.taovr.services.business.config.Constant;
import com.taovr.services.business.util.TimeUtil;

/**
 * 用户
 * @author chy
 *
 */
@Service("userService")
public class UserService {
	
	
	/**
	 * 客服人员待注册用户
	 * @param xco
	 * @return
	 */
	public XCO addProxyUser(XCO xco){
		String rand = generateRandomArray(8).toString();
		xco.setStringValue("user_pwd", CryptoUtil.encryption(rand));
		xco.setIntegerValue("active_state", 0);//待注册用户默认未激活
		//return SqlServiceActuator.execute("tvr-user.insertUser", xco);
		XCO result = SqlServiceActuator.execute("tvr-user.insertUser", xco);
		//System.out.println("XXXXXXXXXX:\n" + result);
		return result;
	}
	
	
	/**
	 * 前台注册用户
	 * @param xco
	 * @return
	 */
	public void registerUser(XCO xco){
		String rand = xco.getStringValue("pwd1");
		xco.setStringValue("user_pwd", CryptoUtil.encryption(rand));
		xco.setIntegerValue("active_state", 1);//待注册用户默认激活
		xco.setIntegerValue("is_employer", 1);//前台注册用户默认为雇主
		xco.setStringValue("nick_name", xco.getStringValue("phone"));//前台注册用户名称默认为""
		SqlServiceActuator.execute("tvr-user.insertUser", xco);
	}
	
	/**
	 * 平台修改密码
	 * @param xco
	 * @return
	 */
	public void udapteUserPwd(XCO xco){
		String rand = xco.getStringValue("pwd1");
		xco.setStringValue("user_pwd", CryptoUtil.encryption(rand));
		long time = new Date().getTime();
		xco.setStringValue("effective_time", TimeUtil.stampToDate(String.valueOf(time)));
		SqlServiceActuator.execute("tvr-user.updatePwd", xco);
	}
	
	/**
	 * 随机生成 num位数字字符数组
	 * 
	 * @param num
	 * @return
	 */
	public static char[] generateRandomArray(int num) {
		String chars = "0123456789";
		char[] rands = new char[num];
		for (int i = 0; i < num; i++) {
			int rand = (int) (Math.random() * 10);
			rands[i] = chars.charAt(rand);
		}
		return rands;
	}
}
