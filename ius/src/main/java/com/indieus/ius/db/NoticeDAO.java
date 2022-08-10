package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.indieus.ius.vo.NoticeVO;

public class NoticeDAO {

	@Autowired
	private SqlSession sqlsession;
	
	
	// 전체 공지사항 게시물 불러오기
	public List<NoticeVO> getNoticeList() throws Exception {
		return sqlsession.selectList("notice.select_all_notice_list");
	}

}
