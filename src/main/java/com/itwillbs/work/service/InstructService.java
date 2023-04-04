package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.work.domain.InstructDTO;

public interface InstructService {
	
	public List<Map<String, Object>> instrList(PageDTO pageDTO, Model model);

	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO, Model model);
	
	public Integer instrCount();
	
	public Integer instrCount(Map<String, Object> instrSearch);
	
	public void insertInstr(InstructDTO instructDTO);
	
	public List<Map<String, Object>> getLineList(String lineName);
	
	public void instrDelete(int instrId);
	
}
