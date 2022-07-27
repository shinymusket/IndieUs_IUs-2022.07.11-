package com.indieus.ius.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.KinderDAO;
import com.indieus.ius.vo.KinderVO;

public class KinderServiceImpl implements KinderService {
	
	@Inject
	private KinderDAO manager;
	
	// 원생 리스트 가져오기 Ajax
	public Object getKinderList() throws Exception {
		List<KinderVO> kinderList = manager.selectKinderList();

		if (kinderList.size() != 0) {
			for(KinderVO element : kinderList) {
				String rrn1 = element.getKinder_rrn1();
				String rrn2 = element.getKinder_rrn2();
				
				int backNum = Integer.parseInt(rrn2.substring(0, 1));
				
				// 가져온 주민등록번호로 성별값 입력
				if ((backNum % 2) == 1) {
					element.setKinder_sex("M");
				} else {
					element.setKinder_sex("F");
				}
				
				// 가져온 주민등록번호로 생년월일 값 입력
				String birth = "";
				if (backNum == 3 || backNum == 4) {
					birth += "20";

				} else if (backNum == 1 || backNum == 2) {
					birth += "19";
				}
				
				birth += rrn1;
				element.setKinder_birth(birth);
				
				// 가져온 주민등록번호로 만 나이 계산
				int birthYear = Integer.parseInt(birth.substring(0, 4));
				int birthMonth = Integer.parseInt(birth.substring(4, 6));
				int birthDay = Integer.parseInt(birth.substring(6, 8));
				
				Calendar current = Calendar.getInstance();
				int currentYear = current.get(Calendar.YEAR);
				int currentMonth = current.get(Calendar.MONTH)+1;
				int currentDay = current.get(Calendar.DAY_OF_MONTH);

				int ageNum = currentYear-birthYear;
				if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
					ageNum--;
				}
				
				String age = Integer.toString(ageNum);
				element.setKinder_age(age);
				
			}
		}
		Map<String, Object> data = new HashMap();
		data.put("kinderList", kinderList);
		
		return data;
		
	}
	
}
