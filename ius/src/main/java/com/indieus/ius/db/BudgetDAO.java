package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.BudgetVO;

@Repository
public class BudgetDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 전체 예산 항목 조회
	public List<BudgetVO> selectAllBudget() throws Exception {
		return sqlsession.selectList("budget.select_all_budget");
	}
	
	// 전체 예산 년도 조회
	public List<String> selectAllBudgetYear() throws Exception {
		return sqlsession.selectList("budget.select_all_budget_year");
	}
	
	// 년도별 예산 조회
	public List<BudgetVO> selectBudgetByYear(String seachYear) throws Exception {
		return sqlsession.selectList("budget.select_budget_by_year", seachYear);
	}
	
	
	// 예산 항목 추가
	@Transactional
	public int registerBudget(BudgetVO bVo) throws Exception {
		return sqlsession.insert("budget.register_budget", bVo);
	}
	
	// 예산 정보 조회
	public BudgetVO selectBudgetByNum(String budget_num) throws Exception {
		return sqlsession.selectOne("budget.select_budget_by_num", budget_num);
	}
	
	// 예산 항목 삭제
	@Transactional
	public int deleteBudget(String budget_num) {
		return sqlsession.delete("budget.delete_budget_by_num", budget_num);
	}


	
}
