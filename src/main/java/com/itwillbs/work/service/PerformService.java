package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;

@Service
public interface PerformService {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<PerformRgDTO> PerformRgList(int instrId);
	
	public void insertPerform(Map<String, Object> row);
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3);
}
