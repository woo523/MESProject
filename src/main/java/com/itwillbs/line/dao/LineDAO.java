package com.itwillbs.line.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.work.domain.InstructDTO;

public interface LineDAO {
	
	public List<LineDTO> lineList();
	
	public List<Map<String, Object>> lineList(PageDTO pageDTO);
	
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch, PageDTO pageDTO);
	
	public Integer lineTotalCount();
	
	public Integer lineSearchCount(Map<String, Object> lineSearch);
	
	public void insertLine(LineDTO lineDTO);
	
	public LineDTO getLineList(int lineId);
	
	public List<InstructDTO> getWorkList();
	
	public void updateLine(LineDTO lineDTO, int lineId);
	
	public void deleteLine(int lineId);
	
}
