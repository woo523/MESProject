package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

public interface InstructService {
	
	public List<Map<String, Object>> instrList();

	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch);
	
}
