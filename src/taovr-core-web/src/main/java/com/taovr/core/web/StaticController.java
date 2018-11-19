package com.taovr.core.web;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.xson.common.object.XCO;

import cn.gatherlife.rpc.RpcClient;

public class StaticController {
	private static Logger	log	= Logger.getLogger(StaticController.class);

	public static Map<String, LinkedHashMap<String, String>> getUserModuleByRole(int role_id) {
		try {
			XCO request = new XCO();
			request.setIntegerValue("role_id", role_id);
			XCO result = RpcClient.call("http://all.demo1.service/tvr-system/queryModuleByRole", request);
			Map<String, LinkedHashMap<String, String>> leftNav = new LinkedHashMap<String, LinkedHashMap<String, String>>();
			Map<Long, String> moduleNameMap = new HashMap<Long, String>();
			if (null != result && 0 == result.getCode()) {
				System.out.println(result);
				List<XCO> list = result.getXCOListValue("data");
				for (XCO item : list) {
					// System.out.println(item);
					LinkedHashMap<String, String> itemMap = null;
					int level = item.getIntegerValue("level");
					if (1 == level) {
						moduleNameMap.put(item.getLongValue("module_id"), item.getStringValue("module_name"));
						itemMap = new LinkedHashMap<String, String>();
						leftNav.put(item.getStringValue("module_name"), itemMap);
					} else {
						itemMap = leftNav.get(moduleNameMap.get(item.getLongValue("f_id")));
						if(null!=itemMap){
							itemMap.put(item.getStringValue("module_name"), item.getStringValue("url"));
						}
					}
				}
				return leftNav;
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}
}
