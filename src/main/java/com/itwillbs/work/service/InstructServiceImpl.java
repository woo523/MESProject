package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.work.dao.InstructDAO;
import com.itwillbs.work.domain.InstructDTO;

@Service 
public class InstructServiceImpl implements InstructService{
	
	@Inject
	private InstructDAO instructDAO;

	@Override
	public List<Map<String, Object>> instrList() {
		
		return instructDAO.instrList();
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch) {
		System.out.println("InstructServiceImpl instrList");
		
		return instructDAO.instrList(instrSearch);
	}

	@Override
	public Integer instrCount() {
		System.out.println("InstructServiceImpl instrCount");
		
		return instructDAO.instrCount();
	}

	@Override
	public Integer instrCount(Map<String, Object> instrSearch) {
		System.out.println("InstructServiceImpl instrCount");
		
		return instructDAO.instrCount(instrSearch);
	}
	
}
