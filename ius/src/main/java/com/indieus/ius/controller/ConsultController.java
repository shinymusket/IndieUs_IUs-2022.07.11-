package com.indieus.ius.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/consult")
public class ConsultController {
	
	// 상담 일지 페이지 이동
	@RequestMapping(value = "/consult_list", method = RequestMethod.GET)
	public String list() throws Exception {
		return "consult/consultList";
	}
	
}
