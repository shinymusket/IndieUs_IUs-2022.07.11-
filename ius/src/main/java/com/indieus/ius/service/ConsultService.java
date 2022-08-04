package com.indieus.ius.service;

import java.util.Map;

public interface ConsultService {
	
	public Object getConsultByKinderNum(Map<String, Object> map) throws Exception;
	
	public Object selectConsultByDate(Map<String, Object> map) throws Exception;

}
