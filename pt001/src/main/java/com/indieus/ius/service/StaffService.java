package com.indieus.ius.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieus.ius.vo.JobClassifiVO;
import com.indieus.ius.vo.StaffVO;

public interface StaffService {
	
	public List<StaffVO> selectStaffList() throws Exception; 
	
	public int selectStaffSeq() throws Exception;
	
	public List<JobClassifiVO> selectJobClassifi() throws Exception;
	
	public JobClassifiVO selectJobClassifiByNum(String staff_cls) throws Exception;
	
	public void getJobList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void insertJobList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int insertStaff(StaffVO sVo) throws Exception;
	
	public StaffVO selectStaffInfo(String staff_num) throws Exception;
	
	public int deleteStaff(String staff_num) throws Exception;
	
	public int updateStaff(StaffVO sVo) throws Exception;
	
}