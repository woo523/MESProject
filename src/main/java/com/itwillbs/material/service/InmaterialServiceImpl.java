package com.itwillbs.material.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.InmaterialDAO;
import com.itwillbs.material.domain.InmaterialDTO;

@Service
public class InmaterialServiceImpl implements InmaterialService{

	@Inject
	private InmaterialDAO inmaterialDAO;
	
	@Override
	public List<InmaterialDTO> inmaterList() {
		System.out.println("InstructServiceImpl inmaterList()");
		
		return inmaterialDAO.inmaterList();
	}

}
