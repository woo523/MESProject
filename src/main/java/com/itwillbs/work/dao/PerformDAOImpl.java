package com.itwillbs.work.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.itwillbs.work.domain.PerformDTO;

public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.peformMapper";

	@Override
	public List<PerformDTO> performList() {
		System.out.println("PerformDAOImpl performList()");
		
		return sqlSession.selectList(namespace+".performlist");
				
	}

	

}
