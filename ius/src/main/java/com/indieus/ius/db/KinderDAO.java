package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.indieus.ius.vo.KinderVO;

@Repository
public class KinderDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 전체 원생 리스트 가져오기
	public List<KinderVO> selectKinderList() throws Exception {
		return sqlsession.selectList("kinder.select_kinder_list");
	}
	
}
