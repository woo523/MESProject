package com.itwillbs.work.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;
import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;



@Service
public class PerformServiceImpl implements PerformService {

	@Inject
	private PerformDAO performDAO;
	
	@Override
	public List<InstruListDTO> InstruList() {
		
		return performDAO.InstruList();
	}

	@Override
	public List<PerformRgDTO> PerformRgList(int instrId) {
		System.out.println("PerformServiceImpl PerformRgList()");
		return performDAO.PerformRgList(instrId);
	}

	

}
