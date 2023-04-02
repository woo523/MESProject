package com.itwillbs.ship.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.domain.ShipDTO;

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
		return sqlSession.selectOne(namespace+".getInfoList",search);
	}

	@Override
	public int countInfoList(Map<String, Object> search) {
		System.out.println("ShipDAOImpl countInfoList()");
		return sqlSession.selectOne(namespace+".countInfoList",search);
	}



	
}