package com.taovr.services.business.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import com.taovr.core.web.CryptoUtil;

@Service("systemService")
public class SystemService {

	/**
	 * 系统管理员初始化密码
	 * @param xco
	 * @return
	 */
	public void initSystemUserPwd(XCO xco){
		xco.setStringValue("pwd", CryptoUtil.encryption("123456"));
		SqlServiceActuator.execute("tvr-system.initSystemUserPwd", xco);
	}
	
	/**
	 * 后台修改密码
	 * @param xco
	 * @return
	 */
	public void udapteUserPwd(XCO xco){
		String rand = xco.getStringValue("pwd1");
		xco.setStringValue("user_pwd", CryptoUtil.encryption(rand));
		SqlServiceActuator.execute("tvr-system.udapteUserPwd", xco);
	}
	
	
	/**
	 * 添加系统管理员时。密码处理
	 * @param xco
	 * @return
	 */
	public void insertSysUser(XCO xco){
		xco.setStringValue("pwd", CryptoUtil.encryption("123456"));
		SqlServiceActuator.execute("tvr-system.insertSysUser", xco);
	}
	
	/**
	 * 保存某个角色下 挂载的权限信息
	 * @param xco
	 * @return
	 */
	public void saveOpt(XCO xco){
		String ids = xco.getStringValue("flag");
		List<XCO> list = new ArrayList<XCO>();
		if(ids.indexOf(",") > -1){
			String[] arr = ids.split(",");
			for(int i=0;i<arr.length;i++){
				XCO mrole = new XCO();
				mrole.setStringValue("module_id", arr[i]);
				mrole.setStringValue("role_id", xco.getStringValue("role_id"));
				list.add(mrole);
			}
		}else{
			XCO mrole = new XCO();
			mrole.setStringValue("module_id", ids);
			mrole.setStringValue("role_id", xco.getStringValue("role_id"));
			list.add(mrole);
		}
		xco.setXCOListValue("list", list);
		SqlServiceActuator.execute("tvr-system.insertModel_rule", xco);
	}
	
}
