package com.indieus.ius.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.indieus.ius.vo.AllergyVO;
import com.indieus.ius.vo.MealMenuVO;

public interface MealMenuService {
	public List<MealMenuVO> allMealMenuView() throws Exception;
	
	public List<AllergyVO> allergyInfo() throws Exception;
	
	public int inputMenu(@RequestParam(value="meal_code[]") String[] meal_code, @RequestParam(value="menu[]") String[] menu, @RequestParam(value="kcal[]") int[] kcal, @RequestParam(value="allergy[]") String[] allergy) throws Exception;
}
