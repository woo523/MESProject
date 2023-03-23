package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.PerformDTO;


public interface PerformDAO {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3);
	
	public List<Map<String, Object>> getPfLiMap(String instrId);
	
	public Map<String, Object> getInstrMap(String instrId);
	
	public InstructDTO getInstr(int instrId);
	
	public void insertPf(PerformDTO performDTO);
}
