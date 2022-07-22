package com.indieus.ius.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.AuthorityDAO;
import com.indieus.ius.vo.AuthorityVO;

public class AuthorityServiceImpl implements AuthorityService {
	
	@Inject
	private AuthorityDAO manager;
	
	// 권한 정보 불러오기 Ajax
	public Object getAuthorityInfo(Map<String, Object> map) throws Exception {
		String staff_num = (String) map.get("staff_num");
		String auth_code = manager.selectAuthCodeByStaffNum(staff_num);
		AuthorityVO aVo = manager.selectAuthByCode(auth_code);
		
		Map<String, Object> retVal = new HashMap();
		retVal.put("authorityInfo", aVo);
		return retVal;
	}

}
