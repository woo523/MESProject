package com.itwillbs.line.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.line.dao.LineDAO;
import com.itwillbs.line.domain.LineDTO;

@Service
public class LineServiceImpl implements LineService{
	
	@Inject
	private LineDAO lineDAO;

	@Override
	public List<LineDTO> lineList() {
		System.out.println("LineServiceImpl lineList()");
		
		return lineDAO.lineList();
	}

}
