package com.indieus.ius.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.indieus.ius.vo.BuyorderDocDraftVO;
import com.indieus.ius.vo.SpendVO;
import com.indieus.ius.vo.StaffVO;
import com.indieus.ius.vo.VacationVO;

public interface AdeptDocService {

	public Object getEworksList(Map<String, Object> map) throws Exception;

	public StaffVO selectStaffNameNumById(String staff_id) throws Exception;

	public int selectDocNextSeq() throws Exception;

	//구매신청서 db 등록
	public int insertBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;

	//지출결의서 db 등록
	public int insertspendingDraft(SpendVO pVo, HttpServletRequest request)  throws Exception;

	//연차신청서 db 등록
	public int insertvacationDraft(VacationVO vVo, HttpServletRequest request) throws Exception;

	//구매신청서 리스트 불러오기
	public Object selectAllBuyList() throws Exception;

	//지출결의서 리스트 불러오기
	public Object selectAllSpendList() throws Exception;

	//연차신청서 리스트 불러오기
	public Object selectAllVacaList() throws Exception;



	//구매신청서 결재 승인
	public int adaptBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;
	//구매신청서 결재 승인시 결재일 등록

	public int buyworkDownDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;
	//지출결의서 결재 승인
	public int adaptSpendDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;
	//지출결의서 결재 승인시 결재일 등록
	public int workdownSpenddrafter(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;

	//연차신청서 결재 승인
	public int adaptVacationDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;

	//연차신청서 결재 승인시 결재일 등록
	public int workdownVacationdrafter(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;

	//구매신청서 결재 반려

	public int referBuyDraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;
	//지출결의서 결재 반려
	public int referSpenddraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;

	//휴가신청서 결재 반려
	public int referVacationdraft(BuyorderDocDraftVO bVo, HttpServletRequest request) throws Exception;


	//상세보기
	public BuyorderDocDraftVO buyinfo(int workNum) throws Exception;
	public SpendVO spendinfo(int workNum) throws Exception;
	public VacationVO vacationinfo(int workNum) throws Exception;



}
