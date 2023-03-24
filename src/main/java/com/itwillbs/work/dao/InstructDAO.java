package com.itwillbs.work.dao;

import java.util.List;
import java.util.Map;


public interface InstructDAO {
	
	public List<Map<String, Object>> instrList();
	
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch);
}
