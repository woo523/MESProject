package com.itwillbs.material.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.ItemDTO;

public interface MaterialDAO {
	
	public List<Map<String, Object>> inmaterList();
	
	public List<Map<String, Object>> getInmaterLiMap(String whouse, String pcd, String sdate, String edate, String ccd);

	public List<Map<String, Object>> getInmaterLiMap();
		
	public List<Map<String, Object>> outmaterList();

	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String sdate, String edate, String ccd);

	public List<Map<String, Object>> getOutmaterLiMap();

	public List<ItemDTO> getItemlist(Map<String, Object> search);

	public Integer countInmaterLi(Map<String, Object> search);
}
