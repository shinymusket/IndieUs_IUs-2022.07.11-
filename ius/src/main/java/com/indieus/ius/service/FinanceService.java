package com.indieus.ius.service;

import java.util.List;
import java.util.Map;


import com.indieus.ius.vo.FinanceVO;

public interface FinanceService {
	public Object selectFinanceList() throws Exception;
	
	public List<String> selectAllFinanceEyear() throws Exception;
	
	public Object getFinanceListByYear(Map<String, Object> map) throws Exception;
	
	public int selectFinanceSeq() throws Exception;
	
	public int insertFinance(FinanceVO fVo) throws Exception;
	
	public FinanceVO selectFinanceByNum(String finance_num) throws Exception;
	
	public int deleteFinance(String finance_num) throws Exception;
	
	public int updateFinance(FinanceVO fVo) throws Exception;
}
