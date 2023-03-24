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
	public List<Map<String, Object>> instrList(String lineName, String workDate, String itemNum, String workSts) {
		System.out.println("InstructServiceImpl instrList()");
		
		return instructDAO.instrList(lineName, workDate, itemNum, workSts);
	}
	
}
