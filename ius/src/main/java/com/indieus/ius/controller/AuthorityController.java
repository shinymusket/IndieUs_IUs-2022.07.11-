package com.indieus.ius.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indieus.ius.service.AuthorityServiceImpl;
import com.indieus.ius.service.StaffServiceImpl;
import com.indieus.ius.vo.StaffVO;

@Controller
@RequestMapping("/authority")
public class AuthorityController {
	
	@Autowired
	private AuthorityServiceImpl service;
	@Autowired
	private StaffServiceImpl staffService;
	
	
	// 권한 부여 페이지 이동
	@RequestMapping(value = "/authority_edit", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<StaffVO> staffList = staffService.selectStaffList();
		model.addAttribute("staffList", staffList);
		
		return "authority/authorityEdit";
	}
	
}
