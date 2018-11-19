package com.taovr.services.business.service;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import com.taovr.services.business.config.Constant;
import com.taovr.services.business.sms.SMSRouter;
import com.taovr.services.business.util.TimeUtil;

/**
 * 短信
 * @author chy
 *
 */
@Service("smsService")
public class SmsService {
	
	/**
	 * 发送短信验证码
	 * @param xco
	 */
	public void sendSms(XCO xco){
		XCO req = new XCO();
		java.util.Random dom = new java.util.Random();
		int ints = dom.nextInt(1000000);//6位
		String rand = ints+"";
		req.setStringValue("mobile", xco.getStringValue("phone_num"));
		req.setIntegerValue("type", xco.getIntegerValue("send_type"));//修改密码
		req.setIntegerValue("test", 1);
		req.setStringValue("tpl_value", rand);
		SMSRouter.sendSms(req);
		long time = new Date().getTime();
		time +=Constant.sms_有效时间*60*1000;
		xco.setStringValue("effective_time", TimeUtil.stampToDate(String.valueOf(time)));
		xco.setStringValue("ce_into", rand);
		xco.setIntegerValue("ce_type", xco.getIntegerValue("send_type"));
		SqlServiceActuator.execute("tvr-user.insertMobileCe", xco);
	}
	
	/**
	 * 随机生成 num位数字字符数组
	 * 
	 * @param num
	 * @return
	 */
	public static void generateRandomArray() {
		java.util.Random dom = new java.util.Random();
		int ints = dom.nextInt(1000000);//6位
		   
		System.out.println(ints);//不足6位的
		   
	}
	
	public static void main(String[] args){
		generateRandomArray();
	}
}
