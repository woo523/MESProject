package com.itwillbs.ship.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.ShipDTO;

public interface ShipService {
	
	public List<ShipDTO> shipList();

	public List<Map<String, Object>> shipAdmin(Map<String, Object> shipAdmin);

	
}
