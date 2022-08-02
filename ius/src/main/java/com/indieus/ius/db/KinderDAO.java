package com.indieus.ius.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.ClassVO;
import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.ParentVO;
import com.indieus.ius.vo.ShuttleVO;
import com.indieus.ius.vo.StaffVO;

@Repository
public class KinderDAO {

	@Autowired
	private SqlSession sqlsession;

	// 전체 원생 리스트 가져오기
	public List<KinderVO> selectKinderList() throws Exception {
		return sqlsession.selectList("kinder.select_kinder_list");
	}

	// 원생 등록을 위한 다음 시퀀스 번호 가져오기
	public int selectNextKinderSeq() throws Exception {
		return sqlsession.selectOne("kinder.select_next_kinder_seq");
	}

	// 원생 등록을 위한 버스 리스트 가져오기
	public List<ShuttleVO> selectAllShuttleList() throws Exception {
		return sqlsession.selectList("kinder.select_all_shuttle_List");
	}

	// 원생 등록을 위한 담임 선생님 리스트 가져오기
	public List<StaffVO> selectHomeTeacherForKinder() throws Exception {
		return sqlsession.selectList("kinder.select_home_teacher_for_kinder");
	}

	// 원생 등록
	@Transactional
	public int insertKinder(KinderVO kVo) throws Exception {
		return sqlsession.insert("kinder.insert_kinder", kVo);
	}
	
	// 담임교사 반 배정을 위한 담임 교사 반 정보 가져오기
	public ClassVO selectClassInfoByStaffNum(String staff_num) throws Exception {
		return sqlsession.selectOne("kinder.select_class_info_by_staff_num", staff_num);
	}
	
	// 담임교사 반 배정
	@Transactional
	public int insertKinderHomeTeacherClass(ClassVO cVo) throws Exception {
		return sqlsession.insert("kinder.insert_kinder_home_teacher_class", cVo);
	}
	
	// 원생 검색
	public List<KinderVO> searchKinderList(Map<String, Object> map) throws Exception {
		return sqlsession.selectList("kinder.search_kinder_list", map);
	}

	// 원생 정보 조회
	public KinderVO selectKinderInfo(String kinder_num) throws Exception {
		return sqlsession.selectOne("kinder.select_kinder_info", kinder_num);
	}
	
	// 원생 정보 조회 - 부모님 이름 가져오기
	public String selectParentNameByKinderNum(Map<String, Object> info) throws Exception {
		return sqlsession.selectOne("kinder.select_parent_name_by_kinder_num", info);
	}

	// 원생 정보 조회 - 부모님 정보 가져오기
	public ParentVO selectParentInfoByKinderNum(Map<String, Object> info) throws Exception {
		return sqlsession.selectOne("kinder.select_parent_info_by_kinder_num", info);
	}
	
	
	// 원생 정보 삭제
	@Transactional
	public int deleteKinderInfo(String kinder_num) throws Exception {
		return sqlsession.delete("kinder.delete_kinder_info", kinder_num);
	}

	// 원생 정보 수정
	public int updateKinder(KinderVO kVo) throws Exception {
		return sqlsession.update("kinder.update_kinder", kVo);
	}

}
