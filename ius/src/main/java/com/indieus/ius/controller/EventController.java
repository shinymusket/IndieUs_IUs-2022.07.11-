package com.indieus.ius.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indieus.ius.service.EventServiceImpl;
import com.indieus.ius.vo.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventServiceImpl service;
	
	// 행사 및 일정 리스트로 이동
	@RequestMapping(value = "/event_list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<EventVO> eventList = service.getAllEventList();
		
		model.addAttribute("eventList", eventList);
		return "event/eventList";
	}
}
