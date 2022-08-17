package com.indieus.ius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.indieus.ius.service.AdeptDocServiceImpl;

@Controller
@RequestMapping("/board")
public class EworksBoardController {


	@Autowired
	private AdeptDocServiceImpl service;

	// 전자결재 리스트 화면 이동
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
//		List<String> docList = service.selectAllSignedDocyear();
//		model.addAttribute("AdeptDocList", docList);
		return "/board/boardList";
	}

	// 전자결재 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "get_eWorks_list", method = RequestMethod.POST)
	public Object getEworksList() throws Exception {
		return service.getEworksList();
	}

	//문서 기안하기
	@RequestMapping(value = "/select_draft_form", method = RequestMethod.GET)
	public String selectform(Model model) throws Exception {
		return "/board/boardDrafting";
	}

	//구매 신청서
		@RequestMapping(value = "/buy_order", method = RequestMethod.GET)
		public String buyOrder(Model model) throws Exception {
			return "/board/buyOrder";
		}

	//지출 결의서
	@RequestMapping(value = "/spend_Resol", method = RequestMethod.GET)
	public String spendingResol(Model model) throws Exception {
		return "/board/spendingResol";
	}

	//연차 신청서
	@RequestMapping(value = "/vacation_Request", method = RequestMethod.GET)
	public String vacationRe(Model model) throws Exception {
		return "/board/vacationRequest";
	}
	
	//구매신청서 폼 이동
	@RequestMapping(value = "/buy_draft_form", method = RequestMethod.GET)
	public String buydraftform(Model model,  HttpSession session) throws Exception {
		StaffIdVO staff = (StaffIdVO) session.getAttribute("staff");
		String staff_id = staff.getStaff_id();
		StaffVO sVo = service.selectStaffNameNumById(staff_id);
		String staff_name = sVo.getStaff_name();
		String staff_num = sVo.getStaff_num();
		int nextSeq = service.selectDocNextSeq();

		model.addAttribute("staff_name", staff_name);
		model.addAttribute("staff_num", staff_num);
		model.addAttribute("nextSeq", nextSeq);

		return "/board/buyOrder";

	}



	//지출결의서 폼 이동
	@RequestMapping(value = "/spend_draft_form", method = RequestMethod.GET)
	public String spenddraftform(Model model,  HttpSession session) throws Exception {
		StaffIdVO staff = (StaffIdVO) session.getAttribute("staff");
		String staff_id = staff.getStaff_id();
		StaffVO sVo = service.selectStaffNameNumById(staff_id);
		String staff_name = sVo.getStaff_name();
		String staff_num = sVo.getStaff_num();
		int nextSeq = service.selectDocNextSeq();

		model.addAttribute("staff_name", staff_name);
		model.addAttribute("staff_num", staff_num);
		model.addAttribute("nextSeq", nextSeq);

		return "/board/spendingResol";
	}


	//연차신청서 폼 이동
	@RequestMapping(value = "/vacation_draft_form", method = RequestMethod.GET)
	public String vacadraftform(Model model,  HttpSession session) throws Exception {
		StaffIdVO staff = (StaffIdVO) session.getAttribute("staff");
		String staff_id = staff.getStaff_id();
		StaffVO sVo = service.selectStaffNameNumById(staff_id);
		String staff_name = sVo.getStaff_name();
		String staff_num = sVo.getStaff_num();
		int nextSeq = service.selectDocNextSeq();

		model.addAttribute("staff_name", staff_name);
		model.addAttribute("staff_num", staff_num);
		model.addAttribute("nextSeq", nextSeq);
		return "/board/vacationRequest";

	}


	// 구매신청서 db 등록
	@RequestMapping(value = "buy_order_Register", method = RequestMethod.POST)
	public String buyorderRegsiter(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		System.out.println(bVo.getWorkNum());
		System.out.println(bVo.getDoc_Sub());
		System.out.println(bVo.getProduct_name());
		System.out.println(bVo.getProduct_amount());
		System.out.println(bVo.getProduct_pay());
		System.out.println(bVo.getProduct_money());
		System.out.println(bVo.getStaff_name());
		System.out.println(bVo.getStaff_num());
		System.out.println(bVo.getEtc());
		rttr.addFlashAttribute("draft", service.insertBuyDraft(bVo,request));
		return "redirect:./board_list";

}


	// 지출결의서 db 등록
	@RequestMapping(value = "spend_Register", method = RequestMethod.POST)
	public String spendingRegsiter(@ModelAttribute SpendVO pVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		rttr.addFlashAttribute("draft", service.insertspendingDraft(pVo, request));

		return "redirect:./board_list";

}



	// 연차신청서 db 등록
	@RequestMapping(value = "vacation_Register", method = RequestMethod.POST)
	public String vacationRegsiter(@ModelAttribute VacationVO vVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		rttr.addFlashAttribute("draft", service.insertvacationDraft(vVo, request));

		return "redirect:./board_list";

	}


	//구매신청서 결재 승인
		@RequestMapping(value = "/buy_order_adapt", method = RequestMethod.GET)
		public String adaptdraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.adaptBuyDraft(bVo,request));
			rttr.addFlashAttribute("draft", service.buyworkDownDraft(bVo,request));
			return "redirect:./board_list";


		}

	//구매신청서 결재 반려
		@RequestMapping(value = "/buy_order_refer", method = RequestMethod.GET)
		public String referdraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.referBuyDraft(bVo,request));
			return "redirect:./board_list";


		}

//지출결의서 결재 승인
		@RequestMapping(value = "/spend_order_adapt", method = RequestMethod.GET)
		public String adaptSpenddraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.adaptSpendDraft(bVo,request));
			rttr.addFlashAttribute("draft", service.workdownSpenddrafter(bVo,request));

			return "redirect:./board_list";


		}
//지출결의서 결재 반려
		@RequestMapping(value = "/spend_order_refer", method = RequestMethod.GET)
		public String referSpenddraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.referSpenddraft(bVo,request));
			return "redirect:./board_list";


				}

//휴가신청서 결재 승인

		@RequestMapping(value = "/vacation_adapt", method = RequestMethod.GET)
		public String adaptVacationDraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.adaptVacationDraft(bVo,request));
			rttr.addFlashAttribute("draft", service.workdownVacationdrafter(bVo,request));
			return "redirect:./board_list";


				}

//휴가신청서 결재 반려

		@RequestMapping(value = "/vacation_refer", method = RequestMethod.GET)
		public String referVacationdraft(@ModelAttribute BuyorderDocDraftVO bVo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			rttr.addFlashAttribute("draft", service.referVacationdraft(bVo,request));
			return "redirect:./board_list";


				}


}
