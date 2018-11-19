package com.taovr.services.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.xson.common.object.XCO;
/**
 * 系统定时任务
 * @author Administrator
 *
 */
public class TimeService {
	
	@Autowired
   // private TimerUtils timerUtils;
	
	/**
	 * 系统定时任务 完成 加盟服务商顾问 审核
	 * 1.实名认证审核成功
	 * 2.银行卡认证成功（省略）
	 * 3.资质案例审核成功
	 */
	public void auditUser(XCO xco) {
		//timerUtils.execute(new TimerRunnable("finishInstockTask"){
		//	public void run() {
		//		
		//	}
		//});
	}
	
}
