package com.itwillbs.ship.dao;

import java.util.List;

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


	
	
}
