package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.EquipDTO;


public interface EquipDAO {
//	public List<Map<String, Object>> getEquipMap();
	
	public List<EquipDTO> equipList();
	
	public void insertEquip(EquipDTO equipDTO);
	
	public List<Map<String, Object>> equipSearch(Map<String, Object> equipSearch, PageDTO pageDTO);

	public List<Map<String, Object>> equipList(PageDTO pageDTO);
	
	public Integer equipCount();
	
	public Integer searchCount(Map<String, Object> equipSearch);
	
	public void deleteEquip(int equpId);

	public Map<String, Object> getequiplist(int equpId);
	
	public void updateEquip(EquipDTO equipDTO);
}
