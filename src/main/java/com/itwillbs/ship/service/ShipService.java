package com.itwillbs.ship.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.work.domain.ItemDTO;

public interface ShipService {

	public List<ShipDTO> getShipList(PageDTO pageDTO);

	public Integer getShipCount(PageDTO pageDTO);

	public List<ShipDTO> getshipList(Map<String, Object> search);

	public List<Map<String, Object>> getShipMap(PageDTO pageDTO);

	public List<Map<String, Object>> getShipMap(Map<String, Object> search);

	public List<ShipDTO> getInfoList(Map<String, Object> search);

	public Integer countInfoList(Map<String, Object> search);

	public List<ItemDTO> getItemList(Map<String, Object> search);

	public Integer countItemList(Map<String, Object> search);

	public List<MaterialDTO> getMtrList(Map<String, Object> search);

	public Integer countMtrList(Map<String, Object> search);

	public List<ClntDTO> getClntList(Map<String, Object> search);

	public Integer countClntList(Map<String, Object> search);

	public Integer shipSCount();

	public void insertShip(ShipDTO shipDTO);

	public List<Map<String, Object>> getListMap(PageDTO pageDTO);

	public List<Map<String, Object>> getListShipMap(Map<String, Object> search);

	public int countListShip(Map<String, Object> search);

	public void updateShip(ShipDTO shipDTO);

	public Map<String, Object> getShip(int shipId);

	public void deleteShip(int shipId);
	
	public ShipDTO getShipOrderId(int ordId);
	


	
}