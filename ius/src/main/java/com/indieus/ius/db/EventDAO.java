package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.indieus.ius.vo.EventVO;

@Repository
public class EventDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 모든 일정 가져오기
	public List<EventVO> getAllEventList() throws Exception {
		return null;
	}
	
}
