package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.ClassVO;
import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.StaffVO;

public class ClassDAO {

	@Autowired
	private SqlSession sqlsession;

	// 학급 반 전체 리스트 가져오기
	public List<ClassVO> selectAllClassList() throws Exception {
		return sqlsession.selectList("class.select_all_class_list");
	}

	// 학급 정보 가져오기
	public ClassVO selectClassByClassNum(String class_number) throws Exception {
		return sqlsession.selectOne("class.select_class_by_class_num", class_number);
	}
	
	// 학급별 학생 명단 가져오기
	public List<KinderVO> selectClassKinderByClassNum(String class_number) throws Exception {
		return sqlsession.selectList("class.select_class_kinder_by_class_num", class_number);
	}
	
	// 학급 등록을 위한 마지막 학급 번호 값 가져오기
	public int selectClassLastNumber() throws Exception {
		return sqlsession.selectOne("class.select_class_last_number");
	}
	
	// 학급 등록을 위한 담당 교사 리스트 가져오기
	public List<StaffVO> selectClassHomeTeacher() throws Exception {
		return sqlsession.selectList("class.select_class_home_teacher");
	}
	
	// 학급 등록
	@Transactional
	public int updateClass(ClassVO cVo) throws Exception {
		return sqlsession.update("class.update_class", cVo);
	}
	
}
