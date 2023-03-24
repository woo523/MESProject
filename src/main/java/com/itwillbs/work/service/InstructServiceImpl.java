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
		// TODO Auto-generated method stub
		return instructDAO.instrList();
	}

	@Override
	public List<Map<String, Object>> instrList(String lineName, String startDate, String endDate, String itemNum,
			String workSts1, String workSts2, String workSts3) {
		// System.out.println("InstructServiceImpl instrList");
		
		return instructDAO.instrList(lineName, startDate, endDate, itemNum, workSts1, workSts2, workSts3);
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch) {
		System.out.println("InstructServiceImpl instrList");
		
		return instructDAO.instrList(instrSearch);
	}
	
}
