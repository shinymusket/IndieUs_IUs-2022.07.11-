package com.indieus.ius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.KinderServiceImpl;

@Controller
@RequestMapping("/kinder")
public class KinderController {
	
	@Autowired
	private KinderServiceImpl service;
	
	// 원생 관리 리스트로 이동
	@RequestMapping(value = "/kinder_list", method = RequestMethod.GET)
	public String list() throws Exception {
		return "kinder/kinderList";
	}
	
	// 원생 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "get_kinder_list", method = RequestMethod.POST)
	public Object getKinderList() throws Exception {
		return service.getKinderList();
	}
	
	// 원생 등록 폼으로 이동
	@RequestMapping(value = "kinder_register_form", method = RequestMethod.GET)
	public String KinderRegisterForm() throws Exception {
		return "kinder/kinderRegisterForm";
	}
	
}
