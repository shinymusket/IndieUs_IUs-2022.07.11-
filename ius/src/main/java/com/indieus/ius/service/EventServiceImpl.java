package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.EventDAO;
import com.indieus.ius.vo.EventVO;

public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO manager;

	// 모든 일정 가져오기
	@Override
	public List<EventVO> getAllEventList() throws Exception {
		return manager.getAllEventList();
	}
	
	// 행사 및 일정 등록
	@Override
	public int eventRegister(EventVO eVo) throws Exception {
		return manager.eventRegister(eVo);
	}
	
	// 행사 및 일정 조회
	@Override
	public List<EventVO> eventSelectByEventDate(String event_date) throws Exception {
		return manager.eventSelectByEventDate(event_date);
	}
	
	// 행사 번호로 행사명 가져오기 Ajax
	@Override
	public Object getEventNameByNum(Map<String, Object> map) throws Exception {
		String event_name = manager.getEventNameByNum(map);
		
		Map<String, Object> data = new HashMap();
		data.put("event_name", event_name);
		return data;
	}
	
	// 행사 번호로 행사명 삭제하기 Ajax
	public void deleteEventByNum(Map<String, Object> map) throws Exception {
		manager.deleteEventByNum(map);
		
	}
	
	// 행사명 수정하기 Ajax
	public void updateEventByNum(Map<String, Object> map) throws Exception {
		manager.updateEventByNum(map);
		
	}

}
