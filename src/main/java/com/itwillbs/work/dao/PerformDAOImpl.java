package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> getInstrLiMap() {
		System.out.println("MemberDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap");
	}

	@Override
	public List<PerformRgDTO> PerformRgList(int instrId) {
		System.out.println("PerformDAOImpl PerformRgList()");
		return sqlSession.selectList(namespace+".PerformRgList", instrId);
	}

	@Override
	public void insertPerform(Map<String, Object> row) {
		System.out.println("PerformDAOImpl insertPerform()");
		
		sqlSession.insert(namespace+".insertPerform", row);
	}
	
	
	@Override
	public Integer getMaxNumP() {
		System.out.println("PerformDAOImpll getMaxNumP()");
		
		return sqlSession.selectOne(namespace+".getMaxNumP");
	}

	

}
