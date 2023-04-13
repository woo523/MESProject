package com.itwillbs.ship.service;

import java.sql.Timestamp;
import java.util.List;	
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.ship.dao.ShipDAO;
import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.work.domain.ItemDTO;

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
	public Integer getShipCount(PageDTO pageDTO) {
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
	public Integer countInfoList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countInfoList()");
		return shipDAO.countInfoList(search);
	}

	@Override
	public List<ItemDTO> getItemList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getItemList()");
		return shipDAO.getItemList(search);
	}

	@Override
	public Integer countItemList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countItemList()");
		return shipDAO.countItemList(search);
	}

	@Override
	public List<MaterialDTO> getMtrList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getMtrList()");
		return shipDAO.getMtrList(search);
	}

	@Override
	public Integer countMtrList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countMtrList()");
		return shipDAO.countMtrList(search);
	}

	@Override
	public List<ClntDTO> getClntList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getClntList()");
		return shipDAO.getClntList(search);
	}

	@Override
	public Integer countClntList(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countClntList()");
		return shipDAO.countClntList(search);
	}

	@Override
	public Integer shipSCount() {
		System.out.println("ShipServiceImpl shipSCount()");
		return shipDAO.shipSCount();
	}

	@Override
	public void insertShip(ShipDTO shipDTO) {
		System.out.println("ShipServiceImpl 메서드틀 정의 구현()");
		shipDTO.setInsertDt(new Timestamp(System.currentTimeMillis()));
		shipDAO.insertShip(shipDTO);
		
	}

	@Override
	public List<Map<String, Object>> getListMap(PageDTO pageDTO) {
		System.out.println("ShipServiceImpl getListMap()");
		return shipDAO.getListMap(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getListShipMap(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getListShipMap()");
		return shipDAO.getListShipMap(search);
	}

	@Override
	public int countListShip(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countListShip()");
		return shipDAO.countListShip(search);
	}

	@Override
	public void updateShip(ShipDTO shipDTO) {
		System.out.println("ShipServiceImpl updateShip()");
		shipDTO.setUpdateDt(new Timestamp(System.currentTimeMillis()));
		shipDAO.updateShip(shipDTO);
	}

	@Override
	public Map<String, Object> getShip(int shipId) {
		System.out.println("ShipServiceImpl getShip()");
		return shipDAO.getShip(shipId);
	}

	@Override
	public void deleteShip(int shipId) {
		System.out.println("ShipServiceImpl deleteShip()");
		shipDAO.deleteShip(shipId);
	}

	@Override
	public ShipDTO getShipOrderId(int ordId) {
		System.out.println("ShipServiceImpl getShipOrderId()");
		return shipDAO.getShipOrderId(ordId);
	}

	@Override
	public List<Map<String, Object>> getSearchShipMap(Map<String, Object> search) {
		System.out.println("ShipServiceImpl getSearchShipMap()");
		return shipDAO.getSearchShipMap(search);
	}

	@Override
	public void updateCmplt(ShipDTO shipDTO) {
		System.out.println("ShipServiceImpl updateCmplt()");
		shipDAO.updateCmplt(shipDTO);
	}

	@Override
	public void deleteCmplt(ShipDTO shipDTO) {
		System.out.println("ShipServiceImpl deleteCmplt()");
		shipDAO.deleteCmplt(shipDTO);
	}

	@Override
	public boolean check(int shipId) {
		System.out.println("ShipServiceImpl check()");
		return shipDAO.check(shipId);
	}

	@Override
	public void deleteOrder(int shipId) {
		System.out.println("ShipServiceImpl deleteOrder()");
		shipDAO.deleteOrder(shipId);
		
	}

	@Override
	public Map<String, Object> getorder(int ordId){
		System.out.println("ShipServiceImpl getorder()");
		return shipDAO.getorder(ordId);
	}

	@Override
	public int countShip(Map<String, Object> search) {
		System.out.println("ShipServiceImpl countShip()");
		return shipDAO.countShip(search);
	}


}