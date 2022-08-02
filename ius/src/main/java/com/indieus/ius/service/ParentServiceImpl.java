package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.ParentDAO;
import com.indieus.ius.vo.KinderVO;

public class ParentServiceImpl implements ParentService {
	
	@Inject
	private ParentDAO manager;

	// 원생 명단(학부모 성명 포함된) 리스트 가져오기 Ajax
	@Override
	public Object getKinderList() throws Exception {
		List<KinderVO> kinderList = manager.selectKinderListIncludeParentName();
		
		Map<String, Object> data = new HashMap();
		data.put("kinderList", kinderList);
		return data;
	}
	
	// 원생 검색 Ajax
	@Override
	public Object searchKinder(Map<String, Object> map) throws Exception {
		String kinder_name = (String) map.get("kinder_name");
		List<KinderVO> kinderList = manager.selectKinderByName(kinder_name);
		
		Map<String, Object> data = new HashMap();
		data.put("kinderList", kinderList);
		return data;
	}
	
	// 원생 정보 입력시 부모님 데이터가 이미 있는지 조사 Ajax
	@Override
	public Object checkKinderParent(Map<String, Object> map) throws Exception {
		int count = manager.selectKinderGetParent(map);
	
		Map<String, Object> result = new HashMap();
		result.put("count", count);
		return result;
	}
	
	
	
}
