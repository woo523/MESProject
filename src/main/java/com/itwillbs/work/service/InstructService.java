package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

public interface InstructService {
	
	public List<Map<String, Object>> instrList();

	public List<Map<String, Object>> instrList(String lineName, String startDate, String endDate, String itemNum, String workSts1, String workSts2, String workSts3);
	
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch);
	
}
