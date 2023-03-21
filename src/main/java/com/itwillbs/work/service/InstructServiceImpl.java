package com.itwillbs.work.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.InstructDAO;
import com.itwillbs.work.domain.InstructDTO;

@Service 
public class InstructServiceImpl implements InstructService{
	
	@Inject
	private InstructDAO instructDAO;
	
	@Override
	public List<InstructDTO> instrList() {
		System.out.println("InstructServiceImpl instrList()");
		
		return instructDAO.instrList();
	}
	
}
