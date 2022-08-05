package com.indieus.ius.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Value;

import com.indieus.ius.db.MainDAO;
import com.indieus.ius.vo.StaffIdVO;

public class MainServiceImpl implements MainService {
	
	@Inject
	private MainDAO manager; 
	
	
	@Value("${host.smtp.id}")
	private String hostSMTPid;
	@Value("${host.smtp.pwd}")
	private String hostSMTPpwd;
	
	// 이메일이 있는지 유무 체크 Ajax
	@Override
	public Object getEmailExistCheck(Map<String, Object> map) throws Exception {
		int result = manager.getEmailExistCheck(map);
		Map<String, Object> data = new HashMap();
		data.put("result", result);
		return data;
	}

	// 이메일로 임시비밀번호 발송하기 Ajax
	@Override
	public Object searchPasswordByEmail(Map<String, Object> map) throws Exception {
		int result = 0;
		
		int check = manager.getEmailExistCheck(map);
		String staff_email = (String) map.get("staff_email");
		if (check != 0) { // 이메일이 있을 때만 실행
			
			// 이메일로 해당 계정의 아이디, 비밀번호, 이름 가져오기.
			StaffIdVO sIvo = manager.getStaffInfoByEmail(staff_email);
			
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			
			// 해당 계정의 비밀번호를 임시비밀번호로 재설정 후 변경 데이터 입력
			sIvo.setStaff_pwd(pw);
			manager.updateStaffPwd(sIvo);
			
			// 해당 임시비밀번호 발급 내용을 메일로 발송
			
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";

			// 보내는 사람 Email, 제목, 내용
			String fromEmail = "zz1489@naver.com";
			String fromName = "IUS Homepage";
			String subject = "";
			String msg = "";

			subject = "귀하의 IUS Homepage 계정의 임시비밀번호가 발급되었습니다.";

			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += sIvo.getStaff_name() + "님 계정의 비밀번호가 임시로 발급되었습니다.";
			msg += "하단의 임시비밀번호를 확인 후 링크로 이동하여 새로운 비밀번호를 설정하세요.</h3></div><br/>";
			msg += "<p>임시 비밀번호 : ";
			msg += sIvo.getStaff_pwd() + "</p>";
			msg += "<a href='http://localhost:8085/ius/'>홈페이지로 이동</a></div>";

			String mail = staff_email;
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch(Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			
			
			result = 1;
		}
		
		Map<String, Object> data = new HashMap();
		data.put("result", result);
		
		return data;
		
		
	}
	
}
