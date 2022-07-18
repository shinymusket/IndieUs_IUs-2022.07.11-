package com.green.pt001.service;

import java.util.List;

import com.green.pt001.vo.JobClassifiVO;
import com.green.pt001.vo.StaffVO;

public interface StaffService {
	
	public List<StaffVO> selectStaffList() throws Exception; 
	
	public int selectStaffSeq() throws Exception;
	
	public List<JobClassifiVO> selectJobClassifi() throws Exception;
	
	public JobClassifiVO selectJobClassifiByNum(String staff_cls) throws Exception;
	
	public int insertStaff(StaffVO sVo) throws Exception;
	
	public StaffVO selectStaffInfo(String staff_num) throws Exception;
	
	public int deleteStaff(String staff_num) throws Exception;
	
	public int updateStaff(StaffVO sVo) throws Exception;
	
}
