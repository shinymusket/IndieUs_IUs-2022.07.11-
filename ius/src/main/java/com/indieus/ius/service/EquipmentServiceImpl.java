package com.indieus.ius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.indieus.ius.db.EquipmentDAO;
import com.indieus.ius.vo.EquipClsVO;
import com.indieus.ius.vo.EquipmentVO;

public class EquipmentServiceImpl implements EquipmentService {

	@Inject
	private EquipmentDAO manager;

	// 시설(비품) 리스트 가져오기 Ajax
	@Override
	public Object getEquipmentList() throws Exception {
		List<EquipmentVO> equipmentList = manager.getAllEquipList();
		Map<String, Object> data = new HashMap();
		data.put("equipmentList", equipmentList);
		return data;
	}

	// 시설(비품) 등록을 위한 다음 시퀀스 가져오기
	@Override
	public int selectEquipmentSeq() throws Exception {
		return manager.selectEquipmentSeq();
	}

	// 교직원 아이디로 이름 가져오기
	@Override
	public String selectStaffNameById(String staff_id) throws Exception {
		return manager.selectStaffNameById(staff_id);
	}

	// 시설(비품) 분류 항목 리스트 가져오기 Ajax
	@Override
	public Object getEquipmentClsList() throws Exception {
		List<EquipClsVO> equipClsList = manager.selectEquipClsList();
		Map<String, Object> data = new HashMap();
		data.put("equipClsList", equipClsList);
		return data;
	}

	// 시설(비품) 분류 항목 - 코드로 항목 정보 가져오기 Ajax
	@Override
	public Object getEquipClsByNum(Map<String, Object> map) throws Exception {
		String equip_cls_num = (String) map.get("equip_cls_num");

		EquipClsVO ecVo = manager.selectEquipClsByNum(equip_cls_num);


		Map<String, Object> data = new HashMap();
		data.put("equip_cls_num", equip_cls_num);
		data.put("equip_cls_name", ecVo.getEquip_cls_name());
		return data;
	}

	// 시설(비품) 분류 항목 - 추가하기 Ajax
	@Override
	public void insertEquipCls(Map<String, Object> map) throws Exception {
		String equip_cls_name = (String) map.get("equip_cls_name");
		int equip_num = manager.selectEquipClsCnt() + 1;

		EquipClsVO ecVo = new EquipClsVO();
		ecVo.setEquip_cls_name(equip_cls_name);
		ecVo.setEquip_num(equip_num);

		manager.insertEquipcls(ecVo);
	}

	// 시설(비품) 분류 항목 - 삭제하기 Ajax
	public void deleteEquipCls(Map<String, Object> map) throws Exception {
		String equip_cls_num = (String) map.get("equip_cls_num");
		System.out.println(equip_cls_num);
		manager.deleteEquipcls(equip_cls_num);
	}


}
