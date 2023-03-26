package com.itwillbs.line.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.line.domain.LineDTO;

public interface LineDAO {
	
	public List<LineDTO> lineList();
	
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch);

}
