package org.com.shop.common;

import java.util.UUID;

public class CommonUtil {
	/**
	 * 获得�?个UUID
	 * 
	 * @return String UUID
	 */
	public static String getUUID() {
		String uid = UUID.randomUUID().toString();
		return uid.replace("-", "");
	}
}
