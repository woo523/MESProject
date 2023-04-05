package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;


public interface PerformDAO {

	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search);
	
	public Integer countInstrLi(Map<String,Object> search);
	
	public List<Map<String, Object>> getPfLiMap(String instrId);
	
	public Map<String, Object> getInstrMap(int instrId);
	
	public InstructDTO getInstr(int instrId);
	
	public void insertPf(PerformDTO performDTO);
	
	public void delPf(int performId);
	
	public PerformDTO getPf(int performId);
	
	public void updatePf(PerformDTO performDTO);
	
	public List<ItemDTO> getItemlist(Map<String,Object> search);
	
	public Integer countItemlist(Map<String,Object> search);
	
	public List<Map<String, Object>> PerformLiMap(Map<String, Object> search);
	
	public Integer countPerformLi(Map<String,Object> search);
	
	public List<Map<String, Object>> ReqList(String performId);
	
	public boolean checkY(int instrId);
	
	public void updateClose (int instrId);
	
	public void updateStart (int instrId);
	
	public void updateInstr(int instrId);
}
