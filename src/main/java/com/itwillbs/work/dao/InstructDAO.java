package com.itwillbs.work.dao;

import java.util.List;
import java.util.Map;


public interface InstructDAO {
	
	public List<Map<String, Object>> instrList(String lineName, String workDate, String itemNum, String workSts);
	
}
