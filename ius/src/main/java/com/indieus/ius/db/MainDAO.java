package com.indieus.ius.db;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.StaffIdVO;

@Repository
public class MainDAO {

	@Autowired
	private SqlSession sqlsession;

	// 이메일이 있는지 유무 체크
	public int getEmailExistCheck(Map<String, Object> map) throws Exception {
		return sqlsession.selectOne("main.select_email_cnt", map);
	}

	// 이메일로 해당 계정의 아이디, 비밀번호, 이름 가져오기
	public StaffIdVO getStaffInfoByEmail(String email) throws Exception {
		return sqlsession.selectOne("main.select_staff_info_by_email", email);
	}

	// 계정 비밀번호 변경
	@Transactional
	public void updateStaffPwd(StaffIdVO sIvo) {
		sqlsession.update("main.update_staff_pwd", sIvo);
	}

}
