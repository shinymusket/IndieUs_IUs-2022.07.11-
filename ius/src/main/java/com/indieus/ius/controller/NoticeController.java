package com.indieus.ius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.NoticeServiceImpl;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl service;
	
	
	// 공지사항 목록으로 이동
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String list() throws Exception {
		return "notice/noticeList";
	}
	
	// 전체 공지사항 게시물 불러오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_notice_list", method = RequestMethod.POST)
	public Object getNoticeList() throws Exception {
		return service.getNoticeList();
	}
	
	// 공지사항 등록 폼으로 이동
	@RequestMapping(value = "/notice_register_form", method = RequestMethod.GET)
	public String noticeRegisterForm() throws Exception {
		return "notice/noticeRegister";
	}
	
	// 공지사항 등록
	
	
}
