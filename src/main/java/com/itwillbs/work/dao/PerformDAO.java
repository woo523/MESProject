package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;


public interface PerformDAO {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<PerformRgDTO> PerformRgList(int instrId);
	
	public void insertPerform(Map<String, Object> row);
	
	public Integer getMaxNumP();
	
	
	
	
}
