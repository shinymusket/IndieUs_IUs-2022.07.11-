package com.indieus.ius.service;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieus.ius.db.StaffDAO;
import com.indieus.ius.vo.JobClassifiVO;
import com.indieus.ius.vo.StaffVO;

public class StaffServiceImpl implements StaffService {
	
	@Inject
	private StaffDAO manager;

	// 교직원 목록 가져오기
	@Override
	public List<StaffVO> selectStaffList() throws Exception {
		List<StaffVO> VoList = manager.selectStaffList();
		
		if (VoList.size() != 0) {
			for (int i = 0; i < VoList.size(); i++ ) {
				String rrn1 = VoList.get(i).getStaff_rrn1();
				String rrn2 = VoList.get(i).getStaff_rrn2(); 
				
				int backNum = Integer.parseInt(rrn2.substring(0, 1));
				
				// 가져온 주민등록번호로 성별값 입력
				if ((backNum % 2) == 1) {
					 VoList.get(i).setStaff_sex("M");
				} else {
					 VoList.get(i).setStaff_sex("F");
				}
				
				// 가져온 주민등록번호로 생년월일 값 입력
				String birth = "";
				if (backNum == 3 || backNum == 4) {
					birth += "20";		
					
				} else if (backNum == 1 || backNum == 2) {
					birth += "19";
				}
				
				birth += rrn1;
				VoList.get(i).setStaff_birth(birth);
				
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
				
				VoList.get(i).setStaff_age(age);
				
			}
		}
		
		return VoList;
	}
	
	// 교직원 등록을 위한 현재 시퀀스값 가져오기
	@Override
	public int selectStaffSeq() throws Exception {
		int result = manager.selectStaffSeq();
		return result;
	}
	
	// 직무 분류 항목 가져오기
	@Override
	public List<JobClassifiVO> selectJobClassifi() throws Exception {
		return manager.selectJobClassifi();
	}
	
	// 직무 코드로 직무명 가져오기
	@Override
	public JobClassifiVO selectJobClassifiByNum(String staff_cls) throws Exception {
		return manager.selectJobClassifiByNum(staff_cls);
	}
	
	// 직무 목록 가져오기
	@Override
	public void getJobList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<JobClassifiVO> list = manager.selectJobClassifi();
		
		String json = "{\"jobList\":[";
		for (int i = 0; i < list.size(); i ++) {
			String staff_cls = list.get(i).getStaff_cls();
			int job_number = list.get(i).getJob_number();
			String job_Kname = list.get(i).getJob_Kname();
			String job_Ename = list.get(i).getJob_Ename();
			
			json += "[{\"staff_cls\":\"" + staff_cls + "\"},";
			json += "{\"job_number\":\"" + job_number + "\"},";
			json += "{\"job_Kname\":\"" + job_Kname + "\"},";
			json += "{\"job_Ename\":\"" + job_Ename + "\"}]";
			
			if (i != list.size() - 1) {
				json += ",";
			}
			
		}
		json += "]}";
		
		out.print(json);	
		
	}
	
	
	// 직무 목록 추가하기
	@Override
	public void insertJobList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		JobClassifiVO jVo = new JobClassifiVO();
		
		int number = manager.selectJobNumber() + 1;
		jVo.setJob_number(number);
		jVo.setStaff_cls(request.getParameter("staff_cls"));
		jVo.setJob_Kname(request.getParameter("job_Kname"));
		jVo.setJob_Ename(request.getParameter("job_Ename"));
		manager.insertJob(jVo);

	}
	
	// 교직원 직무 분류 편집 - 아이디로 정보 가져오기
	@Override
	public JobClassifiVO getJobByStaffCls(String staff_cls) throws Exception {
		JobClassifiVO jVo = manager.selectJobClassifiByNum(staff_cls);
		return jVo;
	}
	
	// 교직원 직무 분류 편집 - 아이디로 데이터 삭제
	@Override
	public void deleteJobByStaffCls(String staff_cls) {
		manager.deleteJobByStaffCls(staff_cls);
	}
	
	// 교직원 직무 분류 편집 - 수정
	@Override
	public void updateJobList(JobClassifiVO jVo) throws Exception {
		manager.updateJobList(jVo);
	}
	
	
	// 교직원 등록
	@Override
	public int insertStaff(StaffVO sVo) throws Exception {
		int result = manager.insertStaff(sVo);
		return result;
	}
	
	// 교직원 정보 상세조회
	@Override
	public StaffVO selectStaffInfo(String staff_num) throws Exception {
		StaffVO sVo = manager.selectStaffInfo(staff_num);
		return sVo;
	}

	// 교직원 삭제
	@Override
	public int deleteStaff(String staff_num) throws Exception {
		int result = manager.deleteStaff(staff_num);
		return result;
	}
	
	// 교직원 정보수정
	@Override
	public int updateStaff(StaffVO sVo) throws Exception {
		int result = manager.updateStaff(sVo);
		return result;
	}








	





	
}
