package com.indieus.ius.service;

import java.util.List;
import java.util.Map;


import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.ShuttleVO;
import com.indieus.ius.vo.StaffVO;

public interface KinderService {

	public Object getKinderList() throws Exception;
	
	public int selectNextKinderSeq() throws Exception;
	
	public List<ShuttleVO> selectAllShuttleList() throws Exception;
	
	public List<StaffVO> selectHomeTeacherForKinder() throws Exception;
	
	public int insertKinder(KinderVO kVo) throws Exception;
	
	public Object searchKinderList(Map<String, Object> map) throws Exception;
	

}
