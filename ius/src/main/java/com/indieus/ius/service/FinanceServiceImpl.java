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

	// 재정등록을 위한 다음 시퀀스 값 확인하기 
	@Override
	public int selectFinanceSeq() throws Exception {
		return manager.selectFinanceSeq();
	}

	// 재정 등록
	@Override
	public int insertFinance(FinanceVO fVo) throws Exception {
		return manager.insertFinance(fVo);
	}
	
	
}
