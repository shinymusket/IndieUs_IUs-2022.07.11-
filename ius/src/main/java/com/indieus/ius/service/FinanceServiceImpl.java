package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.FinanceDAO;
import com.indieus.ius.vo.FinanceVO;

public class FinanceServiceImpl implements FinanceService {


	@Inject
	private FinanceDAO manager;


	// 재정 목록 가져오기 Ajax
	@Override
	public Object selectFinanceList() throws Exception {
		List<FinanceVO> financeList = manager.selectFinanceList();
		Map<String, Object> retVal = new HashMap();
		retVal.put("financeList", financeList);
		return retVal;
	}

	// 년도별 재정 리스트 가져오기 Ajax
	@Override
	public Object getFinanceListByYear(Map<String, Object> map) throws Exception {
		Map<String, Object> retVal = new HashMap();

		String seachYear = (String) map.get("seachYear");
		String financeType =(String) map.get("finance_type");

		List<FinanceVO> financeList = manager.selectFinanceByEyear(seachYear, financeType);
		retVal.put("financeList", financeList);

		int totalIncome = manager.selectTotalIncomeByEyear(seachYear);
		retVal.put("totalIncome", totalIncome);
		int totalExpense = manager.selectTotalExpenseByEyear(seachYear);
		retVal.put("totalExpense", totalExpense);

		return retVal;
	}



	// 전체 재정 회계 년도 조회
	@Override
	public List<String> selectAllFinanceEyear() throws Exception {
		return manager.selectAllFinanceEyear();
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

	// 재정 상세보기
	@Override
	public FinanceVO selectFinanceByNum(String finance_num) throws Exception {
		return manager.selectFinanceByNum(finance_num);
	}

	// 재정 삭제
	@Override
	public int deleteFinance(String finance_num) throws Exception {
		return manager.deleteFinance(finance_num);
	}

	// 재정 정보 수정
	@Override
	public int updateFinance(FinanceVO fVo) throws Exception {
		return manager.updateFinance(fVo);
	}


}
