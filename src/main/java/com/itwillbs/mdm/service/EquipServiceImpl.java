package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.mdm.dao.EquipDAO;



@Service
public class EquipServiceImpl implements EquipService{
	
	@Inject
	private EquipDAO equipDAO;

	@Override
	public List<Map<String, Object>> getEquipMap() {
		System.out.println("EquipServiceImpl getEquipMap()");
		return equipDAO.getEquipMap();
	}

	

	


	
	
	
}
