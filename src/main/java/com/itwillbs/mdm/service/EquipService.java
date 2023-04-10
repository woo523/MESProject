package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.EquipDTO;


public interface EquipService {
	//추상메서드
//	public List<Map<String, Object>> getEquipMap();
	
	public List<EquipDTO> equiplist();
	
	public void insertEquip(EquipDTO equipDTO);
	
	public List<Map<String, Object>> equipSearch(Map<String, Object> equipSearch, PageDTO pageDTO, Model model);

	public List<Map<String, Object>> equipList(PageDTO pageDTO, Model model);
	
	public Integer equipCount();
	
	public Integer searchCount(Map<String, Object> equipSearch);
	
	public void deleteEquip(int equpId);

	public Map<String, Object> getequiplist(int equpId);
	
	public void updateEquip(EquipDTO equipDTO);
}
