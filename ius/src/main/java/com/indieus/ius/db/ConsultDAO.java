package com.indieus.ius.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.indieus.ius.vo.ConsultVO;

@Repository
public class ConsultDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 원생별 상담 일지 정보 가져오기
	public List<ConsultVO> getConsultByKinderNum(Map<String, Object> map) throws Exception {
		return sqlsession.selectList("consult.select_consult_by_kinder_num", map);
		
	}
	
	// 원생별 상담 일지 날짜로 조회하기
	public List<ConsultVO> selectConsultByDate(Map<String, Object> map) throws Exception {
		return sqlsession.selectList("consult.select_consult_by_date", map);
	}

}
