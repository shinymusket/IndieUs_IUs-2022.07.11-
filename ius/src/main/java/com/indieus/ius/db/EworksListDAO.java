package com.indieus.ius.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.BuyorderDocDraftVO;
import com.indieus.ius.vo.EworksBoardVO;
import com.indieus.ius.vo.FinanceVO;
import com.indieus.ius.vo.SpendVO;
import com.indieus.ius.vo.StaffVO;
import com.indieus.ius.vo.VacationVO;

@Repository
public class EworksListDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 구매신청서 결재 리스트 가져오기
	public List<EworksBoardVO> selectAllEworkList() throws Exception {
		return sqlsession.selectList("board.select_all_eWork_list");
	}
	// 직원 아이디로 사번과 이름 가져오기
	public StaffVO selectStaffNameNumById(String staff_id) throws Exception {
		return sqlsession.selectOne("board.select_staff_name_num_by_id", staff_id);
	}
	
	
	// 전자결재 문서 기안을 위한 다음 시퀀스 값 가져오기
	public int selectDocNextSeq() throws Exception {
		return sqlsession.selectOne("board.select_doc_next_seq");
	}
	
	
	
	
	
	//구매신청서 결재 등록
	
	@Transactional
	public int insertBuyDraft(BuyorderDocDraftVO bVo) throws Exception {
		return sqlsession.insert("board.insert_buy_drafter", bVo);
	}
	
	///////////구매신청서 리스트 가져오기
	
			public List<BuyorderDocDraftVO> selectAllBuyList() throws Exception {
				return sqlsession.selectList("board.select_buy_drafter");
			}
	
	///////////////// 구매신청서 상세보기
					public BuyorderDocDraftVO buyinfo(int workNum) throws Exception {
						return sqlsession.selectOne("board.select_buyorder_info", workNum);
					}
	
	///////////////////////////구매신청서 결재 승인
							public int adaptBuyDraft(BuyorderDocDraftVO bVo) throws Exception {
								
								return sqlsession.insert("board.adapt_buy_drafter", bVo);
							}
							//결재 승인시 결재일 등록
							public int buyworkDownDraft(BuyorderDocDraftVO bVo) throws Exception {
								
								return sqlsession.insert("board.workdown_buy_drafter", bVo);
							}
							
	////////////////////////////////////구매신청서 결재 반려
							public int referBuyDraft(BuyorderDocDraftVO bVo) throws Exception {
								return sqlsession.insert("board.refer_buy_drafter", bVo);
							}
							
	
	//지출 결의서 결재 등록
	@Transactional
	public int insertspendingDraft(SpendVO sVo) throws Exception {
		return sqlsession.insert("insert_spending_drafter", sVo);
	}
	
	//////////////////지출결의서 리스트 가져오기
			public List<SpendVO> selectAllSpendList() throws Exception {
				return sqlsession.selectList("board.select_spend_drafter");
			}
			
	///////////////////////////// 지출내역 상세보기
					public SpendVO spendinfo(int workNum) throws Exception {
						return sqlsession.selectOne("board.select_spend_info", workNum);
					}
	/////////////////////////////////////////// 지출내역서 결재 승인
						public int adaptSpendDraft(BuyorderDocDraftVO bVo) throws Exception {
							return sqlsession.insert("board.adapt_spend_drafter", bVo);
						}
						public int workdownSpenddrafter(BuyorderDocDraftVO bVo) throws Exception {
							return sqlsession.insert("board.workdown_spend_drafter", bVo);
						}
						
						//
	///////////////////////////////////////////	지출내역서 결재 반려					
						public int referSpenddraft(BuyorderDocDraftVO bVo) throws Exception {
							return sqlsession.insert("board.refer_spend_drafter", bVo);
						}
						
						
	//연차신청서 결재 등록
	@Transactional
	public int insertvacationDraft(VacationVO vVo) throws Exception {
		return sqlsession.insert("insert_vacation_register", vVo);
	}
	
	/////////////////연차신청서 리스트 가져오기
			public List<VacationVO> selectAllVacaList() throws Exception {
				return sqlsession.selectList("board.select_vacation_drafter");
			}
	
	
	/////////////////////////연차신청서 상세보기
					public VacationVO vacationinfo(int workNum) throws Exception {
						return sqlsession.selectOne("board.select_vacation_info", workNum);
					}
////////////////////////////////////////연차신청서 결재 승인
					public int adaptVacationDraft(BuyorderDocDraftVO bVo) throws Exception {
						return sqlsession.insert("board.adapt_vacation_drafter", bVo);
					}
					
					//연차신청서 결재일 결재시 결재일 등록
					public int workdownVacationdrafter(BuyorderDocDraftVO bVo) throws Exception {
						return sqlsession.insert("board.workdown_vacation_drafter", bVo);
					}
					
////////////////////////////////////////연차신청서 결재 반려
					public int referVacationdraft(BuyorderDocDraftVO bVo) throws Exception {
						return sqlsession.insert("board.refer_vacation_drafter", bVo);
					}					
					
	
	
	
	
	
	
}
	
	
	
	

