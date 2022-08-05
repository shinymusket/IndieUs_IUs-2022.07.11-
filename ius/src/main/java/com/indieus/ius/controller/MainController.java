package com.indieus.ius.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.MainServiceImpl;
import com.indieus.ius.service.StaffIdServiceImpl;
import com.indieus.ius.vo.StaffIdVO;

@Controller
public class MainController {
	
	@Autowired
	private MainServiceImpl service;

	@Autowired
	private StaffIdServiceImpl staffService;
	
	// 홈으로
	@RequestMapping(value = "/main/", method = RequestMethod.GET)
	public String home(HttpSession session) throws Exception {
		if (session.getAttribute("staff") == null) {
			return "/index";
		}
		return "/main/home";
	}

	// 로그인
	@RequestMapping(value = "/main/loginCheck", method = RequestMethod.POST)
	public String main(@ModelAttribute StaffIdVO staff, HttpSession session, HttpServletResponse response) throws Exception {
		staff = staffService.login(staff, response);
		session.setAttribute("staff", staff);
		return "/main/home";
	}

	// 로그아웃
	@RequestMapping(value = "/main/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		staffService.logout(response);
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/main/search_password")
	public String searchPassword() throws Exception {
		return "/main/searchPwd";
	}
	
	// 이메일이 있는지 유무 체크 Ajax
	@ResponseBody
	@RequestMapping(value = "/main/get_email_exist_check", method = RequestMethod.POST)
	public Object getEmailExistCheck(@RequestParam Map<String, Object> map) throws Exception {
		return service.getEmailExistCheck(map);
	}
	
	// 이메일로 임시비밀번호 발송하기 Ajax
	@ResponseBody
	@RequestMapping(value = "/main/search_password_by_email", method = RequestMethod.POST)
	public Object searchPasswordByEmail(@RequestParam Map<String, Object> map) throws Exception {
		return service.searchPasswordByEmail(map);
	}

}
