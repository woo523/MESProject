package com.itwillbs.material.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.material.domain.InmaterialDTO;

@Repository
public class InmaterialDAOImpl implements InmaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.materialMapper";
	
	@Override
	public List<InmaterialDTO> inmaterList() {
		System.out.println("InstructDAOImpl inmaterList()");
		
		return sqlSession.selectList(namespace + ".inmaterList");
	}

}
