package com.indieus.ius.db;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.indieus.ius.vo.AuthorityVO;

public class AuthorityDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 교직원 번호로 권한 코드 가져오기
	public String selectAuthCodeByStaffNum(String staff_num) {
		return sqlsession.selectOne("authority.select_auth_code_by_staff_num", staff_num);
	}
	
	// 코드로 권한 정보 가져오기
	public AuthorityVO selectAuthByCode(String auth_code) {
		return sqlsession.selectOne("authority.select_auth_by_code", auth_code);
	}

}
