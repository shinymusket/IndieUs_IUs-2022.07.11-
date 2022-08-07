package com.indieus.ius.service;

import java.util.Map;

import com.indieus.ius.vo.AuthorityVO;

public interface MainService {

	public Object getEmailExistCheck(Map<String, Object> map) throws Exception;

	public Object searchPasswordByEmail(Map<String, Object> map) throws Exception;
	
	public AuthorityVO selectAuthByCode(String auth_code) throws Exception;
	
	public Object getAuthInfoByCode(Map<String, Object> map) throws Exception;
}
