package com.itwillbs.ship.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.work.domain.ItemDTO;

public interface ShipService {

	List<ShipDTO> getShipList(PageDTO pageDTO);

	int getShipCount(PageDTO pageDTO);

	List<ShipDTO> getshipList(Map<String, Object> search);

	List<Map<String, Object>> getShipMap(PageDTO pageDTO);

	List<Map<String, Object>> getShipMap(Map<String, Object> search);

	List<ShipDTO> getInfoList(Map<String, Object> search);

	int countInfoList(Map<String, Object> search);

	List<ItemDTO> getItemList(Map<String, Object> search);

	int countItemList(Map<String, Object> search);

	List<MaterialDTO> getMtrList(Map<String, Object> search);

	int countMtrList(Map<String, Object> search);

	List<ClntDTO> getClntList(Map<String, Object> search);

	int countClntList(Map<String, Object> search);
	


	
}