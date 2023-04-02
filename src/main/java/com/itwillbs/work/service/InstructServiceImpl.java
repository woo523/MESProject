package com.itwillbs.work.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.work.dao.InstructDAO;
import com.itwillbs.work.domain.InstructDTO;

@Service 
public class InstructServiceImpl implements InstructService{
	
	@Inject
	private InstructDAO instructDAO;

	@Override
	public List<Map<String, Object>> instrList(PageDTO pageDTO, Model model) {
		System.out.println("InstructServiceImpl instrList 전체");
		
		int totalCnt = instructDAO.instrCount();
		
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return instructDAO.instrList(pageDTO);
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO, Model model) {
		System.out.println("InstructServiceImpl instrList 검색");
		
		int totalCnt = instructDAO.instrCount(instrSearch);
		
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return instructDAO.instrList(instrSearch, pageDTO);
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

	@Override
	public void insertInstr(InstructDTO instructDTO) {
		System.out.println("InstructServiceImpl insertInstr");
		
		instructDTO.setWorkDate(new Timestamp(System.currentTimeMillis()));
		instructDTO.setInsertDate(new Timestamp(System.currentTimeMillis()));
		
		instructDAO.insertInstr(instructDTO);
	}
	
}
