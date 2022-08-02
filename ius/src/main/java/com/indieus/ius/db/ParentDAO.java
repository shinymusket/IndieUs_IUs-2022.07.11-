package com.indieus.ius.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.indieus.ius.vo.KinderVO;

@Repository
public class ParentDAO {
	
	@Autowired
	private SqlSession sqlsession; 
	
	// 원생 명단(학부모 성명 포함된) 리스트 가져오기
	public List<KinderVO> selectKinderListIncludeParentName() throws Exception {
		return sqlsession.selectList("parent.select_kinder_list_include_parent_name");
	}
	
	// 원생 명단 검색
	public List<KinderVO> selectKinderByName(String kinder_name) throws Exception {
		return sqlsession.selectList("parent.select_kinder_by_name", kinder_name);
	}
	
	// 원생의 부모 데이터가 이미 있는지 조사
	public int selectKinderGetParent(Map<String, Object> map) throws Exception {
		return sqlsession.selectOne("parent.select_kinder_get_parent", map);
	}
	
}
