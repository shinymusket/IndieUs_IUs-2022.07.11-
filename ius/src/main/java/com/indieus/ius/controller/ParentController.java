package com.indieus.ius.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.ParentServiceImpl;

@Controller
@RequestMapping("/parent")
public class ParentController {
	
	@Autowired
	private ParentServiceImpl service;
	
	// 학부모 관리 홈페이지로 이동
	@RequestMapping(value = "/parent_list", method = RequestMethod.GET)
	public String list() throws Exception {
		return "parent/parentList";
	}
	
	// 원생 명단(학부모 성명 포함된) 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_kinder_list", method = RequestMethod.POST)
	public Object getKinderList() throws Exception {
		return service.getKinderList();
	}
	
	// 학부모 정보 입력 폼으로 이동
	@RequestMapping(value = "/parent_register_form", method = RequestMethod.GET)
	public String parentRegister() throws Exception {
		return "parent/parentRegisterForm";
	}
	
	// 학부모 정보 입력 중 원생 조회 홈페이지
	@RequestMapping(value = "/select_kinder", method = RequestMethod.GET)
	public String selectKinder() throws Exception {
		return "parent/selectKinder";
	}
	
	// 원생 검색 AJax
	@ResponseBody
	@RequestMapping(value = "/search_kinder", method = RequestMethod.POST)
	public Object searchKinder(@RequestParam Map<String, Object> map) throws Exception {
		return service.searchKinder(map);
	}
	
	// 원생 정보 입력시 부모님 데이터가 이미 있는지 조사 Ajax
	@ResponseBody
	@RequestMapping(value = "/check_kinder_parent", method = RequestMethod.POST)
	public Object checkKinderParent(@RequestParam Map<String, Object> map) throws Exception {
		return service.checkKinderParent(map);
	}
}
