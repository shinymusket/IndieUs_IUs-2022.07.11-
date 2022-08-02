package com.indieus.ius.service;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.web.multipart.MultipartFile;

import com.indieus.ius.db.KinderDAO;
import com.indieus.ius.utils.UploadFileUtils;
import com.indieus.ius.vo.ClassVO;
import com.indieus.ius.vo.KinderVO;
import com.indieus.ius.vo.ParentVO;
import com.indieus.ius.vo.ShuttleVO;
import com.indieus.ius.vo.StaffVO;

public class KinderServiceImpl implements KinderService {

	@Inject
	private KinderDAO manager;

	@Resource(name="uploadPath")
	private String uploadPath;

	// 원생 리스트 가져오기 Ajax
	@Override
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

	// 원생 정보 조회하기 Ajax
	@Override
	public Object getKinderByKinderNum(Map<String, Object> map) throws Exception {
		String kinder_num = (String) map.get("kinder_num");
		KinderVO kinder = manager.selectKinderInfo(kinder_num);
		
		
		// 부모님 정보 가져오기
		Map<String, Object> info = new HashMap();
		info.put("kinder_num", kinder_num);
		info.put("relation", "부");
		String fatherName = manager.selectParentNameByKinderNum(info);
		
		info.put("relation", "모");
		String matherName = manager.selectParentNameByKinderNum(info);
		
		
		Map<String, Object> data = new HashMap();
		data.put("kinder", kinder);
		data.put("fatherName", fatherName);
		data.put("matherName", matherName);
		return data;
	}
	
	// 원생 학부모 정보 조회하기 Ajax
	@Override
	public Object getParentByKinderNum(Map<String, Object> map) throws Exception {
		String relation = (String) map.get("relation");
		String kinder_num  = (String) map.get("kinder_num");
		
		if (relation.equalsIgnoreCase("F")) {
			relation = "부";
		} else if (relation.equalsIgnoreCase("M")) {
			relation = "모";
		}

		Map<String, Object> info = new HashMap();
		info.put("relation", relation);
		info.put("kinder_num", kinder_num);
		
		ParentVO parent = manager.selectParentInfoByKinderNum(info);
		
		Map<String, Object> data = new HashMap();
		data.put("parent", parent);
		return data;
	}


	// 원생 등록을 위한 다음 원생 시퀀스 번호 가져오기
	@Override
	public int selectNextKinderSeq() throws Exception {
		return manager.selectNextKinderSeq();
	}

	// 원생 등록을 위한 버스 리스트 가져오기
	@Override
	public List<ShuttleVO> selectAllShuttleList() throws Exception {
		return manager.selectAllShuttleList();
	}

	// 원생 등록을 위한 담임 선생님 리스트 가져오기
	@Override
	public List<StaffVO> selectHomeTeacherForKinder() throws Exception {
		return manager.selectHomeTeacherForKinder();
	}

	// 원생 등록
	@Override
	public int insertKinder(KinderVO kVo, MultipartFile kinder_picFile) throws Exception {
		MultipartFile file = kinder_picFile;

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		kVo.setKinder_picture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		int result = manager.insertKinder(kVo);
		
		// 담임반 배정, 데이터 입력
		String Staff_num = kVo.getStaff_num();
		ClassVO cVo = manager.selectClassInfoByStaffNum(Staff_num);
		
		String kinder_num = kVo.getKinder_num();
		
		cVo.setKinder_num(kinder_num);
		
		manager.insertKinderHomeTeacherClass(cVo);
		
		return result;
	}



	// 원생 검색 Ajax
	@Override
	public Object searchKinderList(Map<String, Object> map) throws Exception {
		List<KinderVO> kinderList = manager.searchKinderList(map);

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

	// 원생 정보 조회
	@Override
	public KinderVO selectKinderInfo(String kinder_num) throws Exception {
		return manager.selectKinderInfo(kinder_num);
	}

	// 원생 정보 삭제
	@Override
	public int deleteKinderInfo(String kinder_num) throws Exception {
		return manager.deleteKinderInfo(kinder_num);
	}

	// 원생 정보 수정
	@Override
	public int updateKinder(KinderVO kVo, MultipartFile kinder_picFile) throws Exception {

		if(kinder_picFile.getSize() != 0) { // 수정 프로필 요청 사진이 있을 시
			MultipartFile file = kinder_picFile;

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file != null) {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} else {
				fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

			System.out.println(imgUploadPath);
			System.out.println(ymdPath);

			kVo.setKinder_picture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		}

		return manager.updateKinder(kVo);
	}








}
