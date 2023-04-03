package com.itwillbs.line.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.line.domain.LineDTO;

public interface LineService {
	// 라인 조회
	public List<LineDTO> lineList();
	// 라인 조회(페이징 포함)
	public List<Map<String, Object>> lineList(PageDTO pageDTO, Model model);
	// 라인 검색 조회(페이징 포함)
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch, PageDTO pageDTO, Model model);
	
	public Integer lineTotalCount();
	
	public Integer lineSearchCount(Map<String, Object> lineSearch);
	
	public void insertLine(LineDTO lineDTO);
	
	public LineDTO getLineList(int lineId);
	
	public void updateLine(LineDTO lineDTO, int lineId);
	
	public void deleteLine(int lineId);

}
