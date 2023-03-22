package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service
public interface PerformService {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3);
}
