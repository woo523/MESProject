package com.itwillbs.ship.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.ship.domain.ShipDTO;

@Repository
public class ShipDAOImpl implements ShipDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ShipDTO> shipList() {
		System.out.println("ShipDAOImpl shipList()");
		return null;
	}

	@Override
	public List<Map<String, Object>> shipAdmin(Map<String, Object> shipAdmin) {
		System.out.println("ShipDAOImpl shipAdmin()");
		return sqlSession.selectList(namespace+".shipAdmin",shipAdmin);
	}



	
}
