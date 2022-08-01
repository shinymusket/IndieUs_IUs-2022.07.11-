package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.indieus.ius.vo.ClassVO;

public class ClassDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 학급 반 전체 리스트 가져오기
	public List<ClassVO> selectAllClassList() throws Exception {
		return sqlsession.selectList("class.select_all_class_list");
	}
	
	// 학급 정보 가져오기
	public ClassVO selectClassByClassNum(String class_num) throws Exception {
		return sqlsession.selectOne("class.select_class_by_class_num", class_num);
	}
}
