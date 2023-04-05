package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.mdm.dao.RequireDAO;



@Service
public class RequireServiceImpl implements RequireService{
	
	@Inject
	private RequireDAO requireDAO;

	@Override
	public List<Map<String, Object>> getRequireMap() {
		System.out.println("RequireServiceImpl getRequireMap()");
		return requireDAO.getRequireMap();
	}


	
	
	
}
