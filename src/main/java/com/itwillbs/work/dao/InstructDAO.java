package com.itwillbs.work.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.work.domain.InstructDTO;


public interface InstructDAO {
	
	public List<Map<String, Object>> instrList(PageDTO pageDTO);
	
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO);
	
	public Integer instrCount();
	
	public Integer instrCount(Map<String, Object> instrSearch);
	
	public void insertInstr(InstructDTO instructDTO);
	
	public List<Map<String, Object>> getLineList(String lineName);
	
	public List<Map<String, Object>> getOrdList();
	
	public List<Map<String, Object>> getOrdList(Map<String, Object> ordSearch);
	
	public void instrDelete(int instrId);
	
}
