package com.itwillbs.ship.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.ShipDTO;

public interface ShipDAO {
	public List<ShipDTO> shipList();

	public List<Map<String, Object>> shipAdmin(Map<String, Object> shipAdmin);



	
}
