package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;


public interface PerformDAO {

	public List<Map<String, Object>> getInstrLiMap();
	
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3);
	
	
}
