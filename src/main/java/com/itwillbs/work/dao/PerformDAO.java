package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;


public interface PerformDAO {

	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3, PageDTO pageDTO);
	
	public List<Map<String, Object>> getPfLiMap(String instrId);
	
	public Map<String, Object> getInstrMap(int instrId);
	
	public InstructDTO getInstr(int instrId);
	
	public void insertPf(PerformDTO performDTO);
	
	public void delPf(int performId);
	
	public PerformDTO getPf(int performId);
	
	public void updatePf(PerformDTO performDTO);
	
	public List<ItemDTO> getItemlist(String itemNum, String itemName);
	
	
}
