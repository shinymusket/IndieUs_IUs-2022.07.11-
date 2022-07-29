package com.indieus.ius.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.indieus.ius.service.EquipmentServiceImpl;
import com.indieus.ius.vo.EquipmentVO;
import com.indieus.ius.vo.StaffIdVO;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {
	
	@Autowired
	private EquipmentServiceImpl service;
	
	
	// 시설(비품) 리스트 페이지로 이동
	@RequestMapping(value = "/equipment_list", method = RequestMethod.GET)
	public String list (Model model) throws Exception {
		return "/equipment/equipmentList";
	}
	
	// 시설(비품) 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "/get_equipment_list", method = RequestMethod.POST)
	public Object getList () throws Exception {
		return service.getEquipmentList();
	}
	
	// 시설(비품) 등록 폼으로 이동
	@RequestMapping(value = "/equipment_register_form", method = RequestMethod.GET)
	public String equipmentRegisterForm(Model model, HttpSession session) throws Exception {
		
		// 시설(비품) 등록을 위한 다음 시퀀스(자산코드) 가져오기
		int seqNum = service.selectEquipmentSeq();
		model.addAttribute("seqNum", seqNum);
		
		
		// 로그인된 직원의 아이디와 이름을 세션에서 꺼내옴
		StaffIdVO sIvo = (StaffIdVO) session.getAttribute("staff");
		String staff_id = sIvo.getStaff_id();
		
		model.addAttribute("staff_id", staff_id);
		
		String staff_name = service.selectStaffNameById(staff_id);
		
		model.addAttribute("staff_name", staff_name);
		
		return "/equipment/equipmentRegisterForm";
	}
	
	// 시설(비품) 등록
	@RequestMapping(value = "/equipment_register", method = RequestMethod.POST)
	public String equipmentRegister(@ModelAttribute EquipmentVO eVo, RedirectAttributes rttr) throws Exception {
		
		return "redirect:./equipmentList";
	}
	
	// 시설(비품) 항목 편집 화면 이동
	@RequestMapping(value = "/equipment_class_edit", method = RequestMethod.GET)
	public String equipmentClsEdit() throws Exception {
		return "/equipment/equipmentClassEdit";
	}
	
	// 시설(비품) 항목 편집 리스트 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "get_equipment_cls_list", method = RequestMethod.POST)
	public Object getEquipmentClsList() throws Exception {
		return service.getEquipmentClsList();
	}
	
	// 시설(비품) 항목 편집 - 코드로 항목 정보 가져오기 Ajax
	@ResponseBody
	@RequestMapping(value = "get_equip_cls_by_num", method = RequestMethod.POST)
	public Object getEquipClsByNum(@RequestParam Map<String, Object> map) throws Exception {
		return service.getEquipClsByNum(map);
	}
	
	// 시설(비품) 항목 편집 - 항목 추가하기 Ajax
	@ResponseBody
	@RequestMapping(value = "insert_equipment_cls_list", method = RequestMethod.POST)
	public void insertEquipCls(@RequestParam Map<String, Object> map) throws Exception {
		service.insertEquipCls(map);
	}
	
	// 시설(비품) 항목 편집 - 항목 삭제하기 Ajax
	@ResponseBody
	@RequestMapping(value = "delete_equipment_cls_list", method = RequestMethod.POST)
	public void deleteEquipCls(@RequestParam Map<String, Object> map) throws Exception {
		service.deleteEquipCls(map);
	}
	
}
