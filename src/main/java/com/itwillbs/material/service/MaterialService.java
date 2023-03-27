package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.ItemDTO;

public interface MaterialService {

	public List<Map<String, Object>> inmaterList();

	public List<Map<String, Object>> getInmaterLiMap(String whouse, String pcd, String sdate, String edate, String ccd);

	public List<Map<String, Object>> getInmaterLiMap();
	
	public List<Map<String, Object>> outmaterList();
	
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String startDate, String endDate, String ccd);

	public List<Map<String, Object>> getOutmaterLiMap();

	public List<ItemDTO> getItemlist(Map<String, Object> search);

	public Integer countItemlist(Map<String, Object> search);

}

