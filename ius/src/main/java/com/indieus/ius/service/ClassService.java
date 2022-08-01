package com.indieus.ius.service;

import java.util.Map;

public interface ClassService {
	
	public Object getClassList() throws Exception;
	
	public Object getClassByClassNum(Map<String, Object> map) throws Exception;
}
