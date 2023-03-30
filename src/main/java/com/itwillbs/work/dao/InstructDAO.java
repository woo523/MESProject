package com.itwillbs.work.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;


public interface InstructDAO {
	
	public List<Map<String, Object>> instrList(PageDTO pageDTO);
	
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO);
	
	public Integer instrCount();
	
	public Integer instrCount(Map<String, Object> instrSearch);
}
