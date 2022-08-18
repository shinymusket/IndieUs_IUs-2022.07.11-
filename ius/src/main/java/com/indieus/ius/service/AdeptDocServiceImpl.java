package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.db.EworksListDAO;
import com.indieus.ius.vo.BuyorderDocDraftVO;
import com.indieus.ius.vo.EworksBoardVO;
import com.indieus.ius.vo.SpendVO;
import com.indieus.ius.vo.StaffVO;
import com.indieus.ius.vo.VacationVO;

public class AdeptDocServiceImpl implements AdeptDocService{

	@Inject
	private EworksListDAO manager;

	// 전자결재 리스트 가져오기 Ajax
	@Override
	public Object getEworksList(Map<String, Object> map) throws Exception {

		List<EworksBoardVO> eworksBoardList =  manager.selectAllEworkList();
		List<BuyorderDocDraftVO> buyBoardList =  manager.selectAllBuyList();
		List<SpendVO> spendBoardList = manager.selectAllSpendList();
		List<VacationVO> vacationBoardList = manager.selectAllVacaList();



		Map<String, Object> data = new HashMap();


		data.put("eworksBoardList", eworksBoardList);
		data.put("buyBoardList", buyBoardList);
		data.put("spendBoardList", spendBoardList);
		data.put("vacationBoardList", vacationBoardList);

		return data;
	}


	@Override
	// 교직원 아이디로 이름과 사번 가져오기
	public StaffVO selectStaffNameNumById(String staff_id) throws Exception {
		return manager.selectStaffNameNumById(staff_id);
	}

	// 전자결재 문서 기안을 위한 다음 시퀀스 값 가져오기
	@Override
	public int selectDocNextSeq() throws Exception {
		return manager.selectDocNextSeq();
	}

	//구매신청서 상세보기

	@Override
	public BuyorderDocDraftVO buyinfo(int workNum) throws Exception{
		return manager.buyinfo(workNum);
	}

	//지출내역서 상세보기

	@Override
	public SpendVO spendinfo(int workNum) throws Exception{

		return manager.spendinfo(workNum);
	}


	//연차신청서 상세보기
	@Override
	public VacationVO vacationinfo(int workNum) throws Exception{

		return manager.vacationinfo(workNum);
	}


	// 구매신청서 db 등록
	@Transactional
	@Override
	public int insertBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

	return manager.insertBuyDraft(bVo);


	}

	//구매신청서 결재 승인
	@Transactional
	@Override
	public int adaptBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

	return manager.adaptBuyDraft(bVo);
	}

	//구매신청서 결재승인시 결재일 등록

	@Transactional
	@Override
	public int buyworkDownDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

	return manager.buyworkDownDraft(bVo);
	}

	//구매신청서 결재 반려

	@Transactional
	@Override
	public int referBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

	return manager.referBuyDraft(bVo);
	}




	//지출결의서 db 등록
	@Transactional
	@Override
	public int insertspendingDraft(SpendVO sVo, HttpServletRequest request) throws Exception {

	return manager.insertspendingDraft(sVo);
	}



	//지출결의서 결재 승인
	@Transactional
		@Override
		public int adaptSpendDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

			return manager.adaptSpendDraft(bVo);
			}

	//지출결의서 결재 승인시 결재일 등록
	@Transactional
	@Override
		public int workdownSpenddrafter(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

		return manager.workdownSpenddrafter(bVo);
		}


	//지출결의서 결재 반려
	@Transactional
	@Override
	public int referSpenddraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {

		return manager.referSpenddraft(bVo);
		}


	//연차신청서 db 등록
	@Transactional
	@Override
	public int insertvacationDraft(VacationVO vVo,  HttpServletRequest request) throws Exception {

	return manager.insertvacationDraft(vVo);

	}

	//연차신청서 결재 승인
		@Transactional
		@Override
		public int adaptVacationDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {
			return manager.adaptVacationDraft(bVo);

		}

		//연차신청서 결재 승인시 결재일 등록
		@Transactional
		@Override
		public int workdownVacationdrafter(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {
			return manager.workdownVacationdrafter(bVo);

		}


	//연차신청서 결재 반려
		@Transactional
		@Override
		public int referVacationdraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception {
			return manager.referVacationdraft(bVo);
		}





	//구매신청서 리스트 불러오기
@Override
public Object selectAllBuyList() throws Exception{
	List<BuyorderDocDraftVO> buyBoardList =  manager.selectAllBuyList();
	Map<String, Object> data = new HashMap();
	data.put("buyBoardList", buyBoardList);
	return data;
}

//지출결의서 리스트 불러오기
@Override
public Object selectAllSpendList() throws Exception{
	List<SpendVO> spendBoardList =  manager.selectAllSpendList();
	Map<String, Object> data = new HashMap();
	data.put("spendBoardList", spendBoardList);
	return data;
}

//연차신청서 리스트 불러오기
@Override
public Object selectAllVacaList() throws Exception{
	List<VacationVO> vacationBoardList =  manager.selectAllVacaList();
	Map<String, Object> data = new HashMap();
	data.put("vacationBoardList", vacationBoardList);
	return data;
}












}


