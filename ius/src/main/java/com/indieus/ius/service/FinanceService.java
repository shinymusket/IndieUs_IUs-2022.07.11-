package com.indieus.ius.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.indieus.ius.vo.FinanceVO;

public interface FinanceService {
	public List<FinanceVO> selectFinanceList() throws Exception;
	
	public int selectFinanceSeq() throws Exception;
	
	public int insertFinance(FinanceVO fVo) throws Exception;
	
	public FinanceVO selectFinanceByNum(String finance_num) throws Exception;
	
	public int deleteFinance(String finance_num) throws Exception;
	
	public int updateFinance(FinanceVO fVo) throws Exception;
}
