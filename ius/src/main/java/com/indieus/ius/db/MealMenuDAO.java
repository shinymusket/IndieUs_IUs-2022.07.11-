package com.indieus.ius.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.indieus.ius.vo.AllergyVO;
import com.indieus.ius.vo.MealMenuVO;

public class MealMenuDAO {

	@Autowired
	SqlSession sqlsession = null;
	
	public List<MealMenuVO> allMealMenuView() throws Exception {
		return sqlsession.selectList("meal.all_meal_menu_view");
	}
	
	public List<AllergyVO> allergyInfo() throws Exception {
		return sqlsession.selectList("meal.allergy_info");
	}
	

	@Transactional
	public int inputMenu(Map<String, Object> map) {
		return sqlsession.insert("meal.insert_meal_menu", map);
		
	}
	
	
}
