package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.mdm.dao.EquipDAO;
import com.itwillbs.mdm.domain.EquipDTO;



@Service
public class EquipServiceImpl implements EquipService{
	
	@Inject
	private EquipDAO equipDAO;

	@Override
	public List<EquipDTO> equiplist() {
		return equipDAO.equipList();
	}

	@Override
	public void insertEquip(EquipDTO equipDTO) {
		equipDAO.insertEquip(equipDTO);
	}

	@Override
	public List<Map<String, Object>> equipSearch(Map<String, Object> equipSearch, PageDTO pageDTO, Model model) {
		int count = equipDAO.searchCount(equipSearch);
		PageUtil.getPaging(pageDTO, model, count);
		return equipDAO.equipSearch(equipSearch, pageDTO);
	}

	@Override
	public List<Map<String, Object>> equipList(PageDTO pageDTO, Model model) {
		int count = equipDAO.equipCount();
		PageUtil.getPaging(pageDTO, model, count);
		return equipDAO.equipList(pageDTO);
	}

	@Override
	public Integer equipCount() {
		return equipDAO.equipCount();
	}

	@Override
	public Integer searchCount(Map<String, Object> equipSearch) {
		return equipDAO.searchCount(equipSearch);
	}

	@Override
	public void deleteEquip(int equpId) {
		equipDAO.deleteEquip(equpId);
	}

	@Override
	public Map<String, Object> getequiplist(int equpId) {
		return equipDAO.getequiplist(equpId);
	}

	@Override
	public void updateEquip(EquipDTO equipDTO) {
		equipDAO.updateEquip(equipDTO);
	}

//	@Override
//	public List<Map<String, Object>> getEquipMap() {
//		System.out.println("EquipServiceImpl getEquipMap()");
//		return equipDAO.getEquipMap();
//	}

	

	


	
	
	
}
