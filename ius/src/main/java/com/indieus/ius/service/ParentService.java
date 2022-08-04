package com.indieus.ius.service;

import java.util.Map;

import com.indieus.ius.vo.ParentVO;

public interface ParentService {

	public Object getKinderList() throws Exception;

	public Object searchKinder(Map<String, Object> map) throws Exception;

	public Object checkKinderParent(Map<String, Object> map) throws Exception;

	public int insertParent(ParentVO pVo) throws Exception;

	public Object getKinderParentInfo(Map<String, Object> map) throws Exception;

	public void deleteParentInfo(Map<String, Object> map) throws Exception;

	public void updateParentInfo(Map<String, Object> map) throws Exception;
}