package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.ConsultDAO;
import com.indieus.ius.vo.ConsultVO;

public class ConsultServiceImpl implements ConsultService {
	
	@Inject
	private ConsultDAO manager;
	
	// 원생별 상담 일지 정보 가져오기 Ajax
	@Override
	public Object getConsultByKinderNum(Map<String, Object> map) throws Exception {
		List<ConsultVO> consultInfo = manager.getConsultByKinderNum(map);
		Map<String, Object> data = new HashMap();
		data.put("consultInfo", consultInfo);	
		return data;
	}
	
	// 원생별 상담 일지 날짜로 조회하기 Ajax
	@Override
	public Object selectConsultByDate(Map<String, Object> map) throws Exception {
		List<ConsultVO> consultInfo = manager.selectConsultByDate(map);
		Map<String, Object> data = new HashMap();
		data.put("consultInfo", consultInfo);	
		return data;
	}

}
