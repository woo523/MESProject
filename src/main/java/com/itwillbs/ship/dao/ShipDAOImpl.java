package com.itwillbs.ship.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.work.domain.ItemDTO;

@Repository
public class ShipDAOImpl implements ShipDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.itwillbs.mappers.shipMapper";

	@Override
	public List<ShipDTO> getShipList(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl getShipList()");
		return sqlSession.selectOne(namespace+".getShipList",pageDTO);
	}

	@Override
	public int getShipCount(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl getShipCount()");
		return sqlSession.selectOne(namespace+".getShipCount",pageDTO);
	}

	@Override
	public List<ShipDTO> getshipList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getshipList()");
		return sqlSession.selectList(namespace+".getshipList",search);
	}

	@Override
	public List<Map<String, Object>> getShipMap(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl getShipMap()");
		return sqlSession.selectList(namespace+".getShipMap",pageDTO);
	}

	@Override
	public List<Map<String, Object>> getShipMap(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getShipMap()");
		return sqlSession.selectList(namespace+".getShipMap",search);
	}

	@Override
	public List<ShipDTO> getInfoList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getInfoList()");
		return sqlSession.selectList(namespace+".getInfoList",search);
	}

	@Override
	public int countInfoList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countInfoList()");
		return sqlSession.selectOne(namespace+".countInfoList",search);
	}

	@Override
	public List<ItemDTO> getItemList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getItemList()");
		return sqlSession.selectList(namespace+".getItemList",search);
	}

	@Override
	public int countItemList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countItemList()");
		return sqlSession.selectOne(namespace+".countItemList",search);
	}

	@Override
	public List<MaterialDTO> getMtrList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getMtrList()");
		return sqlSession.selectList(namespace+".getMtrList",search);
	}

	@Override
	public int countMtrList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countMtrList()");
		return sqlSession.selectOne(namespace+".countMtrList",search);
	}

	@Override
	public List<ClntDTO> getClntList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getClntList()");
		return sqlSession.selectList(namespace+".getClntList",search);
	}

	@Override
	public int countClntList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countClntList()");
		return sqlSession.selectOne(namespace+".countClntList",search);
	}

	@Override
	public Integer shipSCount() {
		System.out.println("ShipDAOImpl shipSCount() 화면단 정보를 db에 저장");
		return sqlSession.selectOne(namespace+".shipSCount");
	}

	@Override
	public void insertShip(ShipDTO shipDTO) {
		System.out.println("ShipDAOImpl insertShip() 화면단 정보를 db에 저장");
		sqlSession.insert(namespace+".insertShip", shipDTO);
		
	}

	@Override
	public List<Map<String, Object>> getListMap(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl getListMap()");
		return sqlSession.selectList(namespace+".getListMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getListShipMap(Map<String, Object> search) {
		System.out.println("ShipDAOImpl getListShipMap()"); 
	    return sqlSession.selectList(namespace+".getListShipMap",search);
	}

	@Override
	public int countListShip(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countListShip()"); 
		return sqlSession.selectOne(namespace+".countListShip",search);
	}

	@Override
	public void updateShip(ShipDTO shipDTO) {
		System.out.println("ShipDAOImpl updateShip() 화면단 정보를 db에 저장");
		sqlSession.update(namespace+".updateShip", shipDTO);
	}

	@Override
	public Map<String, Object> getShip(int shipId) {
		System.out.println("ShipDAOImpl getShip() ");
		return sqlSession.selectOne(namespace+".getShip", shipId);
	}

	@Override
	public void deleteShip(int shipId) {
		System.out.println("ShipDAOImpl deleteShip() 화면단 정보를 db에 저장");
		sqlSession.delete(namespace+".deleteShip", shipId);
	}

	@Override
	public ShipDTO getShipOrderId(int ordId) {
		System.out.println("ShipDAOImpl getShipOrderId() ");
		return sqlSession.selectOne(namespace+".getShipOrderId",ordId);
	}



	
}