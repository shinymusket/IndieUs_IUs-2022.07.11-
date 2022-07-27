package com.indieus.ius.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.indieus.ius.service.MealMenuServiceImpl;
import com.indieus.ius.vo.AllergyVO;
import com.indieus.ius.vo.MealMenuVO;

@Controller
@RequestMapping("/meal")
public class MealMenuController {

	@Autowired
	private MealMenuServiceImpl service;
	
	@RequestMapping(value = "/meal_list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<MealMenuVO> list = service.allMealMenuView();
		model.addAttribute("menuList", list);
		return "/meal/meal_list";
	}
	
	// 식단 등록 폼 이동
	@RequestMapping(value ="/addMealMenu")
	public String addMenu() throws Exception {
		return "/meal/addMealMenu";
	}
	
	// 알러지 정보 불러오기, 선택 페이지 이동
	@RequestMapping(value ="/allergyInfo")
	public String allergyInfo(Model model) throws Exception {
		List<AllergyVO> list = service.allergyInfo();
		model.addAttribute("allergyList", list);
		return "/meal/allergyInfo";
	}
	
	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
	public String inputMenu(@RequestParam(value="meal_code[]") String[] meal_code, @RequestParam(value="menu[]") String[] menu, @RequestParam(value="kcal[]") int[] kcal, @RequestParam(value="allergy[]") String[] allergy) throws Exception {
		
	//System.out.println(list);
		service.inputMenu(meal_code, menu, kcal, allergy);
		
		return "redirect:./meal_list";
	}
	
}
