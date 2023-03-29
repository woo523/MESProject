package com.itwillbs.line.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.line.domain.LineDTO;

public interface LineService {
	
	public List<LineDTO> lineList();
	
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch);
	
	public Integer lineTotalCount();
	
	public Integer lineSearchCount(Map<String, Object> lineSearch);

}
