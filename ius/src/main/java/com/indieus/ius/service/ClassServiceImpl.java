package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.ClassDAO;
import com.indieus.ius.vo.ClassVO;
import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.StaffVO;

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
		List<KinderVO> classKinderList = manager.selectClassKinderByClassNum(class_number);
		
		Map<String, Object> data = new HashMap();
		data.put("classInfo", classInfo);
		data.put("classKinderList", classKinderList);
		return data;
	}

	// 학급 등록을 위한 마지막 학급 번호 가져오기
	@Override
	public int selectClassLastNumber() throws Exception {
		return manager.selectClassLastNumber();
	}
	
	// 학급 등록을 위한 담당 교사 리스트 가져오기
	@Override
	public List<StaffVO> selectClassHomeTeacher() throws Exception {
		return manager.selectClassHomeTeacher();
	}
	
	// 학급 등록
	@Override
	public int updateClass(ClassVO cVo) throws Exception {
		return manager.updateClass(cVo);
	}

}
