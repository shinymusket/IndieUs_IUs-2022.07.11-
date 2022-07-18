package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.JobClassifiVO;
import com.indieus.ius.vo.StaffVO;

@Repository
public class StaffDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 교직원 리스트 가져오기
	public List<StaffVO> selectStaffList() throws Exception {
		return sqlsession.selectList("staff.select_staff_list");
	}
	
	// 교직원 등록을 위한 다음 시퀀스 값 조회
	public int selectStaffSeq() throws Exception {
		return sqlsession.selectOne("staff.select_staff_seq");
	}
	
	// 직무 분류 항목 가져오기
	public List<JobClassifiVO> selectJobClassifi() throws Exception {
		return sqlsession.selectList("staff.select_job_classifi");
	}
	
	// 직무 코드로 직무명 가져오기
	public JobClassifiVO selectJobClassifiByNum(String staff_cls) throws Exception {
		return sqlsession.selectOne("staff.select_job_classifi_by_num", staff_cls);
	}
	
	
	// 교직원 등록
	@Transactional
	public int insertStaff(StaffVO sVo) throws Exception {
		return sqlsession.insert("staff.insert_staff", sVo);
	}
	
	// 교직원 상세정보
	public StaffVO selectStaffInfo(String staff_num) throws Exception {
		return sqlsession.selectOne("staff.select_staff_info", staff_num);
	}
	
	// 교직원 삭제
	@Transactional
	public int deleteStaff(String staff_num) throws Exception {
		return sqlsession.delete("staff.delete_staff", staff_num);
	}
	
	// 교직원 정보수정
	@Transactional
	public int updateStaff(StaffVO sVo) throws Exception {
		return sqlsession.update("staff.update_staff", sVo);
	}
	
}
