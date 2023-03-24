package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

public interface InstructService {

	public List<Map<String, Object>> instrList(String lineName, String workDate, String itemNum, String workSts);
	
}
