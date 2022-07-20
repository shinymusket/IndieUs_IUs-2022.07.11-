package com.indieus.ius.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.indieus.ius.db.FinanceDAO;
import com.indieus.ius.vo.FinanceVO;

public class FinanceServiceImpl implements FinanceService {
	
	
	@Inject
	private FinanceDAO manager;
	
	
	// 재정 목록 가져오기
	@Override
	public List<FinanceVO> selectFinanceList() throws Exception {
		List<FinanceVO> list = manager.selectFinanceList();
		return list;
	}
	
}
