package com.indieus.ius.service;

import java.util.List;

import com.indieus.ius.vo.EventVO;

public interface EventService {
	
	public List<EventVO> getAllEventList() throws Exception;
}
