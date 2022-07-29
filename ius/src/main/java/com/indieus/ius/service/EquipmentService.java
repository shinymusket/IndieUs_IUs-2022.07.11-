package com.indieus.ius.service;

import java.util.Map;

import com.indieus.ius.vo.EquipClsVO;

public interface EquipmentService {
	
	public Object getEquipmentList() throws Exception;
	
	public int selectEquipmentSeq() throws Exception;
	
	public String selectStaffNameById(String staff_id) throws Exception;
	
	public Object getEquipmentClsList() throws Exception;
	
	public Object getEquipClsByNum(Map<String, Object> map) throws Exception;
	
	public void insertEquipCls(Map<String, Object> map) throws Exception;
}
