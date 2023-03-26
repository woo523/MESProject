package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;


@Service
public interface PerformService {

	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search);
	
	public Integer countInstrLi();
	
	public List<Map<String, Object>> getPfLiMap(String instrId);

	public Map<String, Object> getInstrMap(int instrId);
	
	public void insertPf(PerformDTO performDTO);

	public void delPf(int performId); 
	
	public PerformDTO getPf(int performId);
	
	public void updatePf(PerformDTO performDTO);

	public List<ItemDTO> getItemlist(String itemNum, String itemName);
}
