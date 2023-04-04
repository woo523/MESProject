package com.itwillbs.ship.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.work.domain.ItemDTO;

public interface ShipDAO {

	public List<ShipDTO> getShipList(PageDTO pageDTO);

	public int getShipCount(PageDTO pageDTO);

	public List<ShipDTO> getshipList(Map<String, Object> search);

	public List<Map<String, Object>> getShipMap(PageDTO pageDTO);

	public List<Map<String, Object>> getShipMap(Map<String, Object> search);

	public List<ShipDTO> getInfoList(Map<String, Object> search);

	public int countInfoList(Map<String, Object> search);

	public List<ItemDTO> getItemList(Map<String, Object> search);

	public int countItemList(Map<String, Object> search);

	public List<MaterialDTO> getMtrList(Map<String, Object> search);

	public int countMtrList(Map<String, Object> search);

	public List<ClntDTO> getClntList(Map<String, Object> search);

	public int countClntList(Map<String, Object> search);
	
}