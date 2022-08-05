package com.indieus.ius.service;

import java.util.Map;

public interface MainService {
	
	public Object getEmailExistCheck(Map<String, Object> map) throws Exception;
	
	public Object searchPasswordByEmail(Map<String, Object> map) throws Exception;
}
