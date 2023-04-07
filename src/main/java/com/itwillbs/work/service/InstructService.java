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
	
	// 수주 조회
	public List<Map<String, Object>> getOrdList();
	
	// 수주 검색 조회
	public List<Map<String, Object>> getOrdList(Map<String, Object> ordSearch);
	
	public InstructDTO instrIdList(int instrId);
	
	public List<Map<String, Object>> getInstrList(int instrId);
	
	public void instrUpdate(InstructDTO instructDTO, int instrId);
	
	public void instrDelete(int instrId);
	
}
