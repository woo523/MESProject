package com.itwillbs.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;
import com.itwillbs.work.domain.PerformDTO;

@Service
public class PerformServiceImpl implements PerformService {

	
	private PerformDAO performDAO;
	
	@Override
	public List<PerformDTO> performList() {
		
		return performDAO.performList();
	}

}
