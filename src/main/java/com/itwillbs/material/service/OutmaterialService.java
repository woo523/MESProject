package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

public interface OutmaterialService {
	
	public List<Map<String, Object>> outmaterList();
	
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String sdate, String edate, String ccd);

	public List<Map<String, Object>> getOutmaterLiMap();
}
