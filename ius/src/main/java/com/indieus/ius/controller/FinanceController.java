package com.indieus.ius.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.indieus.ius.service.BudgetServiceImpl;
import com.indieus.ius.service.FinanceServiceImpl;
import com.indieus.ius.service.StaffServiceImpl;
import com.indieus.ius.vo.BudgetVO;
import com.indieus.ius.vo.FinanceVO;
import com.indieus.ius.vo.StaffVO;

@Controller
@RequestMapping("/finance")
public class FinanceController {
	
	@Autowired
	private FinanceServiceImpl service;
	@Autowired
	private StaffServiceImpl staffService;
	@Autowired
	private BudgetServiceImpl budgetService;
	
	
	// 재정관리 처음 화면 - 리스트 불러오기
	@RequestMapping(value = "/finance_list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<FinanceVO> list = service.selectFinanceList();
		model.addAttribute("financeList", list);
		return "/finance/financeList";
	}
	
	// 재정등록 폼
	@RequestMapping(value = "/finance_register_form", method = RequestMethod.GET)
	public String registerForm(Model model, @RequestParam String iE) throws Exception {
		// 예산 코드 가져오기
		int finance_num = service.selectFinanceSeq();	
		// 예산 항목 가져오기
		List<BudgetVO> budgetList = budgetService.selectBudgetByBudgetIe(iE);
		// 교직원 명단 가져오기
		List<StaffVO> staffList = staffService.selectStaffList();
		
		model.addAttribute("iE", iE);
		model.addAttribute("finance_num", finance_num);
		model.addAttribute("budgetList", budgetList);
		model.addAttribute("staffList", staffList);
		
		return "/finance/financeRegisterForm";
	}
	
	// 재정등록
	@RequestMapping(value = "/finance_register", method = RequestMethod.POST)
	public String register(@ModelAttribute FinanceVO fVo, RedirectAttributes rttr) throws Exception {
		rttr.addFlashAttribute("result", service.insertFinance(fVo));
		return "redirect:./finance_list";
	}
}
