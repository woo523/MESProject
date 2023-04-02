package com.itwillbs.ship.service;

import java.sql.Timestamp;
import java.util.List;	
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.ship.dao.ShipDAO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;

@Service
public class ShipServiceImpl implements ShipService{
	
	@Inject
	private ShipDAO shipDAO;
	
	@Override
	public List<ShipDTO> getShipList(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return shipDAO.getShipList(pageDTO);
	}

	@Override
	public int getShipCount(PageDTO pageDTO) {
		System.out.println("ShipServiceImpl getShipCount()");
		return shipDAO.getShipCount(pageDTO);
	}

	@Override
	public List<ShipDTO> getshipList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getshipList()");
		return shipDAO.getshipList(search);
	}

	@Override
	public List<Map<String, Object>> getShipMap(PageDTO pageDTO) {
		System.out.println("ShipServiceImpl getShipMap()");
		return shipDAO.getShipMap(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getShipMap(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getShipMap2()");
		return shipDAO.getShipMap(search);
	}

	@Override
	public List<ShipDTO> getInfoList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getInfoList()");
		return shipDAO.getInfoList(search);
	}

	@Override
	public int countInfoList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countInfoList()");
		return shipDAO.countInfoList(search);
	}

	



}