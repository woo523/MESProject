package com.itwillbs.material.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.work.domain.ItemDTO;

public interface MaterialDAO {
	
	public List<Map<String, Object>> inmaterList();
	
	public List<Map<String, Object>> getInmaterLiMap(Map<String, Object> search);

	public List<Map<String, Object>> getInmaterLiMap();
		
	public List<Map<String, Object>> outmaterList();

	public List<Map<String, Object>> getOutmaterLiMap();

	public List<Map<String, Object>> getOutmaterLiMap(Map<String, Object> search);

	public List<ItemDTO> getItemlist(Map<String, Object> search);

	public Integer countItemlist(Map<String, Object> search);

	public List<ClientDTO> getClientlist(Map<String, Object> search);

	public Integer countClientlist(Map<String, Object> search);

	public List<Map<String, Object>> mtrlStateList(Map<String, Object> search);

	public List<Map<String, Object>> mtrlStateList();

	public List<Map<String, Object>> materialState();


}
