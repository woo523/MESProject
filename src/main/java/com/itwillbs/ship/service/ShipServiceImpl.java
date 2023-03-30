package com.itwillbs.ship.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.itwillbs.ship.dao.ShipDAO;
import com.itwillbs.ship.domain.ShipDTO;

@Repository
public class ShipServiceImpl implements ShipService{

	@Override
	public List<ShipDTO> shipList() {
		System.out.println("ShipServiceImpl shipList()");
		return null;
	}

	@Override
	public List<Map<String, Object>> shipAdmin(Map<String, Object> shipAdmin) {
		// TODO Auto-generated method stub
		return null;
	}



	





}
