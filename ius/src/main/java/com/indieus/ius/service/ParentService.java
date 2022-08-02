package com.indieus.ius.service;

import java.util.Map;

public interface ParentService {
	
	public Object getKinderList() throws Exception;
	
	public Object searchKinder(Map<String, Object> map) throws Exception;
	
	public Object checkKinderParent(Map<String, Object> map) throws Exception;
}
