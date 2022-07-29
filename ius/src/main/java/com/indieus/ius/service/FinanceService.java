package com.indieus.ius.service;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;
=======

import javax.servlet.http.HttpServletResponse;
>>>>>>> 2c73c609bb93290dace97a9686ad5952a9e7e0b2

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
