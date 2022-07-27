package com.indieus.ius.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestParam;

import com.indieus.ius.db.MealMenuDAO;
import com.indieus.ius.vo.AllergyVO;
import com.indieus.ius.vo.MealMenuVO;

public class MealMenuServiceImpl implements MealMenuService {

	@Inject
	private MealMenuDAO manager;

	@Override
	public List<MealMenuVO> allMealMenuView() throws Exception {
		
		List<MealMenuVO> list = null;
		
		try {
		list =  manager.allMealMenuView();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
	public List<AllergyVO> allergyInfo() throws Exception {
		List<AllergyVO> list = null;
		
		list = manager.allergyInfo();
		
		return list;
	}
	
	@Override
	public int inputMenu
	(@RequestParam(value="meal_code[]") String[] meal_code, @RequestParam(value="menu[]") String[] menu, @RequestParam(value="kcal[]") int[] kcal, @RequestParam(value="allergy[]") String[] allergy) throws Exception {
		List<MealMenuVO> list = new ArrayList<MealMenuVO>();
		for(int i=0; i < menu.length; i++) {
			MealMenuVO mmVo = new MealMenuVO();
			
			mmVo.setMeal_code(meal_code[i]);
			mmVo.setMeal_menu(menu[i]);
			mmVo.setMenu_calorie(kcal[i]);
			mmVo.setAllergy_num(allergy[i]);
			
			list.add(mmVo);
		}
		Map<String, Object> map = new HashMap();
		map.put("list", list);
		
		return manager.inputMenu(map);
	}
	
	
}
