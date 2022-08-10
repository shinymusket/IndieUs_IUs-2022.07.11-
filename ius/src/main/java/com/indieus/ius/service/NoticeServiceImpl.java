package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.NoticeDAO;
import com.indieus.ius.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDAO manager;
	
	// 전체 공지사항 게시물 불러오기 Ajax
	public Object getNoticeList() throws Exception {
		List<NoticeVO> noticeList = manager.getNoticeList();
		Map<String, Object> data = new HashMap();
		data.put("noticeList", noticeList);
		return data;
	}

}
