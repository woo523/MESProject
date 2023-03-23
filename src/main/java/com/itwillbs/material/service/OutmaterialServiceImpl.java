package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.OutmaterialDAO;

@Service
public class OutmaterialServiceImpl implements OutmaterialService{

	@Inject
	private OutmaterialDAO outmaterialDAO;
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("Inmaterial outmaterList()");
		
		return outmaterialDAO.outmaterList();
	}

}
