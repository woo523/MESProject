package com.itwillbs.work.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;


@Repository
public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.performMapper";

	@Override
	public List<InstruListDTO> InstruList() {
		System.out.println("PerformDAOImpl InstruList()");
		
		return sqlSession.selectList(namespace+".InstruList");
						
	}

	@Override
	public List<PerformRgDTO> PerformRgList(int instrId) {
		System.out.println("PErformDAOImpl PerformRgList()");
		return sqlSession.selectList(namespace+".PerformRgList", instrId);
	}

	

}
