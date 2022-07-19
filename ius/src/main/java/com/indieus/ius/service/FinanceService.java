package com.indieus.ius.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.indieus.ius.vo.FinanceVO;

public interface FinanceService {
	public List<FinanceVO> selectFinanceList(HttpServletResponse response) throws Exception;
}
