package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.ClassDAO;
import com.indieus.ius.vo.ClassVO;

public class ClassServiceImpl implements ClassService {
	
	@Inject
	private ClassDAO manager;
	
	
	
	// 전체 학급 리스트 가져오기 Ajax
	@Override
	public Object getClassList() throws Exception {
		List<ClassVO> classList = manager.selectAllClassList();
		Map<String, Object> data = new HashMap();
		data.put("classList", classList);
		return data;
	}

	// 학급 정보 가져오기 Ajax
	@Override
	public Object getClassByClassNum(Map<String, Object> map) throws Exception {
		String class_number = (String) map.get("class_number");
		ClassVO classInfo = manager.selectClassByClassNum(class_number);
		Map<String, Object> data = new HashMap();
		data.put("classInfo", classInfo);
		return data;
	}
	

}
