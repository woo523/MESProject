package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.work.domain.PerformDTO;


@Service
public interface PerformService {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3);
	
	public List<Map<String, Object>> getPfLiMap(String instrId);

	public Map<String, Object> getInstrMap(int instrId);
	
	public void insertPf(PerformDTO performDTO);

	public void delPf(int performId); 
	
	public PerformDTO getPf(int performId);
}
