package com.indieus.ius.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.ShuttleVO;
import com.indieus.ius.vo.StaffVO;

public interface KinderService {

	public Object getKinderList() throws Exception;

	public Object getKinderByKinderNum(Map<String, Object> map) throws Exception;

	public int selectNextKinderSeq() throws Exception;

	public List<ShuttleVO> selectAllShuttleList() throws Exception;

	public List<StaffVO> selectHomeTeacherForKinder() throws Exception;

	public int insertKinder(KinderVO kVo, MultipartFile kinder_picFile) throws Exception;

	public Object searchKinderList(Map<String, Object> map) throws Exception;

	public KinderVO selectKinderInfo(String kinder_num) throws Exception;

	public int deleteKinderInfo(String kinder_num) throws Exception;

	public int updateKinder(KinderVO kVo, MultipartFile kinder_picFile) throws Exception;

}
