package com.itwillbs.ship.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;

public interface ShipService {

	List<ShipDTO> getShipList(PageDTO pageDTO);

	int getShipCount(PageDTO pageDTO);

	List<ShipDTO> getshipList(Map<String, Object> search);

	List<Map<String, Object>> getShipMap(PageDTO pageDTO);

	List<Map<String, Object>> getShipMap(Map<String, Object> search);

	List<ShipDTO> getInfoList(Map<String, Object> search);

	int countInfoList(Map<String, Object> search);
	


	
}