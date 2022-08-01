package com.indieus.ius.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.ClassServiceImpl;

@Controller
@RequestMapping("/class")
public class ClassController {
	
	@Autowired
	private ClassServiceImpl service;
	
	
	// 학급 관리 화면으로 이동
	@RequestMapping(value = "/class_list", method = RequestMethod.GET)
	public String List() throws Exception {
		return "class/classList";
	}
	
	// 전체 학급 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_class_list", method = RequestMethod.POST)
	public Object getClassList() throws Exception {
		return service.getClassList();
	}
	
	// 학급 정보 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_class_by_class_num", method = RequestMethod.POST)
	public Object getClassByClassNum(@RequestParam Map<String, Object> map) throws Exception  {
		return service.getClassByClassNum(map);
	}
}
