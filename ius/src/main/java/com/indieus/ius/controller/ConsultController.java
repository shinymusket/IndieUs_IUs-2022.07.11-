package com.indieus.ius.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.ConsultServiceImpl;

@Controller
@RequestMapping("/consult")
public class ConsultController {

	@Autowired
	private ConsultServiceImpl service;
	
	// 상담 일지 페이지 이동
	@RequestMapping(value = "/consult_list", method = RequestMethod.GET)
	public String list() throws Exception {
		return "consult/consultList";
	}
	
	// 원생별 상담 일지 정보 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_consult_by_kinder_num", method = RequestMethod.POST)
	public Object getConsultByKinderNum(@RequestParam Map<String, Object> map) throws Exception {
		return service.getConsultByKinderNum(map);
	}
	
	// 원생별 상담 일지 날짜로 조회하기 Ajax
	@ResponseBody
	@RequestMapping(value = "/select_consult", method = RequestMethod.POST)
	public Object selectConsultByDate(@RequestParam Map<String, Object> map) throws Exception {
		return service.selectConsultByDate(map);
	}
}
