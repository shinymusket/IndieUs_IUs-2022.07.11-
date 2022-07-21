package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.FinanceVO;

@Repository
public class FinanceDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 재정 리스트 가져오기
	public List<FinanceVO> selectFinanceList() throws Exception {
		return sqlsession.selectList("finance.select_finance_list");
	}
	
	//  재정등록을 위한 다음 시퀀스 값 확인하기 
	public int selectFinanceSeq() throws Exception {
		return sqlsession.selectOne("finance.select_finance_seq");
	}
	
	
	// 재정등록
	@Transactional
	public int insertFinance(FinanceVO fVo) throws Exception {
		return sqlsession.insert("finance.insert_finance", fVo);
	}
}
