package com.indieus.ius.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;

import com.indieus.ius.db.EventDAO;
import com.indieus.ius.vo.EventVO;

public class EventServiceImpl implements EventService {
	
	@Inject
	private EventDAO manager;

	// 모든 일정 가져오기
	@Autowired
	public List<EventVO> getAllEventList() throws Exception {
		return manager.getAllEventList();
	}
	
}
