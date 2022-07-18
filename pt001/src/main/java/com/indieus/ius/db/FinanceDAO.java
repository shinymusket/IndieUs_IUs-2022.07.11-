package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.indieus.ius.vo.FinanceVO;

@Repository
public class FinanceDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 재정 리스트 가져오기
	public List<FinanceVO> selectFinanceList() throws Exception {
		return sqlsession.selectList("finance.select_finance_list");
	}
	
}
