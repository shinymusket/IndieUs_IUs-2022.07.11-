package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.BudgetDAO;
import com.indieus.ius.vo.BudgetVO;

public class BudgetServiceImpl implements BudgetService {

	@Inject
	private BudgetDAO manager;
	
	// 전체 예산 항목 조회
	@Override
	public List<BudgetVO> selectAllBudget() throws Exception {
		return manager.selectAllBudget();
	}
	
	
	// 예산 리스트 가져오기 Ajax
	@Override
	public Object getBudgetList() throws Exception {
		List<BudgetVO> budgetList = manager.selectAllBudget();
		Map<String, Object> retVal = new HashMap();
		retVal.put("budgetList", budgetList);
		return retVal;
	}
	
	// 년도별 예산 리스트 가져오기 Ajax
	@Override
	public Object getBudgetListByYear(Map<String, Object> map) throws Exception {
		String seachYear = (String) map.get("seachYear");
		List<BudgetVO> budgetList = manager.selectBudgetByYear(seachYear);
		Map<String, Object> retVal = new HashMap();
		retVal.put("budgetList", budgetList);
		return retVal;
	}
	
	// 전체 예산 년도 조회
	@Override
	public List<String> selectAllBudgetYear() throws Exception {
		return manager.selectAllBudgetYear();
	}
	
	// 예상 항목 추가
	@Override
	public int registerBudget(BudgetVO bVo) throws Exception {
		return manager.registerBudget(bVo);
	}

	
	// 예산 정보조회
	@Override
	public BudgetVO selectBudgetNyNum(String budget_num) throws Exception {
		return manager.selectBudgetByNum(budget_num);
	}

	// 예산 항목 삭제
	@Override
	public int deleteBudget(String budget_num) {
		return manager.deleteBudget(budget_num);
	}







}
